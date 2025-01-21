SELECT COUNT(1) FROM club
SELECT COUNT(1) FROM club
SELECT c.Name FROM club c ORDER BY c.Name ASC
SELECT Name FROM club ORDER BY Name
SELECT Manager AS Club_Manager, Captain AS Club_Captain FROM club
SELECT Manager AS Club_Manager, Captain AS Club_Captain FROM club
SELECT club.Name FROM club WHERE club.Manufacturer <> 'Nike'
SELECT club.Name FROM club WHERE club.Manufacturer <> 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT p.Name FROM player AS p WHERE p.Earnings = (SELECT MAX(Earnings) FROM player)
SELECT p.Name FROM player AS p WHERE p.Earnings = (SELECT MAX(Earnings) FROM player)
SELECT DISTINCT Country FROM player p WHERE p.Earnings > 1200000
SELECT player.Country FROM player WHERE player.Earnings > 1200000
SELECT p.Country FROM player AS p WHERE p.Wins_count > 2 ORDER BY p.Earnings DESC, p.Player_ID DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1 OFFSET 0
SELECT p.Name, c.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID
SELECT p.Name, c.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID
SELECT c.Name FROM club c WHERE c.Club_ID IN (SELECT p.Club_ID FROM player p WHERE p.Wins_count > 2)
SELECT c.Name FROM club c WHERE c.Club_ID IN (SELECT p.Club_ID FROM player p WHERE p.Wins_count > 2)
SELECT p.Name FROM player AS p, club AS c WHERE p.Club_ID = c.Club_ID AND c.Manager = 'Sam Allardyce'
SELECT player.Name FROM player LEFT JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID ORDER BY AVG(p.Earnings) DESC
SELECT Name FROM (SELECT Club_ID, AVG(Earnings) AS AvgEarnings FROM player GROUP BY Club_ID) AS AvgEarnings JOIN club ON club.Club_ID = AvgEarnings.Club_ID ORDER BY AvgEarnings DESC
SELECT c.Manufacturer, COUNT(c.Club_ID) FROM club c GROUP BY c.Manufacturer
SELECT c.Manufacturer, COUNT(c.Club_ID) FROM club c GROUP BY c.Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM club GROUP BY Manufacturer) AS ManufacturerCount)
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM club GROUP BY Manufacturer) AS Counts)
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Manufacturer) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Manufacturer) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(DISTINCT Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(DISTINCT Player_ID) > 1
SELECT Name FROM club AS c WHERE NOT EXISTS (SELECT * FROM player AS p WHERE p.Club_ID = c.Club_ID)
SELECT club.Name FROM club LEFT OUTER JOIN player ON club.Club_ID = player.Club_ID WHERE player.Club_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT player.Earnings FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe'
SELECT Earnings FROM player WHERE Country IN (SELECT DISTINCT Country FROM player WHERE Country = 'Australia' OR Country = 'Zimbabwe')
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C WHERE (SELECT COUNT(*) FROM Orders WHERE customer_id = C.customer_id) > 2 AND (SELECT COUNT(*) FROM Order_Items WHERE order_id IN (SELECT order_id FROM Orders WHERE customer_id = C.customer_id)) >= 3
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id LEFT JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY c.customer_id HAVING COUNT(DISTINCT o.order_id) > 2 AND COUNT(oi.order_item_id) >= 3
SELECT O.order_id, O.order_status_code, COUNT(OI.product_id) AS product_count FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS product_count FROM Orders o LEFT JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1 UNION SELECT order_id FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders))
SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1) UNION SELECT MIN(date_order_placed) AS earliest_order FROM Orders
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers AS c WHERE NOT EXISTS (SELECT * FROM Orders AS o WHERE o.customer_id = c.customer_id)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers AS c WHERE NOT EXISTS (SELECT * FROM Orders AS o WHERE o.customer_id = c.customer_id)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_id) >= 2) as Filtered ON p.product_id = Filtered.product_id WHERE Filtered.product_id IS NULL
SELECT product_id, product_name, product_price, product_color FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_id) >= 2)
SELECT Orders.order_id, Orders.date_order_placed FROM Orders, Order_Items WHERE Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING COUNT(Order_Items.product_id) >= 2
SELECT order_id, date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(product_id) >= 2)
SELECT p.product_id, p.product_name, p.product_price FROM Products p INNER JOIN (SELECT product_id, COUNT(order_item_id) AS frequency FROM Order_Items GROUP BY product_id ORDER BY frequency DESC LIMIT 1) freq ON p.product_id = freq.product_id
SELECT product_id, product_name, product_price FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_item_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(order_item_id) as cnt FROM Order_Items GROUP BY product_id) t))
SELECT o.order_id, SUM(p.product_price) AS total_price FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id HAVING SUM(p.product_price) = (SELECT MIN(total_price) FROM (SELECT SUM(product_price) AS total_price FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id) AS Prices)
SELECT o.order_id, SUM(p.product_price) AS total_cost FROM Orders o LEFT JOIN Order_Items oi ON o.order_id = oi.order_id LEFT JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id HAVING SUM(p.product_price) = (SELECT MIN(total_price) FROM (SELECT SUM(product_price) AS total_price FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id) AS Prices)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM Customer_Payment_Methods GROUP BY payment_method_code) tmp)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM Customer_Payment_Methods GROUP BY payment_method_code) tmp)
SELECT gender_code, COUNT(DISTINCT Products.product_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id LEFT JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY gender_code
SELECT gender_code, COUNT(DISTINCT product_id) AS product_count FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY gender_code
SELECT gender_code, COUNT(Orders.order_id) AS number_of_orders FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT gender_code, COUNT(Orders.order_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, p.payment_method_code FROM Customers c JOIN Customer_Payment_Methods p ON c.customer_id = p.customer_id
SELECT Customers.customer_first_name AS FirstName, Customers.customer_middle_initial AS MiddleInitial, Customers.customer_last_name AS LastName, Customer_Payment_Methods.payment_method_code AS PaymentMethod FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT I.invoice_status_code, I.invoice_date, S.shipment_date FROM Invoices AS I INNER JOIN Shipments AS S ON I.invoice_number = S.invoice_number
SELECT I.invoice_status_code AS InvoiceStatus, I.invoice_date AS InvoiceDate, S.shipment_date AS ShipmentDate FROM Invoices I LEFT JOIN Shipments S ON I.invoice_number = S.invoice_number
SELECT product_name, shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT product_name, shipment_date FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi INNER JOIN Shipments s ON oi.order_id = s.order_id
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi INNER JOIN Shipments s ON oi.order_id = s.order_id
SELECT DISTINCT p.product_name, p.product_color FROM Products AS p INNER JOIN Order_Items AS oi ON p.product_id = oi.product_id INNER JOIN Shipments AS s ON oi.order_id = s.order_id
SELECT product_name, product_color FROM Products WHERE EXISTS (SELECT 1 FROM Order_Items JOIN Shipments ON Order_Items.order_id = Shipments.order_id WHERE Products.product_id = Order_Items.product_id)
SELECT DISTINCT product_name, product_price, product_description FROM Products WHERE EXISTS (SELECT 1 FROM Order_Items JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'Female' AND Products.product_id = Order_Items.product_id)
SELECT DISTINCT Products.product_name, Products.product_price, Products.product_description FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'Female'
SELECT invoice_status_code FROM Invoices AS i WHERE NOT EXISTS (SELECT NULL FROM Shipments AS s WHERE s.invoice_number = i.invoice_number)
SELECT i.invoice_status_code FROM Invoices i WHERE NOT EXISTS (SELECT 1 FROM Shipments s WHERE s.invoice_number = i.invoice_number)
SELECT Orders.order_id, Orders.date_order_placed AS date, SUM(Products.product_price) AS total_cost FROM Orders INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id, Orders.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, (SELECT SUM(Products.product_price) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Order_Items.order_id = Orders.order_id) AS TotalAmount FROM Orders
SELECT COUNT(DISTINCT customer_id) FROM Orders WHERE customer_id IS NOT NULL
SELECT COUNT(*) FROM (SELECT customer_id FROM Orders GROUP BY customer_id) AS distinct_customers
SELECT COUNT(DISTINCT oi.order_item_status_code) FROM Order_Items oi
SELECT COUNT(DISTINCT oi.order_item_status_code) FROM Order_Items oi
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods WHERE payment_method_code IS NOT NULL
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods WHERE payment_method_code IS NOT NULL
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%' AND phone_number NOT LIKE '+121%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%%'
SELECT P.product_size FROM Products P WHERE P.product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT Products.product_price, Products.product_size FROM Products WHERE Products.product_price > (SELECT AVG(Products.product_price) FROM Products)
SELECT Products.product_price, Products.product_size FROM Products WHERE Products.product_price > (SELECT AVG(Products.product_price) FROM Products)
SELECT COUNT(*) FROM Products p LEFT OUTER JOIN Order_Items oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT COUNT(*) FROM Products p WHERE p.product_id NOT IN (SELECT oi.product_id FROM Order_Items oi WHERE oi.product_id IS NOT NULL)
SELECT COUNT(DISTINCT customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c WHERE NOT EXISTS (SELECT 1 FROM Customer_Payment_Methods cp WHERE cp.customer_id = c.customer_id)
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT Customers.address_line_1, Customers.town_city, Customers.county FROM Customers WHERE Customers.country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT customer_first_name, product_name FROM Customers JOIN Orders USING(customer_id) JOIN Order_Items USING(order_id) JOIN Products USING(product_id)
SELECT COUNT(DISTINCT order_item_id) FROM Shipment_Items
SELECT COUNT(DISTINCT oi.product_id) FROM Order_Items oi JOIN Shipment_Items si ON oi.order_item_id = si.order_item_id;
SELECT AVG(product_price) FROM Products p WHERE p.product_price IS NOT NULL
SELECT AVG(product_price) AS AverageCost FROM Products WHERE product_price > 0
SELECT AVG(p.product_price) FROM Products p, Order_Items oi WHERE p.product_id = oi.product_id
SELECT AVG(pr.product_price) FROM Products pr, Order_Items oi WHERE pr.product_id = oi.product_id
SELECT c.email_address, c.town_city, c.county FROM Customers c JOIN (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1) g ON c.gender_code = g.gender_code
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1)
SELECT Orders.date_order_placed FROM Orders INNER JOIN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) > 1) AS CustMultiPay ON Orders.customer_id = CustMultiPay.customer_id
SELECT Orders.date_order_placed FROM Orders INNER JOIN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(*) > 1) AS CustMultiPay ON Orders.customer_id = CustMultiPay.customer_id
SELECT order_status_code FROM Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MIN(Cnt) FROM (SELECT COUNT(order_status_code) AS Cnt FROM Orders GROUP BY order_status_code) Temp)
SELECT order_status_code FROM (SELECT order_status_code, COUNT(*) AS order_count FROM Orders GROUP BY order_status_code) AS order_counts ORDER BY order_count ASC LIMIT 1
SELECT P.product_id, P.product_description FROM Products P WHERE P.product_id IN (SELECT OI.product_id FROM Order_Items OI GROUP BY OI.product_id HAVING COUNT(OI.order_item_id) > 3)
SELECT DISTINCT p.product_id, p.product_description FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id GROUP BY p.product_id HAVING COUNT(oi.order_item_id) > 3
SELECT I.invoice_date, I.invoice_number FROM Invoices I INNER JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(DISTINCT S.shipment_id) >= 2
SELECT I.invoice_number, I.invoice_date FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(*) > 1
SELECT Shipments.shipment_tracking_number AS TrackingNumber, Shipments.shipment_date AS ShipmentDate FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments WHERE shipment_tracking_number IS NOT NULL AND shipment_date IS NOT NULL
SELECT product_color, product_description, product_size FROM Products WHERE product_price IN (SELECT product_price FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products))
SELECT product_color, product_description, product_size FROM Products WHERE NOT product_price = (SELECT MAX(product_price) FROM Products)
SELECT d.Name FROM director AS d WHERE d.Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age IN (SELECT MAX(Age) FROM director)
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%' AND Internet IS NOT NULL
SELECT COUNT(DISTINCT Digital_terrestrial_channel) AS Count FROM channel
SELECT p.Title FROM program p ORDER BY p.Start_Year DESC
SELECT director.Name FROM director JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID HAVING COUNT(program.Program_ID) = (SELECT MAX(Counted) FROM (SELECT COUNT(Program_ID) AS Counted FROM program GROUP BY Director_ID) AS Counts)
SELECT d.Name, d.Age FROM director d JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID HAVING COUNT(p.Program_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Program_ID) AS Cnt FROM program GROUP BY Director_ID) tmp)
SELECT Title FROM program ORDER BY Start_Year DESC, Program_ID DESC LIMIT 1
SELECT channel.Name, channel.Internet FROM channel INNER JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name, channel.Internet HAVING COUNT(program.Program_ID) > 1
SELECT c.Name AS Channel_Name, COUNT(p.Program_ID) AS Number_of_Programs FROM channel c LEFT JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name
SELECT count(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT Name FROM director WHERE EXISTS (SELECT 1 FROM program WHERE Director_ID = director.Director_ID AND Title = 'Dracula')
SELECT Name, Internet FROM channel JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID GROUP BY channel.Channel_ID HAVING COUNT(director_admin.Director_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Director_ID) AS Cnt FROM director_admin GROUP BY Channel_ID) tmp)
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT c.Name FROM channel c WHERE c.Channel_ID IN (SELECT da.Channel_ID FROM director_admin da INNER JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age < 40) AND c.Channel_ID IN (SELECT da.Channel_ID FROM director_admin da INNER JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age > 60)
SELECT channel.Channel_ID, channel.Name FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID LEFT JOIN director ON program.Director_ID = director.Director_ID WHERE director.Name != 'Hank Baskett' OR director.Name IS NULL
SELECT COUNT(Radio_ID) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT Name, AirDate FROM (SELECT tv_show_name AS Name, Original_Airdate AS AirDate FROM tv_show)
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC' AND Affiliation IS NOT NULL
SELECT Transmitter FROM radio r WHERE r.ERP_kW > 150 OR r.ERP_kW < 30
SELECT r.Transmitter FROM radio r ORDER BY r.ERP_kW DESC LIMIT 1
SELECT AVG(ERP_kW) FROM radio WHERE ERP_kW > 0
SELECT Affiliation, COUNT(*) AS NumberOfChannels FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM city_channel GROUP BY Affiliation) AS SubQuery)
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(DISTINCT ID) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC, City ASC
SELECT a.Transmitter, b.City FROM radio AS a JOIN city_channel_radio AS c ON a.Radio_ID = c.Radio_ID JOIN city_channel AS b ON c.City_channel_ID = b.ID
SELECT r.Transmitter, cc.Station_name FROM radio r CROSS JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID CROSS JOIN city_channel cc ON ccr.City_channel_ID = cc.ID ORDER BY r.ERP_kW DESC
SELECT r.Transmitter, COUNT(ccr.City_channel_ID) AS Total_Channels FROM radio r LEFT JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT r.Transmitter FROM radio r LEFT JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID WHERE ccr.Radio_ID IS NULL
SELECT v.Model FROM vehicle v WHERE v.Power > 6000 ORDER BY v.Top_Speed DESC LIMIT 1
SELECT v.Model FROM vehicle v WHERE v.Power > 6000 ORDER BY v.Top_Speed DESC LIMIT 1
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT Driver_ID, COUNT(*) FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(*) = (SELECT MAX(Vehicle_Count) FROM (SELECT COUNT(*) AS Vehicle_Count FROM vehicle_driver GROUP BY Driver_ID) AS TempTable)
SELECT vd.Driver_ID, COUNT(*) AS Total_Vehicles FROM vehicle_driver AS vd GROUP BY vd.Driver_ID ORDER BY Total_Vehicles DESC LIMIT 1
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) Max_Power, AVG(Power) Avg_Power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT vd.Vehicle_ID FROM vehicle_driver vd GROUP BY vd.Vehicle_ID ORDER BY COUNT(vd.Driver_ID) ASC LIMIT 1
SELECT v.Vehicle_ID FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID ORDER BY COUNT(vd.Driver_ID) ASC LIMIT 1
SELECT `Top_Speed`, `Power` FROM `vehicle` WHERE `Build_Year` = 1996
SELECT `Top_Speed`, `Power` FROM `vehicle` WHERE `Build_Year` = 1996
SELECT Build_Year AS Year_Built, Model AS Model_Name, Builder AS Manufacturer FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver vd JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = 2012
SELECT COUNT(DISTINCT D.Driver_ID) FROM driver D LEFT JOIN vehicle_driver VD ON D.Driver_ID = VD.Driver_ID LEFT JOIN vehicle V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Build_Year = 2012
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series LIKE 'NASCAR'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series LIKE 'NASCAR'
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT AVG(vehicle.Top_Speed) FROM vehicle
SELECT DISTINCT Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE Power > 5000)
SELECT Name FROM driver AS d WHERE d.Driver_ID IN (SELECT vd.Driver_ID FROM vehicle_driver AS vd, vehicle AS v WHERE vd.Vehicle_ID = v.Vehicle_ID AND v.Power > 5000)
SELECT DISTINCT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT v.Model FROM vehicle v WHERE v.Total_Production > 100 OR v.Top_Speed > 150
SELECT v.Model, v.Build_Year FROM vehicle v WHERE v.Model LIKE '%DJ%'
SELECT v.Model, v.Build_Year FROM vehicle v WHERE v.Model LIKE '%DJ%'
SELECT v.Model FROM vehicle v WHERE NOT EXISTS (SELECT * FROM vehicle_driver vd WHERE vd.Vehicle_ID = v.Vehicle_ID)
SELECT Model FROM vehicle v WHERE NOT EXISTS (SELECT NULL FROM vehicle_driver vd WHERE vd.Vehicle_ID = v.Vehicle_ID)
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2)
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' UNION SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2)
SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver vd INNER JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' UNION SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2)
SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE (SELECT COUNT(*) FROM vehicle_driver vd WHERE vd.Vehicle_ID = v.Vehicle_ID) > 2 OR EXISTS (SELECT 1 FROM vehicle_driver vd JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE vd.Vehicle_ID = v.Vehicle_ID AND d.Name = 'Jeff Gordon')
SELECT COUNT(*) FROM vehicle WHERE Top_Speed IN (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed IN (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY UPPER(Name)
SELECT Name FROM driver ORDER BY Name COLLATE NOCASE ASC
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS DriverCount FROM driver GROUP BY Racing_Series
SELECT count(DISTINCT D.Driver_ID), D.Racing_Series FROM driver AS D GROUP BY D.Racing_Series
SELECT d.Name, d.Citizenship FROM driver d WHERE EXISTS (SELECT 1 FROM vehicle_driver vd JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE vd.Driver_ID = d.Driver_ID AND v.Model = 'DJ1')
SELECT d.Name, d.Citizenship FROM driver d, vehicle_driver vd, vehicle v WHERE d.Driver_ID = vd.Driver_ID AND vd.Vehicle_ID = v.Vehicle_ID AND v.Model = 'DJ1'
SELECT COUNT(*) FROM driver d WHERE NOT EXISTS (SELECT 1 FROM vehicle_driver vd WHERE vd.Driver_ID = d.Driver_ID)
SELECT COUNT(*) FROM driver d WHERE NOT EXISTS (SELECT 1 FROM vehicle_driver vd WHERE vd.Driver_ID = d.Driver_ID)
SELECT COUNT(Exam_ID) FROM Exams WHERE Exam_ID > 0
SELECT COUNT(DISTINCT Exam_ID) FROM Exams
SELECT DISTINCT Exams.Subject_Code FROM Exams ORDER BY Exams.Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY LOWER(Subject_Code)
SELECT Exam_Name, Exam_Date FROM Exams WHERE NOT Subject_Code = 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code NOT LIKE 'Database' AND Subject_Code IS NOT NULL
SELECT e.Exam_Date FROM Exams e WHERE e.Subject_Code LIKE '%data%' ORDER BY e.Exam_Date DESC;
SELECT Exam_Date FROM Exams WHERE INSTR(Subject_Code, 'data') > 0 ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(Question_ID) AS QuestionCount FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) > 0
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' AND Student_Answer_Text != ''
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' AND Student_Answer_Text != ''
SELECT COUNT(*) FROM (SELECT DISTINCT Comments FROM Student_Answers WHERE Comments IS NOT NULL) AS distinct_comments
SELECT COUNT(DISTINCT Student_Answers.Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) FROM Student_Answers GROUP BY Student_Answer_Text HAVING COUNT(*) > 1 ORDER BY COUNT(*) DESC
SELECT a.Student_Answer_Text, COUNT(*) FROM Student_Answers a GROUP BY a.Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Students.First_Name AS StudentFirstName, Student_Answers.Date_of_Answer AS AnswerDate FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT Students.First_Name AS StudentFirstName, Student_Answers.Date_of_Answer AS AnswerDate FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID
SELECT s.Email_Adress AS StudentEmail, sa.Date_of_Answer AS AnswerDate FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID ORDER BY sa.Date_of_Answer DESC
SELECT Email_Adress, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment HAVING COUNT(*) = (SELECT MIN(Count) FROM (SELECT COUNT(*) AS Count FROM Student_Assessments GROUP BY Assessment) AS Counts)
SELECT Assessment FROM (SELECT Assessment, COUNT(*) AS Count FROM Student_Assessments GROUP BY Assessment) AS SubQuery WHERE Count = (SELECT MIN(Count) FROM (SELECT COUNT(*) AS Count FROM Student_Assessments GROUP BY Assessment) AS SubQuery2)
SELECT S.First_Name FROM Students S WHERE S.Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(DISTINCT Student_Answer_ID) >= 2)
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(Student_Answer_ID) >= 2)
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text HAVING COUNT(Valid_Answer_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Valid_Answer_ID) AS Cnt FROM Valid_Answers GROUP BY Valid_Answer_Text) Temp)
SELECT VA.Valid_Answer_Text FROM Valid_Answers AS VA JOIN Student_Assessments AS SA ON VA.Valid_Answer_ID = SA.Valid_Answer_ID GROUP BY VA.Valid_Answer_Text ORDER BY COUNT(SA.Valid_Answer_ID) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'U')
SELECT Last_Name FROM Students WHERE Gender_MFU = 'U' OR Gender_MFU = 'F'
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU = 'M' OR Gender_MFU = 'F'
SELECT s.Last_Name FROM Students s WHERE s.Gender_MFU = 'M' OR s.Gender_MFU = 'F'
SELECT s.First_Name FROM Students s WHERE NOT EXISTS (SELECT NULL FROM Student_Answers sa WHERE sa.Student_ID = s.Student_ID)
SELECT s.First_Name FROM Students s WHERE NOT EXISTS (SELECT NULL FROM Student_Answers sa WHERE sa.Student_ID = s.Student_ID)
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Comments = 'Normal' OR sa.Comments = 'Absent' GROUP BY sa.Student_Answer_Text HAVING COUNT(DISTINCT sa.Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent'
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT * FROM Students WHERE 1=1
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Students.Email_Adress, Students.Cell_Mobile_Phone, Students.Home_Phone FROM Students
SELECT COUNT(*) FROM Addresses WHERE address_id IS NOT NULL
SELECT COUNT(*) FROM Addresses WHERE address_id IS NOT NULL
SELECT DISTINCT address_id, address_details FROM Addresses
SELECT DISTINCT address_id, address_details FROM Addresses
SELECT COUNT(*) FROM Products WHERE product_name IS NOT NULL
SELECT COUNT(*) FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE LOWER(product_name) = 'monitor'
SELECT MIN(product_price) AS MinimumPrice, AVG(product_price) AS AveragePrice, MAX(product_price) AS MaximumPrice FROM Products
SELECT MIN(product_price) MinPrice, AVG(product_price) AvgPrice, MAX(product_price) MaxPrice FROM Products
SELECT AVG(product_price) FROM Products WHERE product_type_code LIKE 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code LIKE 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code LIKE 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code IN ('Hardware')
SELECT product_name FROM Products p1 WHERE p1.product_price > (SELECT AVG(p2.product_price) FROM Products p2)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(P.product_price) FROM Products P)
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'hardware' AND P.product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'Hardware' AND P.product_price > (SELECT AVG(P.product_price) FROM Products P WHERE P.product_type_code = 'Hardware')
SELECT p.product_name FROM Products AS p WHERE p.product_type_code = 'Clothes' ORDER BY p.product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(p.product_price) FROM Products p WHERE p.product_type_code = 'Clothes')
SELECT p.product_id, p.product_name FROM Products AS p WHERE p.product_type_code = 'Hardware' ORDER BY p.product_price ASC LIMIT 1
SELECT p.product_id, p.product_name FROM Products p WHERE p.product_type_code = 'Hardware' AND p.product_price = (SELECT MIN(p2.product_price) FROM Products p2 WHERE p2.product_type_code = 'Hardware')
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products WHERE product_type_code LIKE 'hardware' ORDER BY product_price ASC
SELECT p.product_name FROM Products p WHERE p.product_type_code = 'Hardware' ORDER BY p.product_price ASC
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT COUNT(product_id), product_type_code FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code
SELECT AVG(p.product_price) AS AveragePrice, p.product_type_code FROM Products p GROUP BY p.product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT DISTINCT p.product_type_code FROM Products p WHERE p.product_type_code IN (SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Products GROUP BY product_type_code) AS subquery)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Products GROUP BY product_type_code) as counts)
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT Addresses.address_details, Customers.customer_phone, Customers.customer_email FROM Customers JOIN Addresses ON Customers.address_id = Addresses.address_id WHERE Customers.customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(DISTINCT customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(DISTINCT customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Customers GROUP BY payment_method_code) as counts)
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Customers GROUP BY payment_method_code) as counts)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM (SELECT payment_method_code, COUNT(*) as cnt FROM Customers GROUP BY payment_method_code ORDER BY cnt ASC) as subquery LIMIT 1)
SELECT C.customer_name FROM Customers C INNER JOIN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1) PM ON C.payment_method_code = PM.payment_method_code
SELECT payment_method_code AS PaymentMethod, customer_number AS CustomerNumber FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy' AND customer_id IS NOT NULL
SELECT DISTINCT c.payment_method_code FROM Customers c
SELECT DISTINCT c.payment_method_code FROM Customers c
SELECT product_id, product_type_code FROM Products ORDER BY LOWER(product_name)
SELECT product_id, product_type_code FROM Products ORDER BY LOWER(product_name)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MIN(product_count) FROM (SELECT product_type_code, COUNT(product_id) AS product_count FROM Products GROUP BY product_type_code) sub)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Products GROUP BY product_type_code) AS sub)
SELECT COUNT(DISTINCT order_id) FROM Customer_Orders
SELECT COUNT(DISTINCT order_id) FROM Customer_Orders
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders CO JOIN Customers C ON CO.customer_id = C.customer_id WHERE C.customer_name = 'Jeromy'
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders CO JOIN Customers C ON CO.customer_id = C.customer_id WHERE C.customer_name = 'Jeromy'
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS total_orders FROM Customers AS C LEFT JOIN Customer_Orders AS O ON C.customer_id = O.customer_id GROUP BY C.customer_id
SELECT customer_name, customer_id, (SELECT COUNT(*) FROM Customer_Orders WHERE Customer_Orders.customer_id = Customers.customer_id) AS number_of_orders FROM Customers
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c, Customer_Orders co WHERE c.customer_id = co.customer_id GROUP BY c.customer_id HAVING COUNT(co.order_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(order_id) AS cnt FROM Customer_Orders GROUP BY customer_id) tmp)
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c, Customer_Orders co WHERE c.customer_id = co.customer_id GROUP BY c.customer_id HAVING COUNT(co.order_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(order_id) AS cnt FROM Customer_Orders GROUP BY customer_id) t)
SELECT order_status_code, COUNT(order_id) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(order_id) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MAX(counts) FROM (SELECT COUNT(*) as counts FROM Customer_Orders GROUP BY order_status_code) as subquery)
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Customer_Orders GROUP BY order_status_code) AS counts)
SELECT COUNT(*) FROM Customers c WHERE NOT EXISTS (SELECT 1 FROM Customer_Orders co WHERE co.customer_id = c.customer_id)
SELECT COUNT(c.customer_id) FROM Customers c LEFT OUTER JOIN Customer_Orders co ON c.customer_id = co.customer_id WHERE co.order_id IS NULL
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT oi.product_id FROM Order_Items oi)
SELECT p.product_name FROM Products p WHERE p.product_id NOT IN (SELECT oi.product_id FROM Order_Items oi WHERE oi.product_id IS NOT NULL)
SELECT COUNT(DISTINCT Order_Items.order_item_id) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT SUM(order_quantity) FROM Order_Items, Products WHERE Order_Items.product_id = Products.product_id AND Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c WHERE c.customer_id IN (SELECT co.customer_id FROM Customer_Orders co JOIN Order_Items oi ON co.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id WHERE p.product_name = 'Monitor')
SELECT COUNT(DISTINCT co.customer_id) FROM Customer_Orders co JOIN Order_Items oi ON co.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id WHERE p.product_name LIKE 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM (SELECT DISTINCT customer_id FROM Customer_Orders) AS unique_customers
SELECT c.customer_id FROM Customers c LEFT JOIN Customer_Orders co ON c.customer_id = co.customer_id WHERE co.customer_id IS NULL
SELECT C.customer_id FROM Customers C LEFT JOIN Customer_Orders CO ON C.customer_id = CO.customer_id WHERE CO.customer_id IS NULL
SELECT DISTINCT co.order_date, co.order_id FROM Customer_Orders co, Order_Items oi WHERE co.order_id = oi.order_id AND (oi.order_quantity > 6 OR (SELECT COUNT(*) FROM Order_Items WHERE order_id = co.order_id) > 3)
SELECT order_id, order_date FROM Customer_Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING SUM(order_quantity) > 6) OR order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(product_id) > 3)
SELECT COUNT(*) FROM building WHERE 1=1
SELECT COUNT(DISTINCT Building_ID) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC, Address ASC
SELECT building.Name FROM building ORDER BY Number_of_Stories
SELECT b.Address FROM building b ORDER BY b.Completed_Year DESC
SELECT b.Address FROM building b ORDER BY b.Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year NOT IN (1980)
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year NOT IN (1980)
SELECT AVG(region.Population) FROM region
SELECT AVG(region.Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT r.Capital FROM region r WHERE r.Population = (SELECT MAX(Population) FROM region r2)
SELECT region.Name FROM region ORDER BY region.Area DESC LIMIT 5;
SELECT Name FROM region ORDER BY Area DESC LIMIT 5;
SELECT b.Name AS BuildingName, r.Name AS RegionName FROM building AS b, region AS r WHERE b.Region_ID = r.Region_ID
SELECT b.Name, r.Name FROM building AS b INNER JOIN region AS r ON b.Region_ID = r.Region_ID
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(Building_ID) > 1)
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(Building_ID) > 1)
SELECT r.Capital FROM region r, building b WHERE r.Region_ID = b.Region_ID GROUP BY r.Region_ID HAVING COUNT(b.Building_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM building GROUP BY Region_ID) tmp)
SELECT Capital FROM region WHERE Region_ID = (SELECT Region_ID FROM building GROUP BY Region_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT `Address`, `Capital` FROM `building` INNER JOIN `region` ON `building`.`Region_ID` = `region`.`Region_ID`
SELECT b.Address, r.Name FROM building b, region r WHERE b.Region_ID = r.Region_ID
SELECT b.Number_of_Stories FROM building b LEFT JOIN region r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT b.Number_of_Stories FROM building b LEFT JOIN region r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT b.Completed_Year, COUNT(*) FROM building b GROUP BY b.Completed_Year
SELECT Completed_Year, COUNT(*) FROM building GROUP BY Completed_Year
SELECT Completed_Year, COUNT(Building_ID) AS NumBuildings FROM building GROUP BY Completed_Year ORDER BY NumBuildings DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM building GROUP BY Completed_Year) AS Counts)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING MAX(Number_of_Stories) > 20 AND MIN(Number_of_Stories) < 15
SELECT b.Completed_Year FROM building b GROUP BY b.Completed_Year HAVING MAX(b.Number_of_Stories) > 20 AND MIN(b.Number_of_Stories) < 15
SELECT DISTINCT b.Address FROM building b
SELECT DISTINCT b.Address FROM building AS b
SELECT Completed_Year FROM building AS b ORDER BY b.Number_of_Stories DESC
SELECT b.Completed_Year FROM building AS b ORDER BY b.Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT COUNT(*) AS TotalServices FROM Services
SELECT COUNT(Service_ID) FROM Services WHERE Service_ID > 0
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(Analytical_Layer_Type_Code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Analytical_Layer_Type_Code) AS Cnt FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) a)
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) AS SubQuery)
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services, Customers WHERE Customers_and_Services.Customer_ID = Customers.Customer_ID AND Customers.Customer_Details = 'Hardy Kutch')
SELECT DISTINCT Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch'
SELECT S.Service_Details FROM Services AS S JOIN Customers_and_Services AS CS ON S.Service_ID = CS.Service_ID GROUP BY S.Service_ID HAVING COUNT(CS.Customer_ID) > 3
SELECT DISTINCT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID GROUP BY S.Service_ID HAVING COUNT(CS.Customer_ID) > 3
SELECT C.Customer_Details FROM Customers C WHERE EXISTS (SELECT 1 FROM Customers_and_Services CS WHERE CS.Customer_ID = C.Customer_ID GROUP BY CS.Customer_ID HAVING COUNT(CS.Service_ID) = (SELECT MAX(Counted) FROM (SELECT COUNT(Service_ID) AS Counted FROM Customers_and_Services GROUP BY Customer_ID) AS Counts))
SELECT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID ORDER BY COUNT(CS.Service_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c INNER JOIN (SELECT Customer_ID, COUNT(DISTINCT Service_ID) AS Service_Count FROM Customers_and_Services GROUP BY Customer_ID) cs ON c.Customer_ID = cs.Customer_ID ORDER BY cs.Service_Count DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c, Customers_and_Services cs WHERE c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID HAVING COUNT(DISTINCT cs.Service_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(DISTINCT Service_ID) AS cnt FROM Customers_and_Services GROUP BY Customer_ID) t)
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID IS NOT NULL)
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID IS NOT NULL)
SELECT C.Customer_Details FROM Customers C WHERE EXISTS (SELECT NULL FROM Customers_and_Services CS WHERE C.Customer_ID = CS.Customer_ID GROUP BY CS.Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT DISTINCT c.Customer_Details FROM Customers c WHERE EXISTS (SELECT 1 FROM Customers_and_Services cs WHERE c.Customer_ID = cs.Customer_ID AND cs.Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1))
SELECT DISTINCT COUNT(Customers_and_Services_Details) FROM Customers_and_Services
SELECT COUNT(*) FROM Customers_and_Services WHERE Customers_and_Services_Details IS NOT NULL
SELECT Customer_Details FROM Customers WHERE Customer_Details MATCH 'Kutch'
SELECT Customer_Details FROM Customers WHERE INSTR(Customer_Details, 'Kutch') > 0
SELECT DISTINCT Service_Details FROM Services WHERE EXISTS (SELECT * FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' AND Customers_and_Services.Service_ID = Services.Service_ID) OR EXISTS (SELECT * FROM Customer_Interactions WHERE Status_Code = 'good' AND Customer_Interactions.Service_ID = Services.Service_ID)
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch' UNION SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT DISTINCT S.Service_Details FROM Services S WHERE S.Service_ID IN (SELECT CS.Service_ID FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch') AND S.Service_ID IN (SELECT CI.Service_ID FROM Customer_Interactions CI WHERE CI.Status_Code = 'bad')
SELECT S.Service_Details FROM Services S JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID JOIN Customers C ON CI.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' AND CI.Status_Code = 'bad'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT ci.Service_ID FROM Customer_Interactions ci INNER JOIN Channels c ON ci.Channel_ID = c.Channel_ID WHERE c.Channel_Details = '15 ij')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = '15 ij'))
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details = 'bad')
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details = 'bad')
SELECT COUNT(*) FROM Integration_Platform WHERE EXISTS (SELECT 1 FROM Customer_Interactions WHERE Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID AND Status_Code = 'Success')
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT C.Customer_Details FROM Customers C JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID JOIN Integration_Platform IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE IP.Integration_Platform_Details LIKE '%failed%'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Customer_Interaction_ID IN (SELECT Customer_Interaction_ID FROM Integration_Platform WHERE Integration_Platform_Details = 'Fail'))
SELECT S.Service_Details FROM Services S WHERE S.Service_ID NOT IN (SELECT CS.Service_ID FROM Customers_and_Services CS)
SELECT S.Service_Details FROM Services S WHERE S.Service_ID NOT IN (SELECT CS.Service_ID FROM Customers_and_Services CS)
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT a.Analytical_Layer_Type_Code, COUNT(a.Analytical_ID) FROM Analytical_Layer a GROUP BY a.Analytical_Layer_Type_Code
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customers_and_Services_Details LIKE 'unsatisfied')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customers_and_Services_Details LIKE 'unsatisfied')
SELECT COUNT(Vehicles.id) AS TotalVehicles FROM Vehicles
SELECT COUNT(1) FROM Vehicles
SELECT `name` FROM `Vehicles` ORDER BY `Model_year` DESC
SELECT `name` FROM `Vehicles` ORDER BY `Model_year` DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain <> ''
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain <> ''
SELECT name AS Vehicle_Name, Type_of_powertrain AS Powertrain_Type, Annual_fuel_cost AS Annual_Cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Vehicles WHERE Vehicles.Model_year IN (2013, 2014)
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year IN (2013, 2014) GROUP BY Type_of_powertrain HAVING COUNT(DISTINCT Model_year) = 2
WITH Year2013 AS (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013), Year2014 AS (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014) SELECT Type_of_powertrain FROM Year2013 INTERSECT SELECT Type_of_powertrain FROM Year2014
SELECT Type_of_powertrain, COUNT(id) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(id) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) = (SELECT MAX(cnt) FROM (SELECT COUNT(id) AS cnt FROM Vehicles GROUP BY Type_of_powertrain) sub)
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM Vehicles GROUP BY Type_of_powertrain) temp)
SELECT MIN(Annual_fuel_cost) "Minimum Annual Fuel Cost", MAX(Annual_fuel_cost) "Maximum Annual Fuel Cost", AVG(Annual_fuel_cost) "Average Annual Fuel Cost" FROM Vehicles
SELECT MIN(Annual_fuel_cost) Minimum, MAX(Annual_fuel_cost) Maximum, AVG(Annual_fuel_cost) Average FROM Vehicles
SELECT name AS Vehicle_Name, Model_year AS ModelYear FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate AND Model_year IS NOT NULL
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(Vehicles.id) >= 2
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS AvgFuelCost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) > 1
SELECT name AS CustomerName, age AS CustomerAge, membership_credit AS MembershipCredit FROM Customers
SELECT name AS CustomerName, age AS CustomerAge, membership_credit AS MembershipCredit FROM Customers
SELECT name, age FROM Customers WHERE membership_credit IN (SELECT MAX(membership_credit) FROM Customers)
SELECT C.name, C.age FROM Customers AS C WHERE C.membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers WHERE membership_credit > 0)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT ALL * FROM Discount
SELECT ALL * FROM Discount
SELECT name, SUM(total_hours) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY name
SELECT name, SUM(total_hours) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY name
SELECT name FROM Vehicles V WHERE NOT EXISTS (SELECT NULL FROM Renting_history R WHERE R.vehicles_id = V.id)
SELECT name FROM Vehicles V WHERE NOT EXISTS (SELECT NULL FROM Renting_history R WHERE R.vehicles_id = V.id)
SELECT Customers.name FROM Customers JOIN Renting_history ON Customers.id = Renting_history.customer_id GROUP BY Customers.id HAVING COUNT(Renting_history.customer_id) >= 2
SELECT Customers.name FROM Customers JOIN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(*) > 1) AS Subquery ON Customers.id = Subquery.customer_id
SELECT v.name, v.Model_year FROM Vehicles v, Renting_history r WHERE v.id = r.vehicles_id GROUP BY v.id, v.name, v.Model_year HAVING COUNT(r.id) = (SELECT MAX(cnt) FROM (SELECT COUNT(id) AS cnt FROM Renting_history GROUP BY vehicles_id) tmp)
SELECT name, Model_year FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id HAVING COUNT(vehicles_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(vehicles_id) AS cnt FROM Renting_history GROUP BY vehicles_id)))
SELECT v.name, SUM(rh.total_hours) AS TotalRentalHours FROM Vehicles v, Renting_history rh WHERE v.id = rh.vehicles_id GROUP BY v.name ORDER BY TotalRentalHours DESC
SELECT name FROM Vehicles JOIN (SELECT vehicles_id, SUM(total_hours) AS total FROM Renting_history GROUP BY vehicles_id) AS Subquery ON Vehicles.id = Subquery.vehicles_id ORDER BY Subquery.total DESC
SELECT D.name FROM Discount D LEFT JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.id HAVING COUNT(R.id) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Renting_history GROUP BY discount_id) AS subquery)
SELECT D.name FROM Discount D INNER JOIN (SELECT discount_id, COUNT(*) AS cnt FROM Renting_history GROUP BY discount_id ORDER BY cnt DESC LIMIT 1) AS R ON D.id = R.discount_id
SELECT vehicle_name, powertrain_type FROM (SELECT name AS vehicle_name, Type_of_powertrain AS powertrain_type, id FROM Vehicles) AS Veh JOIN Renting_history ON Veh.id = Renting_history.vehicles_id WHERE Renting_history.total_hours > 30
SELECT Vehicles.name, Vehicles.Type_of_powertrain FROM Vehicles INNER JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id HAVING SUM(Renting_history.total_hours) > 30
SELECT Type_of_powertrain, AVG(Vehicles.City_fuel_economy_rate), AVG(Vehicles.Highway_fuel_economy_rate) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(Vehicles.City_fuel_economy_rate), AVG(Vehicles.Highway_fuel_economy_rate) FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) FROM Student_Loans WHERE amount_of_loan IS NOT NULL
SELECT AVG(amount_of_loan) FROM Student_Loans WHERE amount_of_loan IS NOT NULL
SELECT s.student_id, s.bio_data FROM Students s INNER JOIN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) >= 2) c ON s.student_id = c.student_id LEFT JOIN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(detention_id) >= 2) d ON s.student_id = d.student_id WHERE d.student_id IS NULL
SELECT s.student_id, s.bio_data FROM Students s WHERE EXISTS (SELECT 1 FROM Classes c WHERE c.student_id = s.student_id GROUP BY c.student_id HAVING COUNT(c.class_id) >= 2) OR NOT EXISTS (SELECT 1 FROM Detention d WHERE d.student_id = s.student_id GROUP BY d.student_id HAVING COUNT(d.detention_id) >= 2)
SELECT T.teacher_details FROM Teachers T WHERE EXISTS (SELECT * FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE '%data%') AND NOT EXISTS (SELECT * FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE 'net%')
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%') AND teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans WHERE student_id IS NOT NULL)
SELECT s.bio_data FROM Students s WHERE NOT EXISTS (SELECT * FROM Detention d WHERE d.student_id = s.student_id) AND NOT EXISTS (SELECT * FROM Student_Loans l WHERE l.student_id = s.student_id)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl WHERE sl.student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl INNER JOIN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2) qualified_students ON sl.student_id = qualified_students.student_id
SELECT teacher_details, teacher_id FROM Teachers WHERE teacher_id = (SELECT teacher_id FROM Classes GROUP BY teacher_id HAVING COUNT(class_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(class_id) AS cnt FROM Classes GROUP BY teacher_id) AS sub))
SELECT T.teacher_details, T.teacher_id FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id GROUP BY T.teacher_id ORDER BY COUNT(C.class_id) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT d.detention_summary FROM Detention d
SELECT student_details, address_type_description FROM Students, Students_Addresses, Ref_Address_Types WHERE Students.student_id = Students_Addresses.student_id AND Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT bio_data AS Personal_Details, address_type_description AS Address_Type FROM Students, Students_Addresses, Ref_Address_Types WHERE Students.student_id = Students_Addresses.student_id AND Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT A.address_details, S.bio_data FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Addresses A ON SA.address_id = A.address_id
SELECT bio_data AS Student_Bio, address_details AS Address_Info FROM Students INNER JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id INNER JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id
SELECT bio_data, date_of_transcript FROM Students CROSS JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT bio_data, date_of_transcript FROM Students INNER JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT behaviour_monitoring_details, COUNT(student_id) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(student_id) DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details))
SELECT S.bio_data, S.student_details FROM Students S WHERE S.student_id IN (SELECT BM.student_id FROM Behaviour_Monitoring BM GROUP BY BM.behaviour_monitoring_details HAVING COUNT(BM.behaviour_monitoring_details) = 3 AND BM.behaviour_monitoring_details = (SELECT BM2.behaviour_monitoring_details FROM Behaviour_Monitoring BM2 GROUP BY BM2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT s.bio_data, s.student_details FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(student_id) = 3)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring bm1 WHERE NOT EXISTS (SELECT 1 FROM Behaviour_Monitoring bm2 WHERE bm1.student_id = bm2.student_id AND bm1.behaviour_monitoring_details <> bm2.behaviour_monitoring_details) AND bm1.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT S.bio_data FROM Students S WHERE EXISTS (SELECT 1 FROM Behaviour_Monitoring B WHERE S.student_id = B.student_id GROUP BY B.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT S.bio_data, SE.event_date FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id
SELECT S.bio_data, SE.event_date FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id
SELECT COUNT(DISTINCT SE.student_id), ET.event_type_code, ET.event_type_description FROM Student_Events SE JOIN Ref_Event_Types ET ON SE.event_type_code = ET.event_type_code GROUP BY SE.event_type_code ORDER BY COUNT(DISTINCT SE.student_id) DESC LIMIT 1
SELECT event_type_code, Ref_Event_Types.event_type_description, COUNT(DISTINCT student_id) AS num_students FROM Student_Events NATURAL JOIN Ref_Event_Types GROUP BY event_type_code ORDER BY num_students DESC LIMIT 1
SELECT a.achievement_details, r.achievement_type_description FROM Achievements a, Ref_Achievement_Type r WHERE a.achievement_type_code = r.achievement_type_code
SELECT details.achievement_details, types.achievement_type_description FROM Achievements AS details INNER JOIN Ref_Achievement_Type AS types ON details.achievement_type_code = types.achievement_type_code
SELECT COUNT(DISTINCT T.teacher_id) FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id WHERE NOT EXISTS (SELECT 1 FROM Achievements A WHERE A.student_id = C.student_id)
SELECT COUNT(DISTINCT T.teacher_id) FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id WHERE C.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT date_of_transcript AS TranscriptDate, transcript_details AS Details FROM Transcripts
SELECT date_of_transcript AS Date, transcript_details AS Detail FROM Transcripts
SELECT a.achievement_type_code, a.achievement_details, a.date_achievement FROM Achievements AS a
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements WHERE achievement_type_code IS NOT NULL
SELECT `datetime_detention_start`, `datetime_detention_end` FROM `Detention`
SELECT `datetime_detention_start`, `datetime_detention_end` FROM `Detention`
SELECT S.bio_data FROM Students S WHERE S.student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%' COLLATE SQL_Latin1_General_CP1_CI_AS
SELECT DISTINCT teacher_details, student_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id
SELECT DISTINCT Teachers.teacher_details, Students.student_details FROM Teachers, Students, Classes WHERE Teachers.teacher_id = Classes.teacher_id AND Students.student_id = Classes.student_id
SELECT teacher_id, COUNT(class_id) AS num_courses FROM Classes GROUP BY teacher_id HAVING COUNT(class_id) = (SELECT MAX(course_count) FROM (SELECT COUNT(class_id) AS course_count FROM Classes GROUP BY teacher_id) temp)
SELECT teacher_id, COUNT(*) AS total_courses FROM Classes GROUP BY teacher_id HAVING COUNT(*) = (SELECT MAX(course_count) FROM (SELECT COUNT(*) AS course_count FROM Classes GROUP BY teacher_id) AS subquery);
SELECT student_id, COUNT(class_id) AS num_classes FROM Classes GROUP BY student_id HAVING num_classes = (SELECT MAX(num_classes) FROM (SELECT COUNT(class_id) AS num_classes FROM Classes GROUP BY student_id) AS class_counts)
SELECT student_id, COUNT(class_id) FROM Classes GROUP BY student_id HAVING COUNT(class_id) = (SELECT MAX(course_count) FROM (SELECT student_id, COUNT(class_id) AS course_count FROM Classes GROUP BY student_id) AS subquery)
SELECT S.student_id, S.student_details FROM Students S JOIN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(DISTINCT class_id) = 2) AS C ON S.student_id = C.student_id
SELECT s.student_id, s.student_details FROM Students s JOIN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) = 2) c ON s.student_id = c.student_id
SELECT dt.detention_type_code, dt.detention_type_description FROM Ref_Detention_Type dt LEFT JOIN Detention d ON dt.detention_type_code = d.detention_type_code GROUP BY dt.detention_type_code ORDER BY COUNT(d.detention_id) ASC LIMIT 1
SELECT dt.detention_type_code, dt.detention_type_description FROM Ref_Detention_Type dt LEFT OUTER JOIN Detention d ON dt.detention_type_code = d.detention_type_code GROUP BY dt.detention_type_code ORDER BY COUNT(d.detention_type_code) ASC LIMIT 1
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans SL WHERE SL.amount_of_loan > (SELECT AVG(SL2.amount_of_loan) FROM Student_Loans SL2))
SELECT s.bio_data, s.student_details FROM Students s WHERE s.student_id IN (SELECT sl.student_id FROM Student_Loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) AS EarliestLoanDate FROM Student_Loans
SELECT MIN(date_of_loan) AS EarliestLoanDate FROM Student_Loans
SELECT s.bio_data FROM Students s WHERE EXISTS (SELECT 1 FROM Student_Loans sl WHERE sl.student_id = s.student_id AND sl.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans))
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC LIMIT 1)
SELECT date_of_transcript FROM Transcripts WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans))
SELECT date_of_transcript FROM Transcripts WHERE student_id IN (SELECT student_id FROM Student_Loans GROUP BY student_id ORDER BY SUM(amount_of_loan) DESC LIMIT 1)
SELECT t.teacher_details FROM Teachers t WHERE EXISTS (SELECT 1 FROM Classes c JOIN Transcripts tr ON c.student_id = tr.student_id WHERE t.teacher_id = c.teacher_id AND tr.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts))
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE student_id = (SELECT student_id FROM Transcripts WHERE date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)))
SELECT student_id, SUM(amount_of_loan) AS total_loan FROM Student_Loans GROUP BY student_id
SELECT student_id, SUM(amount_of_loan) AS total_loan FROM Student_Loans GROUP BY student_id
SELECT student_id, bio_data, (SELECT COUNT(*) FROM Classes WHERE Classes.student_id = Students.student_id) AS course_count FROM Students
SELECT student_id, bio_data, (SELECT COUNT(*) FROM Classes WHERE Classes.student_id = Students.student_id) AS course_count FROM Students
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT RAT.address_type_code, RAT.address_type_description FROM Ref_Address_Types RAT, Students_Addresses SA WHERE RAT.address_type_code = SA.address_type_code GROUP BY RAT.address_type_code, RAT.address_type_description HAVING COUNT(SA.address_type_code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Students_Addresses GROUP BY address_type_code) AS SubQuery)
SELECT address_type_code, address_type_description FROM Ref_Address_Types WHERE address_type_code = (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa JOIN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(*) = 2) t ON sa.student_id = t.student_id
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa JOIN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(*) = 2) t ON sa.student_id = t.student_id
SELECT datetime_detention_start FROM Detention ORDER BY datetime_detention_start
SELECT datetime_detention_start FROM Detention
SELECT Name AS `Author's Name` FROM Author
SELECT a.Name FROM Author a
SELECT Name, Address FROM Client WHERE Address IS NOT NULL
SELECT Name, Address FROM Client WHERE 1=1
SELECT Book.Title, Book.ISBN, Book.SalePrice FROM Book
SELECT Book.Title, Book.ISBN, Book.SalePrice FROM Book
SELECT COUNT(*) FROM (SELECT ISBN FROM Book) AS Total
SELECT COUNT(*) FROM Book
SELECT COUNT(*) FROM Author WHERE idAuthor IS NOT NULL
SELECT COUNT(*) FROM (SELECT * FROM Author) AS AllAuthors
SELECT COUNT(IdClient) AS TotalClients FROM Client
SELECT COUNT(IdClient) AS TotalClients FROM Client
SELECT `Name`, `Address` FROM `Client` ORDER BY `Name`
SELECT Name, Address FROM Client ORDER BY Name ASC, IdClient ASC
SELECT Book.Title, Author.Name FROM Book INNER JOIN Author_Book ON Book.ISBN = Author_Book.ISBN INNER JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT Book.Title, Author.Name FROM Book INNER JOIN Author_Book ON Book.ISBN = Author_Book.ISBN INNER JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT o.IdOrder, c.Name FROM Orders o JOIN Client c ON o.IdClient = c.IdClient
SELECT o.IdOrder, c.Name FROM Orders o INNER JOIN Client c ON o.IdClient = c.IdClient
SELECT a.Name, COUNT(ab.ISBN) AS BooksCount FROM Author a LEFT OUTER JOIN Author_Book ab ON a.idAuthor = ab.Author GROUP BY a.idAuthor
SELECT Name, COUNT(ISBN) FROM Author LEFT JOIN Author_Book ON Author.idAuthor = Author_Book.Author GROUP BY Author.idAuthor
SELECT b.ISBN, COUNT(o.IdOrder) AS order_count FROM Book b LEFT JOIN Books_Order bo ON b.ISBN = bo.ISBN LEFT JOIN Orders o ON bo.IdOrder = o.IdOrder GROUP BY b.ISBN
SELECT b.ISBN, COUNT(o.ISBN) FROM Book b LEFT OUTER JOIN Books_Order o ON b.ISBN = o.ISBN GROUP BY b.ISBN
SELECT bo.ISBN, SUM(bo.amount) FROM Books_Order bo GROUP BY bo.ISBN
SELECT bo.ISBN, SUM(bo.amount) FROM Books_Order bo GROUP BY bo.ISBN
SELECT B.Title FROM Book AS B, Books_Order AS O WHERE B.ISBN = O.ISBN GROUP BY B.ISBN ORDER BY COUNT(O.ISBN) DESC LIMIT 1
SELECT B.Title FROM Book B WHERE EXISTS (SELECT 1 FROM Books_Order BO WHERE B.ISBN = BO.ISBN GROUP BY BO.ISBN HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Books_Order GROUP BY ISBN) AS Sub))
SELECT Book.Title, Book.PurchasePrice FROM Book INNER JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT Book.Title, Book.PurchasePrice FROM Book INNER JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT Title FROM Book B WHERE EXISTS (SELECT 1 FROM Books_Order BO WHERE B.ISBN = BO.ISBN)
SELECT DISTINCT b.Title FROM Book b, Books_Order o WHERE b.ISBN = o.ISBN
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders)
SELECT DISTINCT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient
SELECT Name, COUNT(IdOrder) AS OrderTotal FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Client.Name, COUNT(Orders.IdOrder) FROM Client LEFT OUTER JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders GROUP BY IdClient HAVING COUNT(IdOrder) = (SELECT MAX(Cnt) FROM (SELECT COUNT(IdOrder) AS Cnt FROM Orders GROUP BY IdClient) AS Sub))
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM (SELECT IdClient, COUNT(*) AS OrderCount FROM Orders GROUP BY IdClient ORDER BY OrderCount DESC LIMIT 1) AS MostOrders)
SELECT Client.Name, TOTAL(Books_Order.amount) FROM Client JOIN Orders ON Client.IdClient = Orders.IdClient JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.IdClient
SELECT Name, TotalAmount FROM Client C LEFT JOIN (SELECT IdClient, SUM(amount) AS TotalAmount FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient) AS SubQuery ON C.IdClient = SubQuery.IdClient
SELECT (SELECT Name FROM Client WHERE IdClient = sub.IdClient) AS ClientName FROM (SELECT IdClient FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient ORDER BY SUM(amount) DESC LIMIT 1) sub
SELECT (SELECT Name FROM Client WHERE IdClient = o.IdClient) AS ClientName FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder GROUP BY o.IdClient ORDER BY SUM(bo.amount) DESC LIMIT 1
SELECT B.Title FROM Book B LEFT OUTER JOIN Books_Order BO ON B.ISBN = BO.ISBN WHERE BO.ISBN IS NULL
SELECT Title FROM Book AS b WHERE NOT EXISTS (SELECT ISBN FROM Books_Order AS bo WHERE bo.ISBN = b.ISBN)
SELECT Client.Name FROM Client LEFT OUTER JOIN Orders ON Client.IdClient = Orders.IdClient WHERE Orders.IdOrder IS NULL
SELECT Name FROM Client AS c WHERE NOT EXISTS (SELECT NULL FROM Orders AS o WHERE o.IdClient = c.IdClient)
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT AVG(b.PurchasePrice), AVG(b.SalePrice) FROM Book AS b
SELECT AVG(b.PurchasePrice), AVG(b.SalePrice) FROM Book AS b
SELECT MAX(diff) FROM (SELECT SalePrice - PurchasePrice AS diff FROM Book) AS PriceDifferences
SELECT MAX(Book.SalePrice - Book.PurchasePrice) AS LargestPriceDifference FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book AS B)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book AS B)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book WHERE SalePrice >= 0)
SELECT book.Title FROM Book book WHERE book.SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT B.Title FROM Book B WHERE B.PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT B.Title FROM Book B WHERE B.PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(SalePrice) FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'George Orwell'))
SELECT AVG(SalePrice) FROM Book b WHERE EXISTS (SELECT 1 FROM Author_Book ab JOIN Author a ON ab.Author = a.idAuthor WHERE ab.ISBN = b.ISBN AND a.Name = 'George Orwell')
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'Plato'))
SELECT B.SalePrice FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato'
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author = (SELECT idAuthor FROM Author WHERE Name = 'George Orwell')) ORDER BY SalePrice ASC LIMIT 1
SELECT Title FROM Book INNER JOIN Author_Book ON Book.ISBN = Author_Book.ISBN INNER JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell' ORDER BY Book.SalePrice ASC LIMIT 1
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato') AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'Plato') AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Name FROM Author WHERE idAuthor = (SELECT Author FROM Book WHERE Title LIKE 'Pride and Prejudice')
SELECT a.Name FROM Author a WHERE EXISTS (SELECT 1 FROM Book b WHERE b.Author = a.idAuthor AND b.Title = 'Pride and Prejudice')
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name LIKE '%Plato%'))
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name LIKE '%Plato%'))
SELECT COUNT(DISTINCT bo.IdOrder) FROM Books_Order bo JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice'
SELECT COUNT(DISTINCT Books_Order.IdOrder) FROM Books_Order, Book WHERE Books_Order.ISBN = Book.ISBN AND Book.Title = 'Pride and Prejudice'
SELECT o.IdOrder FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice' INTERSECT SELECT o.IdOrder FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'The Little Prince'
SELECT o.IdOrder FROM Orders o WHERE EXISTS (SELECT * FROM Books_Order bo INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice' AND bo.IdOrder = o.IdOrder) AND EXISTS (SELECT * FROM Books_Order bo INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'The Little Prince' AND bo.IdOrder = o.IdOrder)
SELECT b.ISBN FROM Books_Order b JOIN Orders o ON b.IdOrder = o.IdOrder JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name IN ('Peter Doe', 'James Smith') GROUP BY b.ISBN HAVING COUNT(DISTINCT c.Name) = 2
SELECT DISTINCT b.ISBN FROM Books_Order b INNER JOIN Orders o ON b.IdOrder = o.IdOrder INNER JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'Peter Doe' OR c.Name = 'James Smith' GROUP BY b.ISBN HAVING COUNT(DISTINCT c.Name) = 2
SELECT DISTINCT b.Title FROM Book b, Books_Order bo, Orders o, Client c WHERE b.ISBN = bo.ISBN AND bo.IdOrder = o.IdOrder AND o.IdClient = c.IdClient AND c.Name = 'Peter Doe' AND NOT EXISTS (SELECT * FROM Books_Order bo, Orders o, Client c WHERE bo.ISBN = b.ISBN AND bo.IdOrder = o.IdOrder AND o.IdClient = c.IdClient AND c.Name = 'James Smith')
SELECT B.Title FROM Book B WHERE EXISTS (SELECT 1 FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' AND B.ISBN = BO.ISBN) AND NOT EXISTS (SELECT 1 FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith' AND B.ISBN = BO.ISBN)
SELECT c.Name FROM Client c WHERE c.IdClient IN (SELECT o.IdClient FROM Orders o WHERE EXISTS (SELECT 1 FROM Books_Order bo JOIN Book b ON bo.ISBN = b.ISBN WHERE bo.IdOrder = o.IdOrder AND b.Title = 'Pride and Prejudice'))
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN = (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')))
SELECT COUNT(*) AS TotalBooks FROM book
SELECT Title FROM book ORDER BY LOWER(Title) ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT b.Type, b.Release FROM book AS b
SELECT Type AS BookType, MAX(Chapters) AS MaximumChapters, MIN(Chapters) AS MinimumChapters FROM book GROUP BY Type
SELECT Title FROM book WHERE Type IS NOT 'Poet'
SELECT AVG(Rating) FROM review WHERE Rating > 0
SELECT Title, Rating FROM book, review WHERE book.Book_ID = review.Book_ID
SELECT r.Rating FROM review r INNER JOIN book b ON r.Book_ID = b.Book_ID WHERE b.Chapters = (SELECT MAX(Chapters) FROM book)
SELECT r.Rank FROM review r, book b WHERE r.Book_ID = b.Book_ID ORDER BY b.Pages LIMIT 1
SELECT b.Title FROM book b WHERE EXISTS (SELECT 1 FROM review r WHERE r.Book_ID = b.Book_ID AND r.Rank = (SELECT MAX(Rank) FROM review))
SELECT AVG(Readers_in_Million) FROM review INNER JOIN book ON review.Book_ID = book.Book_ID WHERE Type = 'Novel'
SELECT Type, COUNT(*) FROM book GROUP BY Type
SELECT b.Type FROM book b GROUP BY b.Type HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM book GROUP BY Type) AS subquery)
SELECT b.Type FROM book b GROUP BY b.Type HAVING COUNT(b.Book_ID) >= 3
SELECT Title FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Rating
SELECT Title, Audio FROM book b INNER JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Readers_in_Million DESC
SELECT count(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT Type FROM (SELECT Type, MAX(Chapters) AS MaxChapters, MIN(Chapters) AS MinChapters FROM book GROUP BY Type) WHERE MaxChapters > 75 AND MinChapters < 50
SELECT COUNT(DISTINCT book.`Type`) FROM `book`
SELECT b.Type, b.Title FROM book b LEFT JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Book_ID IS NULL
SELECT count(*) FROM customer
SELECT count(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT customer.Name FROM customer ORDER BY customer.Level_of_Membership
SELECT customer.Nationality AS Nationality, customer.Card_Credit AS Card_Credit FROM customer
SELECT c.Nationality, c.Card_Credit FROM customer c
SELECT Name FROM customer WHERE Nationality = 'Australia' OR Nationality = 'England'
SELECT customer.Name FROM customer WHERE customer.Nationality = 'England' OR customer.Nationality = 'Australia'
SELECT AVG(Card_Credit) AS AverageCredit FROM customer WHERE Level_of_Membership > 1
SELECT AVG(Card_Credit) AS AverageCredit FROM customer WHERE Level_of_Membership > 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1 OFFSET 0
SELECT c.Card_Credit FROM customer c WHERE c.Level_of_Membership IN (SELECT MAX(Level_of_Membership) FROM customer)
SELECT Nationality, COUNT(Customer_ID) AS NumberOfCustomers FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(Customer_ID) AS NumberOfCustomers FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT Nationality, COUNT(*) AS Count FROM customer GROUP BY Nationality) AS subquery)
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM customer GROUP BY Nationality) AS Counts)
SELECT c.Nationality FROM customer c WHERE c.Card_Credit < 50 INTERSECT SELECT c.Nationality FROM customer c WHERE c.Card_Credit > 75
SELECT Nationality FROM customer WHERE Card_Credit > 50 AND Nationality IN (SELECT Nationality FROM customer WHERE Card_Credit < 75)
SELECT `Name`, `Dish_Name` FROM `customer` JOIN `customer_order` ON `customer`.`Customer_ID` = `customer_order`.`Customer_ID`
SELECT cust.Name AS CustomerName, ord.Dish_Name AS DishName FROM customer AS cust JOIN customer_order AS ord ON cust.Customer_ID = ord.Customer_ID
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, SUM(co.Quantity) AS TotalOrdered FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID GROUP BY c.Name
SELECT Name, SUM(Quantity) AS Total_Quantity FROM customer c INNER JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Name
SELECT Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING SUM(Quantity) > 1
SELECT c.Name FROM customer c WHERE EXISTS (SELECT 1 FROM customer_order co WHERE co.Customer_ID = c.Customer_ID GROUP BY co.Customer_ID HAVING SUM(co.Quantity) > 1)
SELECT DISTINCT Manager AS DistinctManagers FROM branch
SELECT DISTINCT Manager AS DistinctManagers FROM branch
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT DISTINCT Customer_ID FROM customer_order)
SELECT Name FROM customer WHERE NOT EXISTS (SELECT 1 FROM customer_order WHERE customer.Customer_ID = customer_order.Customer_ID)
SELECT count(*) FROM member
SELECT member.Name FROM member ORDER BY member.Age ASC
SELECT `Name`, `Nationality` FROM `member`
SELECT Name FROM member WHERE Nationality NOT IN ('England')
SELECT `Name` FROM `member` WHERE `Age` = 19 OR `Age` = 20
SELECT Name FROM member WHERE Age IN (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(Member_ID) AS members_count FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM member GROUP BY Nationality) AS Counts)
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT Name AS Leader, Club_Name AS Club FROM member JOIN club_leader ON member.Member_ID = club_leader.Member_ID JOIN club ON club_leader.Club_ID = club.Club_ID
SELECT member.Name FROM member INNER JOIN club_leader ON member.Member_ID = club_leader.Member_ID INNER JOIN club ON club_leader.Club_ID = club.Club_ID WHERE club.Overall_Ranking > 100
SELECT m.Name FROM member AS m JOIN club_leader AS cl ON m.Member_ID = cl.Member_ID WHERE cl.Year_Join < 2018
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Club_Name = 'Houston'
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member GROUP BY Nationality HAVING MAX(Age) > 22 AND MIN(Age) < 19
SELECT AVG(Age) FROM member WHERE EXISTS (SELECT 1 FROM club_leader WHERE club_leader.Member_ID = member.Member_ID)
SELECT c.Club_Name FROM club c WHERE c.Club_Name LIKE '%state%'
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_Name IS NOT NULL
SELECT Collection_Subset_Name FROM Collection_Subsets;
SELECT Collection_Subsets.Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT C.Collection_Description FROM Collections C WHERE C.Collection_ID IN (SELECT CSM.Collection_ID FROM Collection_Subset_Members CSM JOIN Collection_Subsets CS ON CSM.Collection_Subset_ID = CS.Collection_Subset_ID WHERE CS.Collection_Subset_Name = 'Top collection')
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IS NOT NULL;
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IS NOT NULL
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin' AND Document_Object_ID IS NOT NULL
SELECT d.Owner FROM Document_Objects d WHERE d.Description LIKE 'Braeden Collection'
SELECT d.Owner FROM Document_Objects d WHERE d.Description LIKE 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT DISTINCT d.Description FROM Document_Objects d, Document_Objects p WHERE d.Parent_Document_Object_ID = p.Document_Object_ID
SELECT DISTINCT Description FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT COUNT(DISTINCT Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(DISTINCT Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID <> Document_Object_ID
SELECT d.Parent_Document_Object_ID, COUNT(d.Document_Object_ID) AS NumberOfChildren FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID
SELECT Parent_Document_Object_ID, COUNT(*) AS ChildCount FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING Parent_Document_Object_ID IS NOT NULL
SELECT collection_name FROM collections;
SELECT collection_name FROM collections
SELECT c.Collection_Description FROM Collections c WHERE c.Collection_Name = 'Best'
SELECT c.Collection_Description FROM Collections c WHERE c.Collection_Name = 'Best'
SELECT c.Collection_Name FROM Collections c, Collections p WHERE c.Collection_ID = p.Parent_Collection_ID AND p.Collection_Name = 'Nice'
SELECT p.Collection_Name FROM Collections p INNER JOIN Collections c ON p.Collection_ID = c.Parent_Collection_ID WHERE c.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT DISTINCT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT DISTINCT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT d.Parent_Document_Object_ID FROM Document_Objects AS d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID HAVING COUNT(d.Document_Object_ID) > 1
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Collection_ID != Parent_Collection_ID
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Collection_ID != Parent_Collection_ID
SELECT DISTINCT Related_Document_Object_ID FROM Document_Subset_Members, Document_Objects WHERE Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID AND Document_Objects.Owner = 'Ransom'
SELECT Related_Document_Object_ID FROM Document_Objects AS DO INNER JOIN Document_Subset_Members AS DSM ON DO.Document_Object_ID = DSM.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT a.Collection_Subset_ID, a.Collection_Subset_Name, COUNT(b.Collection_ID) FROM Collection_Subsets a LEFT JOIN Collection_Subset_Members b ON a.Collection_Subset_ID = b.Collection_Subset_ID GROUP BY a.Collection_Subset_ID
SELECT a.Collection_Subset_ID, a.Collection_Subset_Name, COUNT(b.Collection_ID) FROM Collection_Subsets a LEFT JOIN Collection_Subset_Members b ON a.Collection_Subset_ID = b.Collection_Subset_ID GROUP BY a.Collection_Subset_ID
SELECT Parent_Document_Object_ID, COUNT(*) AS Child_Count FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID ORDER BY Child_Count DESC LIMIT 1
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS ChildrenCount FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Total_Related FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY Total_Related ASC LIMIT 1
SELECT d.Document_Object_ID FROM Document_Objects d LEFT OUTER JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID ORDER BY COUNT(dc.Document_Object_ID) ASC LIMIT 1
SELECT d.Document_Object_ID, COUNT(d.Related_Document_Object_ID) AS Num_Related_Documents FROM Document_Subset_Members d GROUP BY d.Document_Object_ID HAVING Num_Related_Documents >= 2 AND Num_Related_Documents <= 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Related_Count BETWEEN 2 AND 4
SELECT DISTINCT d.Owner FROM Document_Objects d WHERE d.Document_Object_ID IN (SELECT dsm.Related_Document_Object_ID FROM Document_Subset_Members dsm JOIN Document_Objects d2 ON dsm.Document_Object_ID = d2.Document_Object_ID WHERE d2.Owner = 'Braeden')
SELECT DISTINCT d.Owner FROM Document_Objects d INNER JOIN Document_Subset_Members ds ON d.Document_Object_ID = ds.Related_Document_Object_ID WHERE EXISTS (SELECT 1 FROM Document_Objects d2 WHERE d2.Owner = 'Braeden' AND d2.Document_Object_ID = ds.Document_Object_ID)
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds INNER JOIN Document_Objects do ON ds.Document_Subset_ID = do.Document_Object_ID AND do.Owner = 'Braeden'
SELECT ds.Document_Subset_ID, ds.Document_Subset_Name, COUNT(DISTINCT dsm.Document_Object_ID) FROM Document_Subsets ds LEFT JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID GROUP BY ds.Document_Subset_ID, ds.Document_Subset_Name
SELECT Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name, COUNT(DISTINCT Document_Subset_Members.Document_Object_ID) FROM Document_Subsets LEFT JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subsets.Document_Subset_ID
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS DocumentCount FROM Document_Subsets DS LEFT OUTER JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY DocumentCount DESC LIMIT 1
SELECT d.Document_Subset_ID, d.Document_Subset_Name, COUNT(DISTINCT m.Document_Object_ID) AS Total_Documents FROM Document_Subsets d JOIN Document_Subset_Members m ON d.Document_Subset_ID = m.Document_Subset_ID GROUP BY d.Document_Subset_ID ORDER BY Total_Documents DESC LIMIT 1
SELECT dsm.Document_Object_ID FROM Document_Subset_Members dsm, Document_Subsets ds WHERE dsm.Document_Subset_ID = ds.Document_Subset_ID AND ds.Document_Subset_Name = 'Best for 2000'
SELECT dsm.Document_Object_ID FROM Document_Subset_Members dsm, Document_Subsets ds WHERE dsm.Document_Subset_ID = ds.Document_Subset_ID AND ds.Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Name, Document_Object_ID FROM Document_Subsets, Document_Subset_Members WHERE Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID
SELECT d.Document_Object_ID, ds.Document_Subset_Name FROM Document_Objects d, Document_Subset_Members dsm, Document_Subsets ds WHERE d.Document_Object_ID = dsm.Document_Object_ID AND dsm.Document_Subset_ID = ds.Document_Subset_ID
SELECT c.Collection_Name FROM Collections c WHERE c.Collection_ID IN (SELECT dc.Collection_ID FROM Documents_in_Collections dc WHERE dc.Document_Object_ID IN (SELECT do.Document_Object_ID FROM Document_Objects do WHERE do.Owner = 'Ransom'))
SELECT Collection_Name FROM Collections WHERE EXISTS (SELECT 1 FROM Documents_in_Collections JOIN Document_Objects ON Documents_in_Collections.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Collections.Collection_ID = Documents_in_Collections.Collection_ID AND Document_Objects.Owner = 'Ransom')
SELECT COUNT(Collection_ID) AS TotalCollections, Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT d.Document_Object_ID, COUNT(d.Collection_ID) AS CollectionCount FROM Documents_in_Collections d GROUP BY d.Document_Object_ID
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collection_Name = 'Best';
SELECT COUNT(*) FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collection_Name = 'Best')
SELECT Collection_Name, Collection_ID, COUNT(Document_Object_ID) AS DocumentCount FROM Collections JOIN Documents_in_Collections USING(Collection_ID) GROUP BY Collection_ID, Collection_Name ORDER BY DocumentCount DESC LIMIT 1
SELECT C.Collection_ID, C.Collection_Name, COUNT(DIC.Document_Object_ID) AS Document_Count FROM Collections C LEFT OUTER JOIN Documents_in_Collections DIC ON C.Collection_ID = DIC.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID ORDER BY Document_Count DESC LIMIT 1
SELECT DISTINCT D.Document_Object_ID FROM Document_Objects D, Documents_in_Collections DC, Collections C, Document_Subset_Members DSM, Document_Subsets DS WHERE D.Document_Object_ID = DC.Document_Object_ID AND DC.Collection_ID = C.Collection_ID AND D.Document_Object_ID = DSM.Document_Object_ID AND DSM.Document_Subset_ID = DS.Document_Subset_ID AND DS.Document_Subset_Name = 'Best for 2000' AND C.Collection_Name = 'Best'
SELECT DISTINCT d.Document_Object_ID FROM Document_Objects d JOIN Document_Subset_Members dsm ON d.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000' INTERSECT SELECT d.Document_Object_ID FROM Document_Objects d JOIN Documents_in_Collections dic ON d.Document_Object_ID = dic.Document_Object_ID JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT d.Document_Object_ID FROM Documents_in_Collections d JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT ds.Document_Object_ID FROM Document_Subset_Members ds JOIN Document_Subsets dss ON ds.Document_Subset_ID = dss.Document_Subset_ID WHERE dss.Document_Subset_Name = 'Best for 2000')
SELECT d.Document_Object_ID FROM Documents_in_Collections d, Collections c WHERE d.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT ds.Document_Object_ID FROM Document_Subset_Members ds, Document_Subsets dsu WHERE ds.Document_Subset_ID = dsu.Document_Subset_ID AND dsu.Document_Subset_Name = 'Best for 2000')
SELECT d.Document_Object_ID FROM Document_Objects d WHERE EXISTS (SELECT 1 FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE dm.Document_Object_ID = d.Document_Object_ID AND ds.Document_Subset_Name = 'Best for 2000') OR EXISTS (SELECT 1 FROM Documents_in_Collections dc JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE dc.Document_Object_ID = d.Document_Object_ID AND c.Collection_Name = 'Best')
SELECT DISTINCT d.Document_Object_ID FROM Document_Objects d JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID JOIN Collections c ON dc.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' UNION SELECT d.Document_Object_ID FROM Document_Objects d JOIN Document_Subset_Members dsm ON d.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000'
SELECT C2.Collection_Name FROM Collections C1 JOIN Collection_Subset_Members CSM ON C1.Collection_ID = CSM.Collection_ID JOIN Collections C2 ON CSM.Related_Collection_ID = C2.Collection_ID WHERE C1.Collection_Name = 'Best'
SELECT C.Collection_Name FROM Collections C JOIN Collection_Subset_Members CSM ON C.Collection_ID = CSM.Related_Collection_ID JOIN Collections C2 ON CSM.Collection_ID = C2.Collection_ID WHERE C2.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collections c LEFT JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members, Collections WHERE Collection_Subset_Members.Collection_ID = Collections.Collection_ID AND Collections.Collection_Name = 'Best'
SELECT CS.Collection_Subset_Name FROM Collection_Subsets CS JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID JOIN Collections C ON CSM.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subset_Members JOIN Collections ON Collection_Subset_Members.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best')
SELECT COUNT(name) FROM songs WHERE name LIKE '%Love%'
SELECT `name` FROM `songs` ORDER BY `name` ASC
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality) AS MaximumQuality, MIN(voice_sound_quality) AS MinimumQuality FROM performance_score
SELECT voice_sound_quality, rhythm_tempo, stage_presence FROM performance_score JOIN participants ON performance_score.participant_id = participants.id WHERE participants.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name IS NOT 'Love'
SELECT songs.name, songs.original_artist FROM songs WHERE songs.english_translation LIKE 'All the streets of love'
SELECT DISTINCT stage_presence FROM performance_score INNER JOIN songs ON performance_score.songs_id = songs.id AND songs.language = 'English'
SELECT DISTINCT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id, p.name HAVING COUNT(*) > 1
SELECT participants.id, participants.name, participants.popularity FROM participants, performance_score WHERE participants.id = performance_score.participant_id GROUP BY participants.id ORDER BY COUNT(performance_score.songs_id) DESC
SELECT id, name FROM participants WHERE id IN (SELECT participant_id FROM performance_score WHERE voice_sound_quality = 5 OR rhythm_tempo = 5)
SELECT voice_sound_quality FROM performance_score AS p JOIN songs AS s ON p.songs_id = s.id WHERE s.name = 'The Balkan Girls' AND s.language = 'English'
SELECT s.id, s.name FROM songs s, performance_score ps WHERE s.id = ps.songs_id GROUP BY s.id, s.name HAVING COUNT(ps.participant_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(participant_id) AS cnt FROM performance_score GROUP BY songs_id) t)
SELECT COUNT(*) AS total FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT count(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT language, AVG(rhythm_tempo) AS AverageRhythmTempo FROM songs LEFT JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY language
SELECT DISTINCT participants.name FROM participants, songs WHERE participants.id = songs.original_artist AND songs.language = 'English'
SELECT p.name, p.popularity FROM participants p WHERE EXISTS (SELECT ps.participant_id FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'Croatian' AND ps.participant_id = p.id GROUP BY ps.participant_id) AND EXISTS (SELECT ps.participant_id FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English' AND ps.participant_id = p.id GROUP BY ps.participant_id)
SELECT name FROM songs WHERE INSTR(name, 'Is') > 0
SELECT s.original_artist FROM songs s INNER JOIN performance_score ps ON s.id = ps.songs_id AND ps.rhythm_tempo > 5 ORDER BY ps.voice_sound_quality DESC
SELECT COUNT(city_name) FROM City
SELECT COUNT(city_name) FROM City
SELECT state FROM City WHERE state IS NOT NULL GROUP BY state
SELECT DISTINCT C.state FROM City C
SELECT COUNT(DISTINCT C.country) FROM City C
SELECT COUNT(*) FROM (SELECT country FROM City GROUP BY country HAVING COUNT(*) >= 1)
SELECT city_name, city_code, state, country FROM City GROUP BY city_code
SELECT city_name, city_code, state, country FROM City GROUP BY city_code
SELECT c.latitude, c.longitude FROM City c WHERE c.city_name = 'Baltimore'
SELECT c.latitude, c.longitude FROM City c WHERE c.city_name = 'Baltimore'
SELECT city_name FROM City WHERE state LIKE 'PA'
SELECT city_name FROM City WHERE state LIKE 'PA'
SELECT COUNT(*) FROM City WHERE LOWER(country) = 'canada'
SELECT COUNT(city_code) FROM City WHERE country = UPPER('canada')
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude ASC
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude ASC
SELECT state, COUNT(city_code) AS NumberOfCities FROM City GROUP BY state
SELECT state AS StateName, COUNT(*) AS TotalCities FROM City GROUP BY state
SELECT country, COUNT(*) AS number_of_cities FROM City GROUP BY country
SELECT COUNT(city_name), country FROM City GROUP BY country
SELECT C.state FROM City C GROUP BY C.state HAVING COUNT(*) >= 2
SELECT C.state FROM City C GROUP BY C.state HAVING COUNT(*) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) = (SELECT MAX(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY state) AS Temp)
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) = (SELECT MAX(cnt) FROM (SELECT COUNT(city_code) AS cnt FROM City GROUP BY state) AS subquery)
SELECT country FROM City GROUP BY country HAVING COUNT(city_code) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_code) AS city_count FROM City GROUP BY country))
SELECT country FROM City GROUP BY country HAVING COUNT(city_code) = (SELECT MIN(city_count) FROM (SELECT country, COUNT(city_code) AS city_count FROM City GROUP BY country) AS CountryCounts)
SELECT Fname, Lname FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT Fname || ' ' || LName AS full_name FROM Student s JOIN City c ON s.city_code = c.city_code WHERE c.state = 'MD'
SELECT COUNT(*) FROM Student s INNER JOIN City c ON s.city_code = c.city_code WHERE c.country LIKE 'China'
SELECT COUNT(*) FROM Student s INNER JOIN City c ON s.city_code = c.city_code WHERE c.country = 'China'
SELECT Fname, Major FROM Student LEFT JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT Fname, Major FROM Student s JOIN City c ON s.city_code = c.city_code WHERE c.city_name LIKE 'Baltimore'
SELECT country, COUNT(StuID) FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country
SELECT country, COUNT(StuID) FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country
SELECT S.city_code, COUNT(S.StuID) AS total_students FROM Student S GROUP BY S.city_code
SELECT S.city_code, COUNT(*) FROM Student S GROUP BY S.city_code
SELECT state FROM (SELECT city_code FROM Student GROUP BY city_code ORDER BY COUNT(*) DESC LIMIT 1) AS MostCity JOIN City ON MostCity.city_code = City.city_code
SELECT state FROM (SELECT city_code FROM Student GROUP BY city_code ORDER BY COUNT(*) DESC LIMIT 1) AS MostCity JOIN City ON MostCity.city_code = City.city_code
SELECT country FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country HAVING COUNT(StuID) = (SELECT MIN(student_count) FROM (SELECT COUNT(StuID) AS student_count FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country))
SELECT country FROM (SELECT country, COUNT(*) AS num_students FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country) AS CountryCount ORDER BY num_students ASC LIMIT 1
SELECT c.city_name FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY c.city_name, c.city_code HAVING COUNT(*) >= 3
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT City.state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY City.state HAVING COUNT(Student.StuID) > 5
SELECT state FROM City INNER JOIN Student ON City.city_code = Student.city_code GROUP BY City.state HAVING COUNT(Student.StuID) > 5
SELECT StuID FROM Student AS S JOIN City AS C ON S.city_code = C.city_code WHERE C.country NOT LIKE 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA'
SELECT s.StuID FROM Student s, City c WHERE s.city_code = c.city_code AND s.Sex = 'F' AND c.state = 'PA'
SELECT s.StuID FROM Student s JOIN City c ON s.city_code = c.city_code WHERE s.Sex = 'F' AND c.state = 'PA'
SELECT StuID FROM Student AS s JOIN City AS c ON s.city_code = c.city_code WHERE s.Sex = 'M' AND c.country <> 'USA'
SELECT StuID FROM Student AS s JOIN City AS c ON s.city_code = c.city_code WHERE s.Sex = 'M' AND c.country <> 'USA'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') OR (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT d.distance FROM Direct_distance d WHERE d.city1_code = 'BAL' AND d.city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'NWK') OR (city1_code = 'NWK' AND city2_code = 'BOS')
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'NWK') OR (city1_code = 'NWK' AND city2_code = 'BOS')
SELECT MIN(distance) MinDist, MAX(distance) MaxDist, AVG(distance) AvgDist FROM Direct_distance
SELECT AVG(Direct_distance.distance), MIN(Direct_distance.distance), MAX(Direct_distance.distance) FROM Direct_distance
SELECT d.city1_code, d.city2_code FROM Direct_distance d WHERE d.distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT d.city1_code, d.city2_code FROM Direct_distance d WHERE d.distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT D.city1_code, D.city2_code FROM Direct_distance AS D WHERE D.distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT DISTINCT city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT D.city1_code, D.city2_code FROM Direct_distance D WHERE D.distance < 1000
SELECT city1_code FROM Direct_distance WHERE distance < 1000 UNION SELECT city2_code FROM Direct_distance WHERE distance < 1000
SELECT sum(distance) FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code != 'BAL'
SELECT SUM(DISTINCT distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(d.distance) AS Average_Distance FROM Direct_distance d INNER JOIN City c ON d.city1_code = c.city_code WHERE c.city_name = 'Boston'
SELECT C.city_name FROM City C WHERE C.city_code = (SELECT D.city2_code FROM Direct_distance D WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY D.distance LIMIT 1)
SELECT C.city_name FROM City C INNER JOIN (SELECT city2_code, distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago')) AS D ON C.city_code = D.city2_code ORDER BY D.distance LIMIT 1
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance, City WHERE City.city_name = 'Boston' AND City.city_code = Direct_distance.city1_code ORDER BY distance DESC LIMIT 1)
SELECT city2_code AS city_code, SUM(distance) AS total_distance FROM Direct_distance GROUP BY city2_code
SELECT city1_code AS CityCode, SUM(distance) AS TotalDistance FROM Direct_distance GROUP BY CityCode
SELECT city_name, AVG(distance) FROM City LEFT JOIN Direct_distance ON city_code = city1_code GROUP BY city_name
SELECT C.city_name, AVG(D.distance) FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND Lname = 'Smith') AND city2_code = (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND Lname = 'Kim')
SELECT d.distance FROM Direct_distance d, Student s1, Student s2 WHERE d.city1_code = s1.city_code AND d.city2_code = s2.city_code AND s1.LName = 'Smith' AND s1.Fname = 'Linda' AND s2.LName = 'Kim' AND s2.Fname = 'Tracy'
SELECT S.Fname, S.LName FROM Student S JOIN City C1 ON S.city_code = C1.city_code CROSS JOIN City C2 WHERE C2.city_name = 'Linda Smith' ORDER BY (C1.latitude - C2.latitude)*(C1.latitude - C2.latitude) + (C1.longitude - C2.longitude)*(C1.longitude - C2.longitude) DESC LIMIT 1
SELECT Fname || ' ' || LName AS FullName FROM Student WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') ORDER BY distance DESC LIMIT 1)
SELECT state FROM City WHERE city_code IN (SELECT city_code FROM Student WHERE Fname = 'Linda')
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code WHERE S.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT * FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE Sailors.age < 30
SELECT name AS SailorName, age AS SailorAge FROM Sailors WHERE age < 30
SELECT DISTINCT Boats.bid, Boats.name FROM Boats, Reserves WHERE Boats.bid = Reserves.bid AND Reserves.sid = 1
SELECT DISTINCT R.bid FROM Reserves AS R WHERE R.sid = 1
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid AND bid = 102)
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid AND bid = 102)
SELECT bid FROM Reserves GROUP BY bid
SELECT bid FROM Reserves GROUP BY bid
SELECT Sailors.name FROM Sailors WHERE Sailors.name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%' AND name IS NOT NULL
SELECT sid FROM Sailors s1 WHERE NOT EXISTS (SELECT NULL FROM Sailors s2 WHERE s2.age > s1.age)
SELECT sid FROM Sailors WHERE age != (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age > (SELECT MAX(age) FROM Sailors WHERE rating > 7)
SELECT DISTINCT name FROM Sailors AS S1 WHERE EXISTS (SELECT 1 FROM Sailors AS S2 WHERE S2.rating > 7 AND S1.age > S2.age)
SELECT name, sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves GROUP BY sid HAVING COUNT(*) >= 1)
SELECT DISTINCT sid, name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid)
SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) > 1
SELECT DISTINCT S.name FROM Sailors S, Reserves R WHERE S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) >= 2
SELECT DISTINCT r.sid FROM Reserves r, Boats b WHERE r.bid = b.bid AND b.color IN ('red', 'blue')
SELECT DISTINCT R.sid FROM Reserves R INNER JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue')
SELECT sid, name FROM Sailors WHERE sid IN (SELECT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' OR Boats.color = 'blue')
SELECT DISTINCT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT r.sid FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' INTERSECT SELECT DISTINCT r.sid FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE b.color = 'blue'
SELECT Reserves.sid FROM Reserves INNER JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' OR Boats.color = 'blue'
SELECT s.name, s.sid FROM Sailors s WHERE EXISTS (SELECT 1 FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.color = 'red') AND EXISTS (SELECT 1 FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.color = 'blue')
SELECT DISTINCT s.sid, s.name FROM Sailors s INNER JOIN (SELECT r.sid FROM Reserves r INNER JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' UNION SELECT r.sid FROM Reserves r INNER JOIN Boats b ON r.bid = b.bid WHERE b.color = 'blue') AS reserved ON s.sid = reserved.sid
SELECT s.sid FROM Sailors s LEFT OUTER JOIN Reserves r ON s.sid = r.sid WHERE r.sid IS NULL
SELECT s.sid FROM Sailors s LEFT OUTER JOIN Reserves r ON s.sid = r.sid WHERE r.sid IS NULL
SELECT Sailors.sid, Sailors.name FROM Sailors LEFT OUTER JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT s.name, s.sid FROM Sailors s WHERE s.sid NOT IN (SELECT r.sid FROM Reserves r)
SELECT s.sid FROM Sailors s LEFT OUTER JOIN Reserves r ON s.sid = r.sid WHERE r.sid IS NULL
SELECT Sailors.sid FROM Sailors LEFT OUTER JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid AND bid = 103)
SELECT s.name FROM Sailors s WHERE EXISTS (SELECT 1 FROM Reserves r WHERE s.sid = r.sid AND r.bid = 103)
SELECT name FROM Sailors AS S WHERE S.rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT s.name FROM Sailors s WHERE s.rating > (SELECT MAX(s2.rating) FROM Sailors s2 WHERE s2.name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT S.name, S.sid FROM Sailors S WHERE S.rating > 2 AND S.sid IN (SELECT sid FROM Reserves R WHERE R.sid = S.sid)
SELECT S.name, S.sid FROM Sailors S WHERE S.rating >= 3 AND EXISTS (SELECT 1 FROM Reserves R WHERE R.sid = S.sid)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT COUNT(ALL sid) FROM Sailors;
SELECT COUNT(*) FROM (SELECT sid FROM Sailors) AS SailorTable
SELECT AVG(S.age) FROM Sailors S WHERE S.rating = 7
SELECT AVG(S.age) FROM Sailors S WHERE S.rating = 7
SELECT COUNT(sid) FROM Sailors WHERE name GLOB 'D*'
SELECT COUNT(sid) FROM Sailors WHERE name GLOB 'D*'
SELECT avg(rating), max(age) FROM Sailors
SELECT avg(rating), max(age) FROM Sailors
SELECT bid, COUNT(sid) FROM Reserves GROUP BY bid
SELECT Boats.bid, COUNT(Reserves.bid) AS reservation_count FROM Boats LEFT JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.bid
SELECT bid, COUNT(*) FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid HAVING bid > 50
SELECT bid, COUNT(*) AS TotalReservations FROM Reserves GROUP BY bid HAVING COUNT(*) > 1
SELECT R.bid, COUNT(*) AS ResCount FROM Reserves R GROUP BY R.bid HAVING COUNT(*) > 1
SELECT count(*), B.name FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE R.sid > 1 GROUP BY B.bid
SELECT COUNT(*), B.name FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE R.sid > 1 GROUP BY B.bid
SELECT rating, AVG(age) AS avg_age FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'red') GROUP BY rating
SELECT rating, AVG(age) AS average_age FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red')) GROUP BY rating
SELECT name, rating, age FROM Sailors ORDER BY rating ASC, age ASC
SELECT name, rating, age FROM Sailors ORDER BY rating ASC, age ASC
SELECT COUNT(*) AS TotalNumberOfBoats FROM Boats
SELECT COUNT(*) AS BoatCount FROM Boats
SELECT COUNT(*) FROM Boats b WHERE b.color = 'red'
SELECT count(bid) FROM Boats WHERE color = 'red'
SELECT name FROM Boats WHERE bid IN (SELECT bid FROM Reserves WHERE sid IN (SELECT sid FROM Sailors WHERE age BETWEEN 20 AND 30))
SELECT b.name FROM Boats b JOIN Reserves r ON b.bid = r.bid JOIN Sailors s ON r.sid = s.sid WHERE s.age > 19 AND s.age < 31
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(rating) FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors, Reserves, Boats WHERE Sailors.sid = Reserves.sid AND Reserves.bid = Boats.bid AND Boats.color = 'red')
SELECT MAX(rating) FROM Sailors
SELECT max(rating) FROM Sailors
SELECT s.name FROM Sailors s WHERE EXISTS (SELECT 1 FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.name = 'Melon')
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon' AND Reserves.sid = Sailors.sid)
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT h.Model FROM headphone h WHERE h.Price = (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT DISTINCT headphone.Model FROM headphone ORDER BY headphone.Model
SELECT DISTINCT Model FROM headphone ORDER BY Model COLLATE NOCASE
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT COUNT(*) FROM headphone GROUP BY Class ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM headphone GROUP BY Class) tmp)
SELECT DISTINCT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) > 2
SELECT headphone.Class FROM headphone GROUP BY headphone.Class HAVING COUNT(*) <= 2
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(DISTINCT Earpads) AS DistinctEarpads FROM headphone
SELECT COUNT(DISTINCT Earpads) AS DistinctEarpads FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(*) DESC LIMIT 2
SELECT Earpads, COUNT(Headphone_ID) FROM headphone GROUP BY Earpads HAVING COUNT(Headphone_ID) > 0 ORDER BY COUNT(Headphone_ID) DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone WHERE Price IS NOT NULL)
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT AVG(headphone.Price) AS Avg_Price, headphone.Construction FROM headphone GROUP BY headphone.Construction
SELECT Construction, AVG(Price) AS Average_Price FROM headphone GROUP BY Construction
SELECT DISTINCT h1.Class FROM headphone h1 JOIN headphone h2 ON h1.Class = h2.Class WHERE h1.Earpads = 'Bowls' AND h2.Earpads = 'Comfort Pads'
SELECT DISTINCT Class FROM headphone WHERE Earpads = 'Bowls' AND Class IN (SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads')
SELECT DISTINCT Earpads FROM headphone h WHERE h.Construction NOT LIKE '%Plastic%'
SELECT Earpads FROM headphone WHERE Construction NOT IN ('Plastic')
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone WHERE Price IS NOT NULL)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone WHERE Price IS NOT NULL)
SELECT Name FROM store ORDER BY Date_Opened, Store_ID
SELECT `Name` FROM `store` ORDER BY `Date_Opened`
SELECT `Name`, `Parking` FROM `store` WHERE `Neighborhood` = 'Tarzana'
SELECT `Name`, `Parking` FROM `store` WHERE `Neighborhood` = 'Tarzana'
SELECT COUNT(DISTINCT store.Neighborhood) FROM store
SELECT COUNT(DISTINCT store.Neighborhood) FROM store
SELECT Neighborhood, COUNT(*) FROM store GROUP BY Neighborhood
SELECT Neighborhood, COUNT(*) FROM store GROUP BY Neighborhood
SELECT store.Name, SUM(stock.Quantity) AS TotalHeadphones FROM store JOIN stock ON store.Store_ID = stock.Store_ID GROUP BY store.Store_ID ORDER BY TotalHeadphones DESC LIMIT 1
SELECT s.Name, SUM(st.Quantity) FROM store s JOIN stock st ON s.Store_ID = st.Store_ID WHERE st.Quantity > 0 GROUP BY s.Store_ID
SELECT s.Name FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT s.Name FROM store s WHERE NOT EXISTS (SELECT 1 FROM stock st WHERE st.Store_ID = s.Store_ID AND st.Quantity > 0)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock WHERE Quantity > 0)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock WHERE Quantity > 0)
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID HAVING SUM(Quantity) = (SELECT MAX(total_quantity) FROM (SELECT SUM(Quantity) AS total_quantity FROM stock GROUP BY Headphone_ID)))
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT TOTAL(stock.Quantity) FROM stock, store WHERE stock.Store_ID = store.Store_ID AND store.Name = 'Woodman'
SELECT sum(Quantity) FROM stock s JOIN store st ON s.Store_ID = st.Store_ID WHERE st.Name = 'Woodman'
SELECT Neighborhood FROM store EXCEPT SELECT s.Neighborhood FROM store s JOIN stock st ON s.Store_ID = st.Store_ID WHERE st.Quantity > 0
SELECT Neighborhood FROM store EXCEPT SELECT Neighborhood FROM store JOIN stock ON store.Store_ID = stock.Store_ID
SELECT count(*) FROM Author
SELECT COUNT(*) FROM Author WHERE author_id IS NOT NULL
SELECT COUNT(*) FROM (SELECT paper_id FROM Paper) AS total
SELECT COUNT(DISTINCT paper_id) FROM Paper
SELECT COUNT(DISTINCT affiliation_id) FROM Affiliation
SELECT COUNT(DISTINCT affiliation_id) FROM Affiliation
SELECT COUNT(*) AS TotalPapers FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE venue LIKE 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper p LEFT JOIN Author_list al ON p.paper_id = al.paper_id LEFT JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE p.year = 2009 AND a.name = 'Columbia University'
SELECT COUNT(paper_id) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name LIKE 'Columbia University')) AND year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT `venue`, `year` FROM `Paper` ORDER BY `year` ASC
SELECT DISTINCT venue FROM Paper ORDER BY year
SELECT DISTINCT p.title, p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Harvard University'
SELECT DISTINCT p.title, p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Harvard University'
SELECT P.title, P.paper_id FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Author AS A ON AL.author_id = A.author_id WHERE A.name LIKE 'Mckeown'
SELECT p.title, p.paper_id FROM Paper AS p JOIN Author_list AS al ON p.paper_id = al.paper_id JOIN Author AS a ON al.author_id = a.author_id WHERE a.name = 'Mckeown'
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id GROUP BY p.paper_id, p.title HAVING SUM(CASE WHEN a.name = 'Stanford University' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN a.name = 'Columbia University' THEN 1 ELSE 0 END) > 0
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name IN ('Stanford', 'Columbia University') GROUP BY Paper.paper_id HAVING COUNT(DISTINCT Affiliation.name) = 2
SELECT Paper.paper_id, Paper.title FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen' OR Author.name = 'Rambow, Owen' GROUP BY Paper.paper_id, Paper.title HAVING COUNT(DISTINCT Author.name) = 2
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT AL.paper_id FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY AL.paper_id HAVING COUNT(DISTINCT A.author_id) = 2)
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Mckeown') AND paper_id NOT IN (SELECT paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Rambow')
SELECT p.title, p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown' AND p.paper_id NOT IN (SELECT p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Rambow')
SELECT title, paper_id FROM Paper WHERE EXISTS (SELECT * FROM Author_list WHERE Author_list.paper_id = Paper.paper_id AND author_id IN (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen' OR name = 'Rambow, Owen'))
SELECT paper_id, title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id IN (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen' OR name = 'Rambow, Owen'))
SELECT name, COUNT(paper_id) AS total_papers FROM Author JOIN Author_list USING(author_id) JOIN Paper USING(paper_id) GROUP BY author_id ORDER BY total_papers DESC
SELECT a.name AS AuthorName, COUNT(p.paper_id) AS PaperCount FROM Author a LEFT JOIN Author_list al ON a.author_id = al.author_id LEFT JOIN Paper p ON al.paper_id = p.paper_id GROUP BY a.author_id ORDER BY PaperCount DESC
SELECT Affiliation.name, COUNT(DISTINCT Paper.paper_id) AS total_papers FROM Affiliation LEFT JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id LEFT JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Affiliation.affiliation_id ORDER BY total_papers ASC
SELECT A.name FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY A.affiliation_id ORDER BY COUNT(DISTINCT AL.paper_id) DESC
SELECT DISTINCT a.name FROM Author a, Author_list al WHERE a.author_id = al.author_id GROUP BY a.author_id HAVING COUNT(al.paper_id) > 50
SELECT A.name FROM Author A WHERE (SELECT COUNT(*) FROM Author_list AL WHERE AL.author_id = A.author_id GROUP BY AL.author_id) > 50
SELECT author.name FROM Author author INNER JOIN Author_list author_list ON author.author_id = author_list.author_id GROUP BY author.author_id HAVING COUNT(DISTINCT author_list.paper_id) = 1
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(*) = 1)
SELECT venue, year FROM (SELECT venue, year, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM Paper GROUP BY venue, year) AS ranked WHERE rank = 1
SELECT venue, year FROM (SELECT venue, year, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM Paper GROUP BY venue, year) sub WHERE rank = 1
SELECT P.venue FROM Paper P GROUP BY P.venue ORDER BY COUNT(P.paper_id) ASC LIMIT 1
SELECT P.venue FROM Paper AS P GROUP BY P.venue ORDER BY COUNT(P.paper_id) ASC LIMIT 1
SELECT COUNT(DISTINCT c.paper_id) FROM Citation c WHERE c.cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT c.paper_id) FROM Citation c WHERE c.cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT cited_paper_id) FROM Citation WHERE paper_id = 'D12-1027'
SELECT COUNT(DISTINCT cited_paper_id) FROM Citation WHERE paper_id = 'D12-1027'
SELECT top_paper.paper_id, top_paper.citation_count FROM (SELECT paper_id, COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY paper_id) AS top_paper ORDER BY top_paper.citation_count DESC LIMIT 1
SELECT paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY paper_id HAVING citation_count = (SELECT MAX(citation_count) FROM (SELECT COUNT(*) AS citation_count FROM Citation GROUP BY paper_id) subquery)
SELECT P.title FROM Paper P WHERE P.paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT P.title FROM Paper P WHERE P.paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(*) DESC LIMIT 1)
sql placeholder
sql placeholder
SELECT COUNT(c.paper_id) FROM Citation c JOIN Author_list al ON c.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation INNER JOIN Author_list ON Citation.paper_id = Author_list.paper_id INNER JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation JOIN Author_list ON Citation.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation JOIN Author_list ON Citation.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT Author.name, COUNT(Citation.cited_paper_id) AS NumCitations FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Citation ON Author_list.paper_id = Citation.cited_paper_id GROUP BY Author.author_id ORDER BY NumCitations DESC LIMIT 1
SELECT A.name, COUNT(*) AS citation_count FROM Author A, Author_list AL, Citation C WHERE A.author_id = AL.author_id AND AL.paper_id = C.cited_paper_id GROUP BY A.author_id HAVING citation_count = (SELECT MAX(citation_count) FROM (SELECT COUNT(*) AS citation_count FROM Author_list JOIN Citation ON Author_list.paper_id = Citation.cited_paper_id GROUP BY author_id) AS SubQuery)
SELECT DISTINCT P.venue, P.year FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT DISTINCT P.venue, P.year FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT DISTINCT venue, year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id AND A.name = 'Columbia University'
SELECT DISTINCT P.venue, P.year FROM Paper P, Author_list AL, Affiliation A WHERE P.paper_id = AL.paper_id AND AL.affiliation_id = A.affiliation_id AND A.name LIKE '%Columbia University%'
SELECT A.name FROM Author A WHERE EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE AL.author_id = A.author_id AND P.year = 2009) GROUP BY A.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Author WHERE author_id = (SELECT author_id FROM Author_list JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY author_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT a.name FROM Affiliation a INNER JOIN (SELECT al.affiliation_id FROM Author_list al INNER JOIN Paper p ON al.paper_id = p.paper_id WHERE p.year = 2009 GROUP BY al.affiliation_id ORDER BY COUNT(*) DESC LIMIT 3) top_affiliations ON a.affiliation_id = top_affiliations.affiliation_id
SELECT A.name FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY COUNT(*) DESC LIMIT 3
SELECT COUNT(*) FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(*) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id = (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University')) AND year <= 2009
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name = 'Stanford University' AND p.year BETWEEN 2000 AND 2009
SELECT p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id GROUP BY p.paper_id HAVING COUNT(al.author_id) = (SELECT MAX(author_count) FROM (SELECT paper_id, COUNT(author_id) AS author_count FROM Author_list GROUP BY paper_id) AS counts)
SELECT P.title FROM Paper AS P INNER JOIN (SELECT paper_id, COUNT(author_id) AS num_authors FROM Author_list GROUP BY paper_id) AS A ON P.paper_id = A.paper_id ORDER BY A.num_authors DESC LIMIT 1
SELECT COUNT(DISTINCT al.author_id) FROM Author_list al WHERE al.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND al.author_id NOT IN (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')
SELECT COUNT(DISTINCT AL.author_id) FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE AL.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND A.name != 'Mckeown, Kathleen'
SELECT A.name FROM Author A WHERE EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE AL.author_id = A.author_id AND P.paper_id IN (SELECT P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id WHERE AL.author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen'))) AND A.name <> 'Mckeown, Kathleen' GROUP BY A.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT a.name FROM Author a WHERE a.author_id IN (SELECT al.author_id FROM Author_list al WHERE al.paper_id IN (SELECT al2.paper_id FROM Author_list al2 WHERE al2.author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND al.author_id != (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) GROUP BY a.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT P.paper_id FROM Paper P WHERE P.title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title COLLATE UTF8_GENERAL_CI LIKE '%translation%'
SELECT p.paper_id, p.title FROM Paper p LEFT OUTER JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id GROUP BY p.paper_id, p.title HAVING COUNT(c.cited_paper_id) = 0
SELECT name FROM Affiliation WHERE address LIKE '%China%' ORDER BY (SELECT COUNT(*) FROM Author_list WHERE Author_list.affiliation_id = Affiliation.affiliation_id) DESC LIMIT 1
SELECT name FROM (SELECT A.name, COUNT(AL.paper_id) AS paper_count FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id WHERE A.address LIKE '%China%' GROUP BY A.affiliation_id ORDER BY paper_count DESC LIMIT 1) AS Result
SELECT year, venue, COUNT(*) FROM Paper WHERE venue <> '' GROUP BY year, venue
SELECT COUNT(*) AS paper_count, venue, year FROM Paper GROUP BY venue, year ORDER BY venue ASC, year ASC
SELECT A.name, COUNT(*) FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id
SELECT affiliation.name, COUNT(*) FROM affiliation, author_list, paper WHERE affiliation.affiliation_id = author_list.affiliation_id AND author_list.paper_id = paper.paper_id GROUP BY affiliation.affiliation_id
SELECT p.title FROM Paper p WHERE p.paper_id IN (SELECT c.paper_id FROM Citation c GROUP BY c.paper_id HAVING COUNT(c.cited_paper_id) > 50)
SELECT title FROM Paper p WHERE (SELECT COUNT(*) FROM Citation WHERE paper_id = p.paper_id) > 50
SELECT COUNT(DISTINCT author_id) FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50))
SELECT COUNT(DISTINCT author_id) FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50))
SELECT DISTINCT a.name FROM Author a WHERE a.author_id IN (SELECT al.author_id FROM Author_list al INNER JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue IN ('NAACL', 'ACL') AND p.year = 2009)
SELECT a.name FROM Author a WHERE EXISTS (SELECT 1 FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE al.author_id = a.author_id AND p.venue = 'NAACL' AND p.year = 2009) AND EXISTS (SELECT 1 FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE al.author_id = a.author_id AND p.venue = 'ACL' AND p.year = 2009)
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL'))
SELECT name FROM Author WHERE NOT EXISTS (SELECT * FROM Author_list WHERE author_id = Author.author_id AND paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL'))
SELECT COUNT(*) FROM `conference`
SELECT COUNT(*) FROM `conference`
SELECT DISTINCT Conference_Name AS DistinctConferences FROM conference
SELECT DISTINCT Conference_Name AS Name FROM conference
SELECT `Conference_Name`, `Year`, `Location` FROM `conference`
SELECT Conference_Name AS Name, Year AS Year, Location AS Location FROM conference
SELECT c.Conference_Name, COUNT(cp.Conference_ID) FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name
SELECT Conference_Name, COUNT(*) FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year FROM (SELECT Year, COUNT(*) AS NumConferences FROM conference GROUP BY Year) AS YearlyData WHERE NumConferences = (SELECT MIN(NumConferences) FROM (SELECT Year, COUNT(*) AS NumConferences FROM conference GROUP BY Year) AS SubQuery)
SELECT Year FROM (SELECT Year, COUNT(*) AS ConferenceCount FROM conference GROUP BY Year ORDER BY ConferenceCount ASC) AS TempTable LIMIT 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(DISTINCT Conference_ID) > 1
SELECT c.Location FROM conference AS c GROUP BY c.Location HAVING COUNT(c.Conference_ID) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution
SELECT COUNT(*) FROM institution WHERE Founded >= 1850 AND Founded <= 1900
SELECT COUNT(1) FROM institution WHERE Founded >= 1850 AND Founded <= 1900
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution LIMIT 1)
SELECT Institution_Name, Location FROM institution WHERE Founded IN (SELECT MAX(Founded) FROM institution)
SELECT i.Institution_Name, COUNT(s.staff_ID) AS NumberOfStaff FROM institution AS i LEFT JOIN staff AS s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID
SELECT institution.Institution_ID, COUNT(*) FROM institution INNER JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE institution.Founded > 1800 GROUP BY institution.Institution_ID
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT Institution_Name FROM institution AS i WHERE NOT EXISTS (SELECT NULL FROM staff AS s WHERE s.Institution_ID = i.Institution_ID)
SELECT name FROM staff WHERE Age > (SELECT AVG(s.Age) FROM staff s)
SELECT name FROM staff WHERE Age > (SELECT AVG(s.Age) FROM staff s)
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT (SELECT MAX(Age) FROM staff) AS MaxAge, (SELECT MIN(Age) FROM staff) AS MinAge
SELECT Conference_Name FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation WHERE staff_ID IN (SELECT staff_ID FROM staff WHERE Nationality = 'Canada'))
SELECT DISTINCT Conference_Name FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation JOIN staff ON conference_participation.staff_ID = staff.staff_ID WHERE staff.Institution_ID IN (SELECT Institution_ID FROM institution WHERE Location = 'Canada'))
SELECT s.name FROM staff s WHERE s.staff_ID IN (SELECT cp.staff_ID FROM conference_participation cp GROUP BY cp.staff_ID HAVING SUM(CASE WHEN cp.role = 'speaker' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN cp.role = 'sponsor' THEN 1 ELSE 0 END) > 0)
SELECT s.name FROM staff s INNER JOIN conference_participation cp ON s.staff_ID = cp.staff_ID WHERE cp.role IN ('speaker', 'sponsor') GROUP BY s.staff_ID, s.name HAVING COUNT(DISTINCT cp.role) = 2
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL' AND cp.staff_ID = s.staff_ID) AND EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'Naccl' AND cp.staff_ID = s.staff_ID)
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL' AND cp.staff_ID = s.staff_ID) AND EXISTS (SELECT 1 FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'NACCL' AND cp.staff_ID = s.staff_ID)
SELECT name FROM staff WHERE EXISTS (SELECT 1 FROM conference_participation JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year IN (2003, 2004) AND conference_participation.staff_ID = staff.staff_ID)
SELECT s.name FROM staff s WHERE EXISTS (SELECT * FROM conference_participation cp INNER JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE cp.staff_ID = s.staff_ID AND c.Year IN (2003, 2004))
SELECT c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS NumberOfParticipants FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID
SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(cp.staff_ID) FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year
SELECT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID HAVING COUNT(cp.staff_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(staff_ID) AS Count FROM conference_participation GROUP BY Conference_ID) AS Counts) LIMIT 2
SELECT Conference_Name FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation GROUP BY Conference_ID ORDER BY COUNT(*) DESC LIMIT 2)
SELECT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp INNER JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL')
SELECT DISTINCT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp INNER JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL')
SELECT i.Institution_Name, i.Location FROM institution i WHERE i.Institution_ID NOT IN (SELECT s.Institution_ID FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004)
SELECT Institution_Name, Location FROM institution EXCEPT SELECT i.Institution_Name, i.Location FROM institution i, staff s, conference_participation cp, conference c WHERE i.Institution_ID = s.Institution_ID AND s.staff_ID = cp.staff_ID AND cp.Conference_ID = c.Conference_ID AND c.Year = 2004
SELECT pilot_name FROM PilotSkills GROUP BY pilot_name, age ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT p.pilot_name FROM PilotSkills p WHERE p.age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(PilotSkills.age) FROM PilotSkills) ORDER BY PilotSkills.age ASC
SELECT PilotSkills.* FROM PilotSkills WHERE age < 30
SELECT pilot_name AS Name, plane_name AS Plane, age AS Age FROM PilotSkills WHERE age < 30
SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'Piper Cub' AND p.age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT H.location FROM Hangar H WHERE H.plane_name = 'F-14 Fighter'
SELECT H.location FROM Hangar H WHERE H.plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar WHERE location <> ''
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT p.plane_name FROM PilotSkills AS p WHERE p.pilot_name = 'Jones' AND p.age = 32;
SELECT ps.plane_name FROM PilotSkills ps WHERE ps.pilot_name = 'Jones' AND ps.age = 32
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM PilotSkills GROUP BY plane_name) AS subquery)
SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM PilotSkills GROUP BY plane_name) tmp)
SELECT H.plane_name FROM Hangar H LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name ORDER BY COUNT(P.pilot_name) ASC LIMIT 1
SELECT H.plane_name FROM Hangar H LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name ORDER BY COUNT(P.plane_name) ASC LIMIT 1
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE location = 'Chicago'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills PS, Hangar H WHERE PS.plane_name = H.plane_name AND H.location = 'Chicago'
SELECT PS.plane_name FROM PilotSkills PS WHERE PS.pilot_name = 'Smith' AND PS.age = 41;
SELECT PS.plane_name FROM PilotSkills PS WHERE PS.pilot_name = 'Smith' AND PS.age = 41;
SELECT COUNT(DISTINCT plane_name) AS TotalPlanes FROM PilotSkills
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE plane_name <> ''
SELECT COUNT(*) FROM PilotSkills PS WHERE PS.pilot_name = 'Smith'
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT ps.plane_name) FROM PilotSkills ps WHERE ps.age > 40
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40
SELECT pilot_name FROM PilotSkills WHERE age >= 30 AND age <= 40 ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age > 29 AND age < 41 ORDER BY age
SELECT p.pilot_name FROM PilotSkills p ORDER BY p.age DESC
SELECT p.pilot_name FROM PilotSkills p ORDER BY p.age DESC
SELECT h.location FROM Hangar h ORDER BY h.plane_name
SELECT location AS PlaneLocation FROM Hangar ORDER BY plane_name ASC
SELECT DISTINCT p.plane_name FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name ORDER BY p.plane_name
SELECT plane_name FROM Hangar ORDER BY plane_name
SELECT COUNT(*) FROM PilotSkills WHERE (age > 40) OR (age < 30)
SELECT COUNT(pilot_name) FROM PilotSkills WHERE (age > 40) OR (age < 30)
SELECT p.pilot_name, p.age FROM PilotSkills p WHERE (p.plane_name = 'Piper Cub' AND p.age > 35) OR (p.plane_name = 'F-14 Fighter' AND p.age < 30)
SELECT p.pilot_name, p.age FROM PilotSkills p WHERE (p.plane_name = 'Piper Cub' AND p.age > 35) OR (p.plane_name = 'F-14 Fighter' AND p.age < 30)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT DISTINCT p.pilot_name FROM PilotSkills p LEFT JOIN PilotSkills q ON p.pilot_name = q.pilot_name AND q.plane_name = 'B-52 Bomber' WHERE p.plane_name = 'Piper Cub' AND q.pilot_name IS NULL
SELECT pilot_name FROM (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION ALL SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber') AS subquery GROUP BY pilot_name HAVING COUNT(*) = 2
WITH PiperCubPilots AS (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub'), B52BomberPilots AS (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber') SELECT pilot_name FROM PiperCubPilots INTERSECT SELECT pilot_name FROM B52BomberPilots
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston')
SELECT p.pilot_name FROM PilotSkills p, Hangar h WHERE p.plane_name = h.plane_name AND h.location = 'Austin' INTERSECT SELECT p.pilot_name FROM PilotSkills p, Hangar h WHERE p.plane_name = h.plane_name AND h.location = 'Boston'
SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'Piper Cub' OR p.plane_name = 'F-14 Fighter'
SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'Piper Cub' UNION ALL SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'F-14 Fighter'
SELECT avg(age), plane_name FROM PilotSkills GROUP BY plane_name
SELECT plane_name, AVG(age) AS avg_age FROM PilotSkills GROUP BY plane_name
sql placeholder
SELECT COUNT(*) AS total_entries, plane_name FROM PilotSkills GROUP BY plane_name
SELECT plane_name, pilot_name FROM PilotSkills WHERE (plane_name, age) IN (SELECT plane_name, MIN(age) FROM PilotSkills GROUP BY plane_name) ORDER BY plane_name
SELECT H.plane_name, PS.pilot_name FROM Hangar H LEFT JOIN PilotSkills PS ON H.plane_name = PS.plane_name WHERE PS.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = H.plane_name) ORDER BY H.plane_name
SELECT p.plane_name, p.pilot_name FROM PilotSkills p WHERE EXISTS (SELECT 1 FROM PilotSkills p2 WHERE p2.plane_name = p.plane_name AND p.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = p2.plane_name))
SELECT plane_name, pilot_name FROM PilotSkills WHERE (plane_name, age) IN (SELECT plane_name, MIN(age) FROM PilotSkills GROUP BY plane_name)
SELECT PS.pilot_name, MAX(PS.age) FROM PilotSkills PS GROUP BY PS.pilot_name
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT COUNT(pilot_name), AVG(age), location FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY location
SELECT location, COUNT(DISTINCT pilot_name) AS pilot_count, AVG(age) AS avg_age FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY location
SELECT p.plane_name, COUNT(p.pilot_name) FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name WHERE p.age < 35 GROUP BY p.plane_name
SELECT ps.plane_name, COUNT(ps.pilot_name) AS total_pilots FROM PilotSkills ps INNER JOIN Hangar h ON ps.plane_name = h.plane_name WHERE ps.plane_name IN (SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35) GROUP BY ps.plane_name
SELECT h.location FROM Hangar h, PilotSkills p WHERE h.plane_name = p.plane_name ORDER BY p.age LIMIT 1
SELECT H.location FROM Hangar H, PilotSkills P WHERE H.plane_name = P.plane_name ORDER BY P.age LIMIT 1
SELECT p.pilot_name, p.age FROM PilotSkills p WHERE EXISTS (SELECT 1 FROM Hangar h WHERE p.plane_name = h.plane_name AND h.location = 'Austin')
SELECT pilot_name, age FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name AND Hangar.location = 'Austin'
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT DISTINCT p1.pilot_name FROM PilotSkills p1 WHERE p1.age > (SELECT MAX(p2.age) FROM PilotSkills p2 WHERE p2.plane_name = 'Piper Cub') ORDER BY p1.pilot_name
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills ps WHERE ps.plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%' AND location IS NOT NULL
SELECT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%' GROUP BY plane_name
SELECT COUNT(DISTINCT p.pilot_name) FROM PilotSkills p WHERE p.age > (SELECT MIN(ps.age) FROM PilotSkills ps WHERE ps.plane_name = 'Piper Cub')
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT d.Area_km, d.Government_website FROM district AS d WHERE d.Population = (SELECT MIN(Population) FROM district)
SELECT district.Name, district.Population FROM district WHERE district.Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(Area_km) AS MaxArea, AVG(Area_km) AS AvgArea FROM district
SELECT SUM(d.Population) FROM (SELECT Population FROM district ORDER BY Area_km DESC LIMIT 3) d
SELECT d.District_ID, d.Name, d.Government_website FROM district AS d ORDER BY d.Population ASC
SELECT Name FROM district WHERE Government_website LIKE '%.gov'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman WHERE Speach_title <> ''
SELECT AVG(Points) avg_points, AVG(Age) avg_age FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman WHERE Age IS NOT NULL)
SELECT sp.Name FROM spokesman sp WHERE sp.Points < (SELECT AVG(Points) FROM spokesman)
SELECT Name FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district GROUP BY District_ID HAVING COUNT(Spokesman_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Spokesman_ID) AS Cnt FROM spokesman_district GROUP BY District_ID)))
SELECT s.Name FROM spokesman s, spokesman_district sd WHERE s.Spokesman_ID = sd.Spokesman_ID AND sd.Start_year < 2004
SELECT Name, (SELECT COUNT(*) FROM spokesman_district WHERE spokesman_district.District_ID = district.District_ID) AS Spokesmen_Count FROM district
SELECT d.Name FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 1) AND EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 2)
SELECT d.Name FROM district AS d INNER JOIN spokesman_district AS sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID HAVING COUNT(DISTINCT sd.Spokesman_ID) > 1
SELECT count(*) FROM district d WHERE d.District_ID NOT IN (SELECT sd.District_ID FROM spokesman_district sd)
SELECT count(*) FROM district d WHERE d.District_ID NOT IN (SELECT sd.District_ID FROM spokesman_district sd)
SELECT SUM(Population) TotalPop, AVG(Population) AvgPop FROM district d WHERE d.District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT s.title FROM Sculptures s WHERE s.year IN (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title FROM Sculptures WHERE location LIKE 'gallery 226'
SELECT title FROM Sculptures WHERE location LIKE 'gallery 226'
SELECT title, location FROM Paintings
SELECT title AS PaintingName, location AS PaintingLocation FROM Paintings
SELECT s.title, s.location FROM Sculptures s
SELECT s.title, s.location FROM Sculptures s
SELECT p.medium FROM Paintings p WHERE p.paintingID = 80
SELECT Paintings.medium FROM Paintings WHERE paintingID = 80;
SELECT Artists.fname, Artists.lname FROM Artists WHERE Artists.birthYear > 1850
SELECT fname || ' ' || lname AS FullName FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT Sculptures.title, Sculptures.year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT DISTINCT a.fname, a.lname FROM Artists a LEFT JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT a.fname, a.lname FROM Artists a LEFT JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT birthYear FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE year > 1920)
SELECT DISTINCT birthYear FROM Artists A WHERE A.artistID IN (SELECT sculptorID FROM Sculptures WHERE year > 1920)
SELECT fname, lname FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL)
SELECT fname || ' ' || lname FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT (deathYear - birthYear) AS age FROM Artists ORDER BY age ASC LIMIT 1
SELECT (deathYear - birthYear) AS age FROM Artists ORDER BY age ASC LIMIT 1
SELECT fname, deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname, deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(*) FROM Paintings WHERE location LIKE 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE location LIKE 'gallery 240'
SELECT COUNT(P.paintingID) FROM Paintings P, Artists A WHERE P.painterID = A.artistID AND (A.deathYear - A.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(*) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE (Artists.deathYear - Artists.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT Paintings.title, Paintings.year FROM Paintings LEFT JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT p.title, p.year FROM Paintings p, Artists a WHERE p.painterID = a.artistID AND a.fname = 'Mary'
SELECT P.width_mm FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.birthYear < 1850
SELECT width_mm FROM Paintings p JOIN Artists a ON p.painterID = a.artistID WHERE a.birthYear < 1850
SELECT location, medium FROM Paintings, Artists WHERE Paintings.painterID = Artists.artistID AND Artists.fname = 'Pablo'
SELECT location, medium FROM Paintings, Artists WHERE Paintings.painterID = Artists.artistID AND Artists.fname = 'Pablo'
SELECT DISTINCT a.fname, a.lname FROM Artists a INNER JOIN Paintings p ON a.artistID = p.painterID INNER JOIN Sculptures s ON a.artistID = s.sculptorID GROUP BY a.fname, a.lname
SELECT DISTINCT a.fname || ' ' || a.lname AS full_name FROM Artists a, Paintings p, Sculptures s WHERE a.artistID = p.painterID AND a.artistID = s.sculptorID
SELECT DISTINCT first.fname, first.lname FROM Artists first, Paintings oil, Paintings litho WHERE first.artistID = oil.painterID AND oil.medium = 'Oil' AND first.artistID = litho.painterID AND litho.medium = 'Lithographic'
SELECT DISTINCT a.fname, a.lname FROM Artists a INNER JOIN Paintings p ON a.artistID = p.painterID GROUP BY a.artistID HAVING SUM(CASE WHEN p.medium = 'oil' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN p.medium = 'lithographic' THEN 1 ELSE 0 END) > 0
SELECT birthYear FROM Artists WHERE artistID = (SELECT painterID FROM Paintings WHERE year = 1884 AND mediumOn = 'canvas' LIMIT 1)
SELECT birthYear FROM Artists WHERE EXISTS (SELECT 1 FROM Paintings WHERE Paintings.painterID = Artists.artistID AND year = 1884)
SELECT DISTINCT a.fname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.medium = 'oil' AND p.location = 'gallery 241'
SELECT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 241')
SELECT medium, COUNT(*) FROM Paintings GROUP BY medium UNION ALL SELECT medium, COUNT(*) FROM Sculptures GROUP BY medium
SELECT Combined.medium, COUNT(*) AS Total FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) AS Combined GROUP BY Combined.medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium HAVING AVG(height_mm) IS NOT NULL
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location
SELECT COUNT(DISTINCT location) FROM Paintings WHERE year < 1900
SELECT Paintings.title FROM Paintings WHERE Paintings.year > 1910 AND Paintings.medium = 'oil'
SELECT title FROM Paintings WHERE medium LIKE 'oil' AND year > 1910
SELECT DISTINCT painterID FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 240'
SELECT DISTINCT p.painterID FROM Paintings p WHERE p.medium = 'oil' AND p.location LIKE 'gallery 240'
SELECT DISTINCT P.title FROM Paintings P WHERE P.height_mm > (SELECT height_mm FROM Paintings WHERE mediumOn = 'canvas' ORDER BY height_mm LIMIT 1)
SELECT DISTINCT p1.title FROM Paintings p1 WHERE p1.height_mm > (SELECT MIN(p2.height_mm) FROM Paintings p2 WHERE p2.medium = 'canvas')
SELECT DISTINCT p.paintingID FROM Paintings p WHERE EXISTS (SELECT 1 FROM Paintings p2 WHERE p2.location = 'gallery 240' AND p.year < p2.year)
SELECT DISTINCT p.paintingID FROM Paintings p WHERE EXISTS (SELECT 1 FROM Paintings q WHERE p.year < q.year AND q.location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT a.fname, a.lname FROM Artists a WHERE EXISTS (SELECT 1 FROM Sculptures s WHERE s.sculptorID = a.artistID AND s.title LIKE '%female%')
SELECT fname || ' ' || lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE title LIKE '%female%')
SELECT title FROM Paintings GROUP BY title ORDER BY title
SELECT title FROM Paintings GROUP BY title ORDER BY title
SELECT DISTINCT title FROM Paintings ORDER BY length(title)
SELECT DISTINCT p.title FROM Paintings p ORDER BY p.height_mm ASC
SELECT title FROM Paintings WHERE year >= 1900 AND year <= 1950 UNION ALL SELECT title FROM Sculptures WHERE year >= 1900 AND year <= 1950
SELECT title FROM Paintings WHERE year >= 1900 AND year <= 1950 UNION ALL SELECT title FROM Sculptures WHERE year >= 1900 AND year <= 1950
SELECT P.title FROM Paintings P WHERE P.painterID = 222 UNION ALL SELECT S.title FROM Sculptures S WHERE S.sculptorID = 222
SELECT title FROM Paintings WHERE painterID = 222 UNION ALL SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT painterID FROM Paintings GROUP BY painterID HAVING year < 1900 ORDER BY COUNT(*) DESC LIMIT 1
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID HAVING COUNT(paintingID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(paintingID) AS Cnt FROM Paintings WHERE year < 1900 GROUP BY painterID))
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(sculptureID) = (SELECT MAX(Counted) FROM (SELECT COUNT(sculptureID) AS Counted FROM Sculptures GROUP BY sculptorID)))
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(sculptureID) = (SELECT MAX(Counted) FROM (SELECT COUNT(sculptureID) AS Counted FROM Sculptures GROUP BY sculptorID)))
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT DISTINCT location FROM Paintings WHERE year < 1885 UNION ALL SELECT DISTINCT location FROM Paintings WHERE year > 1930
SELECT location FROM Paintings WHERE year < 1885 UNION ALL SELECT location FROM Paintings WHERE year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000 AND medium IS NOT NULL
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000;
SELECT DISTINCT location FROM Paintings WHERE mediumOn IN ('on panel', 'on canvas')
SELECT DISTINCT location FROM Paintings WHERE mediumOn IN ('panels', 'canvas')
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930 GROUP BY location HAVING MIN(year) < 1885 AND MAX(year) > 1930
SELECT location FROM Paintings WHERE year < 1885 UNION SELECT location FROM Paintings WHERE year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location LIKE 'gallery 241'
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location LIKE 'gallery 241'
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 AND height_mm = (SELECT MAX(height_mm) FROM Paintings WHERE year < 1900)
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT Paintings.year, max(Paintings.height_mm), max(Paintings.width_mm) FROM Paintings GROUP BY Paintings.year
SELECT year, MAX(height_mm) AS MaximumHeight, MAX(width_mm) AS MaximumWidth FROM Paintings GROUP BY year
SELECT a.fname || ' ' || a.lname AS artist_name, AVG(p.height_mm) AS avg_height, AVG(p.width_mm) AS avg_width FROM Artists a, Paintings p WHERE a.artistID = p.painterID GROUP BY a.artistID ORDER BY a.lname, a.fname
SELECT A.lname, A.fname, AVG(P.height_mm) AS HeightAverage, AVG(P.width_mm) AS WidthAverage FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT fname, COUNT(*) FROM Artists, Paintings WHERE Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(*) >= 2
SELECT Artists.fname, COUNT(Paintings.paintingID) AS TotalPaintings FROM Artists INNER JOIN Paintings ON Artists.artistID = Paintings.painterID GROUP BY Artists.artistID HAVING COUNT(Paintings.paintingID) >= 2
SELECT A.deathYear FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) <= 3 OR COUNT(P.paintingID) IS NULL
SELECT A.deathYear FROM Artists A WHERE (SELECT COUNT(P.paintingID) FROM Paintings P WHERE P.painterID = A.artistID) < 4
SELECT A.deathYear FROM Artists A WHERE EXISTS (SELECT 1 FROM Sculptures S WHERE S.sculptorID = A.artistID GROUP BY S.sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT A.deathYear FROM Artists A WHERE A.artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT paintingID, height_mm FROM Paintings WHERE location LIKE 'gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT P.height_mm, P.paintingID FROM Paintings P WHERE P.location = 'gallery 240' AND P.width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(Paintings.year) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(p.year) FROM Paintings p WHERE p.location LIKE 'gallery 240')
SELECT paintingID FROM Paintings p1 WHERE NOT EXISTS (SELECT 1 FROM Paintings p2 WHERE p2.year > 1900 AND p2.height_mm >= p1.height_mm)
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT max(height_mm) FROM Paintings WHERE year > 1900)
SELECT fname, lname, COUNT(paintingID) AS TotalOilPaintings FROM Artists JOIN Paintings ON artistID = painterID WHERE medium = 'oil' GROUP BY artistID ORDER BY TotalOilPaintings DESC LIMIT 3
SELECT A.fname, A.lname FROM Artists A WHERE EXISTS (SELECT 1 FROM Paintings P WHERE P.painterID = A.artistID AND P.medium = 'oil') GROUP BY A.artistID ORDER BY COUNT(*) DESC LIMIT 1
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year ASC
SELECT p.paintingID, p.location, p.title FROM Paintings p WHERE p.medium = 'oil' ORDER BY p.year ASC
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT p.year, p.location, p.title FROM Paintings p WHERE p.height_mm > 1000 ORDER BY p.title ASC
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT location FROM Paintings GROUP BY location HAVING MIN(year) < 1885 AND SUM(CASE WHEN mediumOn = 'canvas' THEN 1 ELSE 0 END) = 0
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn NOT IN ('canvas')
SELECT count(*) FROM race
SELECT COUNT(race.Road) AS TotalRaces FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver AS Driver, Winning_team AS Team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT driver.Constructor FROM driver ORDER BY driver.Age ASC
SELECT DISTINCT Constructor FROM driver AS d ORDER BY d.Age ASC
SELECT DISTINCT driver.Entrant FROM driver WHERE driver.Age >= 20
SELECT DISTINCT driver.Entrant FROM driver WHERE driver.Age >= 20
SELECT max(Age), min(Age) FROM driver
SELECT max(Age), min(Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name COLLATE NOCASE DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name COLLATE NOCASE DESC
SELECT driver.Driver_Name, race.Race_Name FROM driver INNER JOIN race ON driver.Driver_ID = race.Driver_ID
SELECT driver.Driver_Name, race.Race_Name FROM driver INNER JOIN race ON driver.Driver_ID = race.Driver_ID
SELECT Driver_Name, COUNT(race.Road) FROM driver LEFT JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY Driver_Name
SELECT Driver_Name, COUNT(race.Driver_ID) AS Total_Races FROM driver INNER JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID
SELECT D.Age FROM driver D JOIN race R ON D.Driver_ID = R.Driver_ID GROUP BY D.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT d.Age FROM driver d WHERE EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID GROUP BY r.Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Driver_Name, Age FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) > 1)
SELECT d.Driver_Name, d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID, d.Driver_Name, d.Age HAVING COUNT(r.Road) >= 2
SELECT r.Race_Name FROM race AS r JOIN driver AS d ON r.Driver_ID = d.Driver_ID WHERE d.Age >= 26
SELECT R.Race_Name FROM race AS R INNER JOIN driver AS D ON R.Driver_ID = D.Driver_ID WHERE D.Age >= 26
SELECT `Driver_Name` FROM `driver` WHERE `Constructor` != 'Bugatti'
SELECT Driver_Name FROM driver WHERE Constructor NOT IN ('Bugatti')
SELECT d.Constructor, COUNT(DISTINCT d.Driver_ID) FROM driver d GROUP BY d.Constructor
SELECT Constructor, COUNT(*) AS NumberOfDrivers FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT Engine, COUNT(*) AS Count FROM driver GROUP BY Engine) AS SubTable)
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(EngineFrequency) FROM (SELECT COUNT(*) AS EngineFrequency FROM driver GROUP BY Engine) AS FrequencyTable)
SELECT DISTINCT Engine FROM driver WHERE Engine IN (SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2)
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(Driver_ID) >= 2
SELECT d.Driver_Name FROM driver d LEFT OUTER JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Driver_ID IS NULL
SELECT Driver_Name FROM driver d WHERE d.Driver_ID NOT IN (SELECT r.Driver_ID FROM race r)
SELECT DISTINCT d.Constructor FROM driver d WHERE d.Age < 20 AND d.Constructor IN (SELECT Constructor FROM driver WHERE Age > 30)
SELECT DISTINCT d.Constructor FROM driver d WHERE d.Age < 20 AND d.Constructor IN (SELECT Constructor FROM driver WHERE Age > 30)
SELECT Winning_team FROM race WHERE Winning_team IS NOT NULL GROUP BY Winning_team HAVING COUNT(Winning_team) > 1
SELECT Winning_team FROM race WHERE Winning_team IS NOT NULL GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT d.Driver_Name FROM driver d WHERE d.Driver_ID IN (SELECT r.Driver_ID FROM race r WHERE r.Pole_Position IN ('James Hinchcliffe', 'Carl Skerlong') GROUP BY r.Driver_ID HAVING COUNT(DISTINCT r.Pole_Position) = 2)
SELECT DISTINCT d.Driver_Name FROM driver d, race r WHERE d.Driver_ID = r.Driver_ID AND (r.Pole_Position = 'James Hinchcliffe' OR r.Pole_Position = 'Carl Skerlong') GROUP BY d.Driver_ID HAVING COUNT(DISTINCT r.Pole_Position) = 2
SELECT d.Driver_Name FROM driver d LEFT OUTER JOIN race r ON d.Driver_ID = r.Driver_ID AND r.Pole_Position = 'James Hinchcliffe' WHERE r.Driver_ID IS NULL
SELECT Driver_Name FROM driver d WHERE NOT EXISTS (SELECT * FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT count(*) FROM languages
SELECT count(*) FROM languages
SELECT name AS LanguageName FROM languages ORDER BY LanguageName ASC
SELECT name AS LanguageName FROM languages ORDER BY LanguageName ASC
SELECT l.name FROM languages l WHERE l.name LIKE '%ish%'
SELECT l.name FROM languages l WHERE l.name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries WHERE justice_score > 0
SELECT AVG(justice_score) FROM countries AS c
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE name != 'Norway'
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE name != 'Norway'
SELECT COUNT(*) FROM (SELECT DISTINCT language_id FROM official_languages)
SELECT COUNT(DISTINCT ol.language_id) FROM official_languages AS ol
SELECT `name` FROM `countries` ORDER BY `education_score` DESC
SELECT `name` FROM `countries` ORDER BY `education_score` DESC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(c.politics_score) FROM countries c)
SELECT c.name FROM countries c WHERE c.politics_score IN (SELECT MAX(politics_score) FROM countries)
SELECT c.name AS 'Country', l.name AS 'Language' FROM countries c CROSS JOIN languages l INNER JOIN official_languages ol ON c.id = ol.country_id AND l.id = ol.language_id
SELECT country.name, language.name FROM countries AS country JOIN official_languages AS ol ON country.id = ol.country_id JOIN languages AS language ON ol.language_id = language.id
SELECT l.name AS Language, COUNT(ol.country_id) AS Countries FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.name
SELECT l.name, COUNT(DISTINCT ol.country_id) AS num_countries FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.name
SELECT L.name FROM languages L, official_languages OL WHERE L.id = OL.language_id GROUP BY L.id HAVING COUNT(OL.country_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(country_id) AS Cnt FROM official_languages GROUP BY language_id) T)
SELECT name FROM languages WHERE id = (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(DISTINCT country_id) >= 2)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(DISTINCT country_id) >= 2)
SELECT AVG(overall_score) FROM countries c WHERE EXISTS (SELECT 1 FROM official_languages ol JOIN languages l ON ol.language_id = l.id WHERE l.name = 'English' AND ol.country_id = c.id)
SELECT AVG(overall_score) FROM countries WHERE EXISTS (SELECT 1 FROM official_languages JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English' AND official_languages.country_id = countries.id)
SELECT l.name FROM languages l WHERE l.id IN (SELECT ol.language_id FROM official_languages ol GROUP BY ol.language_id ORDER BY COUNT(ol.country_id) DESC LIMIT 3)
SELECT l.name FROM languages l WHERE l.id IN (SELECT ol.language_id FROM official_languages ol GROUP BY ol.language_id ORDER BY COUNT(ol.country_id) DESC LIMIT 3)
SELECT l.name AS Language, AVG(c.overall_score) AS AvgOverallScore FROM languages l, official_languages ol, countries c WHERE l.id = ol.language_id AND ol.country_id = c.id GROUP BY l.name ORDER BY AvgOverallScore DESC
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages JOIN countries ON official_languages.country_id = countries.id GROUP BY language_id ORDER BY AVG(overall_score) DESC)
SELECT name FROM countries WHERE id IN (SELECT country_id FROM official_languages GROUP BY country_id HAVING COUNT(language_id) = (SELECT MAX(count) FROM (SELECT COUNT(language_id) AS count FROM official_languages GROUP BY country_id)))
SELECT (SELECT name FROM countries WHERE id = sub.country_id) AS country FROM (SELECT country_id FROM official_languages GROUP BY country_id ORDER BY COUNT(language_id) DESC LIMIT 1) sub
SELECT l.name FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id WHERE ol.language_id IS NULL
SELECT l.name FROM languages l LEFT JOIN official_languages ol ON l.id = ol.language_id WHERE ol.language_id IS NULL
SELECT c.name FROM countries c WHERE c.id NOT IN (SELECT ol.country_id FROM official_languages ol)
SELECT c.name FROM countries c WHERE c.id NOT IN (SELECT ol.country_id FROM official_languages ol)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score > 95)) AND id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score < 90))
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages INNER JOIN countries ON official_languages.country_id = countries.id WHERE overall_score > 95) AND id IN (SELECT language_id FROM official_languages INNER JOIN countries ON official_languages.country_id = countries.id WHERE overall_score < 90)
SELECT DISTINCT a.town_city, a.country FROM Addresses a
SELECT A.country, A.town_city FROM Addresses A
SELECT Addresses.county_state_province FROM Addresses JOIN Properties ON Addresses.address_id = Properties.property_address_id
SELECT county_state_province FROM Addresses JOIN Properties ON Addresses.address_id = Properties.property_address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_name, feature_description FROM Features WHERE feature_id = (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT feature_name, feature_description FROM Features WHERE feature_id = (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT min(room_count) FROM Properties
SELECT MIN(room_count) FROM Properties
SELECT COUNT(*) FROM Properties WHERE (parking_lots = '1' OR garage_yn = '1') AND property_id IS NOT NULL
SELECT COUNT(DISTINCT property_id) FROM Properties WHERE garage_yn = '1' OR parking_lots = '1'
SELECT DISTINCT a.age_category_description FROM Ref_Age_Categories a INNER JOIN Users u ON a.age_category_code = u.age_category_code WHERE u.other_user_details LIKE '%Mother%'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code IN (SELECT age_category_code FROM Users WHERE user_category_code IN (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description LIKE '%Mother%'))
SELECT U.first_name FROM Users U WHERE EXISTS (SELECT 1 FROM Properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id HAVING COUNT(P.property_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(property_id) AS Cnt FROM Properties GROUP BY owner_user_id) AS Sub))
SELECT U.first_name FROM Users U WHERE EXISTS (SELECT NULL FROM Properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id HAVING COUNT(P.property_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(property_id) AS COUNT FROM Properties GROUP BY owner_user_id) AS Counts))
SELECT AVG(room_count) AS AverageRoomCount FROM Properties WHERE property_description LIKE '%garden%'
SELECT AVG(room_count) FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features WHERE feature_id IN (SELECT feature_id FROM Features WHERE feature_name LIKE '%garden%'))
sql placeholder
sql placeholder
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT AVG(room_count) FROM Properties WHERE room_count IS NOT NULL
SELECT AVG(room_count) FROM Properties WHERE room_count IS NOT NULL
SELECT COUNT(DISTINCT r.room_size) AS distinct_room_sizes FROM Rooms r
SELECT COUNT(room_size) FROM (SELECT DISTINCT room_size FROM Rooms) AS unique_sizes
SELECT user_id, search_string FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(DISTINCT search_seq) >= 2)
SELECT user_id, search_seq FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC, search_datetime DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC, search_datetime DESC
SELECT DISTINCT a.zip_postcode FROM Addresses a INNER JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) > 2)
SELECT DISTINCT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT U.user_id, U.user_category_code FROM Users U WHERE (SELECT COUNT(*) FROM User_Searches US WHERE US.user_id = U.user_id) = 1
SELECT u.user_id, u.user_category_code FROM Users u INNER JOIN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) = 1) s ON u.user_id = s.user_id
SELECT (SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = U.age_category_code) FROM Users U JOIN User_Searches US ON U.user_id = US.user_id ORDER BY US.search_datetime ASC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1))
SELECT login_name FROM Users WHERE age_category_code = (SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description = 'Senior Citizen') ORDER BY first_name
SELECT login_name FROM Users WHERE age_category_code = (SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description = 'Senior Citizen') ORDER BY first_name
SELECT COUNT(*) FROM User_Searches, Users WHERE User_Searches.user_id = Users.user_id AND Users.is_buyer = '1'
SELECT COUNT(*) FROM User_Searches INNER JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = '1'
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE Users.is_seller = '1'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE Users.is_seller = '1'
SELECT line_1_number_building, line_2_number_street, town_city FROM Addresses WHERE address_id IN (SELECT user_address_id FROM Users WHERE user_category_code = (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description LIKE '%Senior%'))
SELECT building.line_1_number_building, street.line_2_number_street, city.town_city FROM Addresses AS building, Addresses AS street, Addresses AS city JOIN Users ON city.address_id = Users.user_address_id WHERE Users.age_category_code = 'senior'
SELECT COUNT(*) FROM (SELECT COUNT(feature_id) AS feature_count, property_id FROM Property_Features GROUP BY property_id HAVING feature_count >= 2) AS feature_counts
SELECT COUNT(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) > 1) AS properties_with_features
SELECT property_id, COUNT(photo_seq) AS count_of_photos FROM Property_Photos GROUP BY property_id
SELECT COUNT(*) AS count_photos, property_id FROM Property_Photos GROUP BY property_id
SELECT owner_user_id, COUNT(*) FROM Properties INNER JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT Properties.owner_user_id, COUNT(Property_Photos.photo_seq) FROM Properties, Property_Photos WHERE Properties.property_id = Property_Photos.property_id GROUP BY Properties.owner_user_id
SELECT SUM(p.price_max) FROM Properties p INNER JOIN Users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN (SELECT user_category_code FROM Ref_User_Categories WHERE user_category_description = 'Single Mother' OR user_category_description = 'Student')
SELECT SUM(price_max) FROM Properties WHERE owner_user_id IN (SELECT user_id FROM Users WHERE user_category_code = 'single_mother' OR user_category_code = 'student')
SELECT uph.datestamp, p.property_name FROM User_Property_History uph JOIN Properties p ON uph.property_id = p.property_id ORDER BY uph.datestamp ASC
SELECT datestamp, property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY datestamp ASC
SELECT A.property_type_description, A.property_type_code FROM Ref_Property_Types A, Properties B WHERE A.property_type_code = B.property_type_code GROUP BY A.property_type_code, A.property_type_description HAVING COUNT(B.property_type_code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Properties GROUP BY property_type_code) AS T)
SELECT R.property_type_code, R.property_type_description FROM Ref_Property_Types R JOIN (SELECT property_type_code, COUNT(*) AS count FROM Properties GROUP BY property_type_code ORDER BY count DESC LIMIT 1) P ON R.property_type_code = P.property_type_code
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT Ref_Age_Categories.age_category_description FROM Ref_Age_Categories WHERE Ref_Age_Categories.age_category_code = 'Over 60'
SELECT room_size, COUNT(*) AS number_of_rooms FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(room_number) AS NumberOfRooms FROM Rooms GROUP BY room_size
SELECT country FROM Addresses WHERE address_id IN (SELECT user_address_id FROM Users WHERE first_name = 'Robbie')
SELECT country FROM Addresses WHERE address_id IN (SELECT user_address_id FROM Users WHERE first_name = 'Robbie')
SELECT U.first_name, U.middle_name, U.last_name FROM Users U, Properties P WHERE U.user_id = P.owner_user_id AND U.user_address_id = P.property_address_id
SELECT first_name || ' ' || last_name AS full_name FROM Users u WHERE EXISTS (SELECT * FROM Properties p WHERE p.owner_user_id = u.user_id AND p.property_address_id = u.user_address_id)
SELECT search_string FROM User_Searches AS US WHERE US.user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id)
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT Users.last_name, Users.user_id FROM Users INNER JOIN Properties ON Users.user_id = Properties.owner_user_id GROUP BY Users.user_id HAVING COUNT(Properties.property_id) >= 2 AND (SELECT COUNT(*) FROM User_Searches WHERE User_Searches.user_id = Users.user_id) <= 2
SELECT U.last_name, U.user_id FROM Users U INNER JOIN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) <= 2) US ON U.user_id = US.user_id INNER JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) >= 2) P ON U.user_id = P.owner_user_id
SELECT COUNT(id) FROM bike WHERE weight > 780
SELECT product_name AS BikeName, weight AS BikeWeight FROM bike ORDER BY price ASC
SELECT `heat`, `name`, `nation` FROM `cyclist`
SELECT MAX(weight) AS MaxWeight, MIN(weight) AS MinWeight FROM `bike`
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
SELECT c.name, c.result FROM cyclist c WHERE c.nation <> 'Russia'
SELECT DISTINCT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015
SELECT b.id, b.product_name FROM bike b, cyclists_own_bikes cob WHERE b.id = cob.bike_id GROUP BY b.id HAVING COUNT(DISTINCT cob.cyclist_id) >= 4
SELECT c.id, c.name FROM cyclist c, cyclists_own_bikes cob WHERE c.id = cob.cyclist_id GROUP BY c.id HAVING COUNT(cob.bike_id) = (SELECT MAX(count) FROM (SELECT COUNT(bike_id) AS count FROM cyclists_own_bikes GROUP BY cyclist_id) AS counts)
SELECT DISTINCT product_name FROM bike WHERE id IN (SELECT bike_id FROM cyclists_own_bikes JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE nation IN ('Russia', 'Great Britain'))
SELECT COUNT(*) FROM (SELECT heat FROM cyclist GROUP BY heat)
SELECT COUNT(DISTINCT c.id) FROM cyclist c WHERE NOT EXISTS (SELECT NULL FROM cyclists_own_bikes cob WHERE cob.cyclist_id = c.id AND cob.purchase_year > 2015)
SELECT DISTINCT b.product_name FROM bike AS b JOIN cyclists_own_bikes AS cob ON b.id = cob.bike_id JOIN cyclist AS c ON cob.cyclist_id = c.id WHERE c.result < '4:21.558'
SELECT DISTINCT b.product_name, b.price FROM bike b, cyclists_own_bikes cob, cyclist c WHERE b.id = cob.bike_id AND cob.cyclist_id = c.id AND c.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY b.id HAVING COUNT(DISTINCT c.name) = 2
SELECT c.name, c.nation, c.result FROM cyclist c WHERE c.id NOT IN (SELECT cob.cyclist_id FROM cyclists_own_bikes cob)
SELECT product_name FROM bike WHERE INSTR(material, 'fiber') > 0
SELECT c.id, COUNT(DISTINCT cb.bike_id) AS bike_count FROM cyclist c LEFT JOIN cyclists_own_bikes cb ON c.id = cb.cyclist_id GROUP BY c.id ORDER BY c.id
SELECT Food, Flavor FROM goods WHERE Food = 'cake' ORDER BY Price DESC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cake' AND Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake')
SELECT g.Flavor, g.Food FROM goods g WHERE g.Food = 'cookie' AND g.Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie') GROUP BY g.Flavor, g.Food
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id FROM goods WHERE Flavor LIKE 'apple'
SELECT Id FROM goods WHERE Flavor LIKE 'apple'
SELECT g.Id FROM goods AS g WHERE g.Price < 3
SELECT Id FROM goods WHERE Price < 3.0
SELECT DISTINCT Id FROM customers WHERE Id IN (SELECT CustomerId FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Food = 'cake' AND Flavor = 'lemon')))
SELECT DISTINCT c.Id FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id AND g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT g.Food, COUNT(DISTINCT r.CustomerId) FROM goods g LEFT JOIN items i ON g.Id = i.Item LEFT JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food
SELECT Food, COUNT(DISTINCT CustomerId) FROM goods INNER JOIN items ON goods.Id = items.Item INNER JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY Food
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'bakery' GROUP BY r.CustomerId HAVING COUNT(DISTINCT r.ReceiptNumber) >= 15
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15
SELECT c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id, c.LastName HAVING COUNT(*) > 10
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) > 10)
SELECT COUNT(*) FROM (SELECT DISTINCT Flavor FROM goods WHERE Food = 'Cake')
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'cake'
SELECT DISTINCT g.Flavor FROM goods g WHERE g.Food LIKE 'Croissant'
SELECT DISTINCT g.Flavor FROM goods g WHERE g.Food = 'croissant'
SELECT DISTINCT goods.Id FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = 15
SELECT DISTINCT G.Id FROM goods G INNER JOIN items I ON G.Id = I.Item INNER JOIN receipts R ON I.Receipt = R.ReceiptNumber WHERE R.CustomerId = 15
SELECT Food, AVG(Price) AS "Average Price", MAX(Price) AS "Maximum Price", MIN(Price) AS "Minimum Price" FROM goods GROUP BY Food
SELECT g.Food, AVG(g.Price) AS Average_Price, MIN(g.Price) AS Minimum_Price, MAX(g.Price) AS Maximum_Price FROM goods g GROUP BY g.Food
SELECT DISTINCT i1.Receipt FROM items i1 JOIN goods g1 ON i1.Item = g1.Id JOIN items i2 ON i1.Receipt = i2.Receipt JOIN goods g2 ON i2.Item = g2.Id WHERE g1.Food = 'Cake' AND g2.Food = 'Cookie'
SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food IN ('cakes', 'cookies') GROUP BY r.ReceiptNumber HAVING MIN(g.Food) <> MAX(g.Food)
SELECT ReceiptNumber FROM receipts WHERE CustomerId IN (SELECT Id FROM customers WHERE LastName = 'LOGAN') AND EXISTS (SELECT * FROM items WHERE Receipt = ReceiptNumber AND Item IN (SELECT Id FROM goods WHERE Food = 'Croissant'))
SELECT ReceiptNumber FROM receipts WHERE CustomerId IN (SELECT Id FROM customers WHERE LastName = 'Logan') AND ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Food = 'croissant'))
SELECT ReceiptNumber, Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price = (SELECT MAX(Price) FROM goods)))
SELECT ReceiptNumber, Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price = (SELECT MAX(Price) FROM goods)))
SELECT goods.Id FROM goods INNER JOIN items ON goods.Id = items.Item GROUP BY goods.Id HAVING COUNT(items.Item) = (SELECT MIN(COUNT) FROM (SELECT COUNT(items.Item) AS COUNT FROM items GROUP BY items.Item))
SELECT goods.Id, goods.Food FROM goods INNER JOIN items ON goods.Id = items.Item GROUP BY items.Item ORDER BY COUNT(items.Item) ASC LIMIT 1
SELECT g.Food, COUNT(g.Id) FROM goods g GROUP BY g.Food
SELECT Food AS TypeOfFood, COUNT(*) AS Total FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice FROM goods GROUP BY Food HAVING AVG(Price) IS NOT NULL
SELECT Food, AVG(Price) AS AvgPrice FROM goods GROUP BY Food HAVING AVG(Price) IS NOT NULL
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5.0
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5.0
SELECT DISTINCT Flavor FROM goods WHERE Food LIKE 'cake' AND Price > 10
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price > 10.00
SELECT DISTINCT g.Id, g.Price FROM goods AS g WHERE g.Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(g.Price) FROM goods AS g)
SELECT DISTINCT g.Id FROM goods g WHERE EXISTS (SELECT 1 FROM goods g2 WHERE g2.Food = 'Tart' AND g.Price < g2.Price)
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(Price) FROM goods t WHERE t.Food LIKE '%Tart%')
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT r.ReceiptNumber FROM receipts r, items i, goods g WHERE r.ReceiptNumber = i.Receipt AND i.Item = g.Id AND g.Price > 13
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 15 GROUP BY r.Date
SELECT Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 15))
SELECT Id FROM goods WHERE Id LIKE '%APP%' COLLATE NOCASE
SELECT Id FROM goods WHERE Id LIKE '%APP%' COLLATE NOCASE
SELECT g.Flavor, g.Price FROM goods g WHERE g.Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT LastName AS CustomerLastName FROM customers ORDER BY CustomerLastName
SELECT LastName AS CustomerLastName FROM customers ORDER BY CustomerLastName
SELECT g.Id FROM goods g ORDER BY g.Id ASC
SELECT DISTINCT Id AS SortedGoods FROM goods ORDER BY SortedGoods
SELECT r.ReceiptNumber FROM receipts r WHERE r.CustomerId = 12 OR EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE i.Receipt = r.ReceiptNumber AND g.Flavor = 'apple' AND g.Food = 'pie')
SELECT r.ReceiptNumber FROM receipts r WHERE r.CustomerId = 12 OR EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE i.Receipt = r.ReceiptNumber AND g.Flavor = 'apple' AND g.Food = 'pie')
SELECT ReceiptNumber, Date FROM receipts WHERE Date = (SELECT MAX(Date) FROM receipts ORDER BY Date DESC LIMIT 1)
SELECT ReceiptNumber, Date FROM receipts WHERE Date = (SELECT MAX(Date) FROM receipts)
SELECT r.ReceiptNumber FROM receipts r WHERE r.Date = (SELECT MIN(Date) FROM receipts) OR r.ReceiptNumber IN (SELECT i.Receipt FROM items i INNER JOIN goods g ON i.Item = g.Id WHERE g.Price > 10)
SELECT r.ReceiptNumber FROM receipts r WHERE r.Date = (SELECT MIN(Date) FROM receipts) OR r.ReceiptNumber IN (SELECT i.Receipt FROM items i INNER JOIN goods g ON i.Item = g.Id WHERE g.Price > 10)
SELECT Id FROM goods WHERE (Food = 'Cookie' OR Food = 'Cake') AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price BETWEEN 3 AND 7 UNION SELECT Id FROM goods WHERE Food = 'Cakes' AND Price BETWEEN 3 AND 7
SELECT FirstName, LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts WHERE Date = (SELECT MIN(Date) FROM receipts))
SELECT (SELECT FirstName || ' ' || LastName FROM customers WHERE Id = r.CustomerId) AS CustomerName FROM receipts r ORDER BY Date ASC LIMIT 1
SELECT AVG(Price) AS AveragePrice FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry') AND Price IS NOT NULL
SELECT Price FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC, Id DESC LIMIT 1
SELECT Id FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT Flavor, MAX(Price), MIN(Price), AVG(Price) FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, MAX(Price), MIN(Price), AVG(Price) FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT min(Price), max(Price), Food FROM goods GROUP BY Food ORDER BY Food
SELECT MIN(g.Price) AS MinPrice, MAX(g.Price) AS MaxPrice, g.Food FROM goods g GROUP BY g.Food ORDER BY g.Food
SELECT Date FROM (SELECT Date, COUNT(*) as ReceiptCount FROM receipts GROUP BY Date) ORDER BY ReceiptCount DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT CustomerId, COUNT(ReceiptNumber) FROM receipts GROUP BY CustomerId ORDER BY COUNT(ReceiptNumber) DESC LIMIT 1
SELECT CustomerId, COUNT(*) AS NumberOfPurchases FROM receipts GROUP BY CustomerId ORDER BY NumberOfPurchases DESC LIMIT 1
SELECT Date, COUNT(DISTINCT CustomerId) AS CustomerCount FROM receipts GROUP BY Date
SELECT receipts.Date, COUNT(DISTINCT receipts.CustomerId) FROM receipts GROUP BY receipts.Date
SELECT FirstName, LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Flavor = 'apple' AND Food = 'Tart')))
SELECT FirstName || ' ' || LastName FROM customers WHERE Id IN (SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tarts')
SELECT g.Id FROM goods g WHERE g.Food = 'Cookies' AND EXISTS (SELECT 1 FROM goods WHERE Food = 'Croissant' AND g.Price < Price)
SELECT Id FROM goods WHERE Food = 'cookies' AND Price < (SELECT Price FROM goods WHERE Food = 'croissant' ORDER BY Price ASC LIMIT 1)
SELECT g.Id FROM goods g WHERE g.Food = 'Cake' AND g.Price >= (SELECT AVG(g2.Price) FROM goods g2 WHERE g2.Flavor = 'Tart')
SELECT Id FROM goods WHERE Food = 'cake' AND Price >= (SELECT AVG(Price) FROM goods g WHERE g.Flavor = 'Tart')
SELECT Id FROM goods WHERE Price > (SELECT 2 * AVG(Price) FROM goods)
SELECT Id FROM goods WHERE Price > (SELECT 2 * AVG(Price) FROM goods)
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT `Id`, `Flavor` FROM `goods` WHERE `Food` = 'Cake' ORDER BY `Flavor`
SELECT `Id`, `Flavor` FROM `goods` WHERE `Food` = 'cake' ORDER BY `Flavor`
SELECT g.Id FROM goods g LEFT JOIN (SELECT Item, COUNT(*) as cnt FROM items GROUP BY Item) i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' AND (i.cnt <= 10 OR i.cnt IS NULL)
SELECT g.Id FROM goods g LEFT JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' GROUP BY g.Id HAVING COUNT(i.Item) <= 10
WITH CakeFlavors AS (SELECT Flavor FROM goods WHERE Food = 'Cake'), TartFlavors AS (SELECT Flavor FROM goods WHERE Food = 'Tart') SELECT Flavor FROM CakeFlavors EXCEPT SELECT Flavor FROM TartFlavors
SELECT DISTINCT Flavor FROM goods AS Cake WHERE Cake.Food = 'Cake' AND NOT EXISTS (SELECT 1 FROM goods AS Tart WHERE Tart.Food = 'Tart' AND Tart.Flavor = Cake.Flavor)
SELECT g.Id FROM goods g JOIN items i ON g.Id = i.Item GROUP BY g.Id ORDER BY COUNT(i.Item) DESC, g.Id ASC LIMIT 3
SELECT g.Id, g.Food, COUNT(*) AS TotalPurchased FROM items i JOIN goods g ON i.Item = g.Id GROUP BY i.Item ORDER BY TotalPurchased DESC LIMIT 3
SELECT customers.Id FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id GROUP BY customers.Id HAVING SUM(goods.Price) > 150
SELECT c.Id FROM customers c WHERE EXISTS (SELECT 1 FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE r.CustomerId = c.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150)
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5
SELECT c.Id FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id GROUP BY c.Id HAVING AVG(g.Price) > 5
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT Date FROM (SELECT r.Date, SUM(g.Price) AS TotalSales FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date) AS Sales WHERE TotalSales > 100
SELECT COUNT(Driver_ID) AS TotalDrivers FROM driver
SELECT COUNT(*) FROM `driver`
SELECT Make, COUNT(*) AS TotalDrivers FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, COUNT(*) AS DriverCount FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) AS AvgAge FROM driver GROUP BY Make
SELECT Make, AVG(Age) AS AvgAge FROM driver GROUP BY Make
SELECT AVG(Laps) FROM driver WHERE driver.Age < 20
SELECT AVG(Laps) FROM driver WHERE Age < 20 AND Laps IS NOT NULL
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner ASC
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner
SELECT `Make` FROM `team` GROUP BY `Make` HAVING COUNT(`Team_ID`) > 1
SELECT t.Make FROM team t GROUP BY t.Make HAVING COUNT(DISTINCT t.Team_ID) > 1
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'
SELECT MAX(`Points`), MIN(`Points`) FROM `driver`
SELECT MAX(Points) AS MaxPoints, MIN(Points) AS MinPoints FROM driver WHERE Points IS NOT NULL
SELECT count(*) FROM `driver` WHERE `Points` < 150
SELECT COUNT(Driver_ID) FROM driver AS drv WHERE drv.Points < 150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT d.Driver FROM driver d ORDER BY d.Age ASC
SELECT D.Driver FROM driver AS D ORDER BY D.Points DESC
SELECT d.Driver FROM driver d ORDER BY d.Points DESC
SELECT drv.Driver, cnt.Country FROM driver drv INNER JOIN country cnt ON drv.Country = cnt.Country_Id
SELECT d.Driver AS DriverName, c.Country AS CountryName FROM driver d INNER JOIN country c ON d.Country = c.Country_Id
SELECT MAX(Points) FROM driver WHERE Country IN (SELECT Country_Id FROM country WHERE Capital = 'Dublin')
SELECT MAX(d.Points) FROM driver AS d JOIN country AS c ON d.Country = c.Country_Id WHERE c.Capital = 'Dublin'
SELECT AVG(d.Age) AS Average_Age FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT AVG(driver.Age) AS AverageAge FROM driver, country WHERE driver.Country = country.Country_Id AND country.Official_native_language = 'English'
SELECT DISTINCT C.Country FROM country AS C, driver AS D WHERE C.Country_Id = D.Country AND D.Points > 150
SELECT DISTINCT c.Country FROM country AS c, driver AS d WHERE c.Country_Id = d.Country AND d.Points > 150
SELECT c.Capital FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Points = (SELECT MAX(Points) FROM driver))
SELECT c.Capital FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Points = (SELECT MAX(Points) FROM driver))
SELECT Make, COUNT(*) FROM driver GROUP BY Make
SELECT Make, COUNT(*) FROM driver GROUP BY Make
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) = (SELECT MAX(DriverCount) FROM (SELECT Make, COUNT(*) AS DriverCount FROM driver GROUP BY Make) tmp)
SELECT d.Make FROM driver d GROUP BY d.Make HAVING COUNT(d.Driver_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Driver_ID) AS Cnt FROM driver GROUP BY Make) AS Sub)
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT Team FROM team t WHERE t.Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT DISTINCT Team_ID FROM team_driver WHERE Driver_ID IS NOT NULL)
SELECT c.Country FROM country c WHERE c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Dodge') AND c.Country_Id IN (SELECT d.Country FROM driver d WHERE d.Make = 'Chevrolet')
SELECT DISTINCT c.Country FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Make = 'Dodge') AND EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Make = 'Chevrolet')
SELECT SUM(d.Points) TotalPoints, AVG(d.Points) AveragePoints FROM driver d
SELECT SUM(Points), AVG(Points) FROM driver
SELECT Country FROM country WHERE NOT EXISTS (SELECT 1 FROM driver WHERE driver.Country = country.Country_Id)
SELECT Country FROM country WHERE NOT EXISTS (SELECT 1 FROM driver WHERE driver.Country = country.Country_Id)
SELECT T.manager, T.sponsor FROM team T, team_driver TD WHERE T.Team_ID = TD.Team_ID GROUP BY T.Team_ID HAVING COUNT(TD.Driver_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Driver_ID) AS Cnt FROM team_driver GROUP BY Team_ID) AS Sub)
SELECT t.Manager, t.Sponsor FROM team t INNER JOIN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) = (SELECT MAX(c) FROM (SELECT COUNT(Driver_ID) AS c FROM team_driver GROUP BY Team_ID) tmp)) td ON t.Team_ID = td.Team_ID
SELECT manager, car_owner FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID HAVING COUNT(td.Driver_ID) >= 2
SELECT Manager, Car_Owner FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID HAVING COUNT(DISTINCT td.Driver_ID) >= 2
SELECT COUNT(DISTINCT Institution_ID) FROM institution
SELECT COUNT(DISTINCT Institution_ID) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC, Enrollment DESC
SELECT institution.Name FROM institution ORDER BY institution.Founded ASC
SELECT City AS CityName, Province AS ProvinceName FROM institution
SELECT City AS CityName, Province AS ProvinceName FROM institution
SELECT MAX(Enrollment) AS Max_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM institution
SELECT MAX(Enrollment) "Maximum Enrollment", MIN(Enrollment) "Minimum Enrollment" FROM institution
SELECT Affiliation FROM institution WHERE NOT City = 'Vancouver'
SELECT Affiliation FROM institution WHERE NOT City = 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC;
SELECT i.Stadium FROM institution AS i ORDER BY i.Capacity DESC
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution i)
SELECT Name AS InstitutionName, Nickname AS InstitutionNickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT Name AS InstitutionName, Nickname AS InstitutionNickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT Nickname FROM Championship, institution WHERE Championship.Institution_ID = institution.Institution_ID ORDER BY institution.Enrollment ASC LIMIT 1
SELECT C.Nickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT Name FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID ORDER BY Number_of_Championships DESC
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship ORDER BY Number_of_Championships DESC)
SELECT institution.Name FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID WHERE c.Number_of_Championships >= 1
SELECT SUM(Number_of_Championships) FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID WHERE Affiliation = 'public'
SELECT TOTAL(Championship.Number_of_Championships) FROM institution, Championship WHERE institution.Institution_ID = Championship.Institution_ID AND institution.Affiliation = 'Public'
SELECT DISTINCT Affiliation, COUNT(*) OVER (PARTITION BY Affiliation) FROM institution
SELECT Affiliation, COUNT(*) AS InstitutionCount FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM institution GROUP BY Affiliation))
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM institution GROUP BY Affiliation) AS SubQuery)
SELECT DISTINCT Founded FROM institution WHERE (SELECT COUNT(*) FROM institution AS inst WHERE inst.Founded = institution.Founded) > 1
SELECT Founded, COUNT(*) AS InstitutionsCount FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT c.Nickname FROM Championship c, institution i WHERE c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC
SELECT C.Nickname FROM institution I, Championship C WHERE I.Institution_ID = C.Institution_ID ORDER BY I.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE (City = 'Vancouver' OR City = 'Calgary') AND Enrollment IS NOT NULL
SELECT Enrollment FROM institution WHERE (City = 'Vancouver' OR City = 'Calgary')
SELECT i1.Province FROM institution i1 WHERE i1.Founded < 1920 INTERSECT SELECT i2.Province FROM institution i2 WHERE i2.Founded > 1950
SELECT DISTINCT i.Province FROM institution i WHERE i.Founded < 1920 AND i.Province IN (SELECT Province FROM institution WHERE Founded > 1950)
SELECT COUNT(Province) FROM (SELECT DISTINCT Province FROM institution) AS unique_provinces
SELECT COUNT(*) FROM (SELECT DISTINCT Province FROM institution AS i)
SELECT W.* FROM Warehouses W
SELECT W.* FROM Warehouses W
SELECT DISTINCT Contents FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location = 'New York'
SELECT DISTINCT Contents FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150.0
SELECT Contents FROM Boxes WHERE Value > 150.0
SELECT Warehouse, AVG(Value) AS AvgValue FROM Boxes GROUP BY Warehouse
SELECT AVG(Value), Warehouse FROM Boxes GROUP BY Warehouse HAVING AVG(Value) IS NOT NULL
SELECT AVG(Value) as AvgValue, SUM(Value) as SumValue FROM Boxes
SELECT AVG(Value) as AverageValue, SUM(Value) as TotalValue FROM Boxes
SELECT AVG(Capacity) AS Average_Capacity, SUM(Capacity) AS Total_Capacity FROM Warehouses
SELECT AVG(Warehouses.Capacity), SUM(Warehouses.Capacity) FROM Warehouses
SELECT b.Contents, MAX(b.Value) AS MaximumValue, AVG(b.Value) AS AverageValue FROM Boxes b GROUP BY b.Contents
SELECT Contents, AVG(Value) as AvgValue, MAX(Value) as MaxValue FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents HAVING SUM(Value) = (SELECT MAX(TotalValue) FROM (SELECT SUM(Value) AS TotalValue FROM Boxes GROUP BY Contents) AS SubQuery)
SELECT B.Contents FROM Boxes B ORDER BY B.Value DESC LIMIT 1
SELECT AVG(Value) AS AverageValue FROM Boxes
SELECT AVG(Value) AS AverageValue FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes WHERE Contents IS NOT NULL
SELECT COUNT(DISTINCT B.Contents) FROM Boxes B
SELECT DISTINCT W.Location AS Location FROM Warehouses AS W
SELECT Location FROM Warehouses GROUP BY Location
SELECT Boxes.Code FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT Boxes.Code FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT SUM(Value) FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT SUM(Value) FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago' UNION SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT B.Contents FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York') GROUP BY B.Contents HAVING COUNT(DISTINCT W.Location) = 2
SELECT DISTINCT Contents FROM Boxes EXCEPT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'New York') AND Contents NOT IN (SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York'))
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' EXCEPT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes B WHERE B.Contents = 'Rocks' AND NOT EXISTS (SELECT 1 FROM Boxes B2 WHERE B2.Warehouse = B.Warehouse AND B2.Contents = 'Scissors'))
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' INTERSECT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' INTERSECT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT B.Code, B.Contents FROM Boxes AS B ORDER BY B.Value ASC
SELECT `Code`, `Contents` FROM `Boxes` ORDER BY `Value`
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes) GROUP BY Contents
SELECT DISTINCT B.Contents FROM Boxes AS B WHERE B.Value > (SELECT AVG(B2.Value) FROM Boxes AS B2)
SELECT DISTINCT Contents FROM Boxes ORDER BY 1
SELECT DISTINCT Contents FROM Boxes ORDER BY 1
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes b WHERE b.Contents = 'Rocks')
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes b WHERE b.Contents = 'Rocks')
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors') GROUP BY Code, Contents
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > (SELECT MAX(B2.Value) FROM Boxes B2 WHERE B2.Contents LIKE '%Scissors%')
SELECT SUM(b.Value) FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code AND w.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT SUM(Value) FROM Boxes b WHERE EXISTS (SELECT 1 FROM Warehouses w WHERE w.Code = b.Warehouse AND w.Capacity = (SELECT MAX(Capacity) FROM Warehouses))
SELECT b.Warehouse, AVG(b.Value) FROM Boxes AS b GROUP BY b.Warehouse HAVING AVG(b.Value) > 150
SELECT Warehouse, AVG(Value) AS AverageValue FROM Boxes GROUP BY Warehouse HAVING AverageValue > 150
SELECT Contents, COUNT(*) AS BoxCount, SUM(Value) AS TotalValue FROM Boxes GROUP BY Contents
SELECT b.Contents, SUM(b.Value) AS TotalValue, COUNT(b.Code) AS NumberOfBoxes FROM Boxes b GROUP BY b.Contents
SELECT Location AS WarehouseLocation, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AvgCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT Location AS WarehouseLocation, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AvgCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT SUM(Warehouses.Capacity) FROM Warehouses
SELECT SUM(Warehouses.Capacity) FROM Warehouses
SELECT W.Location, MAX(B.Value) FROM Warehouses W, Boxes B WHERE W.Code = B.Warehouse GROUP BY W.Location
SELECT Location, MAX(Value) FROM Warehouses w INNER JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Location
SELECT Code, (SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code) AS NumberOfBoxes FROM Warehouses
SELECT Warehouse, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Warehouse
SELECT COUNT(DISTINCT Location) FROM Warehouses WHERE EXISTS (SELECT 1 FROM Boxes WHERE Boxes.Warehouse = Warehouses.Code AND Boxes.Contents = 'Rocks')
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents IN ('Rocks')
SELECT b.Code, w.Location FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code
SELECT b.Code, w.Location FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code
SELECT Code FROM Boxes WHERE EXISTS (SELECT 1 FROM Warehouses WHERE Warehouses.Code = Boxes.Warehouse AND Location = 'Chicago')
SELECT Code FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT COUNT(Code), Warehouse FROM Boxes GROUP BY Warehouse
SELECT Warehouse AS Warehouse_Code, COUNT(Code) AS Box_Count FROM Boxes GROUP BY Warehouse
SELECT b.Warehouse, COUNT(DISTINCT b.Contents) FROM Boxes b GROUP BY b.Warehouse
SELECT Warehouse AS Warehouse_Code, COUNT(DISTINCT Contents) AS Unique_Contents FROM Boxes GROUP BY Warehouse_Code
SELECT W.Code FROM Warehouses W WHERE (SELECT COUNT(*) FROM Boxes B WHERE B.Warehouse = W.Code) > W.Capacity
SELECT Warehouses.Code FROM Warehouses INNER JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING COUNT(Boxes.Code) > Warehouses.Capacity
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT university.University_Name, university.City, university.State FROM university ORDER BY university.University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY 1
SELECT COUNT(1) FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT COUNT(*) FROM university u WHERE u.State = 'Illinois' OR u.State = 'Ohio'
SELECT MAX(Enrollment) 'Max Enrollment', AVG(Enrollment) 'Average Enrollment', MIN(Enrollment) 'Min Enrollment' FROM university
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university AS u)
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(u.Enrollment) FROM university u)
SELECT Home_Conference FROM university WHERE Home_Conference IS NOT NULL
SELECT DISTINCT Home_Conference FROM university
SELECT u.Home_Conference, COUNT(*) FROM university u GROUP BY u.Home_Conference
SELECT Home_Conference, COUNT(*) AS Count_of_Universities FROM university GROUP BY Home_Conference
SELECT State FROM university GROUP BY State HAVING COUNT(University_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(University_ID) AS Count FROM university GROUP BY State) AS Counts)
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM university GROUP BY State) AS Counts)
SELECT DISTINCT Home_Conference FROM university WHERE Home_Conference IN (SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000)
SELECT u.Home_Conference FROM university u GROUP BY u.Home_Conference HAVING AVG(u.Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(Total_Enrollment) FROM (SELECT SUM(Enrollment) AS Total_Enrollment FROM university GROUP BY Home_Conference) AS SubQuery)
SELECT Home_Conference FROM (SELECT Home_Conference, SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) AS subquery WHERE total_enrollment = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) T)
SELECT `Major_Name`, `Major_Code` FROM `major` ORDER BY `Major_Code` ASC
SELECT m.Major_Name, m.Major_Code FROM major AS m ORDER BY m.Major_Code
SELECT m.Major_Name, mr.Rank FROM university u, major_ranking mr, major m WHERE u.University_ID = mr.University_ID AND mr.Major_ID = m.Major_ID AND u.University_Name = 'Augustana College'
SELECT R.Rank, M.Major_Name FROM university U JOIN major_ranking R ON U.University_ID = R.University_ID JOIN major M ON R.Major_ID = M.Major_ID WHERE U.University_Name = 'Augustana College'
SELECT u.University_Name, u.City, u.State FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank = 1 AND mr.University_ID = u.University_ID)
SELECT u.University_Name, u.City, u.State FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank = 1 AND mr.University_ID = u.University_ID)
SELECT u.University_Name FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr WHERE mr.University_ID = u.University_ID AND mr.Rank = 1 GROUP BY mr.University_ID HAVING COUNT(mr.Major_ID) = (SELECT MAX(COUNT) FROM (SELECT COUNT(mr.Major_ID) AS COUNT FROM major_ranking mr WHERE mr.Rank = 1 GROUP BY mr.University_ID) t))
SELECT u.University_Name FROM university u WHERE u.University_ID IN (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID HAVING COUNT(Major_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Major_ID) AS Cnt FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) tmp))
SELECT U.University_Name FROM university U WHERE NOT EXISTS (SELECT 1 FROM major_ranking M WHERE M.University_ID = U.University_ID AND M.Rank = 1)
SELECT u.University_Name FROM university u WHERE u.University_ID NOT IN (SELECT DISTINCT University_ID FROM major_ranking WHERE Rank = 1)
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') INTERSECT SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education'))
SELECT u.University_Name FROM university u WHERE 2 = (SELECT COUNT(DISTINCT m.Major_Name) FROM major m JOIN major_ranking mr ON m.Major_ID = mr.Major_ID WHERE mr.University_ID = u.University_ID AND m.Major_Name IN ('Accounting', 'Urban Education'))
SELECT university.University_Name, overall_ranking.Rank FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID WHERE university.State = 'Wisconsin'
SELECT university.University_Name, overall_ranking.Rank FROM university, overall_ranking WHERE university.University_ID = overall_ranking.University_ID AND university.State = 'Wisconsin'
SELECT u.University_Name FROM university u WHERE EXISTS (SELECT 1 FROM overall_ranking o WHERE o.University_ID = u.University_ID AND o.Research_point = (SELECT MAX(Research_point) FROM overall_ranking))
SELECT u.University_Name FROM university u JOIN overall_ranking r ON u.University_ID = r.University_ID ORDER BY r.Research_point DESC LIMIT 1
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point
SELECT University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point ASC
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE Major_Name = 'Accounting' AND Rank <= 3)
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking JOIN major ON major_ranking.Major_ID = major.Major_ID WHERE Major_Name = 'Accounting' AND Rank <= 3)
SELECT SUM(Enrollment) FROM university u, overall_ranking o WHERE u.University_ID = o.University_ID AND o.Rank <= 5
SELECT TOTAL(Enrollment) FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank <= 5)
SELECT u.University_Name, o.Citation_point FROM university u LEFT JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Reputation_point >= 3
SELECT U.University_Name, O.Citation_point FROM university U, overall_ranking O WHERE U.University_ID = O.University_ID ORDER BY O.Reputation_point DESC LIMIT 3
SELECT u.State FROM university u WHERE u.Enrollment < 3000 GROUP BY u.State HAVING COUNT(u.University_ID) > 2
SELECT u.State FROM university u WHERE u.Enrollment < 3000 GROUP BY u.State HAVING COUNT(u.University_ID) > 2
SELECT M.Title FROM Movies M WHERE M.Rating IS NULL OR M.Rating = ''
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT M.Title FROM Movies M WHERE M.Rating = 'G'
SELECT M.Title FROM Movies M WHERE M.Rating = 'G'
SELECT Title FROM Movies WHERE EXISTS (SELECT 1 FROM MovieTheaters WHERE MovieTheaters.Movie = Movies.Code AND MovieTheaters.Name = 'Odeon')
SELECT M.Title FROM Movies AS M, MovieTheaters AS MT WHERE M.Code = MT.Movie AND MT.Name = 'Odeon'
SELECT Movies.Title AS MovieName, MovieTheaters.Name AS TheaterName FROM Movies, MovieTheaters WHERE Movies.Code = MovieTheaters.Movie
SELECT m.Title AS MovieTitle, t.Name AS TheaterName FROM Movies m, MovieTheaters t WHERE m.Code = t.Movie
SELECT COUNT(*) FROM Movies WHERE LOWER(Rating) = 'g'
SELECT COUNT(*) FROM Movies WHERE LOWER(Rating) = 'g'
SELECT COUNT(*) FROM (SELECT Movie FROM MovieTheaters GROUP BY Movie)
SELECT COUNT(DISTINCT mt.Movie) FROM MovieTheaters mt WHERE mt.Movie IS NOT NULL
SELECT COUNT(DISTINCT MovieTheaters.Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT mt.Movie) FROM MovieTheaters mt WHERE mt.Movie IS NOT NULL
SELECT COUNT(MovieTheaters.Code) FROM MovieTheaters
SELECT COUNT(MovieTheaters.Code) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT mt.Name FROM MovieTheaters mt, Movies m WHERE mt.Movie = m.Code AND (m.Rating = 'G' OR m.Rating = 'PG')
SELECT mt.Name FROM MovieTheaters mt, Movies m WHERE mt.Movie = m.Code AND (m.Rating = 'G' OR m.Rating = 'PG')
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon' UNION SELECT Movie FROM MovieTheaters WHERE Name = 'Imperial')
SELECT M.Title FROM Movies AS M JOIN MovieTheaters AS MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial')
SELECT DISTINCT M.Title FROM Movies M, MovieTheaters MT1, MovieTheaters MT2 WHERE M.Code = MT1.Movie AND M.Code = MT2.Movie AND MT1.Name = 'Odeon' AND MT2.Name = 'Imperial'
SELECT M.Title FROM Movies M WHERE EXISTS (SELECT 1 FROM MovieTheaters MT1 WHERE MT1.Movie = M.Code AND MT1.Name = 'Odeon') AND EXISTS (SELECT 1 FROM MovieTheaters MT2 WHERE MT2.Movie = M.Code AND MT2.Name = 'Imperial')
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon' AND Movie IS NOT NULL)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies ORDER BY LOWER(Title) ASC
SELECT m.Title FROM Movies m ORDER BY m.Title ASC
SELECT Title FROM Movies ORDER BY Rating ASC, Code ASC
SELECT Title FROM Movies ORDER BY Rating, Title
SELECT Name FROM MovieTheaters MT WHERE EXISTS (SELECT 1 FROM MovieTheaters WHERE Movie = MT.Movie GROUP BY Movie ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Name FROM MovieTheaters GROUP BY Movie HAVING COUNT(Movie) = (SELECT MAX(CountedMovies) FROM (SELECT COUNT(Movie) AS CountedMovies FROM MovieTheaters GROUP BY Movie) AS MovieCounts)
SELECT Title FROM Movies JOIN (SELECT Movie, COUNT(*) AS Count FROM MovieTheaters GROUP BY Movie) AS TheaterCounts ON Movies.Code = TheaterCounts.Movie ORDER BY TheaterCounts.Count DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie GROUP BY M.Title ORDER BY COUNT(*) DESC LIMIT 1
SELECT Rating, COUNT(*) AS TotalMovies FROM Movies GROUP BY Rating
SELECT Rating, COUNT(Code) AS TotalMovies FROM Movies GROUP BY Rating
SELECT COUNT(Code) AS NumberOfMoviesWithRating FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) AS NumberOfMoviesWithRating FROM Movies WHERE Rating IS NOT NULL
SELECT Name FROM MovieTheaters WHERE EXISTS (SELECT 1 FROM Movies WHERE Movies.Code = MovieTheaters.Movie)
SELECT Name FROM MovieTheaters WHERE EXISTS (SELECT Code FROM Movies WHERE Movies.Code = MovieTheaters.Movie)
SELECT Name FROM MovieTheaters WHERE Movie NOT IN (SELECT Code FROM Movies WHERE Code IS NOT NULL)
SELECT mt.Name FROM MovieTheaters mt LEFT JOIN Movies m ON mt.Movie = m.Code WHERE mt.Movie IS NULL
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT Title FROM Movies WHERE Title IS NOT NULL
SELECT Title FROM Movies WHERE Title IS NOT NULL
SELECT DISTINCT Rating AS DistinctRatings FROM Movies
SELECT DISTINCT(Rating) FROM Movies
SELECT M.* FROM Movies M WHERE M.Rating IS NULL
SELECT Movies.Code, Movies.Title, Movies.Rating FROM Movies WHERE Movies.Rating IS NULL
SELECT m.Title FROM Movies m LEFT OUTER JOIN MovieTheaters mt ON m.Code = mt.Movie WHERE mt.Movie IS NULL
SELECT M.Title FROM Movies M LEFT JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Movie IS NULL
SELECT Client.Name FROM Client JOIN Package ON Client.AccountNumber = Package.Recipient ORDER BY Package.Weight DESC LIMIT 1
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Recipient FROM Package WHERE Weight = (SELECT MAX(Weight) FROM Package))
SELECT SUM(Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber AND Client.Name = 'Leo Wong'
SELECT SUM(P.Weight) FROM Package P, Client C WHERE P.Sender = C.AccountNumber AND C.Name = 'Leo Wong'
SELECT Employee.Position FROM Employee WHERE Employee.Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name LIKE 'Amy Wong'
SELECT Employee.Position, Employee.Salary FROM Employee WHERE Employee.Name = 'Turanga Leela'
SELECT Employee.Position, Employee.Salary FROM Employee WHERE Employee.Name = 'Turanga Leela'
SELECT AVG(Salary) FROM Employee WHERE LOWER(Position) = 'intern'
SELECT AVG(Salary) FROM Employee WHERE LOWER(Position) = 'intern'
SELECT H.Level FROM Has_Clearance AS H INNER JOIN Employee AS E ON H.Employee = E.EmployeeID WHERE E.Position = 'Physician'
SELECT Has_Clearance.Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'physician'
SELECT p.PackageNumber FROM Package p LEFT JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package WHERE EXISTS (SELECT 1 FROM Client WHERE Client.AccountNumber = Package.Sender AND Client.Name = 'Leo Wong')
SELECT P.PackageNumber FROM Package P INNER JOIN Client C ON P.Recipient = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT p.PackageNumber FROM Package AS p, Client AS c WHERE p.Recipient = c.AccountNumber AND c.Name = 'Leo Wong'
SELECT P.Contents, P.Weight, P.PackageNumber FROM Package P WHERE P.Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR P.Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT DISTINCT p.PackageNumber FROM Package p, Client c WHERE (p.Sender = c.AccountNumber OR p.Recipient = c.AccountNumber) AND c.Name = 'Leo Wong'
SELECT count(*) FROM Package JOIN Client AS Sender ON Package.Sender = Sender.AccountNumber JOIN Client AS Recipient ON Package.Recipient = Recipient.AccountNumber WHERE Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package INNER JOIN Client AS Sender ON Package.Sender = Sender.AccountNumber INNER JOIN Client AS Recipient ON Package.Recipient = Recipient.AccountNumber WHERE Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT P.Contents FROM Package P INNER JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'John Zoidfarb'
SELECT Contents FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'John Zoidfarb')
SELECT p.PackageNumber, p.Weight FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name LIKE '%John%' ORDER BY p.Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name LIKE 'John%') ORDER BY Weight DESC LIMIT 1
SELECT p.PackageNumber, p.Weight FROM Package p ORDER BY p.Weight ASC LIMIT 3
SELECT p.PackageNumber, p.Weight FROM Package p ORDER BY p.Weight ASC LIMIT 3
SELECT Client.Name, COUNT(*) AS PackageCount FROM Client, Package WHERE Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Package GROUP BY Sender) AS MaxCount)
SELECT Client.Name, COUNT(Package.Sender) FROM Client INNER JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.Name ORDER BY COUNT(Package.Sender) DESC LIMIT 1
SELECT C.Name, COUNT(P.Recipient) AS PackageCount FROM Client C LEFT JOIN Package P ON C.AccountNumber = P.Recipient GROUP BY C.AccountNumber ORDER BY PackageCount ASC LIMIT 1
SELECT MIN(PackageCounts.count), Client.Name FROM Client JOIN (SELECT Recipient, COUNT(*) AS count FROM Package GROUP BY Recipient) AS PackageCounts ON Client.AccountNumber = PackageCounts.Recipient
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Sender FROM Package GROUP BY Sender HAVING COUNT(Shipment) > 1)
SELECT C.Name FROM Client C WHERE EXISTS (SELECT NULL FROM Package P WHERE P.Sender = C.AccountNumber GROUP BY P.Sender HAVING COUNT(*) > 1)
SELECT Coordinates FROM Planet WHERE LOWER(Name) = 'mars'
SELECT Coordinates FROM Planet WHERE UPPER(Name) = 'MARS'
SELECT `Name`, `Coordinates` FROM `Planet` ORDER BY `Name` ASC
SELECT `Name`, `Coordinates` FROM `Planet` ORDER BY `Name` ASC
SELECT ShipmentID FROM Shipment WHERE Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Phillip J. Fry')
SELECT DISTINCT Shipment.ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J Fry'
SELECT shipment.Date FROM Shipment shipment
SELECT Shipment.Date FROM Shipment
SELECT Shipment.ShipmentID FROM Shipment, Planet WHERE Shipment.Planet = Planet.PlanetID AND Planet.Name = 'Mars';
SELECT Shipment.ShipmentID FROM Shipment LEFT JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';
SELECT ShipmentID FROM Shipment WHERE Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela') AND Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars')
SELECT s.ShipmentID FROM Shipment s WHERE s.Manager = (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela') AND s.Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars')
SELECT s.ShipmentID FROM Shipment s JOIN Planet p ON s.Planet = p.PlanetID JOIN Employee e ON s.Manager = e.EmployeeID WHERE p.Name = 'Mars' OR e.Name = 'Turanga Leela'
SELECT ShipmentID FROM Shipment WHERE Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela') AND Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars')
SELECT P.Name, COUNT(S.ShipmentID) AS TotalShipments FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.PlanetID, P.Name
SELECT Name, COUNT(ShipmentID) FROM Planet LEFT JOIN Shipment ON PlanetID = Planet GROUP BY PlanetID
SELECT p.Name FROM Planet p WHERE p.PlanetID = (SELECT s.Planet FROM Shipment s GROUP BY s.Planet ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Name FROM Planet ORDER BY (SELECT COUNT(*) FROM Shipment WHERE Shipment.Planet = Planet.PlanetID) DESC LIMIT 1
SELECT e.Name AS Manager, COUNT(s.ShipmentID) AS Shipments FROM Employee e LEFT JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.EmployeeID, e.Name
SELECT e.Name, COUNT(s.ShipmentID) AS ShipmentsCount FROM Shipment s LEFT JOIN Employee e ON s.Manager = e.EmployeeID GROUP BY e.EmployeeID, e.Name
SELECT sum(Weight) FROM Package INNER JOIN Shipment ON Package.Shipment = Shipment.ShipmentID INNER JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT SUM(pkg.Weight) FROM Package AS pkg JOIN Shipment AS s ON pkg.Shipment = s.ShipmentID JOIN Planet AS p ON s.Planet = p.PlanetID WHERE p.Name = 'Mars'
SELECT p.Name, TotalWeight FROM Planet p JOIN (SELECT s.Planet, SUM(pkg.Weight) AS TotalWeight FROM Shipment s JOIN Package pkg ON s.ShipmentID = pkg.Shipment GROUP BY s.Planet) AS PlanetWeights ON p.PlanetID = PlanetWeights.Planet
SELECT Planet.Name, TotalWeight FROM Planet JOIN (SELECT Shipment.Planet, SUM(Package.Weight) AS TotalWeight FROM Shipment JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Shipment.Planet) AS WeightData ON Planet.PlanetID = WeightData.Planet
SELECT Planet.Name FROM Planet INNER JOIN Shipment ON Planet.PlanetID = Shipment.Planet INNER JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.PlanetID HAVING SUM(Package.Weight) > 30
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Planet FROM Shipment, Package WHERE Shipment.ShipmentID = Package.Shipment GROUP BY Planet HAVING SUM(Package.Weight) > 30)
SELECT p.PackageNumber FROM Package p, Shipment s, Planet pl, Client c WHERE p.Shipment = s.ShipmentID AND s.Planet = pl.PlanetID AND p.Sender = c.AccountNumber AND pl.Name = 'Omicron Persei 8' AND c.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8')) AND Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan')
SELECT PackageNumber FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8')) OR Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan')
SELECT COUNT(*) FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment, Planet, Employee WHERE Shipment.Planet = Planet.PlanetID AND Shipment.Manager = Employee.EmployeeID AND (Planet.Name = 'Omicron Persei 8' OR Employee.Name = 'Zapp Brannigan'))
SELECT p.PackageNumber, p.Weight FROM Package p WHERE p.Weight >= 10 AND p.Weight <= 30
SELECT p.PackageNumber, p.Weight FROM Package p WHERE p.Weight >= 10 AND p.Weight <= 30
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE p.Name = 'Mars')
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance h JOIN Planet p ON h.Planet = p.PlanetID WHERE p.Name = 'Mars')
SELECT Name FROM Employee e WHERE EXISTS (SELECT * FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE hc.Employee = e.EmployeeID AND p.Name = 'Omega III')
SELECT E.Name FROM Employee E WHERE EXISTS (SELECT * FROM Has_Clearance H JOIN Planet P ON H.Planet = P.PlanetID WHERE E.EmployeeID = H.Employee AND P.Name = 'Omega III')
SELECT P.Name FROM Planet P WHERE 1 = (SELECT COUNT(DISTINCT Employee) FROM Has_Clearance H WHERE H.Planet = P.PlanetID)
SELECT p.Name FROM Planet p INNER JOIN Has_Clearance h ON p.PlanetID = h.Planet GROUP BY p.PlanetID HAVING COUNT(DISTINCT h.Employee) = 1
SELECT Employee.Name FROM Employee WHERE Employee.Salary >= 5000 AND Employee.Salary <= 10000
SELECT Name FROM Employee WHERE Salary > 4999 AND Salary < 10001
SELECT Name FROM Employee WHERE Salary > 5000 UNION SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee)
SELECT E.Name FROM Employee E WHERE E.Salary > (SELECT AVG(Salary) FROM Employee) OR E.Salary > 5000
SELECT COUNT(*) FROM Employee e WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE p.Name = 'Mars' AND hc.Employee = e.EmployeeID)
SELECT COUNT(*) FROM Employee e WHERE NOT EXISTS (SELECT NULL FROM Has_Clearance hc INNER JOIN Planet p ON hc.Planet = p.PlanetID WHERE hc.Employee = e.EmployeeID AND p.Name = 'Mars')
SELECT COUNT(Game_ID) FROM game
SELECT COUNT(Game_ID) FROM game
SELECT game.Title, game.Developers FROM game ORDER BY game.Units_sold_Millions DESC
SELECT game.Title, game.Developers FROM game ORDER BY game.Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT platform.Platform_name, platform.Market_district FROM platform
SELECT `Platform_name`, `Market_district` FROM `platform`
SELECT platform.Platform_name, platform.Platform_ID FROM platform WHERE platform.Download_rank = 1
SELECT platform.Platform_name, platform.Platform_ID FROM platform WHERE platform.Download_rank = 1
SELECT MAX(player.Rank_of_the_year) AS HighestRank, MIN(player.Rank_of_the_year) AS LowestRank FROM player
SELECT max(Rank_of_the_year), min(Rank_of_the_year) FROM player
SELECT COUNT(*) AS NumberOfPlayers FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(1) FROM player WHERE Rank_of_the_year <= 3
SELECT player.Player_name FROM player ORDER BY player.Player_name ASC
SELECT player.Player_name FROM player ORDER BY player.Player_name ASC
SELECT p.Player_name, p.College FROM player p ORDER BY p.Rank_of_the_year DESC
SELECT p.Player_name, p.College FROM player p ORDER BY p.Rank_of_the_year DESC
SELECT p.Player_name, p.Rank_of_the_year FROM player p WHERE p.Player_ID IN (SELECT gp.Player_ID FROM game_player gp INNER JOIN game g ON gp.Game_ID = g.Game_ID WHERE g.Title = 'Super Mario World')
SELECT p.Player_name, p.Rank_of_the_year FROM player p WHERE EXISTS (SELECT 1 FROM game_player gp JOIN game g ON gp.Game_ID = g.Game_ID WHERE gp.Player_ID = p.Player_ID AND g.Title = 'Super Mario World')
SELECT DISTINCT Developers FROM game, game_player, player WHERE game.Game_ID = game_player.Game_ID AND game_player.Player_ID = player.Player_ID AND player.College = 'Auburn'
SELECT DISTINCT Developers FROM game, game_player, player WHERE game.Game_ID = game_player.Game_ID AND game_player.Player_ID = player.Player_ID AND player.College = 'Auburn'
SELECT AVG(Units_sold_Millions) FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.Position = 'Guard')
SELECT AVG(Units_sold_Millions) FROM game g WHERE EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard' AND gp.Game_ID = g.Game_ID)
SELECT g.Title AS GameTitle, p.Platform_name AS PlatformName FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT g.Title, p.Platform_name FROM game AS g INNER JOIN platform AS p ON g.Platform_ID = p.Platform_ID
SELECT game.Title FROM game INNER JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Market_district = 'Asia' OR platform.Market_district = 'USA'
SELECT game.Title FROM game INNER JOIN platform ON game.Platform_ID = platform.Platform_ID WHERE platform.Market_district = 'Asia' OR platform.Market_district = 'USA'
SELECT Franchise, COUNT(Game_ID) AS GameCount FROM game GROUP BY Franchise
SELECT Franchise AS GameFranchise, COUNT(*) AS TotalGames FROM game GROUP BY GameFranchise
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM game GROUP BY Franchise) AS Counts)
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) = (SELECT MAX(GameCount) FROM (SELECT COUNT(*) AS GameCount FROM game GROUP BY Franchise) tmp)
SELECT DISTINCT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) > 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(DISTINCT Game_ID) >= 2
SELECT p.Player_name FROM player p WHERE p.Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT p.Player_name FROM player p LEFT OUTER JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Game_ID IS NULL
SELECT Title FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player gp INNER JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Oklahoma') AND Game_ID IN (SELECT Game_ID FROM game_player gp INNER JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn')
SELECT DISTINCT game.Title FROM game INNER JOIN game_player ON game.Game_ID = game_player.Game_ID INNER JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Oklahoma' OR player.College = 'Auburn'
SELECT DISTINCT Franchise FROM game WHERE Franchise <> ''
SELECT DISTINCT Franchise FROM game WHERE Franchise <> ''
SELECT g.Title FROM game g WHERE NOT EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.Position = 'Guard')
SELECT g.Title FROM game g LEFT JOIN (SELECT gp.Game_ID FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard') AS sub ON g.Game_ID = sub.Game_ID WHERE sub.Game_ID IS NULL
SELECT press.Name AS PressName FROM press ORDER BY press.Year_Profits_billion DESC
SELECT p.Name FROM press p ORDER BY p.Year_Profits_billion DESC
SELECT Name FROM press WHERE (Year_Profits_billion > 15) OR (Month_Profits_billion > 1)
SELECT Name FROM press WHERE (Year_Profits_billion > 15) OR (Month_Profits_billion > 1)
SELECT AVG(Year_Profits_billion) "Average Annual Profit", MAX(Year_Profits_billion) "Maximum Annual Profit" FROM press
SELECT Press_ID, AVG(Year_Profits_billion) AS AvgYearlyProfit, MAX(Year_Profits_billion) AS MaxYearlyProfit FROM press GROUP BY Press_ID
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press AS p WHERE p.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT p.Name FROM press p WHERE p.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR p.Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT COUNT(Author_ID) FROM author WHERE Age < 30
SELECT count(Author_ID) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender
SELECT Gender, AVG(Age) AS AverageAge FROM author GROUP BY Gender
SELECT Gender, COUNT(Author_ID) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(Author_ID) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(Book_ID) AS NumberOfBooks FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(*) FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 OR Sale_Amount < 500 GROUP BY Book_Series HAVING COUNT(DISTINCT CASE WHEN Sale_Amount > 1000 THEN 'high' WHEN Sale_Amount < 500 THEN 'low' END) = 2
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 OR Sale_Amount < 500 GROUP BY Book_Series HAVING COUNT(DISTINCT CASE WHEN Sale_Amount > 1000 THEN 'high' WHEN Sale_Amount < 500 THEN 'low' END) = 2
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'MM') AND EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'LT')
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'MM') AND EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'LT')
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT b.Author_ID FROM book b WHERE b.Author_ID IS NOT NULL)
SELECT a.Name FROM author a LEFT JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Book_ID IS NULL
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID GROUP BY b.Author_ID HAVING COUNT(*) > 1)
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID GROUP BY b.Author_ID HAVING COUNT(*) > 1)
SELECT b.Title AS BookTitle, a.Name AS AuthorName, p.Name AS PressName FROM book b, author a, press p WHERE b.Author_ID = a.Author_ID AND b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT b.Title AS BookTitle, a.Name AS AuthorName, p.Name AS PressName FROM book b, author a, press p WHERE b.Author_ID = a.Author_ID AND b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT press.Name, SUM(book.Sale_Amount) FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID
SELECT p.Name, SUM(b.Sale_Amount) AS Total_Sales FROM press AS p INNER JOIN book AS b ON p.Press_ID = b.Press_ID GROUP BY p.Name
SELECT p.Name, COUNT(b.Book_ID) FROM press p, book b WHERE p.Press_ID = b.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Press_ID
SELECT p.Name, COUNT(b.Book_ID) FROM press p INNER JOIN book b ON p.Press_ID = b.Press_ID WHERE b.Sale_Amount > 1000 GROUP BY p.Press_ID
SELECT a.Name FROM author a WHERE a.Author_ID = (SELECT b.Author_ID FROM book b ORDER BY b.Sale_Amount DESC LIMIT 1)
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID ORDER BY b.Sale_Amount DESC LIMIT 1)
SELECT author.Name, author.Gender FROM author JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID HAVING COUNT(book.Book_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Book_ID) AS Cnt FROM book GROUP BY Author_ID) tmp)
SELECT author.Name, author.Gender FROM author JOIN book ON author.Author_ID = book.Author_ID GROUP BY author.Author_ID HAVING COUNT(book.Book_ID) = (SELECT MAX(c) FROM (SELECT COUNT(Book_ID) AS c FROM book GROUP BY Author_ID) AS counts)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID IN (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID IN (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT press.Name, press.Year_Profits_billion FROM press INNER JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Press_ID HAVING COUNT(book.Book_ID) > 2
SELECT p.Name, p.Year_Profits_billion FROM press p WHERE p.Press_ID IN (SELECT b.Press_ID FROM book b GROUP BY b.Press_ID HAVING COUNT(b.Book_ID) > 2)
SELECT COUNT(*) AS total_authors FROM Authors
SELECT author_name FROM Authors GROUP BY author_name
SELECT author_name AS AuthorName, other_details AS Details FROM Authors
SELECT A.other_details FROM Authors A WHERE A.author_name = 'Addison Denesik'
SELECT COUNT(*) FROM Documents WHERE document_id IS NOT NULL
SELECT author_name FROM Documents WHERE document_id = 4 LIMIT 1
SELECT DISTINCT author_name FROM Documents WHERE document_name = 'Travel to Brazil'
SELECT COUNT(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents WHERE document_description IS NOT NULL
SELECT document_id AS ID, document_name AS Name FROM Documents WHERE author_name = 'Bianka Cummings'
SELECT author_name, other_details FROM Authors WHERE author_name IN (SELECT author_name FROM Documents WHERE document_name = 'Travel to China')
SELECT d.author_name, COUNT(*) FROM Documents d GROUP BY d.author_name
SELECT author_name FROM Documents GROUP BY author_name HAVING COUNT(document_id) = (SELECT MAX(count) FROM (SELECT COUNT(document_id) AS count FROM Documents GROUP BY author_name) AS counts)
SELECT a.author_name FROM Authors a INNER JOIN (SELECT author_name FROM Documents GROUP BY author_name HAVING COUNT(document_id) > 1) d ON a.author_name = d.author_name
SELECT COUNT(process_id) FROM Business_Processes
SELECT b.next_process_id, b.process_name, b.process_description FROM Business_Processes b WHERE b.process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9 AND next_process_id IS NOT NULL)
SELECT COUNT(DISTINCT process_outcome_code) FROM Process_Outcomes
SELECT `process_outcome_code`, `process_outcome_description` FROM `Process_Outcomes`
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working' LIMIT 1
SELECT COUNT(process_status_code) FROM Process_Status
SELECT `process_status_code`, `process_status_description` FROM `Process_Status`
SELECT process_status_description FROM Process_Status WHERE LOWER(process_status_code) = 'ct'
SELECT COUNT(1) FROM Staff
SELECT DISTINCT staff_id, staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = '100'
SELECT COUNT(*) FROM Ref_Staff_Roles WHERE staff_role_code IS NOT NULL
SELECT staff_role_code AS 'Role Code', staff_role_description AS 'Role Description' FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE TRIM(staff_role_code) = 'HR'
SELECT COUNT(*) FROM (SELECT document_id FROM Documents_Processes GROUP BY document_id)
SELECT process_id FROM Documents_Processes GROUP BY process_id
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes)
SELECT DISTINCT process_id FROM Business_Processes WHERE process_id NOT IN (SELECT process_id FROM Documents_Processes WHERE document_id IS NOT NULL)
SELECT A.process_outcome_description, B.process_status_description FROM (SELECT process_outcome_code, process_status_code FROM Documents_Processes WHERE document_id = 0) AS X JOIN Process_Outcomes A ON X.process_outcome_code = A.process_outcome_code JOIN Process_Status B ON X.process_status_code = B.process_status_code
SELECT BP.process_name FROM Business_Processes BP WHERE EXISTS (SELECT 1 FROM Documents_Processes DP JOIN Documents D ON DP.document_id = D.document_id WHERE D.document_name = 'Travel to Brazil' AND DP.process_id = BP.process_id)
SELECT process_id, COUNT(*) FROM Documents_Processes GROUP BY process_id HAVING COUNT(*) > 0
SELECT COUNT(*) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9 AND staff_id IN (SELECT staff_id FROM Staff)
SELECT staff_id, COUNT(*) AS total_processes FROM Staff_in_Processes GROUP BY staff_id
SELECT sr.staff_role_code, COUNT(sip.document_id) FROM Ref_Staff_Roles sr LEFT OUTER JOIN Staff_in_Processes sip ON sr.staff_role_code = sip.staff_role_code GROUP BY sr.staff_role_code
SELECT COUNT(*) FROM (SELECT DISTINCT staff_role_code FROM Staff_in_Processes WHERE staff_id = 3)
SELECT COUNT(agency_id) AS NumberOfAgencies FROM Agencies
SELECT COUNT(agency_id) AS NumberOfAgencies FROM Agencies
SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies
SELECT Agencies.agency_id, Agencies.agency_details FROM Agencies
SELECT COUNT(DISTINCT client_id) AS ClientCount FROM Clients
SELECT COUNT(DISTINCT client_id) AS TotalUniqueClients FROM Clients
SELECT DISTINCT client_id, client_details FROM Clients
SELECT DISTINCT client_id, client_details FROM Clients
SELECT a.agency_id, COUNT(c.client_id) AS count_of_clients FROM Agencies a LEFT JOIN Clients c ON a.agency_id = c.agency_id GROUP BY a.agency_id
SELECT agency_id, COUNT(*) FROM Clients GROUP BY agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A, Clients C WHERE A.agency_id = C.agency_id GROUP BY A.agency_id HAVING COUNT(C.client_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(client_id) AS COUNT FROM Clients GROUP BY agency_id) AS Counts)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) = (SELECT MAX(count) FROM (SELECT COUNT(client_id) AS count FROM Clients GROUP BY agency_id) AS counts))
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE (SELECT COUNT(*) FROM Clients C WHERE C.agency_id = A.agency_id GROUP BY C.agency_id) >= 2
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT agency_details FROM Agencies WHERE EXISTS (SELECT 1 FROM Clients WHERE Clients.agency_id = Agencies.agency_id AND client_details = 'Mac')
SELECT A.agency_details FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT C.client_details, A.agency_details FROM Clients C, Agencies A WHERE C.agency_id = A.agency_id
SELECT client_details, agency_details FROM Clients INNER JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT sic_code, COUNT(*) FROM Clients GROUP BY sic_code
SELECT sic_code, COUNT(client_id) AS number_of_clients FROM Clients GROUP BY sic_code
SELECT c.client_id, c.client_details FROM Clients c WHERE c.sic_code = 'Bad'
SELECT c.client_id, c.client_details FROM Clients c WHERE c.sic_code = 'Bad'
SELECT DISTINCT a.agency_id, a.agency_details FROM Agencies a, Clients c WHERE a.agency_id = c.agency_id
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT DISTINCT agency_id FROM Clients)
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT COUNT(*) FROM Invoices WHERE invoice_status IS NOT NULL
SELECT COUNT(*) FROM Invoices
SELECT Invoices.invoice_id, Invoices.invoice_status, Invoices.invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices GROUP BY invoice_id
SELECT Clients.client_id, COUNT(Invoices.invoice_id) FROM Clients LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
SELECT client_id, COUNT(*) FROM Invoices GROUP BY client_id
SELECT client_id, client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) = (SELECT MAX(Cnt) FROM (SELECT client_id, COUNT(invoice_id) AS Cnt FROM Invoices GROUP BY client_id) AS Sub))
SELECT C.client_id, C.client_details FROM Clients C JOIN Invoices I ON C.client_id = I.client_id GROUP BY C.client_id HAVING COUNT(I.invoice_id) = (SELECT MAX(Count) FROM (SELECT COUNT(invoice_id) AS Count FROM Invoices GROUP BY client_id) AS SubQuery)
SELECT client_id FROM (SELECT client_id, COUNT(*) as num_invoices FROM Invoices GROUP BY client_id) as InvoiceCounts WHERE num_invoices >= 2
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT invoice_status AS Status, COUNT(*) AS InvoiceCount FROM Invoices GROUP BY Status
SELECT invoice_status, COUNT(*) AS NumberOfInvoices FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(*) = (SELECT MAX(total) FROM (SELECT COUNT(*) AS total FROM Invoices GROUP BY invoice_status) temp)
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Invoices GROUP BY invoice_status) AS counts)
SELECT Invoices.invoice_status AS Status, Invoices.invoice_details AS Details, Clients.client_id AS ClientID, Clients.client_details AS ClientDetails, Agencies.agency_id AS AgencyID, Agencies.agency_details AS AgencyDetails FROM Invoices, Clients, Agencies WHERE Invoices.client_id = Clients.client_id AND Clients.agency_id = Agencies.agency_id
SELECT Invoices.invoice_status, Invoices.invoice_details, Clients.client_id, Clients.client_details, Agencies.agency_id, Agencies.agency_details FROM Invoices INNER JOIN Clients ON Invoices.client_id = Clients.client_id INNER JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT DISTINCT meeting_type, other_details FROM Meetings
SELECT meeting_type, other_details FROM Meetings WHERE meeting_type IS NOT NULL
SELECT Meetings.meeting_outcome, Meetings.purpose_of_meeting FROM Meetings
SELECT Meetings.meeting_outcome, Meetings.purpose_of_meeting FROM Meetings
SELECT p.payment_id, p.payment_details FROM Payments p JOIN Invoices i ON p.invoice_id = i.invoice_id WHERE i.invoice_status = 'Working'
SELECT p.payment_id, p.payment_details FROM Payments p, Invoices i WHERE p.invoice_id = i.invoice_id AND i.invoice_status = 'Working'
SELECT i.invoice_id, i.invoice_status FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id WHERE p.payment_id IS NULL
SELECT i.invoice_id, i.invoice_status FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id WHERE p.payment_id IS NULL
SELECT COUNT(DISTINCT payment_id) FROM Payments
SELECT COUNT(DISTINCT payment_id) FROM Payments
SELECT payment_id AS PaymentID, invoice_id AS InvoiceID, payment_details AS PaymentDetails FROM Payments
SELECT payment_id AS PaymentID, invoice_id AS InvoiceID, payment_details AS PaymentDetails FROM Payments
SELECT DISTINCT I.invoice_id, I.invoice_status FROM Invoices I
SELECT DISTINCT i.invoice_id, i.invoice_status FROM Invoices i JOIN Payments p ON i.invoice_id = p.invoice_id
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS number_of_payments FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
SELECT invoice_id, COUNT(*) AS total_payments FROM Payments GROUP BY invoice_id
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I LEFT JOIN Payments P ON I.invoice_id = P.invoice_id GROUP BY I.invoice_id HAVING COUNT(P.payment_id) = (SELECT MAX(counts) FROM (SELECT COUNT(payment_id) AS counts FROM Payments GROUP BY invoice_id) AS max_payments)
SELECT inv.invoice_id, inv.invoice_status, inv.invoice_details FROM Invoices inv, Payments pay WHERE inv.invoice_id = pay.invoice_id GROUP BY inv.invoice_id HAVING COUNT(pay.payment_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(payment_id) AS cnt FROM Payments GROUP BY invoice_id) AS subquery)
SELECT COUNT(1) FROM Staff
SELECT COUNT(1) FROM Staff
SELECT agency_id, COUNT(staff_id) AS total_staff FROM Staff GROUP BY agency_id
SELECT Agencies.agency_id, COUNT(Staff.staff_id) FROM Agencies LEFT JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A, Staff S WHERE A.agency_id = S.agency_id GROUP BY A.agency_id HAVING COUNT(S.staff_id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(staff_id) AS COUNT FROM Staff GROUP BY agency_id) AS Counts)
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT meeting_outcome, COUNT(*) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(*) AS count_of_meetings FROM Meetings GROUP BY meeting_outcome
SELECT client_id, COUNT(*) AS meeting_count FROM Meetings GROUP BY client_id
SELECT client_id, COUNT(*) AS meeting_count FROM Meetings GROUP BY client_id
SELECT client_id, meeting_type, COUNT(*) AS count_of_meetings FROM Meetings GROUP BY client_id, meeting_type
SELECT meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type HAVING COUNT(*) > 0
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings, Clients WHERE Meetings.client_id = Clients.client_id
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings, Clients WHERE Meetings.client_id = Clients.client_id
SELECT m.meeting_id, IFNULL(COUNT(s.staff_id), 0) AS staff_count FROM Meetings m LEFT JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT m.meeting_id, COUNT(s.staff_id) FROM Meetings m LEFT JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT staff_id, COUNT(*) FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(*) = (SELECT MIN(meeting_count) FROM (SELECT COUNT(*) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id) AS SubQuery)
SELECT S.staff_id FROM Staff S JOIN Staff_in_Meetings SM ON S.staff_id = SM.staff_id GROUP BY S.staff_id ORDER BY COUNT(SM.meeting_id) ASC LIMIT 1
SELECT COUNT(DISTINCT Staff.staff_id) FROM Staff JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings WHERE staff_id IS NOT NULL
SELECT COUNT(DISTINCT staff_id) FROM Staff WHERE staff_id NOT IN (SELECT DISTINCT staff_id FROM Staff_in_Meetings)
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings WHERE Staff.staff_id = Staff_in_Meetings.staff_id)
SELECT client_id, client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients INNER JOIN Meetings ON Clients.client_id = Meetings.client_id UNION SELECT DISTINCT Clients.client_id, Clients.client_details FROM Clients INNER JOIN Invoices ON Clients.client_id = Invoices.client_id
SELECT S.staff_id, S.staff_details FROM Staff S JOIN Staff_in_Meetings SM ON S.staff_id = SM.staff_id AND S.staff_details LIKE '%s%' GROUP BY S.staff_id HAVING COUNT(*) >= 1
SELECT DISTINCT s.staff_id, s.staff_details FROM Staff s INNER JOIN Staff_in_Meetings sim ON s.staff_id = sim.staff_id WHERE s.staff_details LIKE '%s%'
SELECT c.client_id, c.sic_code, c.agency_id FROM Clients c JOIN Meetings m ON c.client_id = m.client_id JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id HAVING COUNT(DISTINCT m.meeting_id) = 1 AND COUNT(DISTINCT i.invoice_id) >= 1
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE EXISTS (SELECT 1 FROM Meetings M WHERE M.client_id = C.client_id GROUP BY M.client_id HAVING COUNT(M.meeting_id) = 1) AND EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id)
SELECT start_date_time, end_date_time, client_details, staff_details FROM Meetings INNER JOIN Clients ON Meetings.client_id = Clients.client_id INNER JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id INNER JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M LEFT JOIN Clients C ON M.client_id = C.client_id LEFT JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id LEFT JOIN Staff S ON SM.staff_id = S.staff_id
