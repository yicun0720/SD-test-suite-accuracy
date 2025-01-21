SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT `Name` FROM `club` ORDER BY `Name` ASC
SELECT Name FROM club ORDER BY LOWER(Name) ASC
SELECT Manager AS Club_Manager, Captain AS Club_Captain FROM club
SELECT club.Manager AS Manager, club.Captain AS Captain FROM club
SELECT Name FROM club WHERE Manufacturer NOT IN ('Nike')
SELECT Name FROM club WHERE Manufacturer NOT IN ('Nike')
SELECT Name FROM player ORDER BY player.Wins_count ASC
SELECT Name FROM player ORDER BY player.Wins_count ASC
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT DISTINCT p.Country FROM player AS p WHERE p.Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000
SELECT p.Country FROM player AS p WHERE p.Wins_count > 2 ORDER BY p.Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1 OFFSET 0
SELECT pl.Name, cl.Name FROM player AS pl JOIN club AS cl ON pl.Club_ID = cl.Club_ID
SELECT player.Name AS Player, club.Name AS Club FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT Name FROM club WHERE EXISTS (SELECT 1 FROM player WHERE Club_ID = club.Club_ID AND Wins_count > 2)
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player WHERE Wins_count > 2)
SELECT p.Name FROM player p LEFT JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT player.Name FROM player LEFT JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY AVG(p.Earnings) DESC
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING AVG(Earnings) ORDER BY AVG(Earnings) DESC)
SELECT c.Manufacturer, COUNT(*) FROM club AS c GROUP BY c.Manufacturer
SELECT c.Manufacturer, COUNT(c.Club_ID) FROM club c GROUP BY c.Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM club GROUP BY Manufacturer) sub)
SELECT Manufacturer FROM (SELECT Manufacturer, COUNT(*) AS Count FROM club GROUP BY Manufacturer) AS SubQuery ORDER BY Count DESC LIMIT 1
SELECT Manufacturer FROM (SELECT Manufacturer, COUNT(*) AS NumClubs FROM club GROUP BY Manufacturer) AS subquery WHERE NumClubs > 1
SELECT Manufacturer FROM (SELECT Manufacturer, COUNT(*) AS NumClubs FROM club GROUP BY Manufacturer) AS subquery WHERE NumClubs > 1
SELECT p.Country FROM player AS p GROUP BY p.Country HAVING COUNT(p.Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(DISTINCT Player_ID) > 1
SELECT c.Name FROM club c WHERE c.Club_ID NOT IN (SELECT p.Club_ID FROM player p WHERE p.Club_ID IS NOT NULL)
SELECT Name FROM club WHERE NOT EXISTS (SELECT 1 FROM player WHERE player.Club_ID = club.Club_ID)
SELECT p.Country FROM player p WHERE p.Earnings > 1400000 INTERSECT SELECT p.Country FROM player p WHERE p.Earnings < 1100000
SELECT DISTINCT p.Country FROM player p WHERE p.Earnings > 1400000 INTERSECT SELECT DISTINCT p.Country FROM player p WHERE p.Earnings < 1100000
SELECT COUNT(DISTINCT player.Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player WHERE Country IS NOT NULL
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C WHERE EXISTS (SELECT 1 FROM Orders O WHERE O.customer_id = C.customer_id GROUP BY O.customer_id HAVING COUNT(*) > 2) AND EXISTS (SELECT 1 FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id WHERE O.customer_id = C.customer_id GROUP BY O.customer_id HAVING COUNT(OI.order_item_id) >= 3)
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id HAVING COUNT(o.order_id) > 2 AND SUM((SELECT COUNT(*) FROM Order_Items WHERE order_id = o.order_id)) >= 3
SELECT a.order_id, a.order_status_code, COUNT(b.product_id) FROM Orders a, Order_Items b WHERE a.order_id = b.order_id GROUP BY a.order_id, a.order_status_code
SELECT O.order_id, O.order_status_code, COUNT(OI.order_item_id) AS NumberOfProducts FROM Orders O LEFT JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT O.date_order_placed FROM Orders O WHERE O.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1) UNION SELECT MIN(date_order_placed) FROM Orders
SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1) UNION ALL SELECT MIN(date_order_placed) FROM Orders
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name FROM Customers c WHERE c.customer_id NOT IN (SELECT o.customer_id FROM Orders o WHERE o.customer_id IS NOT NULL)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders)
SELECT product_id, product_name, product_price, product_color FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 1)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(DISTINCT order_id) < 2) AS sub ON p.product_id = sub.product_id WHERE sub.product_id IS NOT NULL
SELECT o.order_id, o.date_order_placed FROM Orders o INNER JOIN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(product_id) >= 2) as sub ON o.order_id = sub.order_id
SELECT o.order_id, o.date_order_placed FROM Orders o WHERE o.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) >= 2)
SELECT p.product_id, p.product_name, p.product_price FROM Products p WHERE EXISTS (SELECT 1 FROM Order_Items oi WHERE oi.product_id = p.product_id GROUP BY oi.product_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM Order_Items GROUP BY product_id) as subquery))
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id, p.product_name, p.product_price HAVING COUNT(oi.order_item_id) = (SELECT MAX(count) FROM (SELECT COUNT(order_item_id) as count FROM Order_Items GROUP BY product_id) as counts)
SELECT O.order_id, SUM(P.product_price) AS total_price FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id ORDER BY total_price ASC LIMIT 1
SELECT order_id, MIN(total_cost) FROM (SELECT Orders.order_id, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id) AS CostTable
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Customer_Payment_Methods GROUP BY payment_method_code) AS counts)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Customer_Payment_Methods GROUP BY payment_method_code))
SELECT Customers.gender_code, COUNT(Products.product_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id LEFT JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customers.gender_code
SELECT C.gender_code, COUNT(DISTINCT P.product_id) FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id LEFT JOIN Order_Items OI ON O.order_id = OI.order_id LEFT JOIN Products P ON OI.product_id = P.product_id GROUP BY C.gender_code
SELECT gender_code, COUNT(*) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT Customers.gender_code, COUNT(Orders.order_id) FROM Customers LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT Customers.customer_first_name AS FirstName, Customers.customer_middle_initial AS MiddleInitial, Customers.customer_last_name AS LastName, Customer_Payment_Methods.payment_method_code AS PaymentMethod FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT customer_first_name AS `First Name`, customer_middle_initial AS `Middle Initial`, customer_last_name AS `Last Name`, payment_method_code AS `Payment Method` FROM Customers JOIN Customer_Payment_Methods USING(customer_id)
SELECT invoice_status_code, invoice_date, shipment_date FROM Invoices JOIN Shipments USING (invoice_number)
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices, Shipments WHERE Invoices.invoice_number = Shipments.invoice_number
SELECT product_name, shipment_date FROM Products, Order_Items, Shipments WHERE Products.product_id = Order_Items.product_id AND Order_Items.order_id = Shipments.order_id
SELECT p.product_name, s.shipment_date FROM Products AS p JOIN Order_Items AS oi ON p.product_id = oi.product_id JOIN Shipments AS s ON oi.order_id = s.order_id
SELECT order_item_status_code, shipment_tracking_number FROM Shipments JOIN Order_Items ON Shipments.order_id = Order_Items.order_id
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipments s ON oi.order_id = s.order_id
SELECT product_name, product_color FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items WHERE order_id IN (SELECT order_id FROM Shipments))
SELECT product_name, product_color FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items WHERE order_id IN (SELECT order_id FROM Shipments))
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT I.invoice_status_code FROM Invoices I WHERE I.invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT i.invoice_status_code FROM Invoices i LEFT JOIN Shipments s ON i.invoice_number = s.invoice_number WHERE s.shipment_id IS NULL
SELECT O.order_id, O.date_order_placed AS date, SUM(P.product_price) AS total_cost FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT order_id, date_order_placed, SUM(product_price) AS total_paid FROM Orders JOIN Order_Items USING(order_id) JOIN Products USING(product_id) GROUP BY order_id, date_order_placed
SELECT COUNT(*) FROM (SELECT DISTINCT customer_id FROM Orders) AS unique_customers
SELECT COUNT(*) FROM (SELECT DISTINCT customer_id FROM Orders) AS unique_customers
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(*) FROM (SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods) AS unique_payment_methods
SELECT COUNT(*) FROM (SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods) AS unique_payment_methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT C.login_name, C.login_password FROM Customers C WHERE C.phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%' AND product_size IS NOT NULL
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(p.product_price) FROM Products p)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(p.product_price) FROM Products p)
SELECT COUNT(product_id) FROM Products WHERE NOT EXISTS (SELECT 1 FROM Order_Items WHERE Order_Items.product_id = Products.product_id)
SELECT COUNT(*) FROM Products p WHERE p.product_id NOT IN (SELECT product_id FROM Order_Items WHERE product_id IS NOT NULL)
SELECT COUNT(*) FROM Customers c LEFT JOIN Customer_Payment_Methods cp ON c.customer_id = cp.customer_id WHERE cp.customer_id IS NULL
SELECT COUNT(DISTINCT customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT o.order_status_code, o.date_order_placed FROM Orders o
SELECT o.order_status_code, o.date_order_placed FROM Orders o
SELECT c.address_line_1, c.town_city, c.county FROM Customers c WHERE c.country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT C.customer_first_name, P.product_name FROM Customers C, Orders O, Order_Items OI, Products P WHERE C.customer_id = O.customer_id AND O.order_id = OI.order_id AND OI.product_id = P.product_id
SELECT customer_first_name AS Buyer, product_name AS Product FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id
SELECT COUNT(*) FROM (SELECT order_item_id FROM Shipment_Items GROUP BY order_item_id) AS ShippedItems
SELECT COUNT(DISTINCT oi.product_id) FROM Order_Items oi INNER JOIN Shipments s ON oi.order_id = s.order_id;
SELECT AVG(product_price) FROM Products WHERE product_id IS NOT NULL
SELECT AVG(product_price) AS AveragePrice FROM Products
SELECT AVG(product_price) FROM Products INNER JOIN (SELECT product_id FROM Order_Items) AS OrderedProducts ON Products.product_id = OrderedProducts.product_id
SELECT AVG(p.product_price) FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM (SELECT gender_code, COUNT(*) as cnt FROM Customers GROUP BY gender_code ORDER BY cnt ASC) as sub LIMIT 1)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id GROUP BY gender_code ORDER BY COUNT(o.order_id) ASC LIMIT 1)
SELECT O.date_order_placed FROM Orders O WHERE O.customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) > 1)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(DISTINCT payment_method_code) >= 2)
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1 OFFSET 0
SELECT MIN(order_status_code) FROM Orders GROUP BY order_status_code ORDER BY COUNT(order_status_code) ASC
SELECT DISTINCT p.product_id, p.product_description FROM Products p INNER JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) > 3
SELECT P.product_id, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(OI.order_item_id) > 3
SELECT I.invoice_date, I.invoice_number FROM Invoices I WHERE EXISTS (SELECT 1 FROM Shipments S WHERE S.invoice_number = I.invoice_number GROUP BY S.invoice_number HAVING COUNT(S.shipment_id) >= 2)
SELECT invoice_number, invoice_date FROM Invoices WHERE invoice_number IN (SELECT invoice_number FROM Shipments GROUP BY invoice_number HAVING COUNT(shipment_id) >= 2)
SELECT shipment_tracking_number, shipment_date FROM Shipments WHERE shipment_tracking_number IS NOT NULL
SELECT shipment_tracking_number, shipment_date FROM Shipments WHERE shipment_tracking_number IS NOT NULL AND shipment_date IS NOT NULL
SELECT P.product_color, P.product_description, P.product_size FROM Products P WHERE P.product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT max(product_price) FROM Products WHERE product_price > 0)
SELECT Name FROM director WHERE Age > (SELECT AVG(d.Age) FROM director d)
SELECT Name FROM director WHERE Age IN (SELECT MAX(Age) FROM director)
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%' ESCAPE ''
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel WHERE Digital_terrestrial_channel <> ''
SELECT program.Title FROM program ORDER BY program.Start_Year DESC
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID, d.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Name, d.Age FROM director d INNER JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID HAVING COUNT(p.Program_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Program_ID) AS Cnt FROM program GROUP BY Director_ID))
SELECT program.Title FROM program ORDER BY program.Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel c INNER JOIN (SELECT Channel_ID FROM program GROUP BY Channel_ID HAVING COUNT(Program_ID) > 1) p ON c.Channel_ID = p.Channel_ID
SELECT COUNT(p.Program_ID), c.Name FROM channel c LEFT OUTER JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID
SELECT count(*) FROM channel c WHERE NOT EXISTS (SELECT 1 FROM program p WHERE p.Channel_ID = c.Channel_ID)
SELECT d.Name FROM director d WHERE EXISTS (SELECT 1 FROM program p WHERE p.Director_ID = d.Director_ID AND p.Title = 'Dracula')
SELECT c.Name, c.Internet FROM channel c, director_admin d WHERE c.Channel_ID = d.Channel_ID GROUP BY c.Channel_ID HAVING COUNT(d.Director_ID) = (SELECT MAX(COUNTED) FROM (SELECT COUNT(Director_ID) AS COUNTED FROM director_admin GROUP BY Channel_ID) AS subquery)
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT c.Name FROM channel c WHERE EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE da.Channel_ID = c.Channel_ID AND d.Age < 40) AND EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE da.Channel_ID = c.Channel_ID AND d.Age > 60)
SELECT channel.Channel_ID, channel.Name FROM channel WHERE NOT EXISTS (SELECT 1 FROM program JOIN director ON program.Director_ID = director.Director_ID WHERE director.Name = 'Hank Baskett' AND program.Channel_ID = channel.Channel_ID)
SELECT COUNT(1) FROM radio
SELECT r.Transmitter FROM radio r ORDER BY r.ERP_kW ASC
SELECT tv_show.tv_show_name, tv_show.Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation NOT IN ('ABC')
SELECT Transmitter FROM radio WHERE (ERP_kW > 150) OR (ERP_kW < 30)
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT AVG(r.ERP_kW) FROM radio r
SELECT Affiliation, COUNT(*) AS CountOfChannels FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 0
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM city_channel GROUP BY Affiliation) tmp)
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(Affiliation) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC, City ASC
SELECT Transmitter, City FROM radio r CROSS JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID CROSS JOIN city_channel cc ON ccr.City_channel_ID = cc.ID
SELECT r.Transmitter, cc.Station_name FROM radio r CROSS JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID CROSS JOIN city_channel cc ON ccr.City_channel_ID = cc.ID ORDER BY r.ERP_kW DESC
SELECT r.Transmitter, COUNT(ccr.City_channel_ID) FROM radio r LEFT OUTER JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT r.Transmitter FROM radio r WHERE NOT EXISTS (SELECT * FROM city_channel_radio ccr WHERE ccr.Radio_ID = r.Radio_ID)
SELECT v.Model FROM vehicle v WHERE v.Power > 6000 ORDER BY v.Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC, Vehicle_ID ASC LIMIT 1
SELECT Name FROM driver WHERE Citizenship LIKE 'United States'
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT Driver_ID, COUNT(Vehicle_ID) FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(Vehicle_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Vehicle_ID) AS Count FROM vehicle_driver GROUP BY Driver_ID) AS Counts)
SELECT Driver_ID, COUNT(*) FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM vehicle_driver GROUP BY Driver_ID) tmp)
SELECT MAX(v.Power), AVG(v.Power) FROM vehicle v WHERE v.Builder = 'Zhuzhou'
SELECT MAX(Power) MaxPower, AVG(Power) AvgPower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT v.Vehicle_ID FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID ORDER BY COUNT(vd.Vehicle_ID) ASC LIMIT 1
SELECT Top_Speed AS Speed, Power AS HP FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed AS Speed, Power AS HP FROM vehicle WHERE Build_Year = 1996
SELECT v.Build_Year, v.Model, v.Builder FROM vehicle AS v
SELECT v.Build_Year, v.Model, v.Builder FROM vehicle AS v
SELECT COUNT(DISTINCT d.Driver_ID) FROM driver d INNER JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID INNER JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = 2012
SELECT COUNT(DISTINCT vd.Driver_ID) FROM vehicle_driver vd JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = 2012
SELECT COUNT(DISTINCT d.Driver_ID) FROM driver AS d WHERE d.Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver d WHERE d.Racing_Series LIKE 'NASCAR'
SELECT AVG(Top_Speed) AS AverageTopSpeed FROM vehicle
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT DISTINCT Name FROM driver, vehicle_driver, vehicle WHERE driver.Driver_ID = vehicle_driver.Driver_ID AND vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID AND vehicle.Power > 5000
SELECT Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Power > 5000))
SELECT v.Model FROM vehicle v WHERE v.Total_Production > 100 OR v.Top_Speed > 150
SELECT v.Model FROM vehicle v WHERE v.Total_Production > 100 OR v.Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Driver_ID IS NULL
SELECT Model FROM vehicle v WHERE v.Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver vd)
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) = 2 OR v.Builder = 'Ziyang'
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) = 2 OR v.Builder = 'Ziyang'
SELECT DISTINCT v.Vehicle_ID, v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID LEFT JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' OR (SELECT COUNT(*) FROM vehicle_driver vd2 WHERE vd2.Vehicle_ID = v.Vehicle_ID) > 2
SELECT v.Vehicle_ID, v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID, v.Model HAVING COUNT(vd.Driver_ID) > 2 OR MAX(vd.Driver_ID IN (SELECT Driver_ID FROM driver WHERE Name = 'Jeff Gordon')) = 1
SELECT count(*) FROM vehicle WHERE Top_Speed = (SELECT Top_Speed FROM vehicle ORDER BY Top_Speed DESC LIMIT 1)
SELECT count(*) FROM vehicle v WHERE v.Top_Speed = (SELECT max(Top_Speed) FROM vehicle v2)
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Racing_Series
SELECT count(DISTINCT D.Driver_ID) AS DriverCount, D.Racing_Series AS Series FROM driver D GROUP BY D.Racing_Series
SELECT driver.Name, driver.Citizenship FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1'
SELECT Name, Citizenship FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Model = 'DJ1')
SELECT COUNT(*) FROM driver d WHERE d.Driver_ID NOT IN (SELECT DISTINCT vd.Driver_ID FROM vehicle_driver vd)
SELECT count(Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT count(*) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC;
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC, Exam_ID ASC
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code NOT IN ('Database')
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code <> 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC;
SELECT Exam_Date FROM Exams WHERE INSTR(Subject_Code, 'data') > 0 ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(1) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(1) FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(*) FROM (SELECT DISTINCT Comments FROM Student_Answers) AS unique_comments
SELECT COUNT(DISTINCT Comments) FROM Student_Answers WHERE Comments <> ''
SELECT Student_Answer_Text, COUNT(1) FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(1) DESC
SELECT SA.Student_Answer_Text FROM Student_Answers AS SA GROUP BY SA.Student_Answer_Text ORDER BY COUNT(SA.Student_Answer_Text) DESC
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students, Student_Answers WHERE Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name, Student_Answers.Date_of_Answer FROM Students, Student_Answers WHERE Students.Student_ID = Student_Answers.Student_ID
SELECT Email_Adress, Date_of_Answer FROM Students INNER JOIN Student_Answers USING (Student_ID) ORDER BY Date_of_Answer DESC
SELECT Students.Email_Adress, Student_Answers.Date_of_Answer FROM Students, Student_Answers WHERE Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Assessment FROM (SELECT Assessment, COUNT(*) AS Count FROM Student_Assessments GROUP BY Assessment) AS SubQuery ORDER BY Count ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1 OFFSET 0
SELECT S.First_Name FROM Students S WHERE EXISTS (SELECT 1 FROM Student_Answers SA WHERE S.Student_ID = SA.Student_ID GROUP BY SA.Student_ID HAVING COUNT(*) >= 2)
SELECT S.First_Name FROM Students S INNER JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID GROUP BY S.Student_ID HAVING COUNT(DISTINCT SA.Student_Answer_ID) >= 2
WITH Ranked_Answers AS (SELECT Valid_Answer_Text, RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank FROM Valid_Answers GROUP BY Valid_Answer_Text) SELECT Valid_Answer_Text FROM Ranked_Answers WHERE Rank = 1
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Valid_Answers GROUP BY Valid_Answer_Text) AS SubQuery)
SELECT Last_Name FROM Students WHERE Gender_MFU NOT LIKE 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU NOT LIKE 'M'
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(Student_ID) AS Total FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE (Gender_MFU = 'F' OR Gender_MFU = 'M')
SELECT Last_Name FROM Students WHERE (Gender_MFU = 'F' OR Gender_MFU = 'M')
SELECT s.First_Name FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT s.First_Name FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent'
SELECT Student_Answer_Text FROM (SELECT Student_Answer_Text, COUNT(DISTINCT Comments) AS NumComments FROM Student_Answers WHERE Comments IN ('Normal', 'Absent') GROUP BY Student_Answer_Text) AS Filtered WHERE NumComments > 1
SELECT q.Type_of_Question_Code FROM Questions AS q GROUP BY q.Type_of_Question_Code HAVING COUNT(*) > 2
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) >= 3
SELECT ALL Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone, Home_Phone FROM Students
SELECT ALL Student_ID, First_Name, Middle_Name, Last_Name, Gender_MFU, Student_Address, Email_Adress, Cell_Mobile_Phone, Home_Phone FROM Students
SELECT COUNT(1) FROM Addresses
SELECT COUNT(1) FROM Addresses
SELECT `address_id`, `address_details` FROM `Addresses`
SELECT address_id, address_details FROM Addresses
SELECT COUNT(1) FROM Products
SELECT COUNT(DISTINCT product_id) FROM Products
SELECT product_id AS ProductID, product_type_code AS ProductTypeCode, product_name AS ProductName FROM Products
SELECT product_id AS ID, product_type_code AS Type_Code, product_name AS Name FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor' AND product_price IS NOT NULL
SELECT product_price FROM Products WHERE product_name = 'Monitor' AND product_price IS NOT NULL
SELECT min(product_price), avg(product_price), max(product_price) FROM Products
SELECT MIN(product_price) AS Minimum, AVG(product_price) AS Average, MAX(product_price) AS Maximum FROM Products
SELECT AVG(p.product_price) FROM Products p WHERE p.product_type_code = 'Clothes'
SELECT AVG(p.product_price) FROM Products p WHERE p.product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code LIKE 'hardware'
SELECT COUNT(product_id) FROM Products WHERE product_type_code LIKE 'Hardware'
SELECT product_name FROM Products GROUP BY product_name HAVING product_price > AVG(product_price)
SELECT P.product_name FROM Products P WHERE P.product_price > (SELECT AVG(product_price) FROM Products)
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'hardware' AND P.product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'Hardware' AND P.product_price > (SELECT AVG(P2.product_price) FROM Products P2 WHERE P2.product_type_code = 'Hardware')
SELECT product_name FROM (SELECT product_name, RANK() OVER (ORDER BY product_price DESC) AS rank FROM Products WHERE product_type_code = 'Clothes') WHERE rank = 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price, product_id LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC, product_id ASC LIMIT 1
SELECT product_name FROM Products ORDER BY product_price DESC, product_id ASC
SELECT product_name FROM Products ORDER BY product_price DESC, product_id ASC
SELECT product_name FROM Products WHERE product_type_code LIKE 'hardware' ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price
SELECT product_type_code, COUNT(DISTINCT product_id) FROM Products GROUP BY product_type_code
SELECT COUNT(product_id), product_type_code FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS AveragePrice FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS AveragePrice FROM Products GROUP BY product_type_code
SELECT p.product_type_code FROM Products p GROUP BY p.product_type_code HAVING COUNT(p.product_id) >= 2
SELECT p.product_type_code FROM Products p GROUP BY p.product_type_code HAVING COUNT(p.product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Products GROUP BY product_type_code) AS counts)
SELECT product_type_code FROM Products JOIN Order_Items USING (product_id) GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(DISTINCT customer_id) AS TotalUniqueCustomers FROM Customers
SELECT customer_id, customer_name FROM Customers GROUP BY customer_id, customer_name
SELECT customer_id, customer_name FROM Customers GROUP BY customer_id, customer_name
SELECT Customers.customer_address, Customers.customer_phone, Customers.customer_email FROM Customers WHERE Customers.customer_name = 'Jeromy'
SELECT customer_address AS Address, customer_phone AS Phone, customer_email AS Email FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Customers GROUP BY payment_method_code) AS counts)
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM Customers GROUP BY payment_method_code) sub)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT customer_name FROM Customers WHERE payment_method_code IN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code) AS subquery))
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT Products.product_id, Products.product_type_code FROM Products ORDER BY Products.product_name
SELECT product_id, product_type_code FROM Products ORDER BY UPPER(product_name)
SELECT P.product_type_code FROM Products AS P GROUP BY P.product_type_code ORDER BY COUNT(P.product_id) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM Products GROUP BY product_type_code) as counts)
SELECT COUNT(*) AS TotalOrders FROM Customer_Orders
SELECT count(*) FROM Customer_Orders
SELECT Customer_Orders.order_id, Customer_Orders.order_date, Customer_Orders.order_status_code FROM Customer_Orders JOIN Customers ON Customer_Orders.customer_id = Customers.customer_id WHERE Customers.customer_name = 'Jeromy'
SELECT order_id, order_date, order_status_code FROM Customer_Orders WHERE customer_id IN (SELECT customer_id FROM Customers WHERE customer_name LIKE '%Jeromy%')
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS OrderCount FROM Customers C LEFT JOIN Customer_Orders O ON C.customer_id = O.customer_id GROUP BY C.customer_id
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS OrderTotal FROM Customers AS C LEFT JOIN Customer_Orders AS O ON C.customer_id = O.customer_id GROUP BY C.customer_id
SELECT Customers.customer_id, Customers.customer_name, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id GROUP BY Customers.customer_id HAVING COUNT(Customer_Orders.order_id) = (SELECT MAX(order_count) FROM (SELECT COUNT(order_id) AS order_count FROM Customer_Orders GROUP BY customer_id) AS counts)
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id HAVING COUNT(co.order_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(order_id) AS cnt FROM Customer_Orders GROUP BY customer_id) t)
SELECT order_status_code, COUNT(order_id) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(*) AS order_count FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Customer_Orders GROUP BY order_status_code) AS subquery)
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Customer_Orders GROUP BY order_status_code) tmp)
SELECT COUNT(*) FROM Customers AS c WHERE NOT EXISTS (SELECT NULL FROM Customer_Orders AS co WHERE co.customer_id = c.customer_id)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT TOTAL(Order_Items.order_quantity) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT TOTAL(Order_Items.order_quantity) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(*) FROM (SELECT DISTINCT Customers.customer_id FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor') AS unique_customers
SELECT COUNT(DISTINCT CO.customer_id) FROM Customer_Orders CO LEFT JOIN Order_Items OI ON CO.order_id = OI.order_id LEFT JOIN Products P ON OI.product_id = P.product_id WHERE P.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders WHERE customer_id IS NOT NULL
SELECT COUNT(DISTINCT customer_id) FROM (SELECT customer_id FROM Customer_Orders) AS orders
SELECT C.customer_id FROM Customers C WHERE NOT EXISTS (SELECT NULL FROM Customer_Orders CO WHERE C.customer_id = CO.customer_id)
SELECT customer_id FROM Customers WHERE NOT EXISTS (SELECT customer_id FROM Customer_Orders WHERE Customers.customer_id = Customer_Orders.customer_id)
SELECT DISTINCT CO.order_date, CO.order_id FROM Customer_Orders CO, Order_Items OI WHERE CO.order_id = OI.order_id AND (OI.order_quantity > 6 OR (SELECT COUNT(*) FROM Order_Items OI2 WHERE OI2.order_id = CO.order_id) > 3)
SELECT CO.order_id, CO.order_date FROM Customer_Orders AS CO INNER JOIN Order_Items AS OI ON CO.order_id = OI.order_id GROUP BY CO.order_id, CO.order_date HAVING SUM(OI.order_quantity) > 6 OR COUNT(DISTINCT OI.order_item_id) > 3
SELECT COUNT(Building_ID) AS BuildingCount FROM building
SELECT COUNT(Building_ID) AS TotalBuildings FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC, Region_ID ASC
SELECT building.Name FROM building ORDER BY building.Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC, Building_ID ASC
SELECT b.Address FROM building b ORDER BY b.Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE NOT (Completed_Year = 1980)
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year NOT LIKE 1980
SELECT AVG(r.Population) FROM region r
SELECT AVG(region.Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name AS RegionName FROM region ORDER BY RegionName
SELECT r.Capital FROM region AS r WHERE r.Area > 10000
SELECT r.Capital FROM region AS r WHERE r.Area > 10000
SELECT r.Capital FROM region r WHERE r.Population IN (SELECT MAX(Population) FROM region r2)
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region LIMIT 1)
SELECT `Name` FROM `region` ORDER BY `Area` DESC LIMIT 5
SELECT `Name` FROM `region` ORDER BY `Area` DESC LIMIT 5
SELECT b.Name, r.Name FROM building AS b JOIN region AS r ON b.Region_ID = r.Region_ID
SELECT b.Name, r.Name FROM building AS b, region AS r WHERE b.Region_ID = r.Region_ID
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) > 1)
SELECT region.Name FROM region INNER JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID HAVING COUNT(building.Building_ID) > 1
SELECT region.Capital FROM region JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID HAVING COUNT(building.Building_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM building GROUP BY Region_ID) AS SubQuery)
SELECT r.Capital FROM region r, building b WHERE r.Region_ID = b.Region_ID GROUP BY r.Region_ID, r.Capital ORDER BY COUNT(b.Building_ID) DESC LIMIT 1
SELECT Address, Capital FROM building, region WHERE building.Region_ID = region.Region_ID
SELECT building.Address, region.Name FROM building, region WHERE building.Region_ID = region.Region_ID
SELECT Number_of_Stories FROM building b JOIN region r ON b.Region_ID = r.Region_ID AND r.Name = 'Abruzzo'
SELECT b.Number_of_Stories FROM building b INNER JOIN region r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT `Completed_Year`, COUNT(*) AS `Count` FROM `building` GROUP BY `Completed_Year`
SELECT Completed_Year AS Year, COUNT(*) AS Count FROM building GROUP BY Year
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM building GROUP BY Completed_Year) AS Counts)
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM building GROUP BY Completed_Year) AS TempTable)
SELECT Name FROM region WHERE NOT EXISTS (SELECT 1 FROM building WHERE building.Region_ID = region.Region_ID)
SELECT r.Name FROM region r WHERE NOT EXISTS (SELECT * FROM building b WHERE b.Region_ID = r.Region_ID)
SELECT DISTINCT b.Completed_Year FROM building b WHERE b.Number_of_Stories > 20 INTERSECT SELECT DISTINCT b.Completed_Year FROM building b WHERE b.Number_of_Stories < 15
SELECT DISTINCT b1.Completed_Year FROM building b1 JOIN building b2 ON b1.Completed_Year = b2.Completed_Year WHERE b1.Number_of_Stories > 20 AND b2.Number_of_Stories < 15
SELECT DISTINCT building.Address FROM building
SELECT DISTINCT Address FROM building WHERE Address <> ''
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT b.Completed_Year FROM building AS b ORDER BY b.Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY 1
SELECT Channel_Details FROM Channels ORDER BY LENGTH(Channel_Details), Channel_Details
SELECT COUNT(*) FROM Services WHERE Service_ID IS NOT NULL
SELECT COUNT(*) FROM Services WHERE Service_ID IS NOT NULL
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) t)
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(Analytical_Layer_Type_Code) DESC LIMIT 1
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch')
SELECT DISTINCT S.Service_Details FROM Services S, Customers_and_Services CS, Customers C WHERE S.Service_ID = CS.Service_ID AND CS.Customer_ID = C.Customer_ID AND C.Customer_Details = 'Hardy Kutch'
SELECT S.Service_Details FROM Services S, Customers_and_Services CS WHERE S.Service_ID = CS.Service_ID GROUP BY S.Service_ID HAVING COUNT(CS.Customer_ID) > 3
SELECT Service_Details FROM Services WHERE EXISTS (SELECT NULL FROM Customers_and_Services WHERE Services.Service_ID = Customers_and_Services.Service_ID GROUP BY Service_ID HAVING COUNT(Customer_ID) > 3)
SELECT C.Customer_Details FROM Customers C, Customers_and_Services CS WHERE C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID HAVING COUNT(CS.Service_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Service_ID) AS Count FROM Customers_and_Services GROUP BY Customer_ID))
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1)
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID NOT IN (SELECT CS.Customer_ID FROM Customers_and_Services CS)
SELECT Customer_Details FROM Customers WHERE NOT EXISTS (SELECT 1 FROM Customers_and_Services WHERE Customers.Customer_ID = Customers_and_Services.Customer_ID)
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID = (SELECT Service_ID FROM (SELECT Service_ID, COUNT(*) AS cnt FROM Customers_and_Services GROUP BY Service_ID ORDER BY cnt ASC LIMIT 1) AS LeastUsed))
SELECT DISTINCT Customer_Details FROM Customers WHERE EXISTS (SELECT * FROM Customers_and_Services WHERE Customers.Customer_ID = Customers_and_Services.Customer_ID GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT COUNT(*) FROM (SELECT DISTINCT Customers_and_Services_Details FROM Customers_and_Services)
SELECT COUNT(DISTINCT Customers_and_Services_ID) FROM Customers_and_Services
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Customer_Details FROM Customers WHERE INSTR(Customer_Details, 'Kutch') > 0
SELECT DISTINCT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' UNION SELECT DISTINCT S.Service_Details FROM Services S JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID WHERE CI.Status_Code = 'good'
SELECT DISTINCT S.Service_Details FROM Services S WHERE S.Service_ID IN (SELECT CS.Service_ID FROM Customers_and_Services CS, Customers C WHERE CS.Customer_ID = C.Customer_ID AND C.Customer_Details = 'Hardy Kutch') OR S.Service_ID IN (SELECT CI.Service_ID FROM Customer_Interactions CI WHERE CI.Status_Code = 'good')
SELECT DISTINCT S.Service_Details FROM Services S WHERE EXISTS (SELECT * FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' AND CS.Service_ID = S.Service_ID) AND EXISTS (SELECT * FROM Customer_Interactions CI WHERE CI.Status_Code = 'bad' AND CI.Service_ID = S.Service_ID)
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'bad' AND Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch'))
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = '15 ij'))
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = '15 ij'))
SELECT C.Customer_Details FROM Customers C, Customer_Interactions CI WHERE C.Customer_ID = CI.Customer_ID AND CI.Status_Code = 'Stuck' AND CI.Services_and_Channels_Details = 'bad'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details = 'bad')
SELECT COUNT(*) FROM Integration_Platform WHERE Customer_Interaction_ID IN (SELECT Customer_Interaction_ID FROM Customer_Interactions WHERE Status_Code = 'Success')
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT C.Customer_Details FROM Customers C, Customer_Interactions CI, Integration_Platform IP WHERE C.Customer_ID = CI.Customer_ID AND CI.Customer_Interaction_ID = IP.Customer_Interaction_ID AND IP.Integration_Platform_Details LIKE '%failed%'
SELECT Customer_Details FROM Customers WHERE EXISTS (SELECT 1 FROM Customer_Interactions JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Customers.Customer_ID = Customer_Interactions.Customer_ID AND Integration_Platform_Details = 'Fail')
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT DISTINCT Service_ID FROM Customers_and_Services)
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT COUNT(Analytical_ID) AS Count, Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(*) AS TotalUses FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT S.Service_Details FROM Services AS S, Customers_and_Services AS CS WHERE S.Service_ID = CS.Service_ID AND CS.Customers_and_Services_Details LIKE 'unsatisfied'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customers_and_Services_Details LIKE 'unsatisfied')
SELECT COUNT(*) FROM Vehicles WHERE 'id' IS NOT NULL
SELECT COUNT(Vehicles.id) AS VehicleCount FROM Vehicles
SELECT Vehicles.name FROM Vehicles ORDER BY Vehicles.Model_year DESC
SELECT Vehicles.name FROM Vehicles ORDER BY Vehicles.Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles AS v
SELECT DISTINCT t.Type_of_powertrain FROM Vehicles AS t
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 UNION ALL SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2014
SELECT V.name, V.Type_of_powertrain, V.Annual_fuel_cost FROM Vehicles AS V WHERE V.Model_year IN (2013, 2014)
WITH Year2014 AS (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014), Year2013 AS (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013) SELECT Type_of_powertrain FROM Year2014 INTERSECT SELECT Type_of_powertrain FROM Year2013
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Model_year IN (2013, 2014) GROUP BY Type_of_powertrain HAVING COUNT(DISTINCT Model_year) = 2
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Vehicles GROUP BY Type_of_powertrain))
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Vehicles GROUP BY Type_of_powertrain) as counts)
SELECT MIN(Annual_fuel_cost) AS "Minimum Annual Fuel Cost", MAX(Annual_fuel_cost) AS "Maximum Annual Fuel Cost", AVG(Annual_fuel_cost) AS "Average Annual Fuel Cost" FROM Vehicles
SELECT MIN(Annual_fuel_cost) AS MinCost, MAX(Annual_fuel_cost) AS MaxCost, AVG(Annual_fuel_cost) AS AvgCost FROM Vehicles
SELECT V.name, V.Model_year FROM Vehicles V WHERE V.City_fuel_economy_rate <= V.Highway_fuel_economy_rate
SELECT V.name, V.Model_year FROM Vehicles V WHERE V.City_fuel_economy_rate <= V.Highway_fuel_economy_rate
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS AverageAnnualFuelCost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) >= 2
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(Vehicles.id) >= 2
SELECT `name`, `age`, `membership_credit` FROM `Customers`
SELECT `name`, `age`, `membership_credit` FROM `Customers`
SELECT name, age FROM (SELECT name, age, RANK() OVER (ORDER BY membership_credit DESC) AS rnk FROM Customers) WHERE rnk = 1
SELECT name, age FROM (SELECT name, age, RANK() OVER (ORDER BY membership_credit DESC) AS rnk FROM Customers) WHERE rnk = 1
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers WHERE membership_credit IS NOT NULL)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers c)
SELECT id AS DiscountID, name AS DiscountName, membership_credit AS MembershipCredit FROM Discount
SELECT id AS DiscountID, name AS DiscountName, membership_credit AS MembershipCredit FROM Discount
SELECT v.name, total_hours_sum FROM Vehicles v JOIN (SELECT vehicles_id, SUM(total_hours) AS total_hours_sum FROM Renting_history GROUP BY vehicles_id) r ON v.id = r.vehicles_id
SELECT Vehicles.name, TOTAL(Renting_history.total_hours) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name
SELECT V.name FROM Vehicles V WHERE V.id NOT IN (SELECT R.vehicles_id FROM Renting_history R)
SELECT name FROM Vehicles V WHERE V.id NOT IN (SELECT R.vehicles_id FROM Renting_history R)
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(customer_id) >= 2)
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(customer_id) >= 2)
SELECT V.name, V.Model_year FROM Vehicles V, Renting_history R WHERE V.id = R.vehicles_id GROUP BY R.vehicles_id HAVING COUNT(R.vehicles_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(vehicles_id) AS COUNT FROM Renting_history GROUP BY vehicles_id) AS SubQuery)
SELECT name, Model_year FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id HAVING COUNT(vehicles_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(vehicles_id) AS cnt FROM Renting_history GROUP BY vehicles_id)))
SELECT name FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id ORDER BY SUM(total_hours) DESC)
SELECT name FROM Vehicles JOIN (SELECT vehicles_id, SUM(total_hours) AS total FROM Renting_history GROUP BY vehicles_id) AS SubQuery ON Vehicles.id = SubQuery.vehicles_id ORDER BY SubQuery.total DESC
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name, Type_of_powertrain FROM Vehicles WHERE EXISTS (SELECT 1 FROM Renting_history WHERE vehicles_id = Vehicles.id AND total_hours > 30)
SELECT V.name, V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.id HAVING SUM(R.total_hours) > 30
SELECT Type_of_powertrain, AVG(Vehicles.City_fuel_economy_rate), AVG(Vehicles.Highway_fuel_economy_rate) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS CityFuelEconomyAverage, AVG(Highway_fuel_economy_rate) AS HighwayFuelEconomyAverage FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT S.bio_data, S.student_id FROM Students S WHERE EXISTS (SELECT 1 FROM Classes C WHERE C.student_id = S.student_id GROUP BY C.student_id HAVING COUNT(C.class_id) >= 2) AND NOT EXISTS (SELECT 1 FROM Detention D WHERE D.student_id = S.student_id GROUP BY D.student_id HAVING COUNT(D.detention_id) >= 2)
SELECT DISTINCT S.bio_data, S.student_id FROM Students S LEFT JOIN Classes C ON S.student_id = C.student_id LEFT JOIN Detention D ON S.student_id = D.student_id GROUP BY S.student_id HAVING COUNT(DISTINCT C.class_id) >= 2 OR COUNT(DISTINCT D.detention_id) < 2
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%') AND teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT DISTINCT T1.teacher_details FROM Teachers T1 WHERE EXISTS (SELECT * FROM Classes T2 WHERE T2.teacher_id = T1.teacher_id AND T2.class_details LIKE '%data%') AND NOT EXISTS (SELECT * FROM Classes T3 WHERE T3.teacher_id = T1.teacher_id AND T3.class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT amount_of_loan, date_of_loan FROM Student_Loans WHERE student_id IN (SELECT student_id FROM (SELECT student_id, COUNT(*) AS cnt FROM Achievements GROUP BY student_id) AS sub WHERE sub.cnt >= 2)
SELECT SL.student_id, SL.amount_of_loan, SL.date_of_loan FROM Student_Loans SL INNER JOIN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2) AS A ON SL.student_id = A.student_id
SELECT T.teacher_id, T.teacher_details FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id GROUP BY T.teacher_id HAVING COUNT(C.class_id) = (SELECT MAX(class_count) FROM (SELECT teacher_id, COUNT(class_id) AS class_count FROM Classes GROUP BY teacher_id) AS subquery)
SELECT T.teacher_id, T.teacher_details FROM Teachers AS T INNER JOIN Classes AS C ON T.teacher_id = C.teacher_id GROUP BY T.teacher_id ORDER BY COUNT(C.class_id) DESC LIMIT 1
SELECT DISTINCT D.detention_summary FROM Detention D
SELECT detention_summary FROM Detention GROUP BY detention_summary
SELECT Students.bio_data, Students.student_details, Ref_Address_Types.address_type_description FROM Students, Students_Addresses, Ref_Address_Types WHERE Students.student_id = Students_Addresses.student_id AND Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT bio_data AS Personal_Details, student_details AS Student_Details, address_type_description AS Address_Type FROM Students, Students_Addresses, Ref_Address_Types WHERE Students.student_id = Students_Addresses.student_id AND Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT address_details, bio_data FROM Students INNER JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id INNER JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id
SELECT Students.bio_data, Addresses.address_details FROM Students LEFT JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id LEFT JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id
SELECT bio_data, date_of_transcript FROM Students s INNER JOIN Transcripts t ON s.student_id = t.student_id
SELECT bio_data, date_of_transcript FROM Students, Transcripts WHERE Students.student_id = Transcripts.student_id
SELECT behaviour_monitoring_details, COUNT(student_id) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(student_id) = (SELECT MAX(count) FROM (SELECT COUNT(student_id) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) AS subquery)
SELECT behaviour_monitoring_details, COUNT(*) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) AS counts)
SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id GROUP BY B.behaviour_monitoring_details HAVING COUNT(*) = 3 ORDER BY COUNT(*) DESC LIMIT 1
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(DISTINCT student_id) = 3)
SELECT S.bio_data FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id GROUP BY S.student_id HAVING COUNT(DISTINCT B.behaviour_monitoring_details) = 1 AND B.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT S.bio_data FROM Students S WHERE EXISTS (SELECT 1 FROM Behaviour_Monitoring B WHERE S.student_id = B.student_id GROUP BY B.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT bio_data, event_date FROM Students, Student_Events WHERE Students.student_id = Student_Events.student_id
SELECT bio_data, event_date FROM Students, Student_Events WHERE Students.student_id = Student_Events.student_id
SELECT A.event_type_code, B.event_type_description, COUNT(DISTINCT A.student_id) AS StudentCount FROM Student_Events A LEFT JOIN Ref_Event_Types B ON A.event_type_code = B.event_type_code GROUP BY A.event_type_code, B.event_type_description ORDER BY StudentCount DESC LIMIT 1
SELECT COUNT(DISTINCT SE.student_id) AS num_students, SE.event_type_code, RET.event_type_description FROM Student_Events SE INNER JOIN Ref_Event_Types RET ON SE.event_type_code = RET.event_type_code GROUP BY SE.event_type_code ORDER BY num_students DESC LIMIT 1
SELECT A.achievement_details, R.achievement_type_description FROM Achievements A INNER JOIN Ref_Achievement_Type R ON A.achievement_type_code = R.achievement_type_code
SELECT ACH.achievement_details, ACH_TYPE.achievement_type_description FROM Achievements ACH JOIN Ref_Achievement_Type ACH_TYPE ON ACH.achievement_type_code = ACH_TYPE.achievement_type_code
SELECT COUNT(DISTINCT T.teacher_id) FROM Teachers T WHERE T.teacher_id IN (SELECT C.teacher_id FROM Classes C LEFT JOIN Achievements A ON C.student_id = A.student_id WHERE A.achievement_id IS NULL)
SELECT COUNT(DISTINCT teacher_id) FROM Classes WHERE student_id NOT IN (SELECT DISTINCT student_id FROM Achievements)
SELECT t.date_of_transcript, t.transcript_details FROM Transcripts AS t
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT start_time, end_time FROM (SELECT datetime_detention_start AS start_time, datetime_detention_end AS end_time FROM Detention) AS Detention_Times
SELECT `datetime_detention_start`, `datetime_detention_end` FROM `Detention`
SELECT bio_data FROM Students WHERE INSTR(student_details, 'Suite') > 0
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT A.teacher_details, B.student_details FROM Teachers A, Classes C, Students B WHERE A.teacher_id = C.teacher_id AND C.student_id = B.student_id
SELECT T1.teacher_details AS TeacherDetails, T2.student_details AS StudentDetails FROM Teachers T1 INNER JOIN Classes C ON T1.teacher_id = C.teacher_id INNER JOIN Students T2 ON C.student_id = T2.student_id
SELECT teacher_id, COUNT(class_id) AS total_classes FROM Classes GROUP BY teacher_id HAVING total_classes = (SELECT MAX(total_classes) FROM (SELECT COUNT(class_id) AS total_classes FROM Classes GROUP BY teacher_id) AS subquery)
SELECT teacher_id, COUNT(class_id) FROM Classes GROUP BY teacher_id ORDER BY COUNT(class_id) DESC LIMIT 1
SELECT student_id, COUNT(*) FROM Classes GROUP BY student_id HAVING COUNT(*) = (SELECT MAX(courses) FROM (SELECT COUNT(*) AS courses FROM Classes GROUP BY student_id) AS course_counts)
SELECT student_id, COUNT(*) FROM Classes GROUP BY student_id HAVING COUNT(*) = (SELECT MAX(course_count) FROM (SELECT student_id, COUNT(*) AS course_count FROM Classes GROUP BY student_id) AS subquery)
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(DISTINCT class_id) = 2)
SELECT S.student_id, S.bio_data, S.student_details FROM Students S JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id HAVING COUNT(C.class_id) = 2
SELECT r.detention_type_code, r.detention_type_description FROM Ref_Detention_Type r LEFT OUTER JOIN Detention d ON r.detention_type_code = d.detention_type_code GROUP BY r.detention_type_code, r.detention_type_description ORDER BY COUNT(d.detention_id) ASC LIMIT 1
SELECT a.detention_type_code, b.detention_type_description FROM (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1) a JOIN Ref_Detention_Type b ON a.detention_type_code = b.detention_type_code
SELECT bio_data, other_details FROM Students, Student_Loans WHERE Students.student_id = Student_Loans.student_id AND Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT S.bio_data, S.student_details FROM Students S WHERE S.student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan ASC LIMIT 1
SELECT S.bio_data FROM Students S WHERE EXISTS (SELECT 1 FROM Student_Loans SL WHERE S.student_id = SL.student_id AND SL.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans))
SELECT bio_data FROM Students WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC, date_of_loan DESC LIMIT 1)
SELECT t.date_of_transcript FROM Transcripts t WHERE EXISTS (SELECT 1 FROM Student_Loans s WHERE s.student_id = t.student_id AND s.amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans))
SELECT t.date_of_transcript FROM Transcripts t JOIN (SELECT student_id, MAX(total_loans) FROM (SELECT student_id, SUM(amount_of_loan) AS total_loans FROM Student_Loans GROUP BY student_id) y GROUP BY student_id ORDER BY total_loans DESC LIMIT 1) sl ON t.student_id = sl.student_id
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT C.teacher_id FROM Classes C INNER JOIN (SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1) AS S ON C.student_id = S.student_id)
SELECT T.teacher_details FROM Teachers T WHERE EXISTS (SELECT 1 FROM Classes C JOIN Transcripts TR ON C.student_id = TR.student_id WHERE C.teacher_id = T.teacher_id AND TR.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts))
SELECT student_id, SUM(amount_of_loan) AS total_loan_amount FROM Student_Loans GROUP BY student_id
SELECT student_id, SUM(amount_of_loan) AS total_loan_amount FROM Student_Loans GROUP BY student_id
SELECT S.student_id, S.bio_data, (SELECT COUNT(class_id) FROM Classes WHERE Classes.student_id = S.student_id) AS CourseCount FROM Students S
SELECT Students.student_id, Students.bio_data, COUNT(Classes.class_id) FROM Students LEFT JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id
SELECT COUNT(*) FROM (SELECT DISTINCT student_id FROM Detention)
SELECT COUNT(*) FROM (SELECT DISTINCT student_id FROM Detention d WHERE d.student_id IS NOT NULL)
SELECT address_type_code, address_type_description FROM Ref_Address_Types NATURAL JOIN (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code ORDER BY COUNT(*) DESC LIMIT 1) AS MostCommon
SELECT RAT.address_type_code, RAT.address_type_description FROM Ref_Address_Types RAT, Students_Addresses SA WHERE RAT.address_type_code = SA.address_type_code GROUP BY RAT.address_type_code, RAT.address_type_description HAVING COUNT(SA.address_type_code) = (SELECT MAX(COUNT) FROM (SELECT COUNT(address_type_code) AS COUNT FROM Students_Addresses GROUP BY address_type_code) AS Counts)
SELECT bio_data FROM Students WHERE EXISTS (SELECT * FROM Student_Events WHERE Students.student_id = Student_Events.student_id) AND NOT EXISTS (SELECT * FROM Student_Loans WHERE Students.student_id = Student_Loans.student_id)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events EXCEPT SELECT student_id FROM Student_Loans)
SELECT SA.date_from, SA.date_to FROM Students_Addresses SA JOIN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(transcript_id) = 2) AS FilteredStudents ON SA.student_id = FilteredStudents.student_id
SELECT SA.date_from, SA.date_to FROM Students_Addresses AS SA WHERE EXISTS (SELECT 1 FROM Transcripts AS T WHERE T.student_id = SA.student_id GROUP BY T.student_id HAVING COUNT(T.transcript_id) = 2)
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention WHERE datetime_detention_start IS NOT NULL
SELECT author.Name FROM Author author
SELECT Name AS AuthorName FROM Author
SELECT Client.Name, Client.Address FROM Client
SELECT Client.Name, Client.Address FROM Client
SELECT Title, ISBN, SalePrice FROM Book WHERE SalePrice IS NOT NULL
SELECT B.Title, B.ISBN, B.SalePrice FROM Book B
SELECT COUNT(DISTINCT ISBN) FROM Book
SELECT COUNT(DISTINCT ISBN) FROM Book
SELECT count(*) FROM Author
SELECT COUNT(1) FROM Author
SELECT count(*) FROM Client
SELECT count(*) FROM Client
SELECT Name, Address FROM Client ORDER BY Name, Address
SELECT Name, Address FROM Client ORDER BY Name ASC, Address ASC
SELECT b.Title AS BookTitle, a.Name AS AuthorName FROM Book b JOIN Author_Book ab ON b.ISBN = ab.ISBN JOIN Author a ON ab.Author = a.idAuthor WHERE b.ISBN = ab.ISBN AND ab.Author = a.idAuthor
SELECT b.Title AS 'Book Title', a.Name AS 'Author Name' FROM Book b JOIN Author_Book ab ON b.ISBN = ab.ISBN JOIN Author a ON ab.Author = a.idAuthor
SELECT IdOrder, Name FROM Orders JOIN Client ON Orders.IdClient = Client.IdClient
SELECT Orders.IdOrder, Client.Name FROM Orders INNER JOIN Client ON Orders.IdClient = Client.IdClient
SELECT A.Name, COUNT(B.ISBN) AS BooksWritten FROM Author A LEFT JOIN Author_Book AB ON A.idAuthor = AB.Author LEFT JOIN Book B ON AB.ISBN = B.ISBN GROUP BY A.idAuthor
SELECT A.Name, COUNT(AB.ISBN) FROM Author A LEFT JOIN Author_Book AB ON A.idAuthor = AB.Author GROUP BY A.idAuthor
SELECT b.ISBN, COUNT(DISTINCT b.IdOrder) FROM Books_Order b GROUP BY b.ISBN
SELECT b.ISBN, (SELECT COUNT(*) FROM Books_Order WHERE ISBN = b.ISBN) AS OrderCount FROM Book b
SELECT b.ISBN, SUM(bo.amount) AS TotalAmount FROM Book b LEFT JOIN Books_Order bo ON b.ISBN = bo.ISBN GROUP BY b.ISBN
SELECT bo.ISBN, SUM(bo.amount) total_ordered FROM Books_Order bo GROUP BY bo.ISBN
SELECT B.Title FROM Book B WHERE EXISTS (SELECT 1 FROM Books_Order BO WHERE B.ISBN = BO.ISBN GROUP BY BO.ISBN ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Title FROM (SELECT ISBN, COUNT(*) AS OrdersCount FROM Books_Order GROUP BY ISBN) AS OrderCounts JOIN Book ON Book.ISBN = OrderCounts.ISBN ORDER BY OrdersCount DESC LIMIT 1
SELECT Book.Title, Book.PurchasePrice FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Books_Order.ISBN HAVING SUM(Books_Order.amount) = (SELECT MAX(TotalAmount) FROM (SELECT SUM(amount) AS TotalAmount FROM Books_Order GROUP BY ISBN) AS SubQuery)
SELECT b.Title, b.PurchasePrice FROM Book b, Books_Order bo WHERE b.ISBN = bo.ISBN GROUP BY b.ISBN HAVING SUM(bo.amount) = (SELECT MAX(total_amount) FROM (SELECT SUM(amount) AS total_amount FROM Books_Order GROUP BY ISBN) tmp)
SELECT B.Title FROM Book AS B INNER JOIN Books_Order AS BO ON B.ISBN = BO.ISBN
SELECT DISTINCT B.Title FROM Book AS B, Books_Order AS BO WHERE B.ISBN = BO.ISBN
SELECT Name FROM Client WHERE EXISTS (SELECT 1 FROM Orders WHERE Orders.IdClient = Client.IdClient)
SELECT DISTINCT Name FROM Client WHERE EXISTS (SELECT 1 FROM Orders WHERE Orders.IdClient = Client.IdClient)
SELECT Name, COUNT(Orders.IdOrder) FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Name, COUNT(Orders.IdOrder) AS NumberOfOrders FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders GROUP BY IdClient HAVING COUNT(IdOrder) = (SELECT MAX(Cnt) FROM (SELECT COUNT(IdOrder) AS Cnt FROM Orders GROUP BY IdClient)))
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders GROUP BY IdClient HAVING COUNT(IdOrder) = (SELECT MAX(Cnt) FROM (SELECT COUNT(IdOrder) AS Cnt FROM Orders GROUP BY IdClient) AS Sub))
SELECT Client.Name, TotalBooksOrdered FROM Client JOIN (SELECT IdClient, SUM(amount) AS TotalBooksOrdered FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient) AS OrderTotals ON Client.IdClient = OrderTotals.IdClient
SELECT C.Name, SUM(B.amount) FROM Client C LEFT JOIN Orders O ON C.IdClient = O.IdClient LEFT JOIN Books_Order B ON O.IdOrder = B.IdOrder GROUP BY C.Name
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Client.Name FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.IdClient HAVING SUM(Books_Order.amount) = (SELECT MAX(TotalAmount) FROM (SELECT SUM(Books_Order.amount) AS TotalAmount FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Orders.IdClient) AS SubQuery)
SELECT B.Title FROM Book B LEFT JOIN Books_Order BO ON B.ISBN = BO.ISBN WHERE BO.ISBN IS NULL
SELECT B.Title FROM Book B LEFT JOIN Books_Order BO ON B.ISBN = BO.ISBN WHERE BO.ISBN IS NULL
SELECT c.Name FROM Client c WHERE c.IdClient NOT IN (SELECT o.IdClient FROM Orders o)
SELECT c.Name FROM Client c WHERE c.IdClient NOT IN (SELECT o.IdClient FROM Orders o)
SELECT max(SalePrice), min(SalePrice) FROM Book
SELECT (SELECT MAX(SalePrice) FROM Book) AS MaxPrice, (SELECT MIN(SalePrice) FROM Book) AS MinPrice
SELECT AVG(Book.PurchasePrice) AS AveragePurchasePrice, AVG(Book.SalePrice) AS AverageSalePrice FROM Book
SELECT AVG(PurchasePrice) AS AvgPurchase, AVG(SalePrice) AS AvgSale FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book WHERE SalePrice IS NOT NULL AND SalePrice > 0)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(Book.SalePrice) FROM Book)
SELECT b.Title FROM Book b WHERE b.SalePrice = (SELECT MIN(b2.SalePrice) FROM Book b2)
SELECT Title FROM Book WHERE SalePrice IN (SELECT MIN(SalePrice) FROM Book)
SELECT B.Title FROM Book B WHERE B.PurchasePrice IN (SELECT MAX(B2.PurchasePrice) FROM Book B2)
SELECT Title FROM (SELECT Title, PurchasePrice, RANK() OVER (ORDER BY PurchasePrice DESC) AS rank FROM Book) AS RankedBooks WHERE rank = 1
SELECT AVG(b.SalePrice) FROM Book b WHERE b.ISBN IN (SELECT ab.ISBN FROM Author_Book ab JOIN Author a ON ab.Author = a.idAuthor WHERE a.Name = 'George Orwell')
SELECT AVG(SalePrice) FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell')
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'Plato'))
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'Plato'))
SELECT B.Title FROM Book B INNER JOIN Author_Book AB ON B.ISBN = AB.ISBN INNER JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book AS B INNER JOIN Author_Book AS AB ON B.ISBN = AB.ISBN INNER JOIN Author AS A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT B.Title FROM Book B INNER JOIN Author_Book AB ON B.ISBN = AB.ISBN INNER JOIN Author A ON A.idAuthor = AB.Author WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Name FROM Author WHERE idAuthor IN (SELECT Author FROM Author_Book WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice'))
SELECT Name FROM Author WHERE idAuthor IN (SELECT Author FROM Author_Book WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice'))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%')
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%')
SELECT COUNT(DISTINCT IdOrder) FROM Books_Order, Book WHERE Books_Order.ISBN = Book.ISBN AND Book.Title = 'Pride and Prejudice'
SELECT COUNT(DISTINCT IdOrder) FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')
SELECT IdOrder FROM Orders o WHERE EXISTS (SELECT * FROM Books_Order bo JOIN Book b ON bo.ISBN = b.ISBN WHERE o.IdOrder = bo.IdOrder AND b.Title = 'Pride and Prejudice') AND EXISTS (SELECT * FROM Books_Order bo JOIN Book b ON bo.ISBN = b.ISBN WHERE o.IdOrder = bo.IdOrder AND b.Title = 'The Little Prince')
SELECT o.IdOrder FROM Orders o INNER JOIN Books_Order bo ON o.IdOrder = bo.IdOrder INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice' INTERSECT SELECT o.IdOrder FROM Orders o INNER JOIN Books_Order bo ON o.IdOrder = bo.IdOrder INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'The Little Prince'
SELECT b.ISBN FROM Books_Order b JOIN Orders o ON b.IdOrder = o.IdOrder JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'Peter Doe' INTERSECT SELECT b.ISBN FROM Books_Order b JOIN Orders o ON b.IdOrder = o.IdOrder JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'James Smith'
SELECT DISTINCT b.ISBN FROM Books_Order b INNER JOIN Orders o ON b.IdOrder = o.IdOrder INNER JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'Peter Doe' OR c.Name = 'James Smith' GROUP BY b.ISBN HAVING COUNT(DISTINCT c.Name) = 2
SELECT B.Title FROM Book B WHERE EXISTS (SELECT 1 FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' AND B.ISBN = BO.ISBN) AND NOT EXISTS (SELECT 1 FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith' AND B.ISBN = BO.ISBN)
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'Peter Doe') AND ISBN NOT IN (SELECT ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'James Smith')
SELECT Name FROM Client WHERE EXISTS (SELECT 1 FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Client.IdClient = Orders.IdClient AND Book.Title = 'Pride and Prejudice')
SELECT Name FROM Client WHERE IdClient IN (SELECT o.IdClient FROM Orders o, Books_Order bo, Book b WHERE o.IdOrder = bo.IdOrder AND bo.ISBN = b.ISBN AND b.Title = 'Pride and Prejudice')
SELECT COUNT(DISTINCT Book_ID) FROM book
SELECT Title FROM book ORDER BY Title COLLATE NOCASE
SELECT `Title` FROM `book` ORDER BY `Pages` DESC
SELECT book.Type AS Book_Type, book.Release AS Release_Date FROM book
SELECT `Type`, MAX(`Chapters`) Maximum_Chapters, MIN(`Chapters`) Minimum_Chapters FROM `book` GROUP BY `Type`
SELECT Title FROM book WHERE Type <> 'Poet'
SELECT AVG(review.Rating) FROM review
SELECT Title, Rating FROM book LEFT JOIN review ON book.Book_ID = review.Book_ID
SELECT r.Rating FROM review r WHERE EXISTS (SELECT 1 FROM book b WHERE b.Book_ID = r.Book_ID ORDER BY b.Chapters DESC LIMIT 1)
SELECT Rank FROM review INNER JOIN book ON review.Book_ID = book.Book_ID ORDER BY Pages ASC LIMIT 1
SELECT Title FROM book WHERE Book_ID = (SELECT Book_ID FROM review ORDER BY Rank DESC LIMIT 1)
SELECT AVG(Readers_in_Million) FROM review INNER JOIN book ON review.Book_ID = book.Book_ID AND book.Type = 'Novel'
SELECT Type, COUNT(Book_ID) FROM book GROUP BY Type
SELECT Type FROM book GROUP BY Type HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM book GROUP BY Type) tmp)
SELECT DISTINCT Type FROM book WHERE Type IN (SELECT Type FROM book GROUP BY Type HAVING COUNT(Book_ID) >= 3)
SELECT book.Title FROM book INNER JOIN review ON book.Book_ID = review.Book_ID ORDER BY review.Rating ASC
SELECT book.Title, book.Audio FROM book JOIN review ON book.Book_ID = review.Book_ID GROUP BY book.Book_ID ORDER BY SUM(review.Readers_in_Million) DESC
SELECT COUNT(*) FROM book b WHERE b.Book_ID NOT IN (SELECT r.Book_ID FROM review r)
SELECT Type FROM book WHERE Chapters > 75 OR Chapters < 50 GROUP BY Type HAVING COUNT(DISTINCT CASE WHEN Chapters > 75 THEN 'high' WHEN Chapters < 50 THEN 'low' END) = 2
SELECT COUNT(DISTINCT Type) FROM book
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT DISTINCT Book_ID FROM review)
SELECT COUNT(*) FROM `customer`
SELECT COUNT(*) FROM `customer`
SELECT Name FROM customer ORDER BY Level_of_Membership ASC, Name ASC
SELECT `Name` FROM `customer` ORDER BY `Level_of_Membership` ASC
SELECT c.Nationality, c.Card_Credit FROM customer AS c
SELECT Nationality, Card_Credit FROM customer WHERE Customer_ID IS NOT NULL
SELECT customer.Name FROM customer WHERE customer.Nationality = 'England' OR customer.Nationality = 'Australia'
SELECT customer.Name FROM customer WHERE customer.Nationality = 'England' OR customer.Nationality = 'Australia'
SELECT AVG(c.Card_Credit) FROM customer AS c WHERE c.Level_of_Membership > 1
SELECT AVG(c.Card_Credit) FROM customer AS c WHERE c.Level_of_Membership > 1
SELECT Card_Credit FROM customer WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer) LIMIT 1
SELECT Card_Credit FROM customer WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer)
SELECT Nationality, COUNT(DISTINCT Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(DISTINCT Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM customer GROUP BY Nationality) t)
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM customer GROUP BY Nationality) AS Counts)
SELECT DISTINCT c.Nationality FROM customer c WHERE EXISTS (SELECT 1 FROM customer WHERE Nationality = c.Nationality AND Card_Credit < 50) AND EXISTS (SELECT 1 FROM customer WHERE Nationality = c.Nationality AND Card_Credit > 75)
SELECT DISTINCT Nationality FROM customer WHERE Card_Credit > 50 INTERSECT SELECT DISTINCT Nationality FROM customer WHERE Card_Credit < 75
SELECT Name, Dish_Name FROM customer, customer_order WHERE customer.Customer_ID = customer_order.Customer_ID
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID ORDER BY customer_order.Quantity DESC
SELECT customer.Name, customer_order.Dish_Name FROM customer_order INNER JOIN customer ON customer_order.Customer_ID = customer.Customer_ID ORDER BY customer_order.Quantity DESC
SELECT Name, TOTAL(Quantity) FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID
SELECT c.Name, SUM(co.Quantity) AS Total_Quantity FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Name
SELECT c.Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID HAVING TOTAL(co.Quantity) > 1
SELECT c.Name FROM customer c WHERE EXISTS (SELECT 1 FROM customer_order co WHERE co.Customer_ID = c.Customer_ID GROUP BY co.Customer_ID HAVING SUM(co.Quantity) > 1)
SELECT DISTINCT Manager AS DistinctManagers FROM branch
SELECT b.Manager FROM branch b GROUP BY b.Manager
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order WHERE Customer_ID IS NOT NULL)
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order WHERE Customer_ID IS NOT NULL)
SELECT COUNT(*) AS TotalMembers FROM member
SELECT member.Name FROM member ORDER BY member.Age ASC
SELECT member.Name AS MemberName, member.Nationality AS MemberNationality FROM member
SELECT m.Name FROM member AS m WHERE m.Nationality != 'England'
SELECT Name FROM member WHERE Age IN (19, 20)
SELECT Name FROM member WHERE Age IN (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(1) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT Nationality, COUNT(*) AS Count FROM member GROUP BY Nationality) AS TempTable)
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Member_ID) >= 2
SELECT Name, Club_Name FROM member JOIN club_leader USING(Member_ID) JOIN club USING(Club_ID)
SELECT member.Name FROM member INNER JOIN club_leader ON member.Member_ID = club_leader.Member_ID INNER JOIN club ON club_leader.Club_ID = club.Club_ID WHERE club.Overall_Ranking > 100
SELECT Name FROM member JOIN club_leader USING(Member_ID) WHERE Year_Join < 2018
SELECT member.Name FROM member, club_leader, club WHERE member.Member_ID = club_leader.Member_ID AND club_leader.Club_ID = club.Club_ID AND club.Club_Name = 'Houston'
SELECT Name FROM member m WHERE NOT EXISTS (SELECT NULL FROM club_leader cl WHERE cl.Member_ID = m.Member_ID)
SELECT DISTINCT Nationality FROM member WHERE Age > 22 INTERSECT SELECT DISTINCT Nationality FROM member WHERE Age < 19
SELECT AVG(Age) FROM member WHERE Member_ID IN (SELECT Member_ID FROM club_leader)
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT cs.Collection_Subset_Name FROM Collection_Subsets cs
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IS NOT NULL
SELECT cs.Collecrtion_Subset_Details FROM Collection_Subsets cs WHERE cs.Collection_Subset_Name = 'Top collection'
SELECT DISTINCT C.Collection_Description FROM Collections C INNER JOIN Collection_Subsets CS ON C.Collection_ID = CS.Collection_Subset_ID WHERE CS.Collection_Subset_Name = 'Top collection'
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT ds.Document_Subset_Details FROM Document_Subsets AS ds WHERE ds.Document_Subset_Name = 'Best for 2000'
SELECT ds.Document_Subset_Details FROM Document_Subsets ds WHERE ds.Document_Subset_Name = 'Best for 2000'
SELECT DISTINCT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID AS Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Document_Object_ID = (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Objects.Owner FROM Document_Objects WHERE Document_Objects.Description LIKE 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT D2.Owner FROM Document_Objects D1 JOIN Document_Objects D2 ON D1.Parent_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Marlin'
SELECT DISTINCT d.Description FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL
SELECT DISTINCT D.Description FROM Document_Objects D INNER JOIN Document_Objects P ON D.Document_Object_ID = P.Parent_Document_Object_ID
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin' AND Description IS NOT NULL
SELECT COUNT(*) FROM Document_Objects WHERE Owner LIKE 'Marlin'
SELECT d.Document_Object_ID FROM Document_Objects d WHERE d.Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT d.Document_Object_ID FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL
SELECT d.Parent_Document_Object_ID, COUNT(*) AS NumberOfChildren FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID
SELECT Parent_Document_Object_ID AS ParentID, COUNT(Document_Object_ID) AS ChildCount FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT collection_name FROM collections
SELECT Collection_Name FROM Collections WHERE Collection_Name IS NOT NULL
SELECT Collection_Description FROM Collections WHERE Collection_Name LIKE 'Best'
SELECT Collection_Description FROM Collections WHERE UPPER(Collection_Name) = UPPER('Best')
SELECT C2.Collection_Name FROM Collections C1, Collections C2 WHERE C1.Parent_Collection_ID = C2.Collection_ID AND C1.Collection_Name = 'Nice'
SELECT C.Collection_Name FROM Collections AS C JOIN Collections AS P ON C.Collection_ID = P.Parent_Collection_ID WHERE P.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL AND Parent_Collection_ID != Collection_ID)
SELECT C.Collection_Name FROM Collections AS C WHERE C.Collection_ID NOT IN (SELECT P.Parent_Collection_ID FROM Collections AS P WHERE P.Parent_Collection_ID IS NOT NULL)
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1)
SELECT count(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Collection_ID != Parent_Collection_ID
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Collection_ID != Parent_Collection_ID
SELECT Related_Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Objects DO ON DSM.Document_Object_ID = DO.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT DSM.Related_Document_Object_ID FROM Document_Objects DO INNER JOIN Document_Subset_Members DSM ON DO.Document_Object_ID = DSM.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT CS.Collection_Subset_ID, CS.Collection_Subset_Name, COUNT(CSM.Collection_ID) AS TotalCollections FROM Collection_Subsets CS LEFT JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID GROUP BY CS.Collection_Subset_ID
SELECT CS.Collection_Subset_ID, CS.Collection_Subset_Name, COUNT(CSM.Collection_ID) AS Collections_Count FROM Collection_Subsets CS LEFT JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID GROUP BY CS.Collection_Subset_ID, CS.Collection_Subset_Name
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY COUNT(Related_Document_Object_ID) ASC LIMIT 1
SELECT d.Document_Object_ID FROM Document_Objects AS d LEFT JOIN Documents_in_Collections AS dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID ORDER BY COUNT(dc.Document_Object_ID) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Related_Count BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Related_Count BETWEEN 2 AND 4
SELECT DISTINCT d.Owner FROM Document_Objects d WHERE d.Document_Object_ID IN (SELECT m.Related_Document_Object_ID FROM Document_Subset_Members m JOIN Document_Objects o ON m.Document_Object_ID = o.Document_Object_ID WHERE o.Owner = 'Braeden')
SELECT DISTINCT related.Owner FROM Document_Objects AS related WHERE EXISTS (SELECT 1 FROM Document_Subset_Members AS DSM JOIN Document_Objects AS D ON DSM.Document_Object_ID = D.Document_Object_ID WHERE D.Owner = 'Braeden' AND DSM.Related_Document_Object_ID = related.Document_Object_ID)
SELECT DISTINCT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden'))
SELECT DISTINCT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden'))
SELECT ds.Document_Subset_ID, ds.Document_Subset_Name, COUNT(DISTINCT dsm.Document_Object_ID) AS Document_Count FROM Document_Subsets ds LEFT JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID GROUP BY ds.Document_Subset_ID
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS Num_Documents FROM Document_Subsets DS LEFT JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID LEFT JOIN Document_Objects DO ON DSM.Document_Object_ID = DO.Document_Object_ID GROUP BY DS.Document_Subset_ID
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS DocumentCount FROM Document_Subsets DS LEFT OUTER JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY DocumentCount DESC LIMIT 1
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS Document_Count FROM Document_Subsets DS JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY Document_Count DESC LIMIT 1
SELECT DISTINCT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subset_Name = 'Best for 2000'
SELECT dmo.Document_Object_ID FROM Document_Objects dmo, Document_Subset_Members dsm, Document_Subsets ds WHERE dmo.Document_Object_ID = dsm.Document_Object_ID AND dsm.Document_Subset_ID = ds.Document_Subset_ID AND ds.Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Name, Document_Object_ID FROM Document_Subsets JOIN Document_Subset_Members USING(Document_Subset_ID)
SELECT a.Document_Object_ID, b.Document_Subset_Name FROM Document_Objects a, Document_Subset_Members c, Document_Subsets b WHERE a.Document_Object_ID = c.Document_Object_ID AND c.Document_Subset_ID = b.Document_Subset_ID
SELECT Collection_Name FROM Collections, Documents_in_Collections, Document_Objects WHERE Collections.Collection_ID = Documents_in_Collections.Collection_ID AND Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID AND Document_Objects.Owner = 'Ransom'
SELECT c.Collection_Name FROM Collections c JOIN Documents_in_Collections dc ON c.Collection_ID = dc.Collection_ID JOIN Document_Objects do ON dc.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT d.Document_Object_ID, COUNT(c.Collection_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID GROUP BY d.Document_Object_ID
SELECT d.Document_Object_ID, COUNT(c.Collection_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID GROUP BY d.Document_Object_ID
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections, Collections WHERE Documents_in_Collections.Collection_ID = Collections.Collection_ID AND Collections.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Document_Object_ID) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collection_Name = 'Best'
SELECT C.Collection_Name, C.Collection_ID, COUNT(D.Document_Object_ID) FROM Collections C, Documents_in_Collections D WHERE C.Collection_ID = D.Collection_ID GROUP BY C.Collection_ID ORDER BY COUNT(D.Document_Object_ID) DESC LIMIT 1
SELECT C.Collection_ID, C.Collection_Name, COUNT(DIC.Document_Object_ID) AS Document_Count FROM Collections C LEFT JOIN Documents_in_Collections DIC ON C.Collection_ID = DIC.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID ORDER BY Document_Count DESC LIMIT 1
SELECT d.Document_Object_ID FROM Document_Objects d WHERE d.Document_Object_ID IN (SELECT dm.Document_Object_ID FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000') AND d.Document_Object_ID IN (SELECT dc.Document_Object_ID FROM Documents_in_Collections dc JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best')
SELECT DISTINCT do.Document_Object_ID FROM Document_Objects do WHERE EXISTS (SELECT 1 FROM Documents_in_Collections dic JOIN Collections col ON dic.Collection_ID = col.Collection_ID WHERE do.Document_Object_ID = dic.Document_Object_ID AND col.Collection_Name = 'Best') AND EXISTS (SELECT 1 FROM Document_Subset_Members dsm JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Document_Object_ID = dsm.Document_Object_ID AND ds.Document_Subset_Name = 'Best for 2000')
SELECT d.Document_Object_ID FROM Documents_in_Collections d, Collections c WHERE d.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members ds, Document_Subsets dss WHERE ds.Document_Subset_ID = dss.Document_Subset_ID AND dss.Document_Subset_Name = 'Best for 2000')
SELECT d.Document_Object_ID FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' EXCEPT SELECT ds.Document_Object_ID FROM Document_Subset_Members ds INNER JOIN Document_Subsets dss ON ds.Document_Subset_ID = dss.Document_Subset_ID WHERE dss.Document_Subset_Name = 'Best for 2000'
SELECT d.Document_Object_ID FROM Document_Objects d WHERE EXISTS (SELECT 1 FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000' AND dm.Document_Object_ID = d.Document_Object_ID) OR EXISTS (SELECT 1 FROM Documents_in_Collections dc JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' AND dc.Document_Object_ID = d.Document_Object_ID)
SELECT DISTINCT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' UNION ALL SELECT Document_Object_ID FROM Documents_in_Collections DIC JOIN Collections C ON DIC.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best')
SELECT C.Collection_Name FROM Collections C, Collection_Subset_Members CSM, Collections C1 WHERE C.Collection_ID = CSM.Related_Collection_ID AND CSM.Collection_ID = C1.Collection_ID AND C1.Collection_Name = 'Best'
SELECT C.Collection_Name FROM Collections C, Collection_Subset_Members CSM, Collections C2 WHERE C.Collection_ID = CSM.Related_Collection_ID AND CSM.Collection_ID = C2.Collection_ID AND C2.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM (SELECT DISTINCT Related_Collection_ID FROM Collections JOIN Collection_Subset_Members ON Collections.Collection_ID = Collection_Subset_Members.Collection_ID WHERE Collection_Name = 'Best') AS Unique_Related_Collections
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT COUNT(*) FROM songs WHERE INSTR(name, 'Love') > 0
SELECT name FROM songs ORDER BY name COLLATE NOCASE ASC
SELECT name AS 'Song Name', language AS 'Language' FROM songs
SELECT max(voice_sound_quality), min(voice_sound_quality) FROM performance_score
SELECT voice_sound_quality, rhythm_tempo, stage_presence FROM performance_score INNER JOIN participants ON performance_score.participant_id = participants.id AND participants.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name IS NOT 'Love'
SELECT `name`, `original_artist` FROM `songs` WHERE `english_translation` = 'All the streets of love'
SELECT DISTINCT p.stage_presence FROM performance_score p, songs s WHERE p.songs_id = s.id AND s.language = 'English'
SELECT DISTINCT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id, p.name HAVING COUNT(ps.songs_id) >= 2
SELECT p.id, p.name, p.popularity FROM participants p LEFT JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id ORDER BY COUNT(ps.songs_id) DESC
SELECT DISTINCT participants.id, participants.name FROM participants, performance_score WHERE participants.id = performance_score.participant_id AND (performance_score.voice_sound_quality = 5 OR performance_score.rhythm_tempo = 5)
SELECT voice_sound_quality FROM performance_score, songs WHERE performance_score.songs_id = songs.id AND songs.name = 'The Balkan Girls' AND songs.language = 'English'
SELECT s.id, s.name FROM songs s LEFT JOIN performance_score ps ON s.id = ps.songs_id GROUP BY s.id, s.name HAVING COUNT(ps.participant_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(participant_id) AS COUNT FROM performance_score GROUP BY songs_id) t)
SELECT COUNT(*) FROM performance_score WHERE stage_presence NOT BETWEEN 7 AND 9
SELECT count(*) FROM songs WHERE NOT EXISTS (SELECT 1 FROM performance_score WHERE songs.id = performance_score.songs_id)
SELECT language, AVG(rhythm_tempo) AS average_rhythm FROM songs JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY language
SELECT DISTINCT name FROM participants WHERE id IN (SELECT original_artist FROM songs WHERE language = 'English')
SELECT p.name, p.popularity FROM participants p WHERE EXISTS (SELECT 1 FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'Croatian' AND ps.participant_id = p.id) AND EXISTS (SELECT 1 FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English' AND ps.participant_id = p.id)
SELECT name FROM songs WHERE INSTR(name, 'Is') > 0
SELECT original_artist FROM songs JOIN performance_score ON songs.id = performance_score.songs_id WHERE rhythm_tempo > 5 ORDER BY voice_sound_quality DESC
SELECT COUNT(DISTINCT city_code) FROM City
SELECT COUNT(DISTINCT city_code) FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(*) FROM (SELECT DISTINCT country FROM City c)
SELECT COUNT(*) FROM (SELECT DISTINCT country FROM City c)
SELECT city_name, city_code, state, country FROM City
SELECT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT city_name FROM City WHERE City.state = 'PA'
SELECT city_name FROM City WHERE state LIKE 'PA'
SELECT COUNT(*) FROM City WHERE country LIKE 'Canada'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT state, COUNT(city_name) FROM City GROUP BY state
SELECT state, COUNT(*) AS number_of_cities FROM City GROUP BY state
SELECT country, COUNT(*) FROM City WHERE country IS NOT NULL GROUP BY country
SELECT country, COUNT(*) FROM City GROUP BY country
SELECT state FROM (SELECT state, COUNT(*) AS num_cities FROM City GROUP BY state) AS StateCount WHERE num_cities >= 2
SELECT C.state FROM City C GROUP BY C.state HAVING COUNT(C.city_code) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(*) = (SELECT MAX(city_count) FROM (SELECT COUNT(*) AS city_count FROM City GROUP BY state) AS Counts)
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) = (SELECT MAX(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY state) AS Counts)
SELECT country FROM City GROUP BY country HAVING COUNT(city_code) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY country) AS counts)
SELECT country FROM (SELECT country, COUNT(city_code) AS city_count FROM City GROUP BY country ORDER BY city_count ASC LIMIT 1) AS result
SELECT Fname, LName FROM Student INNER JOIN City ON Student.city_code = City.city_code AND City.state = 'MD'
SELECT Fname, LName FROM Student INNER JOIN City ON Student.city_code = City.city_code AND City.state = 'MD'
SELECT COUNT(StuID) FROM Student, City WHERE Student.city_code = City.city_code AND City.country = 'China'
SELECT COUNT(StuID) FROM Student, City WHERE Student.city_code = City.city_code AND City.country = 'China'
SELECT Fname, Major FROM Student s JOIN City c ON s.city_code = c.city_code WHERE c.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT country, COUNT(*) AS NumberOfStudents FROM City INNER JOIN Student ON City.city_code = Student.city_code GROUP BY country
SELECT country, COUNT(*) AS StudentCount FROM Student, City WHERE Student.city_code = City.city_code GROUP BY country
SELECT city_code, COUNT(*) FROM Student GROUP BY city_code
SELECT S.city_code, COUNT(S.StuID) FROM Student S GROUP BY S.city_code
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM City c, Student s WHERE c.city_code = s.city_code GROUP BY state HAVING COUNT(s.StuID) = (SELECT MAX(count) FROM (SELECT COUNT(s.StuID) AS count FROM Student s JOIN City c ON s.city_code = c.city_code GROUP BY state) AS MaxCount)
SELECT country FROM City C LEFT JOIN Student S ON C.city_code = S.city_code GROUP BY country ORDER BY COUNT(S.StuID) ASC LIMIT 1
SELECT country FROM City LEFT JOIN Student ON City.city_code = Student.city_code GROUP BY country ORDER BY COUNT(Student.StuID) ASC LIMIT 1
SELECT C.city_name FROM City AS C INNER JOIN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(*) >= 3) AS S ON C.city_code = S.city_code
SELECT city_name FROM City c WHERE EXISTS (SELECT NULL FROM Student s WHERE s.city_code = c.city_code GROUP BY s.city_code HAVING COUNT(s.StuID) >= 3)
SELECT c.state FROM City c LEFT JOIN Student s ON c.city_code = s.city_code GROUP BY c.state HAVING COUNT(s.StuID) > 5
SELECT C.state FROM City C, Student S WHERE C.city_code = S.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT StuID FROM Student S, City C WHERE S.city_code = C.city_code AND C.country <> 'USA'
SELECT StuID FROM Student WHERE EXISTS (SELECT 1 FROM City WHERE Student.city_code = City.city_code AND City.country <> 'USA')
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA'
SELECT StuID FROM Student, City WHERE Student.city_code = City.city_code AND Sex = 'M' AND City.country <> 'USA'
SELECT StuID FROM Student, City WHERE Student.city_code = City.city_code AND Sex = 'M' AND City.country <> 'USA'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') OR (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT d.distance FROM Direct_distance AS d WHERE (d.city1_code = 'BAL' AND d.city2_code = 'CHI') OR (d.city1_code = 'CHI' AND d.city2_code = 'BAL')
SELECT distance FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code IN (SELECT city_code FROM City WHERE city_name = 'Newark')
SELECT d.distance FROM Direct_distance d WHERE d.city1_code = 'EWR' AND d.city2_code = 'BOS'
SELECT MIN(distance), MAX(distance), AVG(distance) FROM Direct_distance
SELECT avg(distance) AS AverageDistance, min(distance) AS MinimumDistance, max(distance) AS MaximumDistance FROM Direct_distance
SELECT D.city1_code, D.city2_code FROM Direct_distance D WHERE D.distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT d.city1_code, d.city2_code FROM Direct_distance d ORDER BY d.distance DESC LIMIT 1
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(D.distance) FROM Direct_distance D)
SELECT city1_code AS city_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance) UNION SELECT city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT D.city1_code, D.city2_code FROM Direct_distance AS D WHERE D.distance < 1000
SELECT city1_code AS city_code FROM Direct_distance WHERE distance < 1000 UNION SELECT city2_code FROM Direct_distance WHERE distance < 1000
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code <> 'BAL'
SELECT SUM(distance) FROM Direct_distance WHERE 'BAL' IN (city1_code, city2_code)
SELECT AVG(distance) FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code IN (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(distance) FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code IN (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT city_name FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city2_code WHERE Direct_distance.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY distance ASC LIMIT 1
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY distance LIMIT 1)
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = 'BOS' ORDER BY D.distance DESC LIMIT 1
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = 'BOS' ORDER BY D.distance DESC LIMIT 1
SELECT city1_code, SUM(distance) FROM Direct_distance GROUP BY city1_code UNION SELECT city2_code, SUM(distance) FROM Direct_distance GROUP BY city2_code
SELECT city1_code AS city_code, SUM(distance) FROM Direct_distance GROUP BY city1_code
SELECT city_name, AVG(distance) FROM City LEFT JOIN Direct_distance ON city_code = city1_code GROUP BY city_name
SELECT C.city_name, AVG(D.distance) FROM City C LEFT JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city2_code = (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim')
SELECT d.distance FROM Direct_distance d WHERE (d.city1_code, d.city2_code) IN (SELECT s1.city_code, s2.city_code FROM Student s1, Student s2 WHERE s1.Fname = 'Linda' AND s1.LName = 'Smith' AND s2.Fname = 'Tracy' AND s2.LName = 'Kim')
SELECT Fname, Lname FROM Student JOIN City ON Student.city_code = City.city_code WHERE NOT City.city_name = 'Linda Smith' ORDER BY SQRT(POWER(City.latitude - (SELECT latitude FROM City WHERE city_name = 'Linda Smith'), 2) + POWER(City.longitude - (SELECT longitude FROM City WHERE city_name = 'Linda Smith'), 2)) DESC LIMIT 1
SELECT Fname + ' ' + LName AS FullName FROM Student WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') ORDER BY distance DESC LIMIT 1)
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code WHERE S.Fname = 'Linda'
SELECT state FROM City WHERE EXISTS (SELECT 1 FROM Student WHERE Student.city_code = City.city_code AND Fname = 'Linda')
SELECT * FROM Sailors WHERE age > 30
SELECT * FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE age < (30)
SELECT name AS SailorName, age AS SailorAge FROM Sailors WHERE age < 30
SELECT bid, name FROM Boats WHERE EXISTS (SELECT 1 FROM Reserves WHERE Boats.bid = Reserves.bid AND sid = 1)
SELECT DISTINCT R.bid FROM Reserves AS R WHERE R.sid = 1
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 102)
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE R.bid = 102
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT bid FROM Reserves
SELECT name FROM Sailors WHERE INSTR(name, 'e') > 0
SELECT name FROM Sailors WHERE INSTR(name, 'e') > 0
SELECT s.sid FROM Sailors AS s WHERE s.age = (SELECT MAX(s.age) FROM Sailors AS s)
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age > (SELECT max(S.age) FROM Sailors S WHERE S.rating > 7)
SELECT DISTINCT S1.name FROM Sailors S1, Sailors S2 WHERE S1.age > S2.age AND S2.rating > 7
SELECT name, sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves)
SELECT DISTINCT S.sid, S.name FROM Sailors S, Reserves R WHERE S.sid = R.sid
SELECT sid, name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid GROUP BY sid HAVING COUNT(DISTINCT bid) > 1)
SELECT DISTINCT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) >= 2
SELECT DISTINCT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT r.sid FROM Reserves r INNER JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('blue', 'red')
SELECT DISTINCT s.sid, s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' OR b.color = 'blue'
SELECT name, sid FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Sailors.sid = Reserves.sid AND Boats.color IN ('red', 'blue'))
SELECT sid FROM Reserves R, Boats B WHERE R.bid = B.bid AND B.color = 'red' INTERSECT SELECT sid FROM Reserves R, Boats B WHERE R.bid = B.bid AND B.color = 'blue'
SELECT DISTINCT R.sid FROM Reserves R INNER JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue')
SELECT s.sid, s.name FROM Sailors s WHERE s.sid IN (SELECT r.sid FROM Reserves r, Boats b WHERE r.bid = b.bid AND b.color = 'red' GROUP BY r.sid HAVING COUNT(DISTINCT b.color) = 1) AND s.sid IN (SELECT r.sid FROM Reserves r, Boats b WHERE r.bid = b.bid AND b.color = 'blue' GROUP BY r.sid HAVING COUNT(DISTINCT b.color) = 1)
SELECT name, sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red')) INTERSECT SELECT name, sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'blue'))
SELECT s.sid FROM Sailors s WHERE s.sid NOT IN (SELECT r.sid FROM Reserves r)
SELECT s.sid FROM Sailors s WHERE s.sid NOT IN (SELECT r.sid FROM Reserves r)
SELECT s.sid, s.name FROM Sailors s WHERE s.sid NOT IN (SELECT DISTINCT r.sid FROM Reserves r)
SELECT name, sid FROM Sailors AS S WHERE NOT EXISTS (SELECT * FROM Reserves AS R WHERE R.sid = S.sid)
SELECT s.sid FROM Sailors s WHERE s.sid NOT IN (SELECT r.sid FROM Reserves r)
SELECT s.sid FROM Sailors s WHERE s.sid NOT IN (SELECT r.sid FROM Reserves r)
SELECT S.name FROM Sailors AS S INNER JOIN Reserves AS R ON S.sid = R.sid WHERE R.bid = 103
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE r.bid = 103
SELECT name FROM Sailors WHERE rating > (SELECT max(rating) FROM Sailors WHERE name = 'Luis')
SELECT s.name FROM Sailors s WHERE s.rating > (SELECT max(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name IN ('Luis'))
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis') GROUP BY S.name
SELECT name, sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves) AND rating > 2
SELECT DISTINCT S.name, S.sid FROM Sailors AS S, Reserves AS R WHERE S.sid = R.sid AND S.rating >= 3
SELECT name, age FROM Sailors WHERE age IN (SELECT MAX(age) FROM Sailors)
SELECT name, age FROM Sailors WHERE age IN (SELECT MAX(age) FROM Sailors)
SELECT count(*) FROM Sailors;
SELECT COUNT(DISTINCT sid) FROM Sailors
SELECT AVG(Sailors.age) AS AverageAge FROM Sailors WHERE Sailors.rating = 7
SELECT AVG(Sailors.age) AS AverageAge FROM Sailors WHERE Sailors.rating = 7
SELECT COUNT(*) FROM Sailors WHERE name GLOB 'D*'
SELECT COUNT(*) FROM Sailors WHERE name GLOB 'D*'
SELECT AVG(rating) AS avgRating, MAX(age) AS maxAge FROM Sailors
SELECT AVG(rating) as 'Average Rating', MAX(age) as 'Largest Age' FROM Sailors
SELECT bid, COUNT(*) AS NumberOfReservations FROM Reserves GROUP BY bid
SELECT Boats.bid, COUNT(Reserves.bid) AS reservation_count FROM Boats LEFT JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.bid
SELECT count(*), bid FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT count(*), bid FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT B.name, COUNT(*) FROM Boats B LEFT OUTER JOIN Reserves R ON B.bid = R.bid GROUP BY B.bid HAVING COUNT(*) > 1
SELECT B.bid, COUNT(R.bid) AS reservation_count FROM Boats B LEFT JOIN Reserves R ON B.bid = R.bid GROUP BY B.bid HAVING reservation_count > 1
SELECT COUNT(*), B.name FROM Boats B LEFT JOIN Reserves R ON B.bid = R.bid WHERE R.sid > 1 GROUP BY B.name
SELECT name, COUNT(*) FROM Boats WHERE bid IN (SELECT bid FROM Reserves WHERE sid > 1 GROUP BY bid) GROUP BY name
SELECT Sailors.rating, AVG(age) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Boats.bid = Reserves.bid WHERE Boats.color = 'red' GROUP BY Sailors.rating
SELECT S.rating, AVG(S.age) FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT s.name, s.rating, s.age FROM Sailors s ORDER BY s.rating ASC, s.age ASC
SELECT name, rating, age FROM Sailors ORDER BY rating ASC, age
SELECT COUNT(*) AS TotalNumberOfBoats FROM Boats
SELECT COUNT(ALL bid) FROM Boats
SELECT COUNT(*) FROM Boats WHERE LOWER(color) = 'red'
SELECT COUNT(1) FROM Boats WHERE color = 'red'
SELECT name FROM Boats WHERE bid IN (SELECT bid FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE age BETWEEN 20 AND 30))
SELECT name FROM Boats WHERE bid IN (SELECT Reserves.bid FROM Reserves, Sailors WHERE Reserves.sid = Sailors.sid AND Sailors.age BETWEEN 20 AND 30)
SELECT DISTINCT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red')
SELECT S.name FROM Sailors S WHERE NOT EXISTS (SELECT * FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' AND S2.rating >= S.rating)
SELECT MAX(s.rating) FROM Sailors s
SELECT max(rating) FROM Sailors
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE name = 'Melon'))
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE name = 'Melon'))
SELECT name AS SailorName, age AS SailorAge FROM Sailors ORDER BY rating DESC
SELECT name AS SailorName, age AS SailorAge FROM Sailors ORDER BY rating DESC
SELECT Model FROM (SELECT Model, Price FROM headphone ORDER BY Price DESC) AS subquery LIMIT 1
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone LIMIT 1)
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model COLLATE NOCASE
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM headphone GROUP BY Class) AS Counts)
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM headphone GROUP BY Class) AS Counts)
SELECT `Class` FROM headphone GROUP BY `Class` HAVING COUNT(Headphone_ID) > 2
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) <= 2
SELECT headphone.Class, COUNT(headphone.Headphone_ID) FROM headphone WHERE headphone.Price > 200 GROUP BY headphone.Class
SELECT Class, COUNT(Headphone_ID) AS HeadphoneCount FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(*) FROM (SELECT DISTINCT Earpads FROM headphone)
SELECT COUNT(DISTINCT headphone.Earpads) FROM headphone
SELECT `Earpads` FROM `headphone` GROUP BY `Earpads` ORDER BY COUNT(`Headphone_ID`) DESC LIMIT 2
SELECT `Earpads`, COUNT(`Headphone_ID`) FROM `headphone` GROUP BY `Earpads` ORDER BY COUNT(`Headphone_ID`) DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT headphone.Construction, AVG(headphone.Price) AS AvgPrice FROM headphone GROUP BY headphone.Construction
SELECT `Construction`, AVG(`Price`) AS `AvgPrice` FROM `headphone` GROUP BY `Construction`
SELECT DISTINCT h1.Class FROM headphone h1 JOIN headphone h2 ON h1.Class = h2.Class WHERE h1.Earpads = 'Bowls' AND h2.Earpads = 'Comfort Pads'
SELECT DISTINCT h1.Class FROM headphone h1 JOIN headphone h2 ON h1.Class = h2.Class WHERE h1.Earpads = 'Bowls' AND h2.Earpads = 'Comfort Pads'
SELECT DISTINCT h.Earpads FROM headphone h LEFT JOIN headphone p ON h.Earpads = p.Earpads AND p.Construction = 'Plastic' WHERE p.Earpads IS NULL
SELECT Earpads FROM headphone WHERE Construction IS NOT 'Plastic'
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone AS hp)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(h.Price) FROM headphone h)
SELECT Name FROM store ORDER BY Date_Opened, Name
SELECT Name FROM store ORDER BY Date_Opened ASC, Store_ID ASC
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana' AND Parking IS NOT NULL
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana' AND Parking IS NOT NULL
SELECT COUNT(DISTINCT store.Neighborhood) FROM store
SELECT COUNT(DISTINCT store.Neighborhood) FROM store
SELECT Neighborhood, COUNT(DISTINCT Store_ID) AS StoresInNeighborhood FROM store GROUP BY Neighborhood
SELECT COUNT(*), store.Neighborhood FROM store GROUP BY store.Neighborhood
SELECT S.Name, SUM(ST.Quantity) AS TotalHeadphones FROM store S JOIN stock ST ON S.Store_ID = ST.Store_ID GROUP BY S.Store_ID ORDER BY TotalHeadphones DESC LIMIT 1
SELECT Name, SUM(Quantity) FROM store s JOIN stock st ON s.Store_ID = st.Store_ID GROUP BY s.Name
SELECT Name FROM store s WHERE NOT EXISTS (SELECT NULL FROM stock st WHERE st.Store_ID = s.Store_ID AND st.Quantity > 0)
SELECT s.Name FROM store s LEFT JOIN stock st ON s.Store_ID = st.Store_ID WHERE st.Store_ID IS NULL
SELECT h.Model FROM headphone h WHERE h.Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE NOT EXISTS (SELECT 1 FROM stock WHERE headphone.Headphone_ID = stock.Headphone_ID)
SELECT (SELECT Model FROM headphone WHERE Headphone_ID = S.Headphone_ID) AS Model FROM stock S GROUP BY S.Headphone_ID ORDER BY SUM(S.Quantity) DESC LIMIT 1
SELECT h.Model FROM headphone h, stock s WHERE h.Headphone_ID = s.Headphone_ID GROUP BY h.Headphone_ID HAVING SUM(s.Quantity) = (SELECT MAX(total) FROM (SELECT SUM(Quantity) AS total FROM stock GROUP BY Headphone_ID))
SELECT total(Quantity) FROM stock, store WHERE stock.Store_ID = store.Store_ID AND store.Name = 'Woodman'
SELECT sum(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT Neighborhood FROM store EXCEPT SELECT Neighborhood FROM store JOIN stock ON store.Store_ID = stock.Store_ID
SELECT s.Neighborhood FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT count(*) FROM Author
SELECT COUNT(*) FROM (SELECT author_id FROM Author) AS total
SELECT COUNT(*) FROM Paper WHERE paper_id IS NOT NULL
SELECT COUNT(DISTINCT paper_id) FROM Paper WHERE paper_id IS NOT NULL
SELECT count(*) FROM Affiliation
SELECT COUNT(1) FROM `Affiliation`
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND p.year = 2009 AND a.name = 'Columbia University'
SELECT COUNT(P.paper_id) FROM Paper P, Author_list AL, Affiliation A WHERE P.paper_id = AL.paper_id AND AL.affiliation_id = A.affiliation_id AND A.name = 'Columbia University' AND P.year = 2009
SELECT Affiliation.name, Affiliation.address FROM Affiliation
SELECT Affiliation.name, Affiliation.address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT venue FROM Paper ORDER BY year ASC
SELECT DISTINCT Paper.title, Paper.paper_id FROM Paper, Author_list, Affiliation WHERE Paper.paper_id = Author_list.paper_id AND Author_list.affiliation_id = Affiliation.affiliation_id AND Affiliation.name = 'Harvard University'
SELECT p.title, p.paper_id FROM Paper AS p JOIN Author_list AS al ON p.paper_id = al.paper_id JOIN Affiliation AS a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Harvard University'
SELECT P.title, P.paper_id FROM Paper P WHERE EXISTS (SELECT * FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown' AND AL.paper_id = P.paper_id)
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id IN (SELECT author_id FROM Author WHERE name = 'Mckeown'))
SELECT DISTINCT p.title, p.paper_id FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name IN ('Stanford University', 'Columbia University') GROUP BY p.paper_id, p.title HAVING COUNT(DISTINCT a.name) = 2
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford')) INTERSECT SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University'))
SELECT p.title, p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY p.paper_id, p.title HAVING SUM(CASE WHEN a.name IN ('Mckeown, Kathleen', 'Rambow, Owen') THEN 1 ELSE 0 END) = 2
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON A.author_id = AL.author_id WHERE A.name = 'Mckeown, Kathleen' INTERSECT SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON A.author_id = AL.author_id WHERE A.name = 'Rambow, Owen'
SELECT P.title, P.paper_id FROM Paper P INNER JOIN Author_list AL ON P.paper_id = AL.paper_id INNER JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown' AND P.paper_id NOT IN (SELECT AL.paper_id FROM Author_list AL INNER JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Rambow')
SELECT P.title, P.paper_id FROM Paper P WHERE EXISTS (SELECT * FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown' AND AL.paper_id = P.paper_id) AND NOT EXISTS (SELECT * FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Rambow' AND AL.paper_id = P.paper_id)
SELECT P.title, P.paper_id FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND (A.name = 'Mckeown, Kathleen' OR A.name = 'Rambow, Owen')
SELECT title, paper_id FROM Paper WHERE EXISTS (SELECT 1 FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen' OR Author.name = 'Rambow, Owen' AND Author_list.paper_id = Paper.paper_id)
SELECT A.name, COUNT(P.paper_id) AS paper_count FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.author_id ORDER BY paper_count DESC
SELECT author_id, COUNT(paper_id) AS paper_count FROM Author_list GROUP BY author_id ORDER BY paper_count DESC
SELECT name FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.affiliation_id ORDER BY COUNT(DISTINCT Paper.paper_id) ASC
SELECT Affiliation.name FROM Affiliation LEFT JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id LEFT JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.affiliation_id ORDER BY COUNT(DISTINCT Paper.paper_id) DESC
SELECT A.name FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) > 50
SELECT A.name FROM Author A, Author_list AL WHERE A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) > 50
SELECT A.name FROM Author A WHERE A.author_id IN (SELECT AL.author_id FROM Author_list AL GROUP BY AL.author_id HAVING COUNT(AL.paper_id) = 1)
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(DISTINCT paper_id) = 1)
SELECT venue, year FROM Paper GROUP BY venue, year HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Paper GROUP BY venue, year) AS counts)
SELECT venue, year FROM Paper GROUP BY venue, year HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Paper GROUP BY venue, year) AS sub_counts)
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(paper_id) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(paper_id) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT cited_paper_id) FROM Citation WHERE paper_id = 'D12-1027'
SELECT COUNT(*) AS ReferenceCount FROM Citation WHERE paper_id = 'D12-1027'
SELECT paper_id, COUNT(cited_paper_id) AS citations FROM Citation GROUP BY paper_id ORDER BY citations DESC LIMIT 1
SELECT paper_id, COUNT(cited_paper_id) FROM Citation GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1
SELECT P.title FROM Paper P, Citation C WHERE P.paper_id = C.paper_id GROUP BY P.paper_id HAVING COUNT(C.cited_paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(cited_paper_id) AS count FROM Citation GROUP BY paper_id) AS Counts)
SELECT P.title FROM Paper P, Citation C WHERE P.paper_id = C.paper_id GROUP BY P.paper_id HAVING COUNT(C.cited_paper_id) = (SELECT MAX(citations) FROM (SELECT COUNT(cited_paper_id) AS citations FROM Citation GROUP BY paper_id) AS Counts)
sql placeholder
sql placeholder
SELECT COUNT(cited_paper_id) FROM Citation, Author_list, Author WHERE Citation.paper_id = Author_list.paper_id AND Author_list.author_id = Author.author_id AND Author.name = 'Mckeown, Kathleen'
SELECT COUNT(cited_paper_id) FROM Citation, Author_list, Author WHERE Citation.paper_id = Author_list.paper_id AND Author_list.author_id = Author.author_id AND Author.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT cited_paper_id) FROM Citation JOIN Author_list ON Citation.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT COUNT(cited_paper_id) FROM Citation, Author_list, Author WHERE Citation.paper_id = Author_list.paper_id AND Author_list.author_id = Author.author_id AND Author.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(C.cited_paper_id) AS citation_count FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT A.name, COUNT(*) AS citation_count FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT venue, year FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT p.venue, p.year FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen' GROUP BY p.venue, p.year
SELECT DISTINCT venue, year FROM Paper P WHERE EXISTS (SELECT * FROM Author_list AL JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University' AND AL.paper_id = P.paper_id)
SELECT DISTINCT P.venue, P.year FROM Paper P LEFT JOIN Author_list AL ON P.paper_id = AL.paper_id LEFT JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT A.name FROM Author A, Author_list AL, Paper P WHERE A.author_id = AL.author_id AND AL.paper_id = P.paper_id AND P.year = 2009 GROUP BY A.author_id HAVING COUNT(P.paper_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id WHERE year = 2009 GROUP BY author_id) AS SubQuery)
SELECT A.name FROM Author A WHERE EXISTS (SELECT NULL FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 AND AL.author_id = A.author_id GROUP BY AL.author_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT a.name FROM Affiliation a INNER JOIN (SELECT al.affiliation_id FROM Author_list al INNER JOIN Paper p ON al.paper_id = p.paper_id WHERE p.year = 2009 GROUP BY al.affiliation_id ORDER BY COUNT(*) DESC LIMIT 3) AS TopAffiliations ON a.affiliation_id = TopAffiliations.affiliation_id
SELECT Affiliation.name FROM Affiliation, Author_list, Paper WHERE Affiliation.affiliation_id = Author_list.affiliation_id AND Author_list.paper_id = Paper.paper_id AND Paper.year = 2009 GROUP BY Affiliation.name ORDER BY COUNT(Paper.paper_id) DESC LIMIT 3
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name = 'Columbia University' AND p.year <= 2009
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name = 'Columbia University' AND p.year <= 2009
SELECT COUNT(*) FROM Paper WHERE EXISTS (SELECT * FROM Author_list WHERE Author_list.paper_id = Paper.paper_id AND Author_list.affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University')) AND Paper.year BETWEEN 2000 AND 2009
SELECT COUNT(*) FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id WHERE Author_list.affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University') AND Paper.year BETWEEN 2000 AND 2009
SELECT P.title FROM Paper AS P JOIN Author_list AS A ON P.paper_id = A.paper_id GROUP BY P.paper_id HAVING COUNT(A.author_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(author_id) AS Cnt FROM Author_list GROUP BY paper_id) AS Sub)
SELECT Paper.title FROM Paper, Author_list WHERE Paper.paper_id = Author_list.paper_id GROUP BY Paper.paper_id HAVING COUNT(Author_list.author_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(author_id) AS Cnt FROM Author_list GROUP BY paper_id) AS SubQuery)
SELECT COUNT(DISTINCT AL.author_id) FROM Author_list AL INNER JOIN Author A ON AL.author_id = A.author_id WHERE AL.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND A.name != 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT author_id) FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND author_id NOT IN (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')
SELECT A.name, COUNT(*) FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id WHERE AL.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND A.name != 'Mckeown, Kathleen' GROUP BY A.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id WHERE AL.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND A.name != 'Mckeown, Kathleen' GROUP BY A.name ORDER BY COUNT(AL.paper_id) DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%' ESCAPE '!'
SELECT paper_id FROM Paper WHERE LOWER(title) LIKE LOWER('%translation%')
SELECT Paper.paper_id, Paper.title FROM Paper LEFT JOIN Citation ON Paper.paper_id = Citation.cited_paper_id WHERE Citation.cited_paper_id IS NULL
SELECT P.paper_id, P.title FROM Paper P WHERE NOT EXISTS (SELECT NULL FROM Citation C WHERE C.paper_id = P.paper_id)
SELECT name FROM Affiliation WHERE address LIKE '%China%' ORDER BY (SELECT COUNT(*) FROM Author_list WHERE Author_list.affiliation_id = Affiliation.affiliation_id) DESC LIMIT 1
SELECT Affiliation.name FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Affiliation.address LIKE '%China%' GROUP BY Affiliation.name HAVING COUNT(Paper.paper_id) = (SELECT MAX(paper_count) FROM (SELECT COUNT(Paper.paper_id) AS paper_count FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Affiliation.address LIKE '%China%' GROUP BY Affiliation.name) AS sub)
SELECT P.year, P.venue, COUNT(P.paper_id) FROM Paper P GROUP BY P.venue, P.year
SELECT venue, year, COUNT(paper_id) AS PaperCount FROM Paper WHERE venue IS NOT NULL AND year IS NOT NULL GROUP BY venue, year
SELECT A.affiliation_id, COUNT(DISTINCT P.paper_id) AS PaperCount FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id LEFT JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id
SELECT affiliation.name, COUNT(paper.paper_id) FROM Affiliation affiliation INNER JOIN Author_list author_list ON affiliation.affiliation_id = author_list.affiliation_id INNER JOIN Paper paper ON author_list.paper_id = paper.paper_id GROUP BY affiliation.affiliation_id
SELECT P.title FROM Paper P INNER JOIN Citation C ON P.paper_id = C.paper_id GROUP BY P.paper_id HAVING COUNT(C.cited_paper_id) > 50
SELECT P.title FROM Paper P, Citation C WHERE P.paper_id = C.paper_id GROUP BY P.paper_id HAVING COUNT(C.cited_paper_id) > 50
SELECT COUNT(*) FROM Author WHERE author_id NOT IN (SELECT AL.author_id FROM Author_list AL, (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50) C WHERE AL.paper_id = C.paper_id)
SELECT COUNT(*) FROM Author WHERE author_id NOT IN (SELECT AL.author_id FROM Author_list AL INNER JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50) PopPapers ON AL.paper_id = PopPapers.paper_id)
SELECT name FROM Author WHERE author_id IN (SELECT Author_list.author_id FROM Author_list JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.venue IN ('NAACL', 'ACL') AND Paper.year = 2009)
SELECT DISTINCT a.name FROM Author a, Author_list al, Paper p WHERE a.author_id = al.author_id AND al.paper_id = p.paper_id AND p.year = 2009 AND p.venue = 'NAACL' AND EXISTS (SELECT 1 FROM Author_list al2 JOIN Paper p2 ON al2.paper_id = p2.paper_id WHERE al2.author_id = al.author_id AND p2.venue = 'ACL' AND p2.year = 2009)
SELECT A.name FROM Author A WHERE NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND AL.author_id = A.author_id)
SELECT A.name FROM Author A WHERE NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND AL.author_id = A.author_id)
SELECT COUNT(*) AS TotalConferences FROM conference
SELECT COUNT(*) AS TotalConferences FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference WHERE Conference_Name IS NOT NULL AND Conference_Name <> ''
SELECT c.Conference_Name, c.Year, c.Location FROM conference AS c
SELECT c.Conference_Name, c.Year, c.Location FROM conference AS c
SELECT Conference_Name, COUNT(staff_ID) FROM conference LEFT JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY Conference_Name
SELECT Conference_Name, COUNT(*) AS Number_of_Occurrences FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year FROM (SELECT Year, COUNT(*) as NumConferences FROM conference GROUP BY Year) AS YearCounts ORDER BY NumConferences ASC LIMIT 1
SELECT c.Year FROM conference c GROUP BY c.Year ORDER BY COUNT(*) ASC LIMIT 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_Name) > 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(DISTINCT Conference_ID) > 1
SELECT `Institution_Name`, `Location`, `Founded` FROM `institution`
SELECT Institution_Name, Location, Founded FROM institution WHERE Institution_ID IS NOT NULL
SELECT COUNT(*) FROM institution WHERE Founded > 1849 AND Founded < 1901
SELECT COUNT(*) FROM institution WHERE Founded > 1849 AND Founded < 1901
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT i.Institution_Name, COUNT(s.staff_ID) FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_Name
SELECT i.Institution_ID, COUNT(s.staff_ID) FROM institution i JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff)
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff)
SELECT s.name FROM staff AS s WHERE s.Age > (SELECT AVG(Age) FROM staff AS s)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age) AS MaximumAge, MIN(Age) AS MinimumAge FROM staff
SELECT c.Conference_Name FROM conference c WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN staff s ON cp.staff_ID = s.staff_ID WHERE cp.Conference_ID = c.Conference_ID AND s.Nationality = 'Canada')
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID JOIN institution i ON s.Institution_ID = i.Institution_ID WHERE s.Nationality = 'Canada'
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp WHERE cp.staff_ID = s.staff_ID AND cp.role = 'speaker') AND EXISTS (SELECT 1 FROM conference_participation cp WHERE cp.staff_ID = s.staff_ID AND cp.role = 'sponsor')
SELECT s.name FROM staff s WHERE (SELECT COUNT(DISTINCT role) FROM conference_participation cp WHERE cp.staff_ID = s.staff_ID AND role IN ('Speaker', 'Sponsor')) = 2
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL' AND cp.staff_ID = s.staff_ID) AND EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'Naccl' AND cp.staff_ID = s.staff_ID)
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL' AND cp.staff_ID = s.staff_ID) AND EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'NACCL' AND cp.staff_ID = s.staff_ID)
SELECT name FROM staff WHERE EXISTS (SELECT 1 FROM conference_participation JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference_participation.staff_ID = staff.staff_ID AND (conference.Year = 2003 OR conference.Year = 2004))
SELECT s.name FROM staff s WHERE EXISTS (SELECT * FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE cp.staff_ID = s.staff_ID AND (c.Year = 2003 OR c.Year = 2004))
SELECT c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS Num_Participants FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID
SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(cp.staff_ID) FROM conference AS c LEFT JOIN conference_participation AS cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID
SELECT Conference_Name FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation GROUP BY Conference_ID ORDER BY COUNT(staff_ID) DESC LIMIT 2)
SELECT c.Conference_Name FROM conference c JOIN (SELECT Conference_ID, COUNT(staff_ID) AS total_participants FROM conference_participation GROUP BY Conference_ID ORDER BY total_participants DESC LIMIT 2) cp ON c.Conference_ID = cp.Conference_ID
SELECT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp, conference c WHERE cp.Conference_ID = c.Conference_ID AND c.Conference_Name = 'ACL')
SELECT DISTINCT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp, conference c WHERE cp.Conference_ID = c.Conference_ID AND c.Conference_Name = 'ACL')
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT s.Institution_ID FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004)
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT * FROM staff s, conference_participation cp, conference c WHERE s.Institution_ID = i.Institution_ID AND s.staff_ID = cp.staff_ID AND cp.Conference_ID = c.Conference_ID AND c.Year = 2004)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT PS.pilot_name, PS.plane_name, PS.age FROM PilotSkills PS WHERE PS.age < 30
SELECT DISTINCT pilot_name, plane_name, age FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35 EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age >= 35
SELECT pilot_name FROM PilotSkills WHERE (plane_name = 'Piper Cub') AND (age < 35)
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter' ORDER BY location ASC LIMIT 1
SELECT location FROM Hangar WHERE plane_name LIKE 'F-14 Fighter'
SELECT COUNT(*) FROM (SELECT DISTINCT location FROM Hangar)
SELECT COUNT(DISTINCT location) AS location_count FROM Hangar
SELECT DISTINCT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT DISTINCT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT COUNT(*) FROM (SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > 40) AS subquery
SELECT COUNT(*) FROM (SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > 40) AS UniquePilots
SELECT COUNT(pilot_name) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT count(pilot_name) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age IN (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM PilotSkills GROUP BY plane_name) tmp)
SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM PilotSkills GROUP BY plane_name) AS counts)
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT MIN(plane_name) FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC
SELECT COUNT(DISTINCT ps.pilot_name) FROM PilotSkills ps, Hangar h WHERE ps.plane_name = h.plane_name AND h.location = 'Chicago'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills ps WHERE EXISTS (SELECT 1 FROM Hangar h WHERE ps.plane_name = h.plane_name AND h.location = 'Chicago')
SELECT DISTINCT PS.plane_name FROM PilotSkills PS WHERE PS.pilot_name = 'Smith' AND PS.age = 41
SELECT ps.plane_name FROM PilotSkills ps WHERE ps.pilot_name = 'Smith' AND ps.age = 41
SELECT COUNT(DISTINCT plane_name) FROM Hangar WHERE plane_name IN (SELECT plane_name FROM PilotSkills)
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT count(plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(*) FROM PilotSkills WHERE pilot_name = 'Smith' AND plane_name IS NOT NULL
SELECT count(DISTINCT ps.plane_name) FROM PilotSkills ps WHERE ps.age > 40
SELECT count(plane_name) FROM (SELECT DISTINCT plane_name FROM PilotSkills WHERE age > 40) subquery
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age IS NOT NULL ORDER BY age DESC
SELECT pilot_name FROM PilotSkills WHERE age IS NOT NULL ORDER BY age DESC
SELECT h.location FROM Hangar AS h ORDER BY h.plane_name ASC
SELECT Hangar.location FROM Hangar ORDER BY Hangar.plane_name
SELECT DISTINCT p.plane_name FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name ORDER BY p.plane_name
SELECT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT COUNT(pilot_name) FROM PilotSkills WHERE (age < 30) OR (age > 40)
SELECT COUNT(*) FROM (SELECT pilot_name FROM PilotSkills WHERE age > 40 UNION ALL SELECT pilot_name FROM PilotSkills WHERE age < 30) AS subquery
SELECT pilot_name AS Pilot, age AS Age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) UNION SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'F-14 Fighter' AND age < 30)
SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'Piper Cub' AND NOT EXISTS (SELECT 1 FROM PilotSkills q WHERE q.plane_name = 'B-52 Bomber' AND q.pilot_name = p.pilot_name)
SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'Piper Cub' AND NOT EXISTS (SELECT 1 FROM PilotSkills q WHERE q.plane_name = 'B-52 Bomber' AND q.pilot_name = p.pilot_name)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber') GROUP BY pilot_name HAVING COUNT(DISTINCT plane_name) = 2
SELECT AVG(age) average_age, MIN(age) minimum_age FROM PilotSkills
SELECT AVG(age) AS AverageAge, MIN(age) AS MinimumAge FROM PilotSkills
SELECT DISTINCT p1.pilot_name FROM PilotSkills p1 JOIN Hangar h1 ON p1.plane_name = h1.plane_name WHERE h1.location = 'Austin' INTERSECT SELECT DISTINCT p2.pilot_name FROM PilotSkills p2 JOIN Hangar h2 ON p2.plane_name = h2.plane_name WHERE h2.location = 'Boston'
SELECT ps.pilot_name FROM PilotSkills ps, Hangar h WHERE ps.plane_name = h.plane_name AND (h.location = 'Austin' OR h.location = 'Boston') GROUP BY ps.pilot_name HAVING COUNT(DISTINCT h.location) >= 2
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION ALL SELECT pilot_name FROM PilotSkills WHERE plane_name = 'F-14 Fighter'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION SELECT pilot_name FROM PilotSkills WHERE plane_name = 'F-14 Fighter'
SELECT AVG(PilotSkills.age), PilotSkills.plane_name FROM PilotSkills GROUP BY PilotSkills.plane_name
SELECT plane_name, AVG(age) FROM PilotSkills GROUP BY plane_name HAVING AVG(age) IS NOT NULL
sql placeholder
SELECT plane_name, COUNT(*) AS count_of_entries FROM PilotSkills GROUP BY plane_name
SELECT plane_name, pilot_name FROM PilotSkills WHERE (plane_name, age) IN (SELECT plane_name, MIN(age) FROM PilotSkills GROUP BY plane_name) ORDER BY plane_name
SELECT H.plane_name, P.pilot_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = H.plane_name) ORDER BY H.plane_name
SELECT pilot_name, plane_name FROM PilotSkills WHERE (plane_name, age) IN (SELECT plane_name, MAX(age) FROM PilotSkills GROUP BY plane_name)
SELECT h.plane_name, ps.pilot_name FROM Hangar h JOIN PilotSkills ps ON h.plane_name = ps.plane_name WHERE ps.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = ps.plane_name)
SELECT pilot_name, MAX(age) max_age FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) AS MaximumAge FROM PilotSkills GROUP BY pilot_name
SELECT location, count(*), avg(age) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY Hangar.location
SELECT location, COUNT(pilot_name) AS total_pilots, AVG(age) AS avg_age FROM Hangar LEFT JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY location
SELECT plane_name, COUNT(pilot_name) AS pilot_count FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT H.plane_name, COUNT(P.pilot_name) AS pilot_count FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name HAVING AVG(P.age) < 35
SELECT h.location FROM Hangar h JOIN PilotSkills p ON h.plane_name = p.plane_name ORDER BY p.age LIMIT 1
SELECT location FROM Hangar WHERE plane_name = (SELECT plane_name FROM PilotSkills ORDER BY age LIMIT 1)
SELECT pilot_name, age FROM PilotSkills PS JOIN Hangar H ON PS.plane_name = H.plane_name AND H.location = 'Austin'
SELECT pilot_name, age FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name AND Hangar.location = 'Austin'
SELECT DISTINCT p.pilot_name FROM PilotSkills p JOIN PilotSkills pc ON p.age > pc.age WHERE pc.plane_name = 'Piper Cub' ORDER BY p.pilot_name
SELECT DISTINCT p.pilot_name FROM PilotSkills p WHERE p.age > (SELECT MAX(ps.age) FROM PilotSkills ps WHERE ps.plane_name = 'Piper Cub') ORDER BY p.pilot_name ASC
SELECT count(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT min(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter') GROUP BY pilot_name
SELECT plane_name FROM PilotSkills WHERE plane_name LIKE '%Bomber%' GROUP BY plane_name
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%' GROUP BY plane_name
SELECT count(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT min(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(*) FROM PilotSkills ps1 WHERE ps1.age > (SELECT MIN(ps2.age) FROM PilotSkills ps2 WHERE ps2.plane_name = 'Piper Cub')
SELECT Name FROM district WHERE Area_km IN (SELECT MAX(Area_km) FROM district)
SELECT d.Area_km, d.Government_website FROM district AS d WHERE d.Population = (SELECT MIN(Population) FROM district AS d2)
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district WHERE Area_km IS NOT NULL)
SELECT MAX(Area_km), AVG(Area_km) FROM district
SELECT SUM(Population) AS TotalPopulation FROM district ORDER BY Area_km DESC LIMIT 3
SELECT Name, District_ID, Government_website FROM district ORDER BY Population
SELECT d.Name FROM district d WHERE d.Government_website LIKE '%gov%'
SELECT Name AS DistrictName, District_ID AS DistrictID FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman
SELECT AVG(Points) as 'Average Points', AVG(Age) as 'Average Age' FROM spokesman WHERE Rank_position = 1
SELECT `Name`, `Points` FROM `spokesman` WHERE `Age` < 40
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
SELECT s.Name FROM spokesman s WHERE s.Points < (SELECT AVG(sp.Points) FROM spokesman sp)
SELECT Name FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district GROUP BY District_ID HAVING COUNT(Spokesman_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Spokesman_ID) AS Cnt FROM spokesman_district GROUP BY District_ID)))
SELECT s.Name FROM spokesman AS s JOIN spokesman_district AS sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Start_year < 2004
SELECT d.Name, COUNT(s.Spokesman_ID) AS TotalSpokesmen FROM district AS d LEFT JOIN spokesman_district AS sd ON d.District_ID = sd.District_ID LEFT JOIN spokesman AS s ON s.Spokesman_ID = sd.Spokesman_ID GROUP BY d.District_ID
SELECT d.Name FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 1) AND EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 2)
SELECT Name FROM (SELECT district.Name, COUNT(spokesman_district.Spokesman_ID) AS NumSpokesmen FROM district JOIN spokesman_district ON district.District_ID = spokesman_district.District_ID GROUP BY district.District_ID) AS SubQuery WHERE NumSpokesmen > 1
SELECT count(*) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT Name FROM spokesman AS s WHERE NOT EXISTS (SELECT NULL FROM spokesman_district AS sd WHERE s.Spokesman_ID = sd.Spokesman_ID)
SELECT sum(Population) Total, avg(Population) Average FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd WHERE sd.District_ID = d.District_ID)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures WHERE year IN (SELECT MAX(year) FROM Sculptures)
SELECT Paintings.title, Paintings.location FROM Paintings WHERE Paintings.year = (SELECT MIN(year) FROM Paintings)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title FROM Sculptures WHERE location LIKE 'gallery 226'
SELECT title FROM Sculptures WHERE location LIKE 'gallery 226'
SELECT title, location FROM Paintings WHERE title IS NOT NULL
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures WHERE location IS NOT NULL
SELECT title, location FROM Sculptures WHERE location IS NOT NULL
SELECT Paintings.medium FROM Paintings WHERE paintingID = '80'
SELECT medium FROM Paintings WHERE paintingID = '80'
SELECT fname, lname FROM Artists WHERE birthYear > 1850 AND deathYear IS NOT NULL
SELECT fname || ' ' || lname AS FullName FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT title, year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT DISTINCT fname, lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE year < 1900)
SELECT DISTINCT fname, lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE year < 1900)
SELECT DISTINCT birthYear FROM Artists JOIN Sculptures ON artistID = sculptorID WHERE year > 1920
SELECT DISTINCT A.birthYear FROM Artists A LEFT JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year > 1920
SELECT fname, lname FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists LIMIT 1)
SELECT (deathYear - birthYear) AS age FROM Artists ORDER BY age ASC LIMIT 1
SELECT MIN(Age) FROM (SELECT (deathYear - birthYear) AS Age FROM Artists) AS Lifespan
SELECT fname, (deathYear - birthYear) AS age FROM Artists ORDER BY age DESC LIMIT 1
SELECT A.fname, (A.deathYear - A.birthYear) AS age FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(B.deathYear - B.birthYear) FROM Artists B)
SELECT COUNT(*) FROM Paintings WHERE location LIKE 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE location LIKE 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists))
SELECT COUNT(*) FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists))
SELECT Paintings.title, Paintings.year FROM Paintings INNER JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT Paintings.title, Paintings.year FROM Paintings INNER JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT P.width_mm FROM Paintings P, Artists A WHERE P.painterID = A.artistID AND A.birthYear < 1850
SELECT P.width_mm FROM Paintings P, Artists A WHERE P.painterID = A.artistID AND A.birthYear < 1850
SELECT Paintings.location, Paintings.medium FROM Paintings, Artists WHERE Paintings.painterID = Artists.artistID AND Artists.fname = 'Pablo'
SELECT Paintings.location AS Location, Paintings.medium AS Medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID
SELECT DISTINCT A.fname || ' ' || A.lname AS full_name FROM Artists A INNER JOIN Paintings P ON A.artistID = P.painterID INNER JOIN Sculptures S ON A.artistID = S.sculptorID
SELECT DISTINCT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' INTERSECT SELECT painterID FROM Paintings WHERE medium = 'lithographic')
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium IN ('oil', 'lithographic') GROUP BY A.artistID HAVING COUNT(DISTINCT P.medium) = 2
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884 AND mediumOn = 'canvas')
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884)
SELECT DISTINCT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 241')
SELECT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 241')
SELECT medium, COUNT(medium) FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) GROUP BY medium
SELECT medium, COUNT(*) AS NumberOfWorks FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) GROUP BY medium
SELECT medium, AVG(height_mm) AS AverageHeight FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) average_height FROM Paintings GROUP BY medium
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location
SELECT COUNT(*) FROM Paintings WHERE Paintings.year < 1900
SELECT title FROM Paintings WHERE (year > 1910) AND (medium = 'oil')
SELECT P.title FROM Paintings P WHERE P.medium = 'oil' AND P.year > 1910
SELECT DISTINCT painterID FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 240'
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location LIKE 'gallery 240'
SELECT DISTINCT title FROM Paintings p1 WHERE p1.height_mm > (SELECT MIN(p2.height_mm) FROM Paintings p2 WHERE p2.mediumOn = 'canvas')
SELECT DISTINCT title FROM Paintings p1 WHERE p1.height_mm > (SELECT MAX(p2.height_mm) FROM Paintings p2 WHERE p2.medium = 'canvas')
SELECT DISTINCT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
SELECT DISTINCT p.paintingID FROM Paintings p INNER JOIN Paintings q ON p.year < q.year WHERE q.location = 'gallery 240'
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT fname, lname FROM Artists WHERE EXISTS (SELECT 1 FROM Sculptures WHERE sculptorID = Artists.artistID AND title LIKE '%female%')
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE title LIKE '%female%')
SELECT title FROM Paintings GROUP BY title ORDER BY title
SELECT title FROM Paintings GROUP BY title ORDER BY title
SELECT title FROM Paintings GROUP BY title ORDER BY title ASC
SELECT title FROM Paintings GROUP BY title ORDER BY MIN(height_mm) ASC
SELECT title FROM (SELECT title, year FROM Paintings UNION ALL SELECT title, year FROM Sculptures) AS Combined WHERE year BETWEEN 1900 AND 1950
SELECT title FROM (SELECT title, year FROM Paintings UNION ALL SELECT title, year FROM Sculptures) AS Combined WHERE year BETWEEN 1900 AND 1950
SELECT P.title FROM Paintings P WHERE P.painterID = 222 UNION ALL SELECT S.title FROM Sculptures S WHERE S.sculptorID = 222
SELECT P.title FROM Paintings P WHERE P.painterID = 222 UNION ALL SELECT S.title FROM Sculptures S WHERE S.sculptorID = 222
SELECT painterID FROM (SELECT painterID, COUNT(*) AS Total FROM Paintings WHERE year < 1900 GROUP BY painterID) AS SubQuery ORDER BY Total DESC LIMIT 1
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Paintings WHERE year < 1900 GROUP BY painterID) tmp)
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(sculptureID) DESC LIMIT 1)
SELECT A.fname FROM Artists A, Sculptures S WHERE A.artistID = S.sculptorID GROUP BY A.artistID HAVING COUNT(S.sculptureID) = (SELECT MAX(WorkCount) FROM (SELECT COUNT(*) AS WorkCount FROM Sculptures GROUP BY sculptorID) AS Counts)
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT p.location FROM Paintings p WHERE p.year NOT BETWEEN 1885 AND 1930
SELECT location FROM Paintings WHERE year NOT BETWEEN 1885 AND 1930
SELECT paintingID FROM Paintings WHERE height_mm > '500' AND height_mm < '2000'
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT DISTINCT location FROM Paintings WHERE mediumOn LIKE 'on panel' OR mediumOn LIKE 'on canvas'
SELECT DISTINCT location FROM Paintings WHERE mediumOn = 'panels' OR mediumOn = 'canvas'
SELECT DISTINCT location FROM Paintings WHERE year < 1885 INTERSECT SELECT DISTINCT location FROM Paintings WHERE year > 1930
SELECT DISTINCT location FROM Paintings WHERE year < 1885 INTERSECT SELECT DISTINCT location FROM Paintings WHERE year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location LIKE 'gallery 241'
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location LIKE 'gallery 241'
SELECT MAX(height_mm), paintingID FROM Paintings WHERE year < 1900
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) AS 'Maximum Height', MAX(width_mm) AS 'Maximum Width' FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) AS 'Maximum Height', MAX(width_mm) AS 'Maximum Width' FROM Paintings GROUP BY year
SELECT AVG(P.height_mm) AS Average_Height, AVG(P.width_mm) AS Average_Width, A.fname, A.lname FROM Paintings P INNER JOIN Artists A ON P.painterID = A.artistID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.lname, A.fname, AVG(P.height_mm) AS HeightAvg, AVG(P.width_mm) AS WidthAvg FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT Artists.fname, COUNT(Paintings.paintingID) AS NumberOfPaintings FROM Artists, Paintings WHERE Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(Paintings.paintingID) >= 2
SELECT fname, COUNT(P.paintingID) AS paintings_count FROM Artists AS A JOIN Paintings AS P ON A.artistID = P.painterID GROUP BY A.artistID HAVING paintings_count > 1
SELECT A.deathYear FROM Artists A WHERE (SELECT COUNT(*) FROM Paintings P WHERE P.painterID = A.artistID) <= 3
SELECT A.deathYear FROM Artists A WHERE 4 > (SELECT COUNT(*) FROM Paintings P WHERE P.painterID = A.artistID)
SELECT A.deathYear FROM Artists A WHERE A.artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT P.paintingID, P.height_mm FROM Paintings P WHERE P.location = 'gallery 240' ORDER BY P.width_mm DESC LIMIT 1
SELECT P.height_mm, P.paintingID FROM Paintings P WHERE P.location = 'gallery 240' AND P.width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = 'gallery 240')
SELECT P.paintingID FROM Paintings P WHERE P.year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location LIKE 'gallery 240')
SELECT p.paintingID FROM Paintings p WHERE p.height_mm > (SELECT MAX(p2.height_mm) FROM Paintings p2 WHERE p2.year > 1900)
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT fname, lname, COUNT(*) AS TotalOilWorks FROM Artists INNER JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.medium = 'oil' GROUP BY Artists.artistID ORDER BY TotalOilWorks DESC LIMIT 3
SELECT fname, lname FROM Artists WHERE artistID = (SELECT painterID FROM Paintings WHERE medium = 'oil' GROUP BY painterID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year ASC
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year ASC
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT Paintings.year, Paintings.location, Paintings.title FROM Paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT fname, lname FROM Artists AS A WHERE EXISTS (SELECT * FROM Paintings AS P WHERE P.painterID = A.artistID) AND NOT EXISTS (SELECT * FROM Sculptures AS S WHERE S.sculptorID = A.artistID)
SELECT location FROM Paintings GROUP BY location HAVING MIN(year) < 1885 AND SUM(CASE WHEN mediumOn = 'canvas' THEN 1 ELSE 0 END) = 0
SELECT location FROM Paintings WHERE (year < 1885) AND (mediumOn != 'canvas')
SELECT COUNT(*) FROM (SELECT * FROM race) AS AllRaces
SELECT COUNT(*) FROM (SELECT * FROM race) AS AllRaces
SELECT race.Winning_driver, race.Winning_team FROM race ORDER BY race.Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver FROM race WHERE Pole_Position NOT LIKE 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position NOT IN ('Junior Strous')
SELECT Constructor AS Constructors FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver d ORDER BY d.Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20 AND Entrant != ''
SELECT DISTINCT `Entrant` FROM `driver` WHERE `Age` >= 20
SELECT MAX(Age) highest_age, MIN(Age) lowest_age FROM driver
SELECT MAX(driver.Age), MIN(driver.Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20 GROUP BY Engine
SELECT COUNT(DISTINCT Engine) FROM driver WHERE (Age > 30) OR (Age < 20)
SELECT Driver_Name FROM driver ORDER BY UPPER(Driver_Name) DESC
SELECT Driver_Name FROM driver ORDER BY UPPER(Driver_Name) DESC
SELECT Driver_Name, Race_Name FROM driver JOIN race USING (Driver_ID)
SELECT Driver_Name, Race_Name FROM driver JOIN race USING (Driver_ID)
SELECT Driver_Name, COUNT(r.Road) FROM driver LEFT OUTER JOIN race r ON driver.Driver_ID = r.Driver_ID GROUP BY Driver_Name
SELECT d.Driver_Name, COUNT(r.Road) FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID
SELECT d.Age FROM driver d WHERE EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID GROUP BY r.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT d.Age FROM driver d WHERE d.Driver_ID = (SELECT r.Driver_ID FROM race r GROUP BY r.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT d.Driver_Name, d.Age FROM driver d WHERE EXISTS (SELECT 1 FROM race WHERE Driver_ID = d.Driver_ID GROUP BY Driver_ID HAVING COUNT(Road) > 1)
SELECT D.Driver_Name, D.Age FROM driver AS D INNER JOIN race AS R ON D.Driver_ID = R.Driver_ID GROUP BY D.Driver_ID HAVING COUNT(*) >= 2
SELECT R.Race_Name FROM race R CROSS JOIN driver D WHERE R.Driver_ID = D.Driver_ID AND D.Age >= 26
SELECT R.Race_Name FROM race R CROSS JOIN driver D WHERE R.Driver_ID = D.Driver_ID AND D.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor NOT IN ('Bugatti')
SELECT Driver_Name FROM driver WHERE Constructor IS NOT 'Bugatti'
SELECT d.Constructor, COUNT(DISTINCT d.Driver_ID) FROM driver AS d GROUP BY d.Constructor
SELECT Constructor, COUNT(Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM driver GROUP BY Engine) AS Counts)
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) as Cnt FROM driver GROUP BY Engine) tmp)
SELECT d.Engine FROM driver d GROUP BY d.Engine HAVING COUNT(DISTINCT d.Driver_ID) >= 2
SELECT d.Engine FROM driver d GROUP BY d.Engine HAVING COUNT(d.Driver_ID) > 1
SELECT Driver_Name FROM driver d WHERE NOT EXISTS (SELECT NULL FROM race r WHERE r.Driver_ID = d.Driver_ID)
SELECT Driver_Name FROM driver d WHERE NOT EXISTS (SELECT NULL FROM race r WHERE r.Driver_ID = d.Driver_ID)
SELECT d.Constructor FROM driver d WHERE d.Age < 20 INTERSECT SELECT d.Constructor FROM driver d WHERE d.Age > 30 GROUP BY d.Constructor
SELECT d.Constructor FROM driver d WHERE d.Age < 20 INTERSECT SELECT d.Constructor FROM driver d WHERE d.Age > 30 GROUP BY d.Constructor
SELECT r.Winning_team FROM race r GROUP BY r.Winning_team HAVING COUNT(r.Winning_team) > 1
SELECT r.Winning_team FROM race r GROUP BY r.Winning_team HAVING COUNT(r.Winning_team) > 1
SELECT DISTINCT d.Driver_Name FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Pole_Position IN ('James Hinchcliffe', 'Carl Skerlong') GROUP BY d.Driver_Name HAVING COUNT(DISTINCT r.Pole_Position) > 1
SELECT d.Driver_Name FROM driver d JOIN race r1 ON d.Driver_ID = r1.Driver_ID AND r1.Pole_Position = 'James Hinchcliffe' JOIN race r2 ON d.Driver_ID = r2.Driver_ID AND r2.Pole_Position = 'Carl Skerlong'
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT r.Driver_ID FROM race r WHERE r.Pole_Position = 'James Hinchcliffe')
SELECT d.Driver_Name FROM driver d WHERE d.Driver_ID NOT IN (SELECT r.Driver_ID FROM race r WHERE r.Pole_Position = 'James Hinchcliffe')
SELECT COUNT(languages.id) FROM languages
SELECT COUNT(languages.id) FROM languages
SELECT Name FROM languages ORDER BY Name ASC
SELECT name FROM languages ORDER BY name COLLATE NOCASE ASC
SELECT name FROM languages WHERE name LIKE '%ish%' AND id IS NOT NULL
SELECT name FROM languages WHERE name LIKE '%ish%' COLLATE NOCASE
SELECT `name` FROM `countries` ORDER BY `overall_score` DESC
SELECT `name` FROM `countries` ORDER BY `overall_score` DESC
SELECT AVG(c.justice_score) FROM countries AS c
SELECT AVG(justice_score) FROM countries
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE NOT name = 'Norway'
SELECT MAX(health_score) maxHealth, MIN(health_score) minHealth FROM countries WHERE name != 'Norway'
SELECT COUNT(DISTINCT language_id) AS total_languages FROM official_languages
SELECT COUNT(*) FROM (SELECT language_id FROM official_languages GROUP BY language_id) AS distinct_languages
SELECT name FROM countries ORDER BY education_score DESC, id ASC
SELECT name FROM countries ORDER BY education_score DESC, id ASC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT `countries`.`name` AS `Country`, `languages`.`name` AS `Language` FROM `countries` JOIN `official_languages` ON `countries`.`id` = `official_languages`.`country_id` JOIN `languages` ON `official_languages`.`language_id` = `languages`.`id`
SELECT c.name, l.name FROM countries c, languages l WHERE EXISTS (SELECT 1 FROM official_languages ol WHERE ol.country_id = c.id AND ol.language_id = l.id)
SELECT name, COUNT(country_id) AS Countries FROM languages LEFT JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name
SELECT lang.name AS Language, COUNT(distinct ol.country_id) AS Countries FROM languages lang JOIN official_languages ol ON lang.id = ol.language_id GROUP BY lang.name
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(country_id) DESC LIMIT 1)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(language_id) DESC LIMIT 1)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(country_id) >= 2)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(*) > 1)
SELECT AVG(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages, languages WHERE official_languages.language_id = languages.id AND languages.name = 'English')
SELECT AVG(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages, languages WHERE official_languages.language_id = languages.id AND languages.name = 'English')
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 3)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(country_id) DESC LIMIT 3)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages JOIN countries ON country_id = countries.id GROUP BY language_id ORDER BY AVG(overall_score) DESC)
SELECT (SELECT name FROM languages WHERE id = ol.language_id) AS Language FROM official_languages ol JOIN countries ON ol.country_id = countries.id GROUP BY ol.language_id ORDER BY AVG(countries.overall_score) DESC
SELECT countries.name FROM countries, official_languages WHERE countries.id = official_languages.country_id GROUP BY countries.id HAVING COUNT(official_languages.language_id) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language_id) AS lang_count FROM official_languages GROUP BY country_id) AS language_counts)
SELECT c.name FROM countries c, official_languages ol WHERE c.id = ol.country_id GROUP BY c.id ORDER BY COUNT(ol.language_id) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages GROUP BY country_id)
SELECT name FROM countries WHERE NOT EXISTS (SELECT 1 FROM official_languages WHERE country_id = countries.id)
SELECT L.name FROM languages L WHERE L.id IN (SELECT OL.language_id FROM official_languages OL JOIN countries C ON OL.country_id = C.id WHERE C.overall_score > 95) AND L.id IN (SELECT OL.language_id FROM official_languages OL JOIN countries C ON OL.country_id = C.id WHERE C.overall_score < 90)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score > 95) INTERSECT SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score < 90))
SELECT country AS Country, town_city AS City FROM Addresses
SELECT country AS Country, town_city AS City FROM Addresses
SELECT county_state_province FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id
SELECT county_state_province FROM Addresses INNER JOIN Properties ON Addresses.address_id = Properties.property_address_id
SELECT feature_description FROM Features WHERE feature_name LIKE 'rooftop'
SELECT feature_description FROM Features WHERE feature_name LIKE 'rooftop'
SELECT F.feature_name, F.feature_description FROM Features F, Property_Features PF WHERE F.feature_id = PF.feature_id GROUP BY PF.feature_id HAVING COUNT(PF.feature_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) as Cnt FROM Property_Features GROUP BY feature_id) T)
SELECT F.feature_name, F.feature_description FROM Features F JOIN Property_Features PF ON F.feature_id = PF.feature_id GROUP BY PF.feature_id HAVING COUNT(PF.feature_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Property_Features GROUP BY feature_id) AS subquery)
SELECT MIN(room_count) FROM Properties WHERE room_count >= 0
SELECT room_count FROM Properties ORDER BY room_count ASC LIMIT 1
SELECT COUNT(*) FROM Properties p WHERE p.parking_lots = '1' OR p.garage_yn = '1'
SELECT COUNT(*) FROM Properties WHERE (garage_yn = '1') OR (parking_lots = '1')
SELECT age_category_description FROM Ref_Age_Categories AS ac JOIN Users AS u ON ac.age_category_code = u.age_category_code WHERE u.other_user_details LIKE '%Mother%'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_description GLOB '*Mother*'
SELECT U.first_name FROM Users U WHERE EXISTS (SELECT 1 FROM Properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT U.first_name FROM Users U WHERE EXISTS (SELECT 1 FROM Properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id HAVING COUNT(P.property_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Properties GROUP BY owner_user_id) AS Sub))
SELECT AVG(p.room_count) FROM Properties p WHERE p.property_description LIKE '%garden%'
SELECT AVG(room_count) FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features WHERE feature_id IN (SELECT feature_id FROM Features WHERE feature_name LIKE '%garden%'))
SELECT DISTINCT town_city FROM Addresses a, Properties p, Property_Features pf, Features f WHERE a.address_id = p.property_address_id AND p.property_id = pf.property_id AND pf.feature_id = f.feature_id AND f.feature_name = 'swimming pool'
SELECT DISTINCT A.town_city FROM Addresses A WHERE A.address_id IN (SELECT P.property_address_id FROM Properties P, Property_Features PF, Features F WHERE P.property_id = PF.property_id AND PF.feature_id = F.feature_id AND F.feature_name = 'swimming pool')
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT AVG(room_count) FROM Properties p WHERE EXISTS (SELECT property_id FROM Properties WHERE property_id = p.property_id)
SELECT AVG(room_count) FROM Properties p WHERE EXISTS (SELECT property_id FROM Properties WHERE property_id = p.property_id)
SELECT COUNT(DISTINCT room_size) AS distinct_room_sizes FROM Rooms
SELECT COUNT(DISTINCT room_size) AS distinct_room_sizes FROM Rooms
SELECT DISTINCT U.user_id, U.search_string FROM User_Searches U WHERE (SELECT COUNT(*) FROM User_Searches WHERE user_id = U.user_id AND search_string = U.search_string) >= 2
SELECT DISTINCT user_id, search_seq FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT MAX(search_datetime) AS LatestSearchTime FROM User_Searches
SELECT MAX(search_datetime) AS MostRecentSearch FROM User_Searches
SELECT US.search_datetime, US.search_string FROM User_Searches AS US ORDER BY US.search_string DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC, search_datetime DESC
SELECT DISTINCT A.zip_postcode FROM Addresses A INNER JOIN Properties P ON A.address_id = P.property_address_id WHERE P.owner_user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) > 2)
SELECT DISTINCT zip_postcode FROM Addresses WHERE address_id IN (SELECT property_address_id FROM Properties WHERE owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2))
SELECT U.user_id, U.user_category_code FROM Users U WHERE (SELECT COUNT(*) FROM User_Searches US WHERE US.user_id = U.user_id) = 1
SELECT user_id, user_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) = 1)
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT MIN(user_id) FROM User_Searches WHERE search_datetime = (SELECT MIN(search_datetime) FROM User_Searches)))
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1))
SELECT U.login_name FROM Users U WHERE EXISTS (SELECT 1 FROM Ref_Age_Categories R WHERE R.age_category_code = U.age_category_code AND R.age_category_description LIKE 'Senior%') ORDER BY U.first_name
SELECT U.login_name FROM Users U WHERE EXISTS (SELECT 1 FROM Ref_Age_Categories R WHERE U.age_category_code = R.age_category_code AND R.age_category_description = 'Senior Citizen') ORDER BY U.first_name
SELECT COUNT(*) FROM User_Searches WHERE EXISTS (SELECT 1 FROM Users WHERE Users.user_id = User_Searches.user_id AND Users.is_buyer = '1')
SELECT COUNT(*) FROM User_Searches WHERE EXISTS (SELECT 1 FROM Users WHERE Users.user_id = User_Searches.user_id AND Users.is_buyer = '1')
SELECT U.date_registered FROM Users U WHERE U.login_name = 'ratione'
SELECT U.date_registered FROM Users U WHERE U.login_name = 'ratione'
SELECT U.first_name, U.middle_name, U.last_name, U.login_name FROM Users U WHERE U.is_seller = '1'
SELECT U.first_name, U.middle_name, U.last_name, U.login_name FROM Users U WHERE U.is_seller = '1'
SELECT line_1_number_building, line_2_number_street, town_city FROM Addresses WHERE address_id IN (SELECT user_address_id FROM Users WHERE user_category_code = (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description LIKE '%Senior%'))
SELECT line_1_number_building AS Building, line_2_number_street AS Street, town_city AS City FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id WHERE Users.age_category_code = 'senior'
SELECT COUNT(unique_properties.property_id) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2) AS unique_properties
SELECT COUNT(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2) AS subquery
SELECT property_id, COUNT(photo_seq) AS photo_count FROM Property_Photos GROUP BY property_id
SELECT property_id, COUNT(*) AS photo_count FROM Property_Photos GROUP BY property_id
SELECT owner_user_id, COUNT(*) AS photo_count FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT p.owner_user_id, COUNT(pp.photo_seq) AS photo_count FROM Properties p INNER JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.owner_user_id
SELECT SUM(price_max) FROM Properties JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description LIKE '%Single Mother%' OR user_category_description LIKE '%Student%')
SELECT SUM(Properties.price_max) FROM Properties INNER JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description = 'Single Mother' OR user_category_description = 'Student')
SELECT datestamp, property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY datestamp
SELECT User_Property_History.datestamp AS EventDate, Properties.property_name AS PropertyName FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp
SELECT R.property_type_description, R.property_type_code FROM Ref_Property_Types R, Properties P WHERE R.property_type_code = P.property_type_code GROUP BY R.property_type_code, R.property_type_description HAVING COUNT(P.property_type_code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(property_type_code) AS Cnt FROM Properties GROUP BY property_type_code) AS SubQuery)
SELECT property_type_code, property_type_description FROM Ref_Property_Types WHERE property_type_code = (SELECT property_type_code FROM Properties GROUP BY property_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code LIKE 'Over 60'
SELECT COUNT(*), room_size FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(room_number) AS TotalRooms FROM Rooms GROUP BY room_size HAVING COUNT(room_number) > 0
SELECT country FROM Addresses a, Users u WHERE a.address_id = u.user_address_id AND u.first_name = 'Robbie'
SELECT A.country FROM Addresses A JOIN Users U ON A.address_id = U.user_address_id WHERE U.first_name = 'Robbie'
SELECT DISTINCT U.first_name, U.middle_name, U.last_name FROM Users U LEFT JOIN Properties P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id
SELECT U.first_name || ' ' || U.middle_name || ' ' || U.last_name FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id
SELECT search_string FROM User_Searches AS US WHERE US.user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT search_string FROM User_Searches WHERE user_id IN (SELECT U.user_id FROM Users U LEFT JOIN Properties P ON U.user_id = P.owner_user_id WHERE P.property_id IS NULL)
SELECT U.last_name, U.user_id FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id LEFT JOIN User_Searches US ON U.user_id = US.user_id GROUP BY U.user_id HAVING COUNT(DISTINCT P.property_id) >= 2 AND COUNT(DISTINCT US.search_seq) <= 2
SELECT U.last_name, U.user_id FROM Users U WHERE EXISTS (SELECT 1 FROM User_Searches US WHERE US.user_id = U.user_id GROUP BY US.user_id HAVING COUNT(US.search_seq) <= 2) AND EXISTS (SELECT 1 FROM Properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id HAVING COUNT(P.property_id) >= 2)
SELECT COUNT(*) AS NumberOfBikes FROM bike WHERE weight > 780
SELECT b.product_name, b.weight FROM bike b ORDER BY b.price ASC
SELECT heat, name, nation FROM cyclist WHERE heat IS NOT NULL
SELECT max(weight), min(weight) FROM bike
SELECT AVG(b.price) FROM bike b WHERE b.material = 'Carbon CC'
SELECT name, result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT b.id, b.product_name FROM bike b CROSS JOIN cyclists_own_bikes cob WHERE b.id = cob.bike_id AND cob.purchase_year > 2015
SELECT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id GROUP BY bike.id, bike.product_name HAVING COUNT(DISTINCT cyclists_own_bikes.cyclist_id) >= 4
SELECT c.id, c.name FROM cyclist AS c JOIN cyclists_own_bikes AS cob ON c.id = cob.cyclist_id GROUP BY c.id HAVING COUNT(cob.bike_id) = (SELECT MAX(count) FROM (SELECT COUNT(bike_id) AS count FROM cyclists_own_bikes GROUP BY cyclist_id) AS subquery)
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation = 'Russia' UNION SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation = 'Great Britain'
SELECT COUNT(*) FROM (SELECT DISTINCT heat FROM cyclist)
SELECT count(*) FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015)
SELECT DISTINCT b.product_name FROM bike b, cyclists_own_bikes cob, cyclist c WHERE b.id = cob.bike_id AND cob.cyclist_id = c.id AND c.result < '4:21.558'
SELECT b.product_name, b.price FROM bike b WHERE EXISTS (SELECT 1 FROM cyclists_own_bikes cob JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.name = 'Bradley Wiggins' AND cob.bike_id = b.id) AND EXISTS (SELECT 1 FROM cyclists_own_bikes cob JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.name = 'Antonio Tauler' AND cob.bike_id = b.id)
SELECT name, nation, result FROM cyclist c WHERE c.id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes)
SELECT product_name FROM bike WHERE material LIKE '%fiber%' AND material IS NOT NULL
SELECT c.id, COUNT(b.bike_id) AS bike_count FROM cyclist AS c LEFT JOIN cyclists_own_bikes AS b ON c.id = b.cyclist_id GROUP BY c.id ORDER BY c.id
SELECT Flavor, Food FROM goods WHERE Food = 'cake' ORDER BY Price DESC LIMIT 1 OFFSET 0
SELECT Id, Flavor FROM goods WHERE Food LIKE 'cake' ORDER BY Price DESC LIMIT 1
SELECT Flavor FROM goods WHERE Food = 'cookie' ORDER BY Price ASC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' ORDER BY Price ASC LIMIT 1
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Price < 3.00
SELECT goods.Id FROM goods WHERE Price < 3.00
SELECT DISTINCT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
SELECT DISTINCT c.Id FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id AND g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT g.Food, COUNT(DISTINCT r.CustomerId) FROM goods g LEFT JOIN items i ON g.Id = i.Item LEFT JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food
SELECT g.Food, COUNT(DISTINCT r.CustomerId) FROM goods g LEFT JOIN items i ON g.Id = i.Item LEFT JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food
SELECT CustomerId AS Id FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'bakery' GROUP BY CustomerId HAVING COUNT(DISTINCT ReceiptNumber) >= 15
SELECT receipts.CustomerId FROM receipts GROUP BY receipts.CustomerId HAVING COUNT(*) >= 15
SELECT c.LastName FROM customers c, receipts r WHERE c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10
SELECT c.LastName FROM customers c WHERE EXISTS (SELECT 1 FROM receipts r WHERE r.CustomerId = c.Id GROUP BY r.CustomerId HAVING COUNT(*) > 10)
SELECT COUNT(DISTINCT g.Id) FROM goods g WHERE g.Food = 'Cake'
SELECT COUNT(*) FROM (SELECT Id FROM goods WHERE Food = 'cake' GROUP BY Id)
SELECT Flavor FROM goods WHERE Food LIKE 'Croissant'
SELECT Flavor FROM goods WHERE Food LIKE 'croissant'
SELECT DISTINCT g.Id FROM goods g INNER JOIN items i ON g.Id = i.Item WHERE i.Receipt IN (SELECT ReceiptNumber FROM receipts WHERE CustomerId = 15)
SELECT DISTINCT G.Id FROM goods AS G JOIN items AS I ON G.Id = I.Item JOIN receipts AS R ON I.Receipt = R.ReceiptNumber WHERE R.CustomerId = 15
SELECT Food, AVG(Price) Average, MAX(Price) Maximum, MIN(Price) Minimum FROM goods GROUP BY Food
SELECT g.Food, AVG(g.Price) AS AveragePrice, MIN(g.Price) AS MinimumPrice, MAX(g.Price) AS MaximumPrice FROM goods g GROUP BY g.Food
SELECT DISTINCT i.Receipt FROM items i, goods g WHERE i.Item = g.Id AND g.Food = 'Cake' AND EXISTS (SELECT 1 FROM items i2, goods g2 WHERE i2.Item = g2.Id AND g2.Food = 'Cookie' AND i2.Receipt = i.Receipt)
SELECT r.ReceiptNumber FROM receipts r WHERE r.ReceiptNumber IN (SELECT i.Receipt FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cake') AND r.ReceiptNumber IN (SELECT i.Receipt FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cookies')
SELECT DISTINCT R.ReceiptNumber FROM receipts AS R, customers AS C, items AS I, goods AS G WHERE R.CustomerId = C.Id AND I.Receipt = R.ReceiptNumber AND I.Item = G.Id AND C.LastName = 'LOGAN' AND G.Food = 'Croissant'
SELECT DISTINCT r.ReceiptNumber FROM receipts r, customers c, items i, goods g WHERE r.CustomerId = c.Id AND i.Receipt = r.ReceiptNumber AND i.Item = g.Id AND c.LastName = 'Logan' AND g.Food = 'croissant'
SELECT R.ReceiptNumber, R.Date FROM receipts AS R JOIN items AS I ON R.ReceiptNumber = I.Receipt JOIN goods AS G ON I.Item = G.Id ORDER BY G.Price DESC LIMIT 1
SELECT ReceiptNumber, Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods ORDER BY Price DESC LIMIT 1)) LIMIT 1
SELECT g.Id FROM goods g JOIN items i ON g.Id = i.Item GROUP BY g.Id ORDER BY COUNT(*) ASC LIMIT 1
SELECT g.Id, g.Food FROM goods g JOIN items i ON g.Id = i.Item GROUP BY i.Item ORDER BY COUNT(i.Item) ASC LIMIT 1 OFFSET 0
SELECT Food, COUNT(DISTINCT Id) FROM goods GROUP BY Food
SELECT Food, COUNT(*) FROM goods GROUP BY Food HAVING COUNT(*) > 0
SELECT g.Food, AVG(g.Price) AS AveragePrice FROM goods g GROUP BY g.Food
SELECT Food, AVG(Price) AS Average_Price FROM goods WHERE Price IS NOT NULL GROUP BY Food
SELECT Id FROM goods WHERE Flavor LIKE 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5.000
SELECT g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price > 10
SELECT g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price > 10
SELECT DISTINCT goods.Id, goods.Price FROM goods WHERE Price < (SELECT AVG(g.Price) FROM goods g)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT min(g2.Price) FROM goods g2 WHERE g2.Flavor = 'Tart')
SELECT DISTINCT Id FROM goods WHERE Price < (SELECT MIN(Price) FROM goods t WHERE t.Food = 'Tart' AND t.Price IS NOT NULL)
SELECT DISTINCT Receipt FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 15 GROUP BY receipts.Date
SELECT DISTINCT receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 15
SELECT Id FROM goods WHERE UPPER(Id) LIKE UPPER('%APP%')
SELECT Id FROM goods WHERE UPPER(Id) LIKE UPPER('%APP%')
SELECT g.Flavor, g.Price FROM goods AS g WHERE g.Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT customers.LastName FROM customers ORDER BY customers.LastName ASC
SELECT customers.LastName FROM customers ORDER BY customers.LastName ASC
SELECT Id FROM goods ORDER BY Id
SELECT DISTINCT g.Id AS GoodID FROM goods g ORDER BY GoodID
SELECT DISTINCT r.ReceiptNumber FROM receipts r LEFT JOIN items i ON r.ReceiptNumber = i.Receipt LEFT JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie' OR r.CustomerId = 12
SELECT DISTINCT r.ReceiptNumber FROM receipts r LEFT JOIN items i ON r.ReceiptNumber = i.Receipt LEFT JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie' OR r.CustomerId = 12
SELECT ReceiptNumber, Date FROM receipts WHERE Date = (SELECT MAX(Date) FROM receipts ORDER BY Date DESC LIMIT 1)
SELECT r.ReceiptNumber, r.Date FROM receipts AS r WHERE r.Date = (SELECT MAX(Date) FROM receipts AS r2)
SELECT DISTINCT R.ReceiptNumber FROM receipts R, items I, goods G WHERE R.ReceiptNumber = I.Receipt AND I.Item = G.Id AND (R.Date = (SELECT MIN(Date) FROM receipts) OR G.Price > 10)
SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 10 OR r.Date = (SELECT MIN(Date) FROM receipts)
SELECT g.Id FROM goods g WHERE g.Food IN ('Cookie', 'Cake') AND g.Price >= 3 AND g.Price <= 7
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price BETWEEN 3 AND 7 UNION SELECT Id FROM goods WHERE Food = 'Cakes' AND Price BETWEEN 3 AND 7
SELECT FirstName, LastName FROM customers WHERE Id = (SELECT CustomerId FROM receipts ORDER BY Date ASC, ReceiptNumber ASC LIMIT 1)
SELECT FirstName || ' ' || LastName FROM customers JOIN receipts ON customers.Id = receipts.CustomerId ORDER BY Date ASC LIMIT 1
SELECT AVG(Price) FROM goods WHERE Flavor IN (SELECT DISTINCT Flavor FROM goods WHERE Flavor = 'blackberry' OR Flavor = 'blueberry')
SELECT AVG(Price) AS AvgPrice FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT Price FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT Id FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT Flavor, MAX(Price) AS HighestPrice, MIN(Price) AS LowestPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, MAX(Price) as Maximum_Price, MIN(Price) as Minimum_Price, AVG(Price) as Average_Price FROM goods GROUP BY Flavor ORDER BY Flavor ASC
SELECT Food, MIN(Price) as MinimumPrice, MAX(Price) as MaximumPrice FROM goods GROUP BY Food ORDER BY Food ASC
SELECT Food, MIN(Price), MAX(Price) FROM goods WHERE Food IS NOT NULL GROUP BY Food ORDER BY Food ASC
SELECT Date FROM (SELECT Date, COUNT(*) AS NumReceipts FROM receipts GROUP BY Date) AS DateCounts ORDER BY NumReceipts DESC LIMIT 3
SELECT r.Date FROM receipts r GROUP BY r.Date ORDER BY COUNT(r.ReceiptNumber) DESC LIMIT 3
SELECT FirstName, LastName, COUNT(ReceiptNumber) AS CountOfVisits FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId GROUP BY customers.Id ORDER BY CountOfVisits DESC LIMIT 1
SELECT CustomerId, COUNT(*) AS Total FROM receipts GROUP BY CustomerId ORDER BY Total DESC LIMIT 1
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date HAVING COUNT(DISTINCT CustomerId) > 0
SELECT Date, COUNT(DISTINCT CustomerId) AS Visitors FROM receipts GROUP BY Date
SELECT FirstName, LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts INNER JOIN items ON ReceiptNumber = Receipt WHERE Item IN (SELECT Id FROM goods WHERE Flavor = 'apple' AND Food = 'Tart'))
SELECT DISTINCT FirstName || ' ' || LastName FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE Flavor = 'apple' AND Food = 'Tarts'
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Croissant')
SELECT Id FROM goods WHERE Food = 'cookies' AND Price < (SELECT MIN(Price) FROM goods g WHERE g.Food = 'croissant')
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Food = 'cake' AND Price >= (SELECT AVG(Price) FROM goods WHERE Flavor = 'Tart' AND Food = 'Tart')
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT g.Id, g.Flavor, g.Food FROM goods g ORDER BY g.Price ASC
SELECT g.Id, g.Flavor, g.Food FROM goods g ORDER BY g.Price ASC
SELECT Id AS ItemID, Flavor AS CakeFlavor FROM goods WHERE Food = 'Cake' ORDER BY Flavor
SELECT Id AS CakeId, Flavor AS CakeFlavor FROM goods WHERE Food = 'cake' ORDER BY Flavor
SELECT g.Id FROM goods g LEFT JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' GROUP BY g.Id HAVING COUNT(i.Item) <= 10
SELECT g.Id FROM goods g LEFT JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' GROUP BY g.Id HAVING COUNT(i.Item) <= 10
SELECT DISTINCT Flavor FROM goods WHERE Flavor IN (SELECT Flavor FROM goods WHERE Food = 'Cake') AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT DISTINCT g.Flavor FROM goods g WHERE g.Food = 'Cake' AND g.Flavor NOT IN (SELECT t.Flavor FROM goods t WHERE t.Food = 'Tart')
SELECT Item FROM (SELECT Item, COUNT(*) AS Count FROM items GROUP BY Item) AS Popularity ORDER BY Count DESC LIMIT 3
SELECT g.Food, g.Flavor, COUNT(*) AS Total FROM items i LEFT JOIN goods g ON i.Item = g.Id GROUP BY i.Item ORDER BY Total DESC LIMIT 3
SELECT DISTINCT customers.Id FROM customers, receipts, items, goods WHERE customers.Id = receipts.CustomerId AND receipts.ReceiptNumber = items.Receipt AND items.Item = goods.Id GROUP BY customers.Id HAVING SUM(goods.Price) > 150
SELECT DISTINCT customers.Id FROM customers, receipts, items, goods WHERE customers.Id = receipts.CustomerId AND receipts.ReceiptNumber = items.Receipt AND items.Item = goods.Id GROUP BY customers.Id HAVING SUM(goods.Price) > 150
SELECT customers.Id FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id GROUP BY customers.Id HAVING AVG(goods.Price) > 5
SELECT customers.Id FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id GROUP BY customers.Id HAVING AVG(goods.Price) > 5
SELECT DISTINCT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT DISTINCT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT COUNT(DISTINCT Driver_ID) FROM driver
SELECT COUNT(*) FROM `driver`
SELECT d.Make, COUNT(*) FROM driver AS d WHERE d.Points > 150 GROUP BY d.Make
SELECT d.Make, COUNT(d.Driver_ID) FROM driver d WHERE d.Points > 150 GROUP BY d.Make
SELECT `Make`, AVG(`Age`) FROM `driver` GROUP BY `Make`
SELECT `Make`, AVG(`Age`) FROM `driver` GROUP BY `Make`
SELECT AVG(d.Laps) AS AvgLaps FROM driver AS d WHERE d.Age < 20
SELECT AVG(Laps) AS AverageLaps FROM driver WHERE Age < 20
SELECT t.Manager, t.Sponsor FROM team t ORDER BY t.Car_Owner ASC
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner ASC
SELECT Make FROM team GROUP BY Make HAVING COUNT(*) > 1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*) > 1
SELECT team.Make FROM team WHERE team.Car_Owner = 'Buddy Arrington'
SELECT team.Make FROM team WHERE team.Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) as Max_Points, MIN(Points) as Min_Points FROM driver
SELECT MAX(Points) 'Maximum Points', MIN(Points) 'Minimum Points' FROM driver
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Points < 150
SELECT COUNT(*) FROM driver WHERE Points < 150.0
SELECT Driver FROM driver ORDER BY Age
SELECT driver.Driver FROM driver ORDER BY Age
SELECT driver.Driver FROM driver ORDER BY driver.Points DESC
SELECT driver.Driver FROM driver ORDER BY driver.Points DESC
SELECT driver.Driver, country.Country FROM driver INNER JOIN country ON driver.Country = country.Country_Id
SELECT driver.Driver, country.Country FROM driver INNER JOIN country ON driver.Country = country.Country_Id
SELECT MAX(Points) FROM driver WHERE Country IN (SELECT Country_Id FROM country WHERE Capital = 'Dublin')
SELECT MAX(Points) FROM driver WHERE Country IN (SELECT Country_Id FROM country WHERE Capital = 'Dublin')
SELECT AVG(d.Age) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT AVG(d.Age) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT C.Country FROM country AS C, driver AS D WHERE C.Country_Id = D.Country AND D.Points > 150
SELECT C.Country FROM country C WHERE EXISTS (SELECT 1 FROM driver D WHERE D.Country = C.Country_Id AND D.Points > 150)
SELECT c.Capital FROM country c JOIN driver d ON c.Country_Id = d.Country ORDER BY d.Points DESC LIMIT 1
SELECT c.Capital FROM country c JOIN driver d ON c.Country_Id = d.Country ORDER BY d.Points DESC LIMIT 1
SELECT driver.Make, COUNT(*) AS DriverCount FROM driver GROUP BY driver.Make
SELECT Make, COUNT(Driver_ID) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) = (SELECT MAX(DriverCount) FROM (SELECT COUNT(*) AS DriverCount FROM driver GROUP BY Make) AS Counts)
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM driver GROUP BY Make) tmp)
SELECT d.Make FROM driver AS d GROUP BY d.Make HAVING COUNT(*) >= 3
SELECT d.Make FROM driver d GROUP BY d.Make HAVING COUNT(d.Driver_ID) >= 3
SELECT Team FROM team WHERE NOT EXISTS (SELECT 1 FROM team_driver WHERE team.Team_ID = team_driver.Team_ID)
SELECT Team FROM team T WHERE NOT EXISTS (SELECT NULL FROM team_driver TD WHERE TD.Team_ID = T.Team_ID)
SELECT c.Country FROM country c WHERE c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Dodge') AND c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Chevrolet')
SELECT c.Country FROM country c WHERE c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Dodge') AND c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Chevrolet')
SELECT SUM(Points) as TotalPoints, AVG(Points) as AvgPoints FROM driver
SELECT AVG(Points) average_points, SUM(Points) total_points FROM driver
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver GROUP BY Country)
SELECT Country FROM country WHERE Country_Id NOT IN (SELECT Country FROM driver GROUP BY Country)
SELECT manager, sponsor FROM team JOIN (SELECT Team_ID, COUNT(Driver_ID) AS DriverCount FROM team_driver GROUP BY Team_ID ORDER BY DriverCount DESC LIMIT 1) AS MostDrivers ON team.Team_ID = MostDrivers.Team_ID
SELECT Manager, Sponsor FROM team JOIN team_driver ON team.Team_ID = team_driver.Team_ID GROUP BY team.Team_ID HAVING COUNT(team_driver.Driver_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Driver_ID) AS Cnt FROM team_driver GROUP BY Team_ID) tmp)
SELECT t.manager, t.car_owner FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID HAVING COUNT(DISTINCT td.Driver_ID) >= 2
SELECT t.Manager, t.Car_Owner FROM team AS t JOIN team_driver AS td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID HAVING COUNT(td.Driver_ID) >= 2
SELECT COUNT(1) FROM institution
SELECT COUNT(1) FROM institution
SELECT Name FROM institution ORDER BY institution.Name ASC
SELECT Name FROM institution ORDER BY LOWER(Name) ASC
SELECT Name FROM institution ORDER BY Founded ASC, Name ASC
SELECT `Name` FROM `institution` ORDER BY `Founded` ASC
SELECT institution.City, institution.Province FROM institution
SELECT institution.City, institution.Province FROM institution
SELECT MAX(Enrollment) Maximum, MIN(Enrollment) Minimum FROM institution
SELECT MAX(Enrollment) Maximum, MIN(Enrollment) Minimum FROM institution
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT institution.Stadium FROM institution ORDER BY institution.Capacity DESC
SELECT institution.Stadium FROM institution ORDER BY institution.Capacity DESC
SELECT i.Stadium FROM institution i ORDER BY i.Enrollment DESC LIMIT 1
SELECT institution.Stadium FROM institution WHERE institution.Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Name, Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT i.Name, c.Nickname FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID
SELECT Nickname FROM Championship c JOIN institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Enrollment ASC LIMIT 1
SELECT Nickname FROM Championship INNER JOIN institution ON Championship.Institution_ID = institution.Institution_ID ORDER BY institution.Enrollment ASC LIMIT 1
SELECT Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY c.Number_of_Championships DESC, i.Name ASC
SELECT Name FROM institution AS i JOIN Championship AS c ON i.Institution_ID = c.Institution_ID ORDER BY c.Number_of_Championships DESC
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID WHERE c.Number_of_Championships >= 1
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID WHERE c.Number_of_Championships >= 1
SELECT SUM(Championship.Number_of_Championships) FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID WHERE institution.Affiliation LIKE 'public'
SELECT SUM(Number_of_Championships) FROM Championship, institution WHERE Championship.Institution_ID = institution.Institution_ID AND institution.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT DISTINCT Affiliation, COUNT(*) OVER (PARTITION BY Affiliation) FROM institution
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM institution GROUP BY Affiliation))
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM institution GROUP BY Affiliation) AS SubQuery)
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT Founded, COUNT(*) FROM institution WHERE Founded IS NOT NULL GROUP BY Founded HAVING COUNT(*) > 1
SELECT Nickname FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY i.Capacity DESC
SELECT Nickname FROM Championship C, institution I WHERE C.Institution_ID = I.Institution_ID ORDER BY I.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City = 'Vancouver' OR City = 'Calgary'
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT COUNT(*) FROM (SELECT DISTINCT Province FROM institution)
SELECT COUNT(*) FROM (SELECT DISTINCT Province FROM institution)
SELECT Warehouses.Code, Warehouses.Location, Warehouses.Capacity FROM Warehouses
SELECT Warehouses.Code, Warehouses.Location, Warehouses.Capacity FROM Warehouses
SELECT DISTINCT b.Contents FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code AND w.Location = 'New York'
SELECT DISTINCT b.Contents FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code AND w.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT b.Warehouse, AVG(b.Value) AS AverageValue FROM Boxes b GROUP BY b.Warehouse
SELECT AVG(B.Value), B.Warehouse FROM Boxes AS B GROUP BY B.Warehouse
SELECT AVG(Value) AS AvgValue, SUM(Value) AS SumValue FROM Boxes
SELECT AVG(Value) Average, SUM(Value) Total FROM Boxes
SELECT AVG(Warehouses.Capacity) AS AverageCapacity, SUM(Warehouses.Capacity) AS TotalCapacity FROM Warehouses
SELECT AVG(Capacity) AS Average, SUM(Capacity) AS Total FROM Warehouses
SELECT Contents, AVG(Value), MAX(Value) FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value), MAX(Value) FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents HAVING SUM(Value) = (SELECT MAX(TotalValue) FROM (SELECT SUM(Value) AS TotalValue FROM Boxes GROUP BY Contents) AS SubQuery)
SELECT B.Contents FROM Boxes AS B WHERE B.Value = (SELECT MAX(Value) FROM Boxes)
SELECT AVG(Value) AS AverageValue FROM Boxes
SELECT AVG(Value) AS AverageValue FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT b.Contents FROM Boxes AS b
SELECT COUNT(*) FROM (SELECT DISTINCT Contents FROM Boxes) AS UniqueContents
SELECT COUNT(*) FROM (SELECT DISTINCT Contents FROM Boxes) AS UniqueContents
SELECT DISTINCT W.Location FROM Warehouses W
SELECT DISTINCT WarehouseLocations.Location FROM Warehouses AS WarehouseLocations
SELECT Code FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago' OR Location = 'New York')
SELECT Code FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago' OR Location = 'New York')
SELECT SUM(B.Value) FROM Boxes B INNER JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT SUM(b.Value) FROM Boxes b INNER JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location IN ('Chicago', 'New York')
SELECT DISTINCT Contents FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT DISTINCT B.Contents FROM Boxes B, Warehouses W1, Warehouses W2 WHERE B.Warehouse = W1.Code AND W1.Location = 'Chicago' AND B.Contents IN (SELECT Contents FROM Boxes WHERE Warehouse = W2.Code AND W2.Location = 'New York')
SELECT DISTINCT Contents FROM Boxes EXCEPT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT Contents FROM Boxes EXCEPT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT W.Location FROM Warehouses W WHERE EXISTS (SELECT * FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents = 'Rocks') AND NOT EXISTS (SELECT * FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents = 'Scissors')
SELECT w.Location FROM Warehouses w WHERE w.Code IN (SELECT b.Warehouse FROM Boxes b WHERE b.Contents = 'Rocks') AND NOT EXISTS (SELECT 1 FROM Boxes b2 WHERE b2.Warehouse = w.Code AND b2.Contents = 'Scissors')
SELECT DISTINCT W.Location FROM Warehouses W, Boxes B WHERE W.Code = B.Warehouse AND B.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT W.Code FROM Warehouses W, Boxes B WHERE W.Code = B.Warehouse AND (B.Contents = 'Rocks' OR B.Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT DISTINCT Warehouse FROM Boxes WHERE Contents = 'Rocks' INTERSECT SELECT DISTINCT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents IN ('Rocks', 'Scissors'))
SELECT Code AS BoxCode, Contents AS BoxContents FROM Boxes ORDER BY Value
SELECT Boxes.Code, Boxes.Contents FROM Boxes ORDER BY Boxes.Value
SELECT Code, Contents FROM Boxes WHERE Value IN (SELECT MIN(Value) FROM Boxes)
SELECT Code, Contents FROM Boxes WHERE Value IN (SELECT MIN(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes AS B)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes AS B)
SELECT DISTINCT Contents FROM Boxes GROUP BY Contents ORDER BY Contents
SELECT DISTINCT B.Contents FROM Boxes B ORDER BY B.Contents ASC
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents LIKE 'Rocks')
SELECT B.Code FROM Boxes B WHERE B.Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents LIKE 'Scissors')
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > (SELECT MAX(B2.Value) FROM Boxes B2 WHERE B2.Contents = 'Scissors')
SELECT SUM(b.Value) FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code AND w.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT SUM(B.Value) FROM Boxes B, Warehouses W WHERE B.Warehouse = W.Code AND W.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150.0
SELECT B.Warehouse, AVG(B.Value) AS AvgValue FROM Boxes B GROUP BY B.Warehouse HAVING AVG(B.Value) > 150
SELECT Contents, COUNT(Boxes.Code), SUM(Boxes.Value) FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Contents
SELECT Location, SUM(Capacity) Total_Capacity, AVG(Capacity) Average_Capacity, MAX(Capacity) Maximum_Capacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location
SELECT sum(Capacity) FROM Warehouses
SELECT sum(Capacity) FROM Warehouses
SELECT Warehouses.Location, MAX(Boxes.Value) AS MaxValue FROM Warehouses INNER JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT Warehouses.Location, MAX(Boxes.Value) AS MaxValue FROM Warehouses INNER JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT W.Code, COUNT(B.Code) FROM Warehouses AS W LEFT OUTER JOIN Boxes AS B ON W.Code = B.Warehouse GROUP BY W.Code
SELECT Warehouse, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Warehouse
SELECT COUNT(DISTINCT Location) FROM Warehouses WHERE Code IN (SELECT DISTINCT Warehouse FROM Boxes WHERE Contents = 'Rocks')
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents LIKE '%Rocks%'
SELECT Boxes.Code AS BoxCode, Warehouses.Location AS WarehouseLocation FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
SELECT Boxes.Code AS BoxCode, Warehouses.Location AS WarehouseLocation FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
SELECT b.Code FROM Boxes AS b INNER JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Location = 'Chicago'
SELECT B.Code FROM Boxes AS B, Warehouses AS W WHERE B.Warehouse = W.Code AND W.Location = 'Chicago'
SELECT b.Warehouse, COUNT(b.Code) FROM Boxes b GROUP BY b.Warehouse
SELECT Warehouse, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Warehouse
SELECT b.Warehouse, COUNT(DISTINCT b.Contents) AS TypesOfContents FROM Boxes b GROUP BY b.Warehouse
SELECT b.Warehouse, COUNT(DISTINCT b.Contents) AS TypesOfContents FROM Boxes b GROUP BY b.Warehouse
SELECT W.Code FROM Warehouses W WHERE (SELECT COUNT(B.Code) FROM Boxes B WHERE B.Warehouse = W.Code) > W.Capacity
SELECT wh.Code FROM Warehouses AS wh JOIN Boxes AS bx ON wh.Code = bx.Warehouse GROUP BY wh.Code HAVING COUNT(bx.Code) > wh.Capacity
SELECT SUM(b.Value) FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location != 'Chicago'
SELECT SUM(Value) FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location NOT IN ('Chicago')
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT COUNT(University_ID) FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT COUNT(University_ID) FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT MAX(Enrollment) Maximum, AVG(Enrollment) Average, MIN(Enrollment) Minimum FROM university
SELECT MAX(Enrollment) Maximum, AVG(Enrollment) Average, MIN(Enrollment) Minimum FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(U.Enrollment) FROM university U)
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(uni.Enrollment) FROM university uni)
SELECT Home_Conference FROM university GROUP BY Home_Conference
SELECT Home_Conference FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(University_ID) AS NumberOfUniversities FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(*) AS Count_of_Universities FROM university GROUP BY Home_Conference
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM university GROUP BY State) AS Counts)
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM university GROUP BY State) AS subquery)
SELECT u.Home_Conference FROM university u GROUP BY u.Home_Conference HAVING AVG(u.Enrollment) > 2000
SELECT u.Home_Conference FROM university AS u GROUP BY u.Home_Conference HAVING AVG(u.Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(Total_Enrollment) FROM (SELECT SUM(Enrollment) AS Total_Enrollment FROM university GROUP BY Home_Conference) AS SubQuery)
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY SUM(Enrollment) ASC LIMIT 1
SELECT Major_Name AS Name, Major_Code AS Code FROM major ORDER BY Major_Code
SELECT major.Major_Name, major.Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name, Rank FROM major CROSS JOIN major_ranking ON major.Major_ID = major_ranking.Major_ID CROSS JOIN university ON major_ranking.University_ID = university.University_ID WHERE University_Name = 'Augustana College'
SELECT mr.Rank, m.Major_Name FROM university u, major_ranking mr, major m WHERE u.University_ID = mr.University_ID AND mr.Major_ID = m.Major_ID AND u.University_Name = 'Augustana College'
SELECT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT u.University_Name, u.City, u.State FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank = 1 AND mr.University_ID = u.University_ID)
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT u.University_Name FROM university u WHERE u.University_ID IN (SELECT mr.University_ID FROM major_ranking mr WHERE mr.Rank = 1 GROUP BY mr.University_ID HAVING COUNT(mr.Major_ID) = (SELECT MAX(c) FROM (SELECT COUNT(Major_ID) AS c FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) AS max_count))
SELECT u.University_Name FROM university u WHERE u.University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT University_Name FROM university u WHERE NOT EXISTS (SELECT * FROM major_ranking m WHERE m.University_ID = u.University_ID AND m.Rank = 1)
SELECT u.University_Name FROM university u INNER JOIN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') INTERSECT SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education')) AS mr ON u.University_ID = mr.University_ID
SELECT U.University_Name FROM university U JOIN (SELECT MR.University_ID FROM major_ranking MR JOIN major M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name IN ('Accounting', 'Urban Education') GROUP BY MR.University_ID HAVING COUNT(DISTINCT M.Major_Name) = 2) AS J ON U.University_ID = J.University_ID
SELECT U.University_Name, O.Rank FROM university U INNER JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE U.State = 'Wisconsin'
SELECT U.University_Name, O.Rank FROM university U INNER JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE U.State = 'Wisconsin'
SELECT University_Name FROM university u WHERE EXISTS (SELECT 1 FROM overall_ranking r WHERE r.University_ID = u.University_ID ORDER BY r.Research_point DESC LIMIT 1)
SELECT u.University_Name FROM university u INNER JOIN (SELECT University_ID FROM overall_ranking ORDER BY Research_point DESC LIMIT 1) r ON u.University_ID = r.University_ID
SELECT university.University_Name FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT university.University_Name FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') AND Rank <= 3)
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID = (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') AND Rank <= 3)
SELECT SUM(Enrollment) FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE overall_ranking.Rank <= 5
SELECT SUM(Enrollment) FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE overall_ranking.Rank <= 5
SELECT U.University_Name, O.Citation_point FROM university AS U, overall_ranking AS O WHERE U.University_ID = O.University_ID AND O.Reputation_point >= (SELECT Reputation_point FROM overall_ranking ORDER BY Reputation_point DESC LIMIT 1 OFFSET 2)
SELECT u.University_Name, o.Citation_point FROM university u LEFT JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(DISTINCT University_ID) > 2;
SELECT State FROM (SELECT State, Enrollment FROM university) AS sub WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(*) > 2
SELECT Title FROM Movies WHERE Rating = ''
SELECT Title FROM Movies WHERE Rating = ''
SELECT Title FROM Movies WHERE Rating LIKE 'G'
SELECT Title FROM Movies WHERE Rating LIKE 'G'
SELECT (SELECT Title FROM Movies WHERE Code = MovieTheaters.Movie) AS MovieTitle FROM MovieTheaters WHERE Name = 'Odeon'
SELECT (SELECT Title FROM Movies WHERE Code = MovieTheaters.Movie) AS MovieTitle FROM MovieTheaters WHERE Name = 'Odeon'
SELECT M.Title, T.Name FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie
SELECT M.Title, T.Name FROM Movies AS M, MovieTheaters AS T WHERE M.Code = T.Movie
SELECT COUNT(*) FROM Movies WHERE TRIM(Rating) = 'G'
SELECT COUNT(Code) FROM Movies WHERE Rating = 'G'
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(MovieTheaters.Code) FROM MovieTheaters
SELECT COUNT(DISTINCT MovieTheaters.Code) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating IN ('G', 'PG')
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating IN ('G', 'PG')
SELECT M.Title FROM Movies AS M, MovieTheaters AS MT WHERE M.Code = MT.Movie AND (MT.Name = 'Odeon' OR MT.Name = 'Imperial')
SELECT Title FROM Movies INNER JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie AND MovieTheaters.Name IN ('Odeon', 'Imperial')
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon') INTERSECT SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Imperial')
SELECT DISTINCT M.Title FROM Movies M, MovieTheaters MT1, MovieTheaters MT2 WHERE M.Code = MT1.Movie AND M.Code = MT2.Movie AND MT1.Name = 'Odeon' AND MT2.Name = 'Imperial'
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies M WHERE NOT EXISTS (SELECT NULL FROM MovieTheaters MT WHERE MT.Movie = M.Code AND MT.Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title ASC, Code ASC
SELECT m.Title FROM Movies AS m ORDER BY m.Title ASC
SELECT Title FROM Movies ORDER BY Rating ASC
SELECT Title FROM Movies ORDER BY Rating, Title
SELECT Name FROM (SELECT Name, COUNT(Movie) AS MovieCount FROM MovieTheaters GROUP BY Name ORDER BY MovieCount DESC) AS RankedTheaters LIMIT 1
SELECT Name FROM MovieTheaters GROUP BY Movie HAVING COUNT(Movie) > 0 ORDER BY COUNT(Movie) DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie GROUP BY M.Title ORDER BY COUNT(*) DESC LIMIT 1
SELECT M.Title FROM Movies M, MovieTheaters T WHERE M.Code = T.Movie GROUP BY M.Title HAVING COUNT(T.Name) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM MovieTheaters GROUP BY Movie) AS SubQuery)
SELECT COUNT(*) AS MovieCount, Rating FROM Movies GROUP BY Rating
SELECT m.Rating, COUNT(m.Code) FROM Movies m GROUP BY m.Rating
SELECT count(Code) FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) AS NumberOfMoviesWithRating FROM Movies WHERE Rating IS NOT NULL
SELECT MT.Name FROM MovieTheaters MT WHERE EXISTS (SELECT 1 FROM Movies M WHERE M.Code = MT.Movie)
SELECT Name FROM MovieTheaters WHERE EXISTS (SELECT Code FROM Movies WHERE Movies.Code = MovieTheaters.Movie)
SELECT MovieTheaters.Name FROM MovieTheaters LEFT OUTER JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Code IS NULL
SELECT Name FROM MovieTheaters WHERE NOT EXISTS (SELECT Code FROM Movies WHERE Movies.Code = MovieTheaters.Movie)
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating = 'G')
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating = 'G')
SELECT Title FROM Movies WHERE Title IS NOT NULL
SELECT Title FROM Movies WHERE Title IS NOT NULL
SELECT DISTINCT m.Rating FROM Movies m
SELECT Rating FROM Movies WHERE Rating IS NOT NULL GROUP BY Rating
SELECT Movies.Code, Movies.Title, Movies.Rating FROM Movies WHERE Movies.Rating IS NULL
SELECT Movies.Code, Movies.Title, Movies.Rating FROM Movies WHERE Movies.Rating IS NULL
SELECT m.Title FROM Movies m LEFT JOIN MovieTheaters mt ON m.Code = mt.Movie WHERE mt.Movie IS NULL
SELECT Title FROM Movies M WHERE M.Code NOT IN (SELECT MT.Movie FROM MovieTheaters MT)
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Recipient FROM Package WHERE Weight = (SELECT MAX(Weight) FROM Package))
SELECT Client.Name FROM Client INNER JOIN Package ON Client.AccountNumber = Package.Recipient ORDER BY Package.Weight DESC LIMIT 1
SELECT SUM(Weight) FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT SUM(P.Weight) FROM Package P, Client C WHERE P.Sender = C.AccountNumber AND C.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT e.Salary, e.Position FROM Employee e WHERE e.Name = 'Turanga Leela'
SELECT emp.Position, emp.Salary FROM Employee emp WHERE emp.Name = 'Turanga Leela'
SELECT AVG(Salary) FROM Employee WHERE Position LIKE 'intern'
SELECT AVG(Salary) FROM Employee WHERE Position LIKE 'intern'
SELECT clearance.Level FROM Has_Clearance AS clearance INNER JOIN Employee AS emp ON clearance.Employee = emp.EmployeeID WHERE emp.Position = 'Physician'
SELECT Level FROM Has_Clearance h INNER JOIN Employee e ON h.Employee = e.EmployeeID WHERE e.Position LIKE 'physician'
SELECT Package.PackageNumber FROM Package INNER JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT PackageNumber FROM Package WHERE Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT Package.PackageNumber FROM Package, Client WHERE Package.Recipient = Client.AccountNumber AND Client.Name = 'Leo Wong'
SELECT * FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') UNION SELECT * FROM Package WHERE Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT DISTINCT P.PackageNumber FROM Package P JOIN Client C ON P.Sender = C.AccountNumber OR P.Recipient = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package p JOIN Client s ON p.Sender = s.AccountNumber JOIN Client r ON p.Recipient = r.AccountNumber WHERE s.Name = 'Ogden Wernstrom' AND r.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name LIKE 'Ogden Wernstrom') AND Recipient = (SELECT AccountNumber FROM Client WHERE Name LIKE 'Leo Wong')
SELECT Contents FROM Package AS p JOIN Client AS c ON p.Sender = c.AccountNumber WHERE c.Name = 'John Zoidfarb'
SELECT Contents FROM Package AS p JOIN Client AS c ON p.Sender = c.AccountNumber WHERE c.Name = 'John Zoidfarb'
SELECT Package.PackageNumber, MAX(Package.Weight) AS MaxWeight FROM Package, Client WHERE Package.Sender = Client.AccountNumber AND Client.Name LIKE '%John%' GROUP BY Package.PackageNumber ORDER BY MaxWeight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package INNER JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE 'John%' ORDER BY Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT `PackageNumber`, `Weight` FROM `Package` ORDER BY `Weight` ASC LIMIT 3
SELECT C.Name, COUNT(P.PackageNumber) AS TotalPackages FROM Client C INNER JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber ORDER BY TotalPackages DESC LIMIT 1
SELECT Client.Name, COUNT(*) FROM Client INNER JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name, MIN(NumPackages) FROM (SELECT Client.Name AS Name, COUNT(Package.PackageNumber) AS NumPackages FROM Client LEFT JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Client.AccountNumber) AS SubQuery
SELECT Recipient, COUNT(*) AS PackageCount FROM Package GROUP BY Recipient ORDER BY PackageCount ASC LIMIT 1
SELECT C.Name FROM Client C, Package P WHERE C.AccountNumber = P.Sender GROUP BY C.AccountNumber HAVING COUNT(P.Sender) > 1
SELECT Name FROM (SELECT C.Name, COUNT(*) AS PackageCount FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber) AS SubQuery WHERE PackageCount > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name AS PlanetName, Coordinates AS PlanetCoordinates FROM Planet ORDER BY Name ASC
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT ShipmentID FROM Shipment WHERE EXISTS (SELECT * FROM Employee WHERE Employee.EmployeeID = Shipment.Manager AND Employee.Name = 'Phillip J. Fry')
SELECT ShipmentID FROM Shipment WHERE EXISTS (SELECT 1 FROM Employee WHERE Employee.EmployeeID = Shipment.Manager AND Employee.Name = 'Phillip J Fry')
SELECT shipment.Date FROM Shipment shipment
SELECT s.Date FROM Shipment s
SELECT s.ShipmentID FROM Shipment s INNER JOIN Planet p ON s.Planet = p.PlanetID WHERE p.Name = 'Mars';
SELECT s.ShipmentID FROM Shipment s, Planet p WHERE s.Planet = p.PlanetID AND p.Name = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment, Employee, Planet WHERE Shipment.Manager = Employee.EmployeeID AND Shipment.Planet = Planet.PlanetID AND Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT DISTINCT s.ShipmentID FROM Shipment s, Employee e, Planet p WHERE s.Manager = e.EmployeeID AND s.Planet = p.PlanetID AND e.Name = 'Turanga Leela' AND p.Name = 'Mars'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name = 'Mars' OR Employee.Name = 'Turanga Leela'
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT Planet.Name, COUNT(*) AS ShipmentsCount FROM Planet INNER JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.PlanetID
SELECT Name, COUNT(ShipmentID) AS Shipments FROM Planet LEFT OUTER JOIN Shipment ON PlanetID = Planet GROUP BY PlanetID
SELECT Name FROM Planet ORDER BY (SELECT COUNT(*) FROM Shipment WHERE Shipment.Planet = Planet.PlanetID) DESC LIMIT 1
SELECT P.Name FROM Planet P, Shipment S WHERE P.PlanetID = S.Planet GROUP BY P.Name ORDER BY COUNT(S.ShipmentID) DESC LIMIT 1
SELECT E.Name, COUNT(S.Manager) FROM Shipment S LEFT JOIN Employee E ON S.Manager = E.EmployeeID GROUP BY E.EmployeeID
SELECT E.Name, COUNT(*) AS ShipmentsCount FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.EmployeeID, E.Name
SELECT sum(P.Weight) FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT SUM(Weight) FROM Package INNER JOIN Shipment ON Package.Shipment = Shipment.ShipmentID INNER JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Planet.Name, TotalWeight FROM Planet JOIN (SELECT Shipment.Planet, SUM(Package.Weight) AS TotalWeight FROM Shipment JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Shipment.Planet) AS WeightData ON Planet.PlanetID = WeightData.Planet
SELECT Name, TotalWeight FROM (SELECT Planet.Name AS Name, SUM(Package.Weight) AS TotalWeight FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name) AS WeightSummary
SELECT Planet.Name FROM Planet INNER JOIN Shipment ON Planet.PlanetID = Shipment.Planet INNER JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.PlanetID HAVING SUM(Package.Weight) > 30
SELECT p.Name FROM Planet p WHERE EXISTS (SELECT 1 FROM Shipment s JOIN Package pk ON s.ShipmentID = pk.Shipment WHERE s.Planet = p.PlanetID GROUP BY s.Planet HAVING SUM(pk.Weight) > 30)
SELECT p.PackageNumber FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID JOIN Client c ON p.Sender = c.AccountNumber WHERE pl.Name = 'Omicron Persei 8' AND c.Name = 'Zapp Brannigan'
SELECT COUNT(Package.PackageNumber) FROM Package INNER JOIN Shipment ON Package.Shipment = Shipment.ShipmentID INNER JOIN Client ON Package.Sender = Client.AccountNumber INNER JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT p.PackageNumber FROM Package p INNER JOIN Shipment s ON p.Shipment = s.ShipmentID INNER JOIN Planet pl ON s.Planet = pl.PlanetID INNER JOIN Client c ON p.Sender = c.AccountNumber WHERE pl.Name = 'Omicron Persei 8' OR c.Name = 'Zapp Brannigan'
SELECT COUNT(Package.PackageNumber) FROM Package, Shipment, Planet, Client WHERE Package.Shipment = Shipment.ShipmentID AND Shipment.Planet = Planet.PlanetID AND Package.Sender = Client.AccountNumber AND (Planet.Name = 'Omicron Persei 8' OR Client.Name = 'Zapp Brannigan')
SELECT PackageNumber, Weight FROM Package WHERE Weight > 9 AND Weight < 31
SELECT PackageNumber, Weight FROM Package WHERE Weight > 9.99 AND Weight < 30.01
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance, Planet WHERE Has_Clearance.Planet = Planet.PlanetID AND Planet.Name = 'Omega III')
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance, Planet WHERE Has_Clearance.Planet = Planet.PlanetID AND Planet.Name = 'Omega III')
SELECT p.Name FROM Planet p INNER JOIN (SELECT Planet FROM Has_Clearance GROUP BY Planet HAVING COUNT(*) = 1) AS h ON p.PlanetID = h.Planet
SELECT P.Name FROM Planet P JOIN (SELECT Planet, COUNT(DISTINCT Employee) AS EmpCount FROM Has_Clearance GROUP BY Planet) AS H ON P.PlanetID = H.Planet WHERE H.EmpCount = 1
SELECT Name FROM Employee WHERE Salary > 4999.99 AND Salary < 10000.01
SELECT Name FROM Employee WHERE Salary > 4999 AND Salary < 10001
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT COUNT(*) FROM game WHERE Game_ID IS NOT NULL
SELECT COUNT(*) FROM game WHERE Game_ID IS NOT NULL
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title AS GameTitle, Developers AS GameDevelopers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers NOT LIKE '%Nintendo%'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers <> 'Nintendo'
SELECT `Platform_name`, `Market_district` FROM `platform`
SELECT `Platform_name`, `Market_district` FROM `platform`
SELECT DISTINCT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year) AS HighestRank, MIN(Rank_of_the_year) AS LowestRank FROM player
SELECT (SELECT MAX(Rank_of_the_year) FROM player) AS Max_Rank, (SELECT MIN(Rank_of_the_year) FROM player) AS Min_Rank
SELECT COUNT(*) FROM player p WHERE p.Rank_of_the_year < 3
SELECT COUNT(1) FROM player WHERE Rank_of_the_year <= 3
SELECT p.Player_name FROM player p ORDER BY p.Player_name ASC
SELECT p.Player_name FROM player AS p ORDER BY p.Player_name ASC
SELECT p.Player_name, p.College FROM player p ORDER BY p.Rank_of_the_year DESC
SELECT p.Player_name, p.College FROM player p ORDER BY p.Rank_of_the_year DESC
SELECT Player_name, Rank_of_the_year FROM player WHERE Player_ID IN (SELECT Player_ID FROM game_player WHERE Game_ID IN (SELECT Game_ID FROM game WHERE Title = 'Super Mario World'))
SELECT DISTINCT player.Player_name, player.Rank_of_the_year FROM player JOIN game_player ON player.Player_ID = game_player.Player_ID JOIN game ON game_player.Game_ID = game.Game_ID WHERE game.Title = 'Super Mario World'
SELECT DISTINCT Developers FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Auburn'))
SELECT DISTINCT Developers FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Auburn'))
SELECT AVG(g.Units_sold_Millions) FROM game g, game_player gp, player p WHERE g.Game_ID = gp.Game_ID AND gp.Player_ID = p.Player_ID AND p.Position = 'Guard'
SELECT AVG(Units_sold_Millions) FROM game INNER JOIN game_player ON game.Game_ID = game_player.Game_ID INNER JOIN player ON game_player.Player_ID = player.Player_ID WHERE Position = 'Guard'
SELECT g.Title, p.Platform_name FROM game AS g INNER JOIN platform AS p ON g.Platform_ID = p.Platform_ID
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID AND p.Market_district IN ('Asia', 'USA')
SELECT g.Title FROM game g INNER JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district = 'Asia' OR p.Market_district = 'USA'
SELECT Franchise AS GameFranchise, COUNT(*) AS TotalGames FROM game GROUP BY Franchise
SELECT Franchise, COUNT(Game_ID) FROM game WHERE Franchise IS NOT NULL GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Game_ID) AS Count FROM game GROUP BY Franchise) AS Counts)
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Game_ID) AS Count FROM game GROUP BY Franchise) tmp)
SELECT Franchise FROM (SELECT Franchise, COUNT(*) AS NumGames FROM game GROUP BY Franchise) AS FranchiseCount WHERE NumGames >= 2
SELECT g.Franchise FROM game g GROUP BY g.Franchise HAVING COUNT(DISTINCT g.Game_ID) > 1
SELECT p.Player_name FROM player p WHERE p.Player_ID NOT IN (SELECT Player_ID FROM game_player WHERE If_active)
SELECT Player_name FROM player p WHERE NOT EXISTS (SELECT NULL FROM game_player gp WHERE gp.Player_ID = p.Player_ID)
SELECT Title FROM game WHERE Game_ID IN (SELECT gp.Game_ID FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Oklahoma' INTERSECT SELECT gp.Game_ID FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn')
SELECT Title FROM game WHERE Game_ID IN (SELECT gp.Game_ID FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Oklahoma' OR p.College = 'Auburn')
SELECT Franchise FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT p.Name FROM press p WHERE p.Year_Profits_billion > 15 OR p.Month_Profits_billion > 1
SELECT p.Name FROM press p WHERE p.Year_Profits_billion > 15 OR p.Month_Profits_billion > 1
SELECT AVG(Year_Profits_billion) avg_yearly_profit, MAX(Year_Profits_billion) max_yearly_profit FROM press
SELECT p.Press_ID, AVG(p.Year_Profits_billion) AS AvgYearlyProfit, MAX(p.Year_Profits_billion) AS MaxYearlyProfit FROM press p GROUP BY p.Press_ID
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press p WHERE p.Month_Profits_billion IN (SELECT MAX(Month_Profits_billion) FROM press UNION ALL SELECT MIN(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press);
SELECT COUNT(*) FROM author WHERE `Age` < 30
SELECT count(*) FROM author WHERE `Age` < 30
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, AVG(Age) AS Avg_Age FROM author GROUP BY Gender
SELECT COUNT(Author_ID), Gender FROM author WHERE Age > 30 GROUP BY Gender
SELECT `Gender`, COUNT(*) AS `Count` FROM `author` WHERE `Age` > 30 GROUP BY `Gender`
SELECT `Title` FROM `book` ORDER BY `Release_date` DESC
SELECT `Title` FROM `book` ORDER BY `Release_date` DESC
SELECT Book_Series, COUNT(Book_ID) FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(Book_ID) FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5;
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5;
SELECT b.Book_Series FROM book b WHERE b.Sale_Amount > 1000 INTERSECT SELECT b.Book_Series FROM book b WHERE b.Sale_Amount < 500 GROUP BY b.Book_Series
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'MM' INTERSECT SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'MM' INTERSECT SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT DISTINCT Author_ID FROM book)
SELECT Name FROM author a WHERE a.Author_ID NOT IN (SELECT b.Author_ID FROM book b)
SELECT author.Name FROM author JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID, author.Name HAVING COUNT(DISTINCT book.Book_ID) > 1
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT Title, Author.Name, Press.Name FROM book JOIN author ON book.Author_ID = author.Author_ID JOIN press ON book.Press_ID = press.Press_ID ORDER BY Sale_Amount DESC LIMIT 3
SELECT b.Title AS Book_Title, a.Name AS Author_Name, p.Name AS Press_Name FROM book b JOIN author a ON b.Author_ID = a.Author_ID JOIN press p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT p.Name, SUM(b.Sale_Amount) FROM press p JOIN book b ON p.Press_ID = b.Press_ID GROUP BY p.Press_ID
SELECT p.Name, SUM(b.Sale_Amount) FROM press p LEFT JOIN book b ON p.Press_ID = b.Press_ID GROUP BY p.Name
SELECT p.Name AS PublisherName, COUNT(b.Book_ID) AS TotalBooks FROM press p, book b WHERE p.Press_ID = b.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Press_ID
SELECT p.Name, COUNT(b.Book_ID) FROM press p LEFT JOIN book b ON p.Press_ID = b.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Press_ID
SELECT author.Name FROM author, book WHERE author.Author_ID = book.Author_ID ORDER BY book.Sale_Amount DESC LIMIT 1
SELECT author.Name FROM author, book WHERE author.Author_ID = book.Author_ID ORDER BY book.Sale_Amount DESC LIMIT 1
SELECT Name, Gender FROM author WHERE Author_ID IN (SELECT Author_ID FROM book GROUP BY Author_ID ORDER BY COUNT(Book_ID) DESC LIMIT 1)
SELECT author.Name, author.Gender FROM author JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID HAVING COUNT(book.Book_ID) = (SELECT MAX(Counted) FROM (SELECT COUNT(Book_ID) AS Counted FROM book GROUP BY Author_ID) AS Counts)
SELECT a.Name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor' AND b.Author_ID = a.Author_ID)
SELECT a.Name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor' AND b.Author_ID = a.Author_ID)
SELECT press.Name, press.Year_Profits_billion FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID, press.Name, press.Year_Profits_billion HAVING COUNT(DISTINCT book.Book_ID) > 2
SELECT press.Name, press.Year_Profits_billion FROM press INNER JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2
SELECT COUNT(author_name) FROM Authors
SELECT author_name FROM Authors WHERE author_name IS NOT NULL
SELECT a.author_name, a.other_details FROM Authors a
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(*) FROM Documents WHERE document_id IS NOT NULL
SELECT author_name FROM Documents WHERE document_id = 4 LIMIT 1
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil' AND document_description IS NOT NULL
SELECT count(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT Documents.document_name, Documents.document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings' AND document_id IS NOT NULL
SELECT author_name, other_details FROM Authors WHERE EXISTS (SELECT 1 FROM Documents WHERE Documents.author_name = Authors.author_name AND document_name = 'Travel to China')
SELECT Documents.author_name, COUNT(Documents.document_id) FROM Documents GROUP BY Documents.author_name
SELECT author_name FROM Documents GROUP BY author_name HAVING COUNT(document_id) = (SELECT MAX(doc_count) FROM (SELECT COUNT(document_id) AS doc_count FROM Documents GROUP BY author_name) AS counts)
SELECT DISTINCT a.author_name FROM Authors a, Documents d WHERE a.author_name = d.author_name GROUP BY a.author_name HAVING COUNT(d.document_id) >= 2
SELECT COUNT(*) AS total_processes FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = '9'
SELECT BP.process_name FROM Business_Processes BP JOIN Business_Processes BP2 ON BP.process_id = BP2.next_process_id WHERE BP2.process_id = 9
SELECT COUNT(process_outcome_description) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code IN ('working')
SELECT COUNT(*) FROM (SELECT * FROM Process_Status) AS all_statuses
SELECT p.process_status_code, p.process_status_description FROM Process_Status p
SELECT process_status_description FROM Process_Status WHERE LOWER(process_status_code) = 'ct'
SELECT COUNT(1) FROM Staff
SELECT DISTINCT staff_id, staff_details FROM Staff
SELECT S.staff_details FROM Staff S WHERE S.staff_id = 100
SELECT COUNT(staff_role_code) AS TotalStaffRoles FROM Ref_Staff_Roles
SELECT staff_role_code AS 'Role Code', staff_role_description AS 'Role Description' FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT COUNT(*) FROM (SELECT document_id FROM Documents_Processes GROUP BY document_id)
SELECT DISTINCT process_id FROM Documents_Processes
SELECT D.document_id FROM Documents D WHERE NOT EXISTS (SELECT 1 FROM Documents_Processes DP WHERE D.document_id = DP.document_id)
SELECT process_id FROM Business_Processes EXCEPT SELECT process_id FROM Documents_Processes
SELECT process_outcome_description, process_status_description FROM Process_Outcomes, Process_Status, Documents_Processes WHERE Documents_Processes.document_id = 0 AND Documents_Processes.process_outcome_code = Process_Outcomes.process_outcome_code AND Documents_Processes.process_status_code = Process_Status.process_status_code
SELECT process_name FROM Business_Processes WHERE process_id IN (SELECT process_id FROM Documents_Processes WHERE document_id = (SELECT document_id FROM Documents WHERE document_name = 'Travel to Brazil'))
SELECT process_id, COUNT(*) FROM Documents_Processes GROUP BY process_id HAVING COUNT(*) > 0
SELECT COUNT(*) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9 AND staff_id IS NOT NULL
SELECT S.staff_id, COUNT(*) AS process_count FROM Staff_in_Processes AS S GROUP BY S.staff_id
SELECT S.staff_role_code, COUNT(*) FROM Staff_in_Processes AS S GROUP BY S.staff_role_code
SELECT COUNT(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3 AND staff_role_code IS NOT NULL
SELECT count(*) FROM Agencies
SELECT COUNT(ALL agency_id) FROM Agencies
SELECT `agency_id`, `agency_details` FROM `Agencies`
SELECT DISTINCT agency_id, agency_details FROM Agencies
SELECT count(*) FROM Clients
SELECT count(*) FROM Clients
SELECT `client_id`, `client_details` FROM `Clients`
SELECT `client_id`, `client_details` FROM `Clients`
SELECT Agencies.agency_id, COUNT(Clients.client_id) AS NumberOfClients FROM Agencies LEFT JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id
SELECT Agencies.agency_id, COUNT(Clients.client_id) FROM Agencies LEFT JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A, Clients C WHERE A.agency_id = C.agency_id GROUP BY A.agency_id HAVING COUNT(C.client_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(client_id) AS cnt FROM Clients GROUP BY agency_id) AS subquery)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id = (SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(client_id) DESC LIMIT 1)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients WHERE client_details = 'Mac')
SELECT agency_details FROM Agencies, Clients WHERE Agencies.agency_id = Clients.agency_id AND Clients.client_details LIKE '%Mac%'
SELECT C.client_details, A.agency_details FROM Clients C JOIN Agencies A ON C.agency_id = A.agency_id
SELECT A.agency_details, C.client_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id
SELECT c.sic_code, COUNT(c.client_id) FROM Clients c GROUP BY c.sic_code
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code LIKE 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code LIKE 'Bad'
SELECT agency_id, agency_details FROM Agencies WHERE EXISTS (SELECT 1 FROM Clients WHERE Clients.agency_id = Agencies.agency_id)
SELECT DISTINCT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients)
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients
SELECT Agencies.agency_id FROM Agencies LEFT OUTER JOIN Clients ON Agencies.agency_id = Clients.agency_id WHERE Clients.agency_id IS NULL
SELECT COUNT(*) FROM Invoices WHERE invoice_status IS NOT NULL
SELECT COUNT(*) FROM Invoices WHERE invoice_status IS NOT NULL
SELECT invoice_id, invoice_status, invoice_details FROM Invoices WHERE invoice_details <> ''
SELECT invoice_id, invoice_status, invoice_details FROM Invoices WHERE invoice_status IS NOT NULL
SELECT client_id, COUNT(*) FROM Invoices GROUP BY client_id HAVING COUNT(*) > 0
SELECT client_id, COUNT(*) AS TotalInvoices FROM Invoices GROUP BY client_id
SELECT C.client_id, C.client_details FROM Clients C INNER JOIN Invoices I ON C.client_id = I.client_id GROUP BY C.client_id ORDER BY COUNT(I.invoice_id) DESC LIMIT 1
SELECT c.client_id, c.client_details FROM Clients c JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id ORDER BY COUNT(i.invoice_id) DESC LIMIT 1
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) >= 2
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) >= 2
SELECT invoice_status, COUNT(invoice_id) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(invoice_id) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Invoices GROUP BY invoice_status) AS SubCounts)
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Invoices GROUP BY invoice_status) AS subquery)
SELECT Invoices.invoice_status AS Status, Invoices.invoice_details AS Details, Clients.client_id AS ClientID, Clients.client_details AS ClientDetails, Agencies.agency_id AS AgencyID, Agencies.agency_details AS AgencyDetails FROM Invoices JOIN Clients ON Invoices.client_id = Clients.client_id JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT i.invoice_status AS Status, i.invoice_details AS Details, c.client_id AS ClientID, c.client_details AS ClientDetails, a.agency_id AS AgencyID, a.agency_details AS AgencyDetails FROM Invoices i, Clients c, Agencies a WHERE i.client_id = c.client_id AND c.agency_id = a.agency_id
SELECT meeting_type, other_details FROM Meetings WHERE meeting_type IS NOT NULL
SELECT meeting_type AS Type, other_details AS Details FROM Meetings
SELECT m.meeting_outcome, m.purpose_of_meeting FROM Meetings m
SELECT m.meeting_outcome, m.purpose_of_meeting FROM Meetings m
SELECT Payments.payment_id, Payments.payment_details FROM Payments INNER JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working'
SELECT Payments.payment_id, Payments.payment_details FROM Payments INNER JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working'
SELECT Invoices.invoice_id, Invoices.invoice_status FROM Invoices LEFT OUTER JOIN Payments ON Invoices.invoice_id = Payments.invoice_id WHERE Payments.payment_id IS NULL
SELECT i.invoice_id, i.invoice_status FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id WHERE p.payment_id IS NULL
SELECT COUNT(payment_id) AS NumberOfPayments FROM Payments
SELECT COUNT(payment_id) AS NumberOfPayments FROM Payments
SELECT payment_id, invoice_id, payment_details FROM Payments WHERE payment_id IS NOT NULL
SELECT payment_id, invoice_id, payment_details FROM Payments WHERE payment_id IS NOT NULL
SELECT DISTINCT `invoice_id`, `invoice_status` FROM `Invoices`
SELECT DISTINCT i.invoice_id, i.invoice_status FROM Invoices i WHERE i.invoice_id IN (SELECT invoice_id FROM Payments)
SELECT invoice_id, COUNT(*) FROM Payments GROUP BY invoice_id
SELECT invoice_id, COUNT(*) FROM Payments GROUP BY invoice_id
SELECT invoice_id, invoice_status, invoice_details FROM Invoices WHERE invoice_id = (SELECT invoice_id FROM Payments GROUP BY invoice_id ORDER BY COUNT(payment_id) DESC LIMIT 1)
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I, Payments P WHERE I.invoice_id = P.invoice_id GROUP BY I.invoice_id, I.invoice_status, I.invoice_details HAVING COUNT(P.payment_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(payment_id) AS cnt FROM Payments GROUP BY invoice_id) AS subquery)
SELECT COUNT(*) FROM Staff WHERE 1=1
SELECT COUNT(staff_id) AS StaffCount FROM Staff
SELECT a.agency_id, COUNT(s.staff_id) AS staff_count FROM Agencies a LEFT JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id
SELECT a.agency_id, COUNT(s.staff_id) FROM Agencies a LEFT JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A, Staff S WHERE A.agency_id = S.agency_id GROUP BY A.agency_id HAVING COUNT(S.staff_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(staff_id) AS COUNT FROM Staff GROUP BY agency_id) AS Counts)
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id ORDER BY COUNT(S.staff_id) DESC LIMIT 1
SELECT meeting_outcome AS OutcomeCode, COUNT(*) AS NumberOfMeetings FROM Meetings GROUP BY OutcomeCode
SELECT meeting_outcome, COUNT(*) AS TotalMeetings FROM Meetings GROUP BY meeting_outcome
SELECT client_id, COUNT(*) FROM Meetings GROUP BY client_id
SELECT client_id, COUNT(*) FROM Meetings GROUP BY client_id
SELECT client_id, meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type, client_id
SELECT meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM Meetings AS m JOIN Clients AS c ON m.client_id = c.client_id
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM Meetings m, Clients c WHERE m.client_id = c.client_id
SELECT M.meeting_id, IFNULL(COUNT(SIM.staff_id), 0) AS staff_count FROM Meetings M LEFT JOIN Staff_in_Meetings SIM ON M.meeting_id = SIM.meeting_id GROUP BY M.meeting_id
SELECT m.meeting_id, COUNT(s.staff_id) FROM Meetings m LEFT JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT s.staff_id, COUNT(m.meeting_id) AS meetings_count FROM Staff_in_Meetings s JOIN Meetings m ON s.meeting_id = m.meeting_id GROUP BY s.staff_id ORDER BY meetings_count ASC LIMIT 1
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) = (SELECT COUNT(meeting_id) FROM Staff_in_Meetings GROUP BY staff_id ORDER BY COUNT(meeting_id) ASC LIMIT 1)
SELECT COUNT(*) FROM (SELECT DISTINCT staff_id FROM Staff_in_Meetings)
SELECT COUNT(*) FROM (SELECT DISTINCT staff_id FROM Staff_in_Meetings)
SELECT COUNT(*) FROM Staff s WHERE NOT EXISTS (SELECT 1 FROM Staff_in_Meetings sim WHERE sim.staff_id = s.staff_id)
SELECT COUNT(*) FROM Staff s WHERE NOT EXISTS (SELECT 1 FROM Staff_in_Meetings sim WHERE sim.staff_id = s.staff_id)
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients INNER JOIN Meetings ON Clients.client_id = Meetings.client_id UNION SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients INNER JOIN Invoices ON Clients.client_id = Invoices.client_id
SELECT DISTINCT client_id, client_details FROM Clients WHERE EXISTS (SELECT 1 FROM Meetings WHERE Meetings.client_id = Clients.client_id) OR EXISTS (SELECT 1 FROM Invoices WHERE Invoices.client_id = Clients.client_id)
SELECT s.staff_id, s.staff_details FROM Staff s WHERE s.staff_id IN (SELECT sim.staff_id FROM Staff_in_Meetings sim) AND s.staff_details LIKE '%s%'
SELECT s.staff_id, s.staff_details FROM Staff s WHERE s.staff_id IN (SELECT sim.staff_id FROM Staff_in_Meetings sim) AND s.staff_details LIKE '%s%'
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE EXISTS (SELECT 1 FROM Meetings M WHERE M.client_id = C.client_id GROUP BY M.client_id HAVING COUNT(M.meeting_id) = 1) AND EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id)
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE (SELECT COUNT(*) FROM Meetings M WHERE M.client_id = C.client_id) = 1 AND EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id)
SELECT start_date_time, end_date_time, client_details, staff_details FROM Meetings JOIN Clients ON Meetings.client_id = Clients.client_id JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
SELECT Meetings.start_date_time, Meetings.end_date_time, Clients.client_details, Staff.staff_details FROM Meetings LEFT JOIN Clients ON Meetings.client_id = Clients.client_id LEFT JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id LEFT JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
