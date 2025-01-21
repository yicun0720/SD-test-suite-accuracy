SELECT COUNT(*) AS ClubCount FROM club
SELECT COUNT(DISTINCT Club_ID) FROM club
SELECT club.Name FROM club ORDER BY club.Name
SELECT club.Name FROM club ORDER BY club.Name
SELECT club.Manager AS Manager, club.Captain AS Captain FROM club
SELECT club.Manager AS Manager, club.Captain AS Captain FROM club
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC, Name
SELECT Name FROM player AS p ORDER BY p.Wins_count ASC
SELECT Name FROM player WHERE Earnings IN (SELECT MAX(Earnings) FROM player)
SELECT Name FROM player WHERE Earnings IN (SELECT MAX(Earnings) FROM player)
SELECT DISTINCT Country FROM player WHERE Earnings > 1.2e6
SELECT Country FROM player GROUP BY Country HAVING MAX(Earnings) > 1200000
SELECT p.Country FROM player p WHERE p.Wins_count > 2 ORDER BY p.Earnings DESC, p.Country ASC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 AND Earnings = (SELECT MAX(Earnings) FROM player WHERE Wins_count > 2)
SELECT Name AS PlayerName, (SELECT Name FROM club WHERE Club_ID = player.Club_ID) AS ClubName FROM player
SELECT player.Name, club.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE player.Club_ID IS NOT NULL
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING MAX(Wins_count) > 2)
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player WHERE Wins_count > 2 GROUP BY Club_ID)
SELECT player.Name FROM player INNER JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT p.Name FROM player p INNER JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY AVG(p.Earnings) DESC
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID HAVING AVG(Earnings) ORDER BY AVG(Earnings) DESC)
SELECT c.Manufacturer, COUNT(*) AS NumberOfClubs FROM club c GROUP BY c.Manufacturer
SELECT Manufacturer, COUNT(DISTINCT Club_ID) AS ClubsCount FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM club GROUP BY Manufacturer) AS Counts)
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM club GROUP BY Manufacturer) AS SubQuery)
SELECT DISTINCT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
WITH ClubCounts AS (SELECT Manufacturer, COUNT(*) AS TotalClubs FROM club GROUP BY Manufacturer) SELECT Manufacturer FROM ClubCounts WHERE TotalClubs > 1
SELECT p.Country FROM player p GROUP BY p.Country HAVING COUNT(p.Player_ID) > 1
SELECT p.Country FROM player p GROUP BY p.Country HAVING COUNT(p.Player_ID) > 1
SELECT Name FROM club c WHERE NOT EXISTS (SELECT NULL FROM player p WHERE p.Club_ID = c.Club_ID)
SELECT Name FROM club WHERE NOT EXISTS (SELECT 1 FROM player WHERE club.Club_ID = player.Club_ID)
SELECT p.Country FROM player p WHERE p.Earnings > 1400000 OR p.Earnings < 1100000
SELECT DISTINCT p1.Country FROM player p1 JOIN player p2 ON p1.Country = p2.Country WHERE p1.Earnings > 1400000 AND p2.Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player WHERE Country IS NOT NULL
SELECT COUNT(DISTINCT Country) FROM player WHERE Country IS NOT NULL
SELECT Earnings FROM player WHERE Country LIKE 'Australia' OR Country LIKE 'Zimbabwe'
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe') GROUP BY Player_ID
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c WHERE (SELECT COUNT(*) FROM Orders o WHERE o.customer_id = c.customer_id) > 2 AND (SELECT COUNT(*) FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id WHERE o.customer_id = c.customer_id) >= 3
SELECT customer_id, customer_first_name, customer_last_name FROM Customers WHERE customer_id IN (SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(order_id) > 2) AND customer_id IN (SELECT customer_id FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY customer_id HAVING COUNT(order_item_id) >= 3)
SELECT O.order_id, O.order_status_code, COUNT(I.product_id) AS product_count FROM Orders O JOIN Order_Items I ON O.order_id = I.order_id GROUP BY O.order_id, O.order_status_code
SELECT Orders.order_id, Orders.order_status_code, COUNT(Order_Items.product_id) AS NumberOfProducts FROM Orders LEFT JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.order_status_code
SELECT date_order_placed FROM Orders O WHERE O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR EXISTS (SELECT 1 FROM Order_Items OI WHERE OI.order_id = O.order_id GROUP BY OI.order_id HAVING COUNT(*) > 1)
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) UNION SELECT date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING COUNT(Order_Items.order_id) > 1
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers EXCEPT SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders WHERE order_status_code IS NOT NULL)
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products P WHERE NOT EXISTS (SELECT 1 FROM Order_Items O WHERE P.product_id = O.product_id GROUP BY O.product_id HAVING COUNT(O.product_id) >= 2)
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p WHERE (SELECT COUNT(*) FROM Order_Items oi WHERE oi.product_id = p.product_id) < 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(*) >= 2
SELECT Orders.order_id, Orders.date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id, Orders.date_order_placed HAVING COUNT(*) >= 2
SELECT p.product_id, p.product_name, p.product_price FROM Products p JOIN Order_Items o ON p.product_id = o.product_id GROUP BY p.product_id, p.product_name, p.product_price ORDER BY COUNT(o.product_id) DESC LIMIT 1
SELECT product_id, product_name, product_price FROM Products JOIN Order_Items USING(product_id) GROUP BY product_id, product_name, product_price ORDER BY COUNT(product_id) DESC
SELECT O.order_id, SUM(P.product_price) AS TotalPrice FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id ORDER BY TotalPrice ASC LIMIT 1
SELECT order_id, SUM(product_price) AS total_cost FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id HAVING total_cost = (SELECT MIN(total_cost) FROM (SELECT SUM(product_price) AS total_cost FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id) AS Sub)
WITH PaymentCounts AS (SELECT payment_method_code, COUNT(*) AS Count FROM Customer_Payment_Methods GROUP BY payment_method_code) SELECT payment_method_code FROM PaymentCounts WHERE Count = (SELECT MAX(Count) FROM PaymentCounts)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING COUNT(customer_id) = (SELECT MAX(count) FROM (SELECT COUNT(customer_id) AS count FROM Customer_Payment_Methods GROUP BY payment_method_code) AS subquery)
SELECT Customers.gender_code, COUNT(Order_Items.product_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.gender_code
SELECT gender_code, COUNT(DISTINCT Products.product_id) AS total_products FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY gender_code
SELECT gender_code, COUNT(Orders.order_id) AS order_count FROM Customers LEFT OUTER JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT C.gender_code, COUNT(O.order_id) AS orders_count FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id GROUP BY C.gender_code
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, p.payment_method_code FROM Customers c JOIN Customer_Payment_Methods p ON c.customer_id = p.customer_id
SELECT A.customer_first_name, A.customer_middle_initial, A.customer_last_name, B.payment_method_code FROM Customers A LEFT JOIN Customer_Payment_Methods B ON A.customer_id = B.customer_id
SELECT i.invoice_status_code, i.invoice_date, s.shipment_date FROM Invoices i INNER JOIN Shipments s ON i.invoice_number = s.invoice_number
SELECT I1.invoice_status_code, I1.invoice_date, S1.shipment_date FROM Invoices I1 LEFT JOIN Shipments S1 ON I1.invoice_number = S1.invoice_number
SELECT Products.product_name AS ProductName, Shipments.shipment_date AS ShipmentDate FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT Products.product_name, Shipments.shipment_date FROM Products, Order_Items, Shipment_Items, Shipments WHERE Products.product_id = Order_Items.product_id AND Order_Items.order_item_id = Shipment_Items.order_item_id AND Shipment_Items.shipment_id = Shipments.shipment_id
SELECT OI.order_item_status_code, SH.shipment_tracking_number FROM Order_Items OI CROSS JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id CROSS JOIN Shipments SH ON SI.shipment_id = SH.shipment_id
SELECT order_item_status_code, shipment_tracking_number FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id JOIN Shipments ON Shipment_Items.shipment_id = Shipments.shipment_id
SELECT DISTINCT Products.product_name, Products.product_color FROM Products, Order_Items, Shipment_Items WHERE Products.product_id = Order_Items.product_id AND Order_Items.order_item_id = Shipment_Items.order_item_id
SELECT product_name, product_color FROM Products WHERE EXISTS (SELECT 1 FROM Order_Items JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id WHERE Order_Items.product_id = Products.product_id)
SELECT DISTINCT P.product_name AS Name, P.product_price AS Price, P.product_description AS Description FROM Products P, Order_Items OI, Orders O, Customers C WHERE P.product_id = OI.product_id AND OI.order_id = O.order_id AND O.customer_id = C.customer_id AND C.gender_code = 'female'
SELECT DISTINCT P.product_name AS Name, P.product_price AS Price, P.product_description AS Description FROM Products P, Order_Items OI, Orders O, Customers C WHERE P.product_id = OI.product_id AND OI.order_id = O.order_id AND O.customer_id = C.customer_id AND C.gender_code = 'female'
sql placeholder
SELECT DISTINCT invoice_status_code FROM Invoices WHERE invoice_number IN (SELECT invoice_number FROM Orders EXCEPT SELECT invoice_number FROM Shipments)
sql placeholder
SELECT o.order_id, o.date_order_placed, SUM(p.product_price) AS total_amount FROM Orders o INNER JOIN Order_Items oi ON o.order_id = oi.order_id INNER JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id
SELECT COUNT(order_item_status_code) FROM (SELECT DISTINCT order_item_status_code FROM Order_Items)
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(*) FROM (SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods)
SELECT DISTINCT COUNT(*) OVER () FROM Customer_Payment_Methods GROUP BY payment_method_code
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%' AND LENGTH(phone_number) > 3
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%' AND LENGTH(phone_number) > 2
SELECT product_size FROM Products WHERE INSTR(product_name, 'Dell') > 0
SELECT product_size FROM Products WHERE INSTR(product_name, 'Dell') > 0
SELECT P.product_price, P.product_size FROM Products P WHERE P.product_price > (SELECT AVG(product_price) FROM Products WHERE product_id IS NOT NULL)
SELECT P.product_price, P.product_size FROM Products P WHERE P.product_price > (SELECT AVG(product_price) FROM Products WHERE product_id IS NOT NULL)
SELECT COUNT(DISTINCT p.product_id) FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items WHERE product_id IS NOT NULL)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT order_status_code, date_order_placed FROM Orders WHERE order_status_code IS NOT NULL AND date_order_placed IS NOT NULL
SELECT order_status_code AS Status, date_order_placed AS Date FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country LIKE 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country LIKE 'United States'
SELECT C.customer_first_name AS Buyer, P.product_name AS Product FROM Customers C, Orders O, Order_Items OI, Products P WHERE C.customer_id = O.customer_id AND O.order_id = OI.order_id AND OI.product_id = P.product_id
SELECT C.customer_first_name AS FirstName, P.product_name AS Product FROM Customers C, Orders O, Order_Items OI, Products P WHERE C.customer_id = O.customer_id AND O.order_id = OI.order_id AND OI.product_id = P.product_id
SELECT COUNT(shipment_id) FROM Shipment_Items
SELECT COUNT(DISTINCT si.order_item_id) AS total_shipped FROM Shipment_Items si
SELECT AVG(product_price) FROM Products
SELECT AVG(p.product_price) FROM Products p
SELECT AVG(product_price) FROM Products JOIN Order_Items USING (product_id)
SELECT AVG(product_price) AS AvgPrice FROM Products WHERE EXISTS (SELECT 1 FROM Order_Items WHERE Order_Items.product_id = Products.product_id)
WITH GenderCount AS (SELECT gender_code, COUNT(*) as cnt FROM Customers GROUP BY gender_code) SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM GenderCount ORDER BY cnt ASC LIMIT 1)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT order_status_code FROM Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MIN(count) FROM (SELECT COUNT(order_status_code) AS count FROM Orders GROUP BY order_status_code) AS counts)
SELECT order_status_code FROM (SELECT order_status_code, COUNT(*) AS count FROM Orders GROUP BY order_status_code) AS order_counts WHERE count = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Orders GROUP BY order_status_code) AS counts)
SELECT p.product_id, p.product_description FROM Products p WHERE EXISTS (SELECT 1 FROM Order_Items oi WHERE oi.product_id = p.product_id GROUP BY oi.product_id HAVING COUNT(oi.product_id) > 3)
SELECT P.product_id, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id GROUP BY P.product_id HAVING COUNT(OI.product_id) > 3
SELECT I.invoice_date, I.invoice_number FROM Invoices I INNER JOIN (SELECT invoice_number FROM Shipments GROUP BY invoice_number HAVING COUNT(shipment_id) >= 2) AS S ON I.invoice_number = S.invoice_number
SELECT I.invoice_number, I.invoice_date FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number, I.invoice_date HAVING COUNT(*) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments WHERE shipment_tracking_number IS NOT NULL
SELECT shipment_tracking_number, shipment_date FROM Shipments WHERE shipment_tracking_number IS NOT NULL
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(P.product_price) FROM Products P)
SELECT product_color, product_description, product_size FROM Products WHERE NOT product_price = (SELECT MAX(product_price) FROM Products)
SELECT d.Name FROM director d WHERE d.Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(DISTINCT Channel_ID) FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT p.Title FROM program AS p ORDER BY p.Start_Year DESC
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID HAVING COUNT(program.Program_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(Program_ID) AS Cnt FROM program GROUP BY Director_ID) T)
SELECT d.Name, d.Age FROM director d WHERE EXISTS (SELECT 1 FROM program p WHERE p.Director_ID = d.Director_ID GROUP BY p.Director_ID HAVING COUNT(p.Program_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Program_ID) AS cnt FROM program GROUP BY Director_ID) tmp))
SELECT Title FROM program WHERE Start_Year = (SELECT MAX(Start_Year) FROM program)
SELECT ch.Name, ch.Internet FROM channel ch, program pr WHERE ch.Channel_ID = pr.Channel_ID GROUP BY ch.Channel_ID, ch.Name, ch.Internet HAVING COUNT(pr.Program_ID) > 1
SELECT channel.Name, COUNT(program.Program_ID) FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID, channel.Name
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT DISTINCT Channel_ID FROM program)
SELECT Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID AND p.Title = 'Dracula'
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID IN (SELECT Channel_ID FROM director_admin GROUP BY Channel_ID HAVING COUNT(Director_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Director_ID) as cnt FROM director_admin GROUP BY Channel_ID) t))
SELECT Name FROM director WHERE Age > 29 AND Age < 61
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin JOIN director ON director_admin.Director_ID = director.Director_ID WHERE Age < 40) AND Channel_ID IN (SELECT Channel_ID FROM director_admin JOIN director ON director_admin.Director_ID = director.Director_ID WHERE Age > 60)
SELECT c.Channel_ID, c.Name FROM channel c WHERE c.Channel_ID NOT IN (SELECT da.Channel_ID FROM director_admin da, director d WHERE da.director_id = d.director_id AND d.name = 'Hank Baskett')
SELECT COUNT(DISTINCT Radio_ID) AS UniqueRadioCount FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC, Transmitter
SELECT tv_show_name, Original_Airdate FROM tv_show WHERE Original_Airdate IS NOT NULL
SELECT Station_name FROM city_channel WHERE Affiliation IS NOT 'ABC'
SELECT Transmitter FROM radio WHERE (ERP_kW > 150) OR (ERP_kW < 30)
SELECT Transmitter FROM radio WHERE ERP_kW IN (SELECT MAX(ERP_kW) FROM radio)
SELECT AVG(ERP_kW) AS AvgERP FROM radio
SELECT Affiliation, COUNT(ID) AS NumberOfChannels FROM city_channel GROUP BY Affiliation
WITH AffiliationCounts AS (SELECT Affiliation, COUNT(*) AS Count FROM city_channel GROUP BY Affiliation) SELECT Affiliation FROM AffiliationCounts WHERE Count = (SELECT MAX(Count) FROM AffiliationCounts)
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(Affiliation) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name
SELECT r.Transmitter, cc.City FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID
SELECT radio.Transmitter AS Transmitter, city_channel.Station_name AS Station FROM radio, city_channel_radio, city_channel WHERE radio.Radio_ID = city_channel_radio.Radio_ID AND city_channel_radio.City_channel_ID = city_channel.ID ORDER BY radio.ERP_kW DESC
SELECT r.Transmitter, COUNT(DISTINCT ccr.City_channel_ID) AS CountOfCityChannels FROM radio r LEFT OUTER JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT r.Transmitter FROM radio r WHERE r.Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1 OFFSET 0
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1 OFFSET 0
SELECT Name FROM driver WHERE Citizenship IN ('United States')
SELECT Name FROM driver WHERE Citizenship IN ('United States')
SELECT Driver_ID, COUNT(Vehicle_ID) AS num_vehicles FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(Vehicle_ID) = (SELECT MAX(num_vehicles) FROM (SELECT COUNT(Vehicle_ID) AS num_vehicles FROM vehicle_driver GROUP BY Driver_ID) sub)
SELECT Driver_ID, COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(Vehicle_ID) = (SELECT MAX(vehicle_count) FROM (SELECT COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID) AS sub)
SELECT MAX(Power) MaximumPower, AVG(Power) AveragePower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) MaximumPower, AVG(Power) AveragePower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(*) = (SELECT MIN(counts) FROM (SELECT COUNT(*) AS counts FROM vehicle_driver GROUP BY Vehicle_ID) AS subquery)
WITH VehicleCounts AS (SELECT Vehicle_ID, COUNT(*) AS NumTimesDriven FROM vehicle_driver GROUP BY Vehicle_ID) SELECT Vehicle_ID FROM VehicleCounts WHERE NumTimesDriven = (SELECT MIN(NumTimesDriven) FROM VehicleCounts)
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Build_Year = 1996
SELECT vehicle.Top_Speed, vehicle.Power FROM vehicle WHERE vehicle.Build_Year = 1996
SELECT vehicle.Build_Year, vehicle.Model, vehicle.Builder FROM vehicle
SELECT Build_Year AS YearBuilt, Model AS VehicleModel, Builder AS Manufacturer FROM vehicle
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT d.Driver_ID) FROM driver d LEFT JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID LEFT JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = 2012
SELECT COUNT(1) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(1) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle WHERE Top_Speed IS NOT NULL
SELECT AVG(Top_Speed) FROM vehicle WHERE Top_Speed IS NOT NULL
SELECT DISTINCT d.Name FROM driver d, vehicle v, vehicle_driver vd WHERE d.Driver_ID = vd.Driver_ID AND vd.Vehicle_ID = v.Vehicle_ID AND v.Power > 5000
SELECT Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver vd JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000)
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%' AND Build_Year IS NOT NULL
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%' AND Model IS NOT NULL
SELECT v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Vehicle_ID IS NULL
SELECT Model FROM vehicle v WHERE NOT EXISTS (SELECT NULL FROM vehicle_driver vd WHERE vd.Vehicle_ID = v.Vehicle_ID)
SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2) OR Builder = 'Ziyang'
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' UNION SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2)
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE EXISTS (SELECT 1 FROM vehicle_driver D JOIN driver DR ON D.Driver_ID = DR.Driver_ID WHERE DR.Name = 'Jeff Gordon' AND D.Vehicle_ID = V.Vehicle_ID) OR V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2)
SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN (SELECT vd.Vehicle_ID FROM vehicle_driver vd JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' UNION SELECT vd.Vehicle_ID FROM vehicle_driver vd GROUP BY vd.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) > 2)
SELECT COUNT(*) FROM vehicle v WHERE v.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle v WHERE v.Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name COLLATE NOCASE ASC
SELECT Name FROM driver ORDER BY Name COLLATE NOCASE ASC
SELECT Racing_Series, COUNT(*) AS NumberOfDrivers FROM driver GROUP BY Racing_Series
SELECT COUNT(Driver_ID), Racing_Series FROM driver GROUP BY Racing_Series
SELECT Name, Citizenship FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver, vehicle WHERE vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID AND vehicle.Model = 'DJ1')
SELECT Name, Citizenship FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver, vehicle WHERE vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID AND vehicle.Model = 'DJ1')
SELECT COUNT(Driver_ID) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(Driver_ID) FROM driver d WHERE NOT EXISTS (SELECT 1 FROM vehicle_driver vd WHERE vd.Driver_ID = d.Driver_ID)
SELECT COUNT(Exam_ID) AS NumberOfExams FROM Exams
SELECT COUNT(Exam_ID) AS NumberOfExams FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY 1
SELECT Subject_Code FROM Exams GROUP BY Subject_Code ORDER BY Subject_Code
SELECT Exam_Name, Exam_Date FROM Exams WHERE NOT Subject_Code = 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code NOT IN ('Database')
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE LOWER(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(*) AS count FROM Questions GROUP BY Type_of_Question_Code
SELECT Q.Type_of_Question_Code, COUNT(Q.Type_of_Question_Code) AS Total FROM Questions Q GROUP BY Q.Type_of_Question_Code
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Comments = 'Normal'
SELECT DISTINCT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) AS Answer_Count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Answer_Count DESC
SELECT Student_Answer_Text, COUNT(*) AS NumOccurrences FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY NumOccurrences DESC
SELECT first_name, date_of_answer FROM Students INNER JOIN Student_Answers ON Students.student_id = Student_Answers.student_id
SELECT first_name, date_of_answer FROM Students, Student_Answers WHERE Students.Student_ID = Student_Answers.Student_ID
SELECT Email_Adress, Date_of_Answer FROM Students INNER JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Date_of_Answer DESC
SELECT Email_Adress AS Email, Date_of_Answer AS Date FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment HAVING COUNT(*) = (SELECT MIN(Count) FROM (SELECT COUNT(*) AS Count FROM Student_Assessments GROUP BY Assessment) AS SubQuery)
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC, Assessment ASC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(Student_ID) >= 2)
SELECT S.First_Name FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID GROUP BY S.Student_ID HAVING COUNT(A.Student_ID) >= 2
WITH RankedAnswers AS (SELECT Valid_Answer_Text, RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank FROM Valid_Answers GROUP BY Valid_Answer_Text) SELECT Valid_Answer_Text FROM RankedAnswers WHERE Rank = 1
WITH Ranked_Answers AS (SELECT Valid_Answer_Text, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM Valid_Answers JOIN Student_Assessments ON Valid_Answers.Valid_Answer_ID = Student_Assessments.Valid_Answer_ID GROUP BY Valid_Answer_Text) SELECT Valid_Answer_Text FROM Ranked_Answers WHERE rank = 1
sql placeholder
sql placeholder
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
sql placeholder
sql placeholder
SELECT s.First_Name FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT s.First_Name FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Student_Answer_ID IN (SELECT Student_Answer_ID FROM Student_Answers WHERE Comments = 'Normal') INTERSECT SELECT sa.Student_Answer_Text FROM Student_Answers sa WHERE sa.Student_Answer_ID IN (SELECT Student_Answer_ID FROM Student_Answers WHERE Comments = 'Absent')
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) > 2
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) > 2
SELECT * FROM Students WHERE Student_ID IS NOT NULL
SELECT ALL * FROM Students
SELECT COUNT(DISTINCT address_id) FROM Addresses
SELECT COUNT(DISTINCT address_id) FROM Addresses
SELECT Addresses.address_id, Addresses.address_details FROM Addresses
SELECT Addresses.address_id, Addresses.address_details FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT p.product_id, p.product_type_code, p.product_name FROM Products p
SELECT p.product_id, p.product_type_code, p.product_name FROM Products p
SELECT p.product_price FROM Products p WHERE p.product_name = 'Monitor'
SELECT p.product_price FROM Products p WHERE p.product_name = 'Monitor'
SELECT MIN(p.product_price) AS Min_Price, AVG(p.product_price) AS Avg_Price, MAX(p.product_price) AS Max_Price FROM Products p
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products
SELECT AVG(product_price) AS Average_Price FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) AS Average_Clothes_Price FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code LIKE 'hardware'
SELECT COUNT(product_id) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code IS NOT NULL)
SELECT P.product_name FROM Products P WHERE P.product_price > (SELECT AVG(product_price) FROM Products)
SELECT DISTINCT product_name FROM Products WHERE product_type_code = 'hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware' GROUP BY product_type_code)
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT p.product_name FROM Products p ORDER BY p.product_price DESC
SELECT p.product_name FROM Products p ORDER BY p.product_price DESC
SELECT product_name, product_price FROM Products WHERE product_type_code LIKE 'hardware' ORDER BY product_price ASC
SELECT p.product_name FROM Products p WHERE p.product_type_code = 'Hardware' ORDER BY p.product_price ASC
SELECT COUNT(product_id), product_type_code FROM Products GROUP BY product_type_code
SELECT COUNT(product_id), product_type_code FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(DISTINCT product_id) >= 2
SELECT P.product_type_code FROM Products P GROUP BY P.product_type_code HAVING COUNT(P.product_id) > 1
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MAX(product_count) FROM (SELECT COUNT(product_id) AS product_count FROM Products GROUP BY product_type_code) AS counts)
SELECT product_type_code FROM Products, Order_Items WHERE Products.product_id = Order_Items.product_id GROUP BY product_type_code HAVING COUNT(product_type_code) = (SELECT MAX(count) FROM (SELECT COUNT(product_type_code) AS count FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY product_type_code) AS counts)
SELECT COUNT(customer_id) FROM Customers WHERE customer_id IS NOT NULL
SELECT COUNT(customer_id) FROM Customers WHERE customer_id IS NOT NULL
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT Customers.customer_address, Customers.customer_phone, Customers.customer_email FROM Customers WHERE Customers.customer_name = 'Jeromy'
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy' AND customer_email LIKE '%@%'
SELECT payment_method_code, COUNT(*) AS NumberOfCustomers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(*) AS NumberOfCustomers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC, payment_method_code ASC LIMIT 1
WITH PaymentCounts AS (SELECT payment_method_code, COUNT(*) AS count FROM Customers GROUP BY payment_method_code) SELECT payment_method_code FROM PaymentCounts WHERE count = (SELECT MAX(count) FROM PaymentCounts)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM Customers GROUP BY payment_method_code) as counts))
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1 OFFSET 0)
SELECT Customers.payment_method_code, Customers.customer_number FROM Customers WHERE Customers.customer_name = 'Jeromy'
SELECT Customers.payment_method_code, Customers.customer_number FROM Customers WHERE Customers.customer_name = 'Jeromy'
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) > 0
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) > 0
SELECT p.product_id, p.product_type_code FROM Products AS p ORDER BY p.product_name ASC
SELECT product_id, product_type_code FROM Products ORDER BY LOWER(product_name) ASC
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MIN(count) FROM (SELECT COUNT(product_id) AS count FROM Products GROUP BY product_type_code) AS counts)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM Products GROUP BY product_type_code) as counts)
SELECT COUNT(DISTINCT order_id) AS UniqueOrderCount FROM Customer_Orders
SELECT COUNT(*) AS TotalOrders FROM Customer_Orders
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders CO, Customers C WHERE CO.customer_id = C.customer_id AND C.customer_name = 'Jeromy'
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders CO, Customers C WHERE CO.customer_id = C.customer_id AND C.customer_name = 'Jeromy'
SELECT C.customer_name, C.customer_id, (SELECT COUNT(*) FROM Customer_Orders WHERE customer_id = C.customer_id) AS num_orders FROM Customers C
SELECT C.customer_name, C.customer_id, (SELECT COUNT(*) FROM Customer_Orders WHERE customer_id = C.customer_id) AS order_count FROM Customers C
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C WHERE EXISTS (SELECT 1 FROM Customer_Orders O WHERE O.customer_id = C.customer_id GROUP BY O.customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C INNER JOIN (SELECT customer_id FROM Customer_Orders GROUP BY customer_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Customer_Orders GROUP BY customer_id) T)) CO ON C.customer_id = CO.customer_id
SELECT order_status_code, COUNT(order_id) AS total_orders FROM Customer_Orders GROUP BY order_status_code ORDER BY total_orders DESC
SELECT order_status_code, COUNT(order_id) AS count_of_orders FROM Customer_Orders GROUP BY order_status_code ORDER BY count_of_orders
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MAX(count) FROM (SELECT order_status_code, COUNT(*) AS count FROM Customer_Orders GROUP BY order_status_code) AS counts)
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Customer_Orders GROUP BY order_status_code) AS counts)
SELECT COUNT(*) FROM Customers C LEFT OUTER JOIN Customer_Orders O ON C.customer_id = O.customer_id WHERE O.customer_id IS NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT P.product_name FROM Products P WHERE NOT EXISTS (SELECT NULL FROM Order_Items OI WHERE OI.product_id = P.product_id)
SELECT P.product_name FROM Products P LEFT JOIN Order_Items O ON P.product_id = O.product_id WHERE O.product_id IS NULL
SELECT COUNT(*) FROM Order_Items oi, Products p WHERE oi.product_id = p.product_id AND p.product_name = 'Monitor'
SELECT TOTAL(Order_Items.order_quantity) FROM Order_Items, Products WHERE Order_Items.product_id = Products.product_id AND Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders co WHERE EXISTS (SELECT 1 FROM Order_Items oi JOIN Products p ON oi.product_id = p.product_id WHERE oi.order_id = co.order_id AND p.product_name = 'Monitor')
SELECT COUNT(DISTINCT C.customer_id) FROM Customers C, Customer_Orders CO, Order_Items OI, Products P WHERE C.customer_id = CO.customer_id AND CO.order_id = OI.order_id AND OI.product_id = P.product_id AND P.product_name = 'Monitor'
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers, Customer_Orders WHERE Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders WHERE customer_id IN (SELECT customer_id FROM Customers)
SELECT Customers.customer_id FROM Customers LEFT OUTER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT c.customer_id FROM Customers c WHERE NOT EXISTS (SELECT NULL FROM Customer_Orders o WHERE o.customer_id = c.customer_id)
SELECT o.order_date, o.order_id FROM Customer_Orders o JOIN Order_Items i ON o.order_id = i.order_id GROUP BY o.order_id, o.order_date HAVING MAX(i.order_quantity) > 6 OR COUNT(DISTINCT i.product_id) > 3
SELECT CO.order_id, CO.order_date FROM Customer_Orders CO JOIN (SELECT order_id FROM Order_Items WHERE order_quantity > 6 UNION SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3) AS OI ON CO.order_id = OI.order_id
SELECT COUNT(DISTINCT Building_ID) FROM building
SELECT COUNT(*) FROM building WHERE Building_ID IS NOT NULL
SELECT building.Name FROM building ORDER BY building.Number_of_Stories ASC
SELECT building.Name FROM building ORDER BY building.Number_of_Stories ASC
SELECT building.Address FROM building ORDER BY building.Completed_Year DESC
SELECT building.Address FROM building ORDER BY building.Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year IS NOT 1980
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year IS NOT 1980
SELECT AVG(Population) FROM region
SELECT AVG(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC, Region_ID ASC
SELECT Name FROM region ORDER BY UPPER(Name) ASC
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC, Name ASC LIMIT 5
SELECT building.Name AS Building, region.Name AS Region FROM building, region WHERE building.Region_ID = region.Region_ID
SELECT building.Name, region.Name FROM building, region WHERE building.Region_ID = region.Region_ID
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) > 1)
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) > 1)
SELECT Capital FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM building GROUP BY Region_ID) sub))
SELECT region.Capital FROM region JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID HAVING COUNT(building.Building_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM building GROUP BY Region_ID) AS SubQuery)
SELECT bld.Address, reg.Capital FROM building AS bld JOIN region AS reg ON bld.Region_ID = reg.Region_ID
SELECT A.Address, R.Name FROM building A JOIN region R ON A.Region_ID = R.Region_ID
SELECT Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT b.Name, b.Number_of_Stories FROM building b JOIN region r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT b.Completed_Year, COUNT(b.Building_ID) AS NumberOfBuildings FROM building b GROUP BY b.Completed_Year
SELECT Completed_Year AS Year, COUNT(Building_ID) AS BuildingsCompleted FROM building GROUP BY Year
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM building GROUP BY Completed_Year) AS counts)
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM building GROUP BY Completed_Year) AS Counts)
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Region_ID IS NULL
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Region_ID IS NULL
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT Completed_Year FROM building WHERE Completed_Year IN (SELECT Completed_Year FROM building WHERE Number_of_Stories > 20) INTERSECT SELECT Completed_Year FROM building WHERE Completed_Year IN (SELECT Completed_Year FROM building WHERE Number_of_Stories < 15)
SELECT DISTINCT b.Address FROM building b
SELECT DISTINCT b.Address FROM building b
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC, Completed_Year DESC
SELECT Name, Completed_Year FROM building ORDER BY Number_of_Stories DESC, Completed_Year
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT Channel_Details FROM Channels ORDER BY 1
SELECT COUNT(*) AS TotalServices FROM Services
SELECT COUNT(*) FROM Services WHERE Service_ID IS NOT NULL
SELECT Analytical_Layer_Type_Code FROM (SELECT Analytical_Layer_Type_Code, RANK() OVER (ORDER BY COUNT(*) DESC) AS Rank FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) AS Ranked WHERE Rank = 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) AS SubQuery)
SELECT DISTINCT Services.Service_Details FROM Services INNER JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID INNER JOIN Customers ON Customers_and_Services.Customer_ID = Customers.Customer_ID WHERE Customers.Customer_Details = 'Hardy Kutch'
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(Service_ID) > 3)
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(Service_ID) > 3)
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions GROUP BY Customer_ID HAVING COUNT(Customer_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Customer_ID) AS cnt FROM Customer_Interactions GROUP BY Customer_ID) tmp))
SELECT Customers.* FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(Service_ID) DESC LIMIT 1)
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(DISTINCT Service_ID) = (SELECT MAX(service_count) FROM (SELECT Customer_ID, COUNT(DISTINCT Service_ID) AS service_count FROM Customers_and_Services GROUP BY Customer_ID) AS Temp))
SELECT C.Customer_Details FROM Customers C INNER JOIN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1) AS S ON C.Customer_ID = S.Customer_ID
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT DISTINCT Customer_ID FROM Customers_and_Services)
SELECT C.Customer_Details FROM Customers C LEFT OUTER JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Customer_ID IS NULL
WITH LeastUsedService AS (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1) SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID IN (SELECT Service_ID FROM LeastUsedService))
SELECT DISTINCT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID JOIN (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1) AS LeastUsed ON CS.Service_ID = LeastUsed.Service_ID
SELECT COUNT(*) FROM (SELECT Customers_and_Services_Details FROM Customers_and_Services GROUP BY Customers_and_Services_Details)
SELECT (SELECT COUNT(DISTINCT Customer_Details) FROM Customers) + (SELECT COUNT(DISTINCT Service_Details) FROM Services) AS Total_Details
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%' ORDER BY Customer_Details
SELECT * FROM Customers WHERE LOWER(Customer_Details) LIKE LOWER('%Kutch%')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT CS.Service_ID FROM Customers_and_Services CS LEFT JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' OR EXISTS (SELECT 1 FROM Customer_Interactions CI WHERE CI.Status_Code = 'good' AND CI.Service_ID = CS.Service_ID))
SELECT DISTINCT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch') UNION SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID JOIN Customer_Interactions CI ON CI.Service_ID = S.Service_ID WHERE C.Customer_Details = 'Hardy Kutch' AND CI.Status_Code = 'bad'
SELECT S.Service_Details FROM Services S, Customers_and_Services CS, Customers C, Customer_Interactions CI WHERE S.Service_ID = CS.Service_ID AND CS.Customer_ID = C.Customer_ID AND C.Customer_Details = 'Hardy Kutch' AND CI.Service_ID = S.Service_ID AND CI.Status_Code = 'bad'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = '15 ij'))
SELECT DISTINCT S.Service_Details FROM Services S INNER JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID INNER JOIN Channels C ON CI.Channel_ID = C.Channel_ID WHERE C.Channel_Details = '15 ij'
SELECT Customers.* FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code LIKE 'Stuck' AND Customer_Interactions.Services_and_Channels_Details LIKE 'bad'
SELECT C.Customer_Details FROM Customers C INNER JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID WHERE CI.Status_Code = 'Stuck' AND CI.Services_and_Channels_Details = 'bad' GROUP BY C.Customer_ID
SELECT COUNT(*) AS Total_Successful FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%successful%'
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Customer_Interaction_ID IN (SELECT Customer_Interaction_ID FROM Integration_Platform WHERE Status_Code = 'failed'))
SELECT C.Customer_Details FROM Customers C WHERE EXISTS (SELECT NULL FROM Customer_Interactions CI JOIN Integration_Platform IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE CI.Customer_ID = C.Customer_ID AND IP.Integration_Platform_Details = 'Fail')
SELECT * FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services UNION SELECT Service_ID FROM Customer_Interactions)
SELECT S.Service_Details FROM Services S LEFT OUTER JOIN Customers_and_Services C ON S.Service_ID = C.Service_ID WHERE C.Service_ID IS NULL
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_Layer_Type_Code) AS usage_count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) AS NumberOfUses FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID WHERE CS.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID WHERE CS.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT COUNT(id) FROM Vehicles
SELECT COUNT(id) FROM Vehicles
SELECT name AS VehicleName FROM Vehicles ORDER BY Model_year DESC
SELECT name AS VehicleName FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IS NOT NULL
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IS NOT NULL
SELECT Vehicles.name, Vehicles.Type_of_powertrain, Vehicles.Annual_fuel_cost FROM Vehicles WHERE Vehicles.Model_year = 2013 OR Vehicles.Model_year = 2014
SELECT name AS Vehicle_Name, Type_of_powertrain AS Powertrain_Type, Annual_fuel_cost AS Yearly_Fuel_Cost FROM Vehicles WHERE Model_year = 2013 OR Model_year = 2014
SELECT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IN (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014) INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013 INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014
SELECT Type_of_powertrain, COUNT(Vehicles.id) AS VehicleCount FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(id) AS NumberOfVehicles FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) = (SELECT MAX(Count) FROM (SELECT COUNT(id) AS Count FROM Vehicles GROUP BY Type_of_powertrain) AS Counts)
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(Type_of_powertrain) = (SELECT MAX(C) FROM (SELECT COUNT(Type_of_powertrain) AS C FROM Vehicles GROUP BY Type_of_powertrain) AS sub)
SELECT MIN(Vehicles.Annual_fuel_cost) AS MinCost, MAX(Vehicles.Annual_fuel_cost) AS MaxCost, AVG(Vehicles.Annual_fuel_cost) AS AvgCost FROM Vehicles
SELECT MIN(Annual_fuel_cost) AS MinCost, MAX(Annual_fuel_cost) AS MaxCost, AVG(Annual_fuel_cost) AS AvgCost FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate AND Model_year IS NOT NULL
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate AND Model_year IS NOT NULL
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) > 1
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) > 1
SELECT c.name, c.age, c.membership_credit FROM Customers c
SELECT Customers.name, Customers.age, Customers.membership_credit FROM Customers WHERE name IS NOT NULL
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT AVG(Customers.age) AS AverageAge FROM Customers WHERE Customers.membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT AVG(C.age) FROM Customers C WHERE C.membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount WHERE id IS NOT NULL
SELECT * FROM Discount WHERE id IS NOT NULL
SELECT Vehicles.name, SUM(Renting_history.total_hours) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name HAVING SUM(Renting_history.total_hours) > 0
SELECT V.name, SUM(RH.total_hours) AS TotalHours FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.name
SELECT V.name FROM Vehicles V WHERE V.id NOT IN (SELECT vehicles_id FROM Renting_history WHERE vehicles_id IS NOT NULL)
SELECT name FROM Vehicles WHERE id NOT IN (SELECT DISTINCT vehicles_id FROM Renting_history)
SELECT C.name FROM Customers C, Renting_history R WHERE C.id = R.customer_id GROUP BY C.id HAVING COUNT(R.customer_id) >= 2
SELECT name FROM Customers WHERE EXISTS (SELECT 1 FROM Renting_history WHERE Customers.id = Renting_history.customer_id GROUP BY customer_id HAVING COUNT(*) >= 2)
SELECT name, Model_year FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Renting_history GROUP BY vehicles_id) AS Counts))
SELECT V.name, V.Model_year FROM Vehicles V, Renting_history R WHERE V.id = R.vehicles_id GROUP BY V.id HAVING COUNT(R.id) = (SELECT MAX(cnt) FROM (SELECT COUNT(id) AS cnt FROM Renting_history GROUP BY vehicles_id) AS subquery)
SELECT name FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY name ORDER BY SUM(R.total_hours) DESC
SELECT name FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history ORDER BY total_hours DESC)
SELECT D.name FROM Discount D, Renting_history R WHERE D.id = R.discount_id GROUP BY D.name HAVING COUNT(R.id) = (SELECT MAX(COUNT) FROM (SELECT COUNT(*) AS COUNT FROM Renting_history GROUP BY discount_id))
SELECT name FROM Discount WHERE id IN (SELECT discount_id FROM Renting_history GROUP BY discount_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Renting_history GROUP BY discount_id) AS subquery))
SELECT name, Type_of_powertrain FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history WHERE total_hours > 30)
SELECT V.name, V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.id HAVING SUM(R.total_hours) > 30
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS City_Fuel_Avg, AVG(Highway_fuel_economy_rate) AS Highway_Fuel_Avg FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(Vehicles.City_fuel_economy_rate) AS City_Fuel_Avg, AVG(Vehicles.Highway_fuel_economy_rate) AS Highway_Fuel_Avg FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) AS AverageLoanAmount FROM Student_Loans
SELECT AVG(amount_of_loan) FROM Student_Loans WHERE amount_of_loan IS NOT NULL
SELECT bio_data, student_id FROM Students WHERE student_id IN (SELECT student_id FROM (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2 UNION SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2) AS SubQuery)
SELECT bio_data, student_id FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2) OR student_id NOT IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT T.* FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id WHERE C.class_details LIKE '%data%' AND T.teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT T.teacher_details FROM Teachers T WHERE EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE '%data%') AND NOT EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT amount_of_loan, date_of_loan FROM Student_Loans WHERE student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT SL.amount_of_loan, SL.date_of_loan FROM Student_Loans SL WHERE SL.student_id IN (SELECT A.student_id FROM Achievements A GROUP BY A.student_id HAVING COUNT(A.achievement_id) >= 2)
SELECT teacher_id, teacher_details FROM Teachers WHERE teacher_id = (SELECT teacher_id FROM (SELECT teacher_id, COUNT(*) AS num_courses FROM Classes GROUP BY teacher_id) AS CourseCount ORDER BY num_courses DESC LIMIT 1)
SELECT T.teacher_id, T.teacher_details FROM Teachers T WHERE EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id GROUP BY C.teacher_id HAVING COUNT(C.class_id) = (SELECT MAX(count) FROM (SELECT COUNT(class_id) AS count FROM Classes GROUP BY teacher_id) AS subquery))
SELECT detention_summary FROM Detention GROUP BY detention_summary
SELECT detention_summary FROM Detention GROUP BY detention_summary
SELECT DISTINCT student_details, address_type_description FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT student_details, address_type_description FROM Students, Students_Addresses, Ref_Address_Types WHERE Students.student_id = Students_Addresses.student_id AND Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT DISTINCT bio_data, address_details FROM Students CROSS JOIN Addresses JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id AND Addresses.address_id = Students_Addresses.address_id
SELECT Students.bio_data AS Biography, Addresses.address_details AS Address FROM Students, Students_Addresses, Addresses WHERE Students.student_id = Students_Addresses.student_id AND Students_Addresses.address_id = Addresses.address_id
SELECT Students.bio_data, Transcripts.date_of_transcript FROM Students, Transcripts WHERE Students.student_id = Transcripts.student_id
SELECT Students.bio_data AS Biography, Transcripts.date_of_transcript AS TranscriptDate FROM Students JOIN Transcripts ON Students.student_id = Transcripts.student_id
SELECT B.behaviour_monitoring_details, COUNT(B.student_id) AS num_students FROM Behaviour_Monitoring B WHERE B.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) GROUP BY B.behaviour_monitoring_details
SELECT behaviour_monitoring_details, COUNT(behaviour_monitoring_details) FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(behaviour_monitoring_details) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) AS SubQuery)
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT B.student_id FROM Behaviour_Monitoring B JOIN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) AS ThreeResults ON B.behaviour_monitoring_details = ThreeResults.behaviour_monitoring_details JOIN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) AS MostCommon ON B.behaviour_monitoring_details = MostCommon.behaviour_monitoring_details)
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) INTERSECT SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT bio_data FROM Students S WHERE (SELECT COUNT(DISTINCT behaviour_monitoring_details) FROM Behaviour_Monitoring B WHERE B.student_id = S.student_id) = 1 AND (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring B WHERE B.student_id = S.student_id LIMIT 1) = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT bio_data, event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id
SELECT bio_data, event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id
SELECT event_type_code, (SELECT event_type_description FROM Ref_Event_Types WHERE event_type_code = SE.event_type_code) AS description, COUNT(DISTINCT student_id) AS count FROM Student_Events SE GROUP BY event_type_code ORDER BY count DESC LIMIT 1
WITH EventCounts AS (SELECT event_type_code, COUNT(DISTINCT student_id) AS num_students FROM Student_Events GROUP BY event_type_code) SELECT EventCounts.event_type_code, EventCounts.num_students, Ref_Event_Types.event_type_description FROM EventCounts JOIN Ref_Event_Types ON EventCounts.event_type_code = Ref_Event_Types.event_type_code WHERE num_students = (SELECT MAX(num_students) FROM EventCounts)
SELECT A.achievement_details, R.achievement_type_description FROM Achievements AS A, Ref_Achievement_Type AS R WHERE A.achievement_type_code = R.achievement_type_code
SELECT achievement_details, achievement_type_description FROM Achievements INNER JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
SELECT COUNT(DISTINCT teacher_id) FROM Classes WHERE student_id IN (SELECT student_id FROM Students WHERE NOT EXISTS (SELECT student_id FROM Achievements WHERE Students.student_id = student_id))
SELECT COUNT(DISTINCT t.teacher_id) FROM Teachers t INNER JOIN Classes c ON t.teacher_id = c.teacher_id LEFT JOIN Achievements a ON c.student_id = a.student_id WHERE a.achievement_id IS NULL
SELECT date_of_transcript, transcript_details FROM Transcripts WHERE date_of_transcript IS NOT NULL
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT Achievements.achievement_type_code, Achievements.achievement_details, Achievements.date_achievement FROM Achievements
SELECT Achievements.achievement_type_code, Achievements.achievement_details, Achievements.date_achievement FROM Achievements
SELECT `datetime_detention_start`, `datetime_detention_end` FROM `Detention`
SELECT `datetime_detention_start`, `datetime_detention_end` FROM `Detention`
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%' ESCAPE '\'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%' ESCAPE '\'
SELECT teacher_details, student_details FROM Teachers JOIN Classes ON Teachers.teacher_id = Classes.teacher_id JOIN Students ON Classes.student_id = Students.student_id
SELECT student_details, teacher_details FROM Students INNER JOIN Classes ON Students.student_id = Classes.student_id INNER JOIN Teachers ON Teachers.teacher_id = Classes.teacher_id
SELECT A.teacher_id, A.num_courses FROM (SELECT teacher_id, COUNT(*) AS num_courses FROM Classes GROUP BY teacher_id) A WHERE A.num_courses = (SELECT MAX(num_courses) FROM (SELECT COUNT(*) AS num_courses FROM Classes GROUP BY teacher_id) B)
SELECT teacher_id, COUNT(class_id) FROM Classes GROUP BY teacher_id HAVING COUNT(class_id) = (SELECT MAX(course_count) FROM (SELECT COUNT(class_id) AS course_count FROM Classes GROUP BY teacher_id) AS subquery)
sql placeholder
SELECT Students.student_id, COUNT(Classes.class_id) AS num_courses FROM Students JOIN Classes ON Students.student_id = Classes.student_id GROUP BY Students.student_id ORDER BY num_courses DESC LIMIT 1
sql placeholder
sql placeholder
SELECT detention_type_code, detention_type_description FROM (SELECT D.detention_type_code, R.detention_type_description, COUNT(*) AS cnt FROM Detention D JOIN Ref_Detention_Type R ON D.detention_type_code = R.detention_type_code GROUP BY D.detention_type_code, R.detention_type_description) AS SubQuery ORDER BY cnt ASC LIMIT 1
SELECT RDT.detention_type_code, RDT.detention_type_description FROM Ref_Detention_Type RDT WHERE RDT.detention_type_code IN (SELECT detention_type_code FROM Detention GROUP BY detention_type_code HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Detention GROUP BY detention_type_code) AS subquery))
SELECT bio_data, other_details FROM Students, Student_Loans WHERE Students.student_id = Student_Loans.student_id AND Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans) GROUP BY Students.student_id
SELECT bio_data, student_details FROM Students WHERE EXISTS (SELECT 1 FROM Student_Loans WHERE Students.student_id = Student_Loans.student_id AND amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans))
SELECT bio_data FROM Students, Student_Loans WHERE Students.student_id = Student_Loans.student_id AND Student_Loans.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT T.date_of_transcript FROM Transcripts T WHERE EXISTS (SELECT 1 FROM Student_Loans S WHERE S.student_id = T.student_id AND S.amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans))
SELECT T.date_of_transcript FROM Transcripts T WHERE EXISTS (SELECT 1 FROM Student_Loans S WHERE S.student_id = T.student_id AND S.amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans))
SELECT T1.teacher_details FROM Teachers T1 WHERE EXISTS (SELECT T2.student_id FROM Classes T2 JOIN Transcripts T3 ON T2.student_id = T3.student_id WHERE T1.teacher_id = T2.teacher_id AND T3.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts))
SELECT T.teacher_details FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id JOIN Transcripts TR ON C.student_id = TR.student_id WHERE TR.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT student_id, SUM(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT s.student_id, IFNULL(SUM(sl.amount_of_loan), 0) AS total_loan FROM Students s LEFT JOIN Student_Loans sl ON s.student_id = sl.student_id GROUP BY s.student_id
SELECT DISTINCT s.student_id, s.bio_data, (SELECT COUNT(class_id) FROM Classes WHERE student_id = s.student_id) AS course_count FROM Students s
SELECT S.student_id, S.bio_data, COUNT(C.class_id) AS num_courses FROM Students S LEFT JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id, S.bio_data
SELECT COUNT(student_id) FROM (SELECT DISTINCT student_id FROM Detention)
SELECT COUNT(DISTINCT Students.student_id) FROM Students, Detention WHERE Students.student_id = Detention.student_id
SELECT R.address_type_code, R.address_type_description FROM Ref_Address_Types R, Students_Addresses S WHERE R.address_type_code = S.address_type_code GROUP BY R.address_type_code, R.address_type_description HAVING COUNT(S.address_type_code) = (SELECT MAX(Cnt) FROM (SELECT COUNT(address_type_code) AS Cnt FROM Students_Addresses GROUP BY address_type_code) T)
SELECT SA.address_type_code, RAT.address_type_description FROM Students_Addresses SA, Ref_Address_Types RAT WHERE SA.address_type_code = RAT.address_type_code GROUP BY SA.address_type_code, RAT.address_type_description HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Students_Addresses GROUP BY address_type_code) as counts)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events EXCEPT SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events EXCEPT SELECT student_id FROM Student_Loans)
SELECT Students_Addresses.date_from, Students_Addresses.date_to FROM Students_Addresses JOIN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(*) = 2) Temp ON Students_Addresses.student_id = Temp.student_id
SELECT SA.date_from, SA.date_to FROM Students_Addresses SA, (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(transcript_id) = 2) AS T WHERE SA.student_id = T.student_id
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start AS StartDate FROM Detention
SELECT Author.Name AS AuthorName FROM Author
SELECT Name FROM Author WHERE Name IS NOT NULL
SELECT c.Name, c.Address FROM Client c
SELECT Name, Address FROM Client WHERE Name IS NOT NULL AND Address IS NOT NULL
SELECT Title, ISBN, SalePrice FROM Book
SELECT Book.Title, Book.ISBN, Book.SalePrice FROM Book
SELECT COUNT(Book.ISBN) FROM Book
SELECT COUNT(Book.ISBN) FROM Book
SELECT COUNT(*) FROM (SELECT DISTINCT idAuthor FROM Author) temp
SELECT COUNT(idAuthor) AS NumberOfAuthors FROM Author
SELECT COUNT(IdClient) FROM Client
SELECT COUNT(DISTINCT IdClient) AS UniqueClients FROM Client
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT Title, Name FROM Book INNER JOIN Author_Book ON Book.ISBN = Author_Book.ISBN INNER JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT b.Title, a.Name FROM Book b, Author a, Author_Book ab WHERE b.ISBN = ab.ISBN AND ab.Author = a.idAuthor
SELECT Orders.IdOrder, Client.Name FROM Orders, Client WHERE Orders.IdClient = Client.IdClient
SELECT Orders.IdOrder, Client.Name FROM Orders, Client WHERE Orders.IdClient = Client.IdClient
SELECT DISTINCT A.Name, (SELECT COUNT(*) FROM Author_Book WHERE Author = A.idAuthor) AS BookCount FROM Author A
SELECT DISTINCT A.Name, (SELECT COUNT(*) FROM Author_Book WHERE Author = A.idAuthor) AS BookCount FROM Author A
SELECT Book.ISBN, COUNT(Books_Order.ISBN) FROM Book LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN
SELECT Book.ISBN, IFNULL(COUNT(Books_Order.ISBN), 0) AS order_count FROM Book LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN
SELECT b.ISBN, SUM(o.amount) AS TotalAmount FROM Book b, Books_Order o WHERE b.ISBN = o.ISBN GROUP BY b.ISBN
SELECT b.ISBN, SUM(o.amount) AS TotalAmount FROM Book b, Books_Order o WHERE b.ISBN = o.ISBN GROUP BY b.ISBN
SELECT Title FROM Book WHERE ISBN = (SELECT ISBN FROM Books_Order GROUP BY ISBN ORDER BY SUM(amount) DESC LIMIT 1)
SELECT B.Title FROM Book B INNER JOIN (SELECT ISBN, COUNT(ISBN) AS order_count FROM Books_Order GROUP BY ISBN ORDER BY order_count DESC LIMIT 1) AS MostOrdered ON B.ISBN = MostOrdered.ISBN
SELECT book.Title, book.PurchasePrice FROM Book book JOIN (SELECT ISBN, MAX(amount) AS max_amount FROM Books_Order GROUP BY ISBN) max_orders ON book.ISBN = max_orders.ISBN WHERE max_orders.max_amount = (SELECT MAX(amount) FROM Books_Order)
SELECT B.Title, B.PurchasePrice FROM Book B INNER JOIN (SELECT ISBN, SUM(amount) AS TotalAmount FROM Books_Order GROUP BY ISBN ORDER BY TotalAmount DESC LIMIT 1) AS Sub ON B.ISBN = Sub.ISBN
SELECT B.Title FROM Book B INNER JOIN Books_Order BO ON B.ISBN = BO.ISBN WHERE BO.ISBN IS NOT NULL
SELECT DISTINCT B.Title FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN
SELECT C.Name FROM Client C WHERE EXISTS (SELECT 1 FROM Orders O WHERE O.IdClient = C.IdClient)
SELECT Name FROM Client WHERE EXISTS (SELECT 1 FROM Orders WHERE Orders.IdClient = Client.IdClient)
SELECT Name, COUNT(IdOrder) AS NumberOfOrders FROM Client LEFT OUTER JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Name
SELECT Name, COUNT(Orders.IdOrder) AS TotalOrders FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.Name
SELECT C.Name FROM Client C WHERE C.IdClient IN (SELECT IdClient FROM Orders GROUP BY IdClient HAVING COUNT(*) = (SELECT MAX(OrderCount) FROM (SELECT IdClient, COUNT(*) AS OrderCount FROM Orders GROUP BY IdClient) AS SubQuery))
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders GROUP BY IdClient HAVING COUNT(IdOrder) = (SELECT MAX(order_count) FROM (SELECT COUNT(IdOrder) AS order_count FROM Orders GROUP BY IdClient) AS subquery))
SELECT Client.Name AS ClientName, AggregateTotal.TotalAmount FROM Client JOIN (SELECT IdClient, SUM(amount) AS TotalAmount FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient) AS AggregateTotal ON Client.IdClient = AggregateTotal.IdClient
SELECT DISTINCT C.Name, SUM(BO.amount) OVER (PARTITION BY C.Name) AS TotalBooks FROM Client C LEFT JOIN Orders O ON C.IdClient = O.IdClient LEFT JOIN Books_Order BO ON O.IdOrder = BO.IdOrder
SELECT C.Name FROM (SELECT IdClient, SUM(amount) AS TotalAmount FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder GROUP BY IdClient ORDER BY TotalAmount DESC LIMIT 1) AS SubQuery JOIN Client C ON SubQuery.IdClient = C.IdClient
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order GROUP BY IdOrder HAVING SUM(amount) = (SELECT MAX(TotalAmount) FROM (SELECT SUM(amount) AS TotalAmount FROM Books_Order GROUP BY IdOrder) AS SubQuery)))
SELECT B.Title FROM Book B WHERE B.ISBN NOT IN (SELECT O.ISBN FROM Books_Order O)
SELECT Title FROM Book AS B WHERE NOT EXISTS (SELECT NULL FROM Books_Order AS BO WHERE B.ISBN = BO.ISBN)
SELECT Client.Name FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient WHERE Orders.IdClient IS NULL
SELECT C.Name FROM Client C WHERE C.IdClient NOT IN (SELECT O.IdClient FROM Orders O)
SELECT MAX(SalePrice) AS MaximumSalePrice, MIN(SalePrice) AS MinimumSalePrice FROM Book
SELECT MAX(SalePrice) AS MaximumSalePrice, MIN(SalePrice) AS MinimumSalePrice FROM Book
SELECT AVG(Book.PurchasePrice) AS 'Purchase Price Average', AVG(Book.SalePrice) AS 'Sale Price Average' FROM Book
SELECT AVG(PurchasePrice) AS Purchase_Price_Avg, AVG(SalePrice) AS Sale_Price_Avg FROM Book
SELECT MAX(SalePrice - PurchasePrice) AS MaximumPriceDifference FROM Book
SELECT MAX(SalePrice - PurchasePrice) AS LargestDifference FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book AS B)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book AS B)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book GROUP BY SalePrice)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book GROUP BY SalePrice)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT B.Title FROM Book B WHERE B.PurchasePrice = (SELECT MAX(B2.PurchasePrice) FROM Book B2)
SELECT AVG(SalePrice) FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell')
SELECT AVG(SalePrice) FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell')
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'Plato'))
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'Plato'))
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B WHERE EXISTS (SELECT 1 FROM Author_Book AB JOIN Author A ON AB.Author = A.idAuthor WHERE AB.ISBN = B.ISBN AND A.Name = 'Plato') AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author = idAuthor WHERE Name = 'Plato') AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT A.Name FROM Author A WHERE A.idAuthor IN (SELECT AB.Author FROM Author_Book AB JOIN Book B ON AB.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice')
SELECT Author.Name FROM Author INNER JOIN Author_Book ON Author.idAuthor = Author_Book.Author INNER JOIN Book ON Author_Book.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT Book.Title FROM Book INNER JOIN Author_Book ON Book.ISBN = Author_Book.ISBN INNER JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%'
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%')
SELECT COUNT(*) FROM (SELECT DISTINCT O.IdOrder FROM Orders O, Books_Order BO, Book B WHERE O.IdOrder = BO.IdOrder AND BO.ISBN = B.ISBN AND B.Title = 'Pride and Prejudice') AS TempTable
SELECT COUNT(Books_Order.IdOrder) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT DISTINCT o1.IdOrder FROM Orders o1, Orders o2 JOIN Books_Order bo1 ON o1.IdOrder = bo1.IdOrder JOIN Book b1 ON bo1.ISBN = b1.ISBN JOIN Books_Order bo2 ON o2.IdOrder = bo2.IdOrder JOIN Book b2 ON bo2.ISBN = b2.ISBN WHERE b1.Title = 'Pride and Prejudice' AND b2.Title = 'The Little Prince' AND o1.IdOrder = o2.IdOrder
SELECT IdOrder FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order bo INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice') INTERSECT SELECT IdOrder FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order bo INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'The Little Prince')
SELECT B.ISBN FROM Books_Order B JOIN Orders O ON B.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' INTERSECT SELECT B.ISBN FROM Books_Order B JOIN Orders O ON B.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith'
SELECT B.ISBN FROM Books_Order B JOIN Orders O ON B.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name IN ('Peter Doe', 'James Smith') GROUP BY B.ISBN HAVING COUNT(DISTINCT C.Name) = 2
SELECT B.Title FROM Book B WHERE B.ISBN IN (SELECT BO.ISBN FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe') AND B.ISBN NOT IN (SELECT BO.ISBN FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith')
SELECT Title FROM Book WHERE ISBN IN (SELECT Books_Order.ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'Peter Doe') AND Title NOT IN (SELECT Title FROM Book WHERE ISBN IN (SELECT Books_Order.ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'James Smith'))
SELECT DISTINCT c.Name FROM Client c, Orders o, Books_Order bo, Book b WHERE c.IdClient = o.IdClient AND o.IdOrder = bo.IdOrder AND bo.ISBN = b.ISBN AND b.Title = 'Pride and Prejudice'
SELECT Name FROM Client WHERE EXISTS (SELECT 1 FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Client.IdClient = Orders.IdClient AND Book.Title = 'Pride and Prejudice')
SELECT COUNT(Book_ID) FROM book
SELECT Title FROM book ORDER BY UPPER(Title) ASC
SELECT Title FROM book AS b ORDER BY b.Pages DESC
SELECT book.Type, book.Release FROM book
SELECT Book_ID, Title, MAX(Chapters) as Maximum_Chapters, MIN(Chapters) as Minimum_Chapters FROM book GROUP BY Book_ID, Title
SELECT Title FROM book WHERE Type NOT IN ('Poet')
SELECT AVG(Rating) AS AverageRating FROM review
SELECT Title, Rating FROM book, review WHERE book.Book_ID = review.Book_ID
SELECT R.Rating FROM review R INNER JOIN book B ON R.Book_ID = B.Book_ID WHERE B.Chapters = (SELECT MAX(Chapters) FROM book)
SELECT review.Rank FROM review JOIN book ON review.Book_ID = book.Book_ID ORDER BY book.Pages ASC LIMIT 1
SELECT Title FROM book WHERE EXISTS (SELECT 1 FROM review WHERE book.Book_ID = review.Book_ID ORDER BY Rank DESC LIMIT 1)
SELECT AVG(Readers_in_Million) AS avg_readers FROM book JOIN review ON book.Book_ID = review.Book_ID WHERE Type = 'Novel'
SELECT b.Type, COUNT(b.Book_ID) AS TotalBooks FROM book b GROUP BY b.Type
SELECT Type FROM book GROUP BY Type HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM book GROUP BY Type) AS Counts)
SELECT book.Type FROM book GROUP BY book.Type HAVING COUNT(book.Book_ID) >= 3
SELECT b.Title FROM book b INNER JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Rating, b.Title ASC
SELECT DISTINCT b.Title, b.Audio FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Readers_in_Million DESC
SELECT COUNT(*) FROM (SELECT Book_ID FROM book EXCEPT SELECT Book_ID FROM review) AS subquery
SELECT Type FROM book WHERE Chapters > 75 INTERSECT SELECT Type FROM book WHERE Chapters < 50
SELECT DISTINCT COUNT(*) FROM (SELECT Type FROM book GROUP BY Type) AS types
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT DISTINCT Book_ID FROM review)
SELECT COUNT(1) FROM customer
SELECT COUNT(1) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC, Name ASC
SELECT customer.Name FROM customer ORDER BY Level_of_Membership
SELECT customer.Nationality, customer.Card_Credit FROM customer
SELECT customer.Nationality, customer.Card_Credit FROM customer
SELECT c.Name FROM customer AS c WHERE c.Nationality = 'England' OR c.Nationality = 'Australia'
SELECT c.Name FROM customer AS c WHERE c.Nationality = 'England' OR c.Nationality = 'Australia'
SELECT AVG(c.Card_Credit) FROM customer c WHERE c.Level_of_Membership > 1
SELECT AVG(c.Card_Credit) FROM customer c WHERE c.Level_of_Membership > 1
SELECT Card_Credit FROM customer AS c WHERE c.Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer AS sub)
SELECT Card_Credit FROM customer AS c WHERE c.Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer AS sub)
SELECT Nationality, COUNT(*) FROM customer GROUP BY Nationality ORDER BY COUNT(*)
SELECT Nationality, COUNT(DISTINCT Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM customer GROUP BY Nationality) AS counts)
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(c) FROM (SELECT COUNT(*) AS c FROM customer GROUP BY Nationality) AS counts)
SELECT Nationality FROM (SELECT Nationality, MIN(Card_Credit) AS MinCredit, MAX(Card_Credit) AS MaxCredit FROM customer GROUP BY Nationality) WHERE MinCredit < 50 AND MaxCredit > 75
SELECT Nationality FROM customer WHERE Nationality IN (SELECT Nationality FROM customer WHERE Card_Credit > 50) AND Nationality IN (SELECT Nationality FROM customer WHERE Card_Credit < 75) GROUP BY Nationality
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID
SELECT c.Name, o.Dish_Name FROM customer AS c INNER JOIN customer_order AS o ON c.Customer_ID = o.Customer_ID
SELECT c.Name AS CustomerName, co.Dish_Name AS DishName FROM customer AS c JOIN customer_order AS co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT customer.Name, customer_order.Dish_Name FROM customer INNER JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID ORDER BY customer_order.Quantity DESC
SELECT customer.Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer INNER JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Name
SELECT Name, Total_Quantity FROM customer c JOIN (SELECT Customer_ID, SUM(Quantity) AS Total_Quantity FROM customer_order GROUP BY Customer_ID) co ON c.Customer_ID = co.Customer_ID
SELECT c.* FROM customer c WHERE EXISTS (SELECT 1 FROM customer_order co WHERE c.Customer_ID = co.Customer_ID GROUP BY co.Customer_ID HAVING SUM(co.Quantity) > 1)
SELECT Name FROM customer WHERE Customer_ID IN (SELECT Customer_ID FROM customer_order GROUP BY Customer_ID HAVING SUM(Quantity) > 1)
SELECT Manager FROM branch WHERE Manager IS NOT NULL GROUP BY Manager
SELECT Manager FROM branch WHERE Manager IS NOT NULL GROUP BY Manager
SELECT Name FROM customer c WHERE NOT EXISTS (SELECT NULL FROM customer_order o WHERE o.Customer_ID = c.Customer_ID)
SELECT Name FROM customer WHERE NOT EXISTS (SELECT 1 FROM customer_order WHERE customer_order.Customer_ID = customer.Customer_ID)
SELECT COUNT(member.Member_ID) FROM member
SELECT Name FROM member ORDER BY Age ASC, Name ASC
SELECT m.Name, m.Nationality FROM member m
SELECT m.Name FROM member m WHERE m.Nationality NOT IN ('England')
SELECT Name FROM member WHERE Age IN (SELECT Age FROM member WHERE Age = 19 OR Age = 20)
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)
SELECT m.Nationality, COUNT(m.Member_ID) AS TotalMembers FROM member m GROUP BY m.Nationality
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM member GROUP BY Nationality) AS counts)
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(*) >= 2
SELECT m.Name AS Leader, c.Club_Name AS Club FROM member m, club_leader cl, club c WHERE m.Member_ID = cl.Member_ID AND cl.Club_ID = c.Club_ID
SELECT member.Name FROM member JOIN club_leader ON member.Member_ID = club_leader.Member_ID JOIN club ON club_leader.Club_ID = club.Club_ID AND club.Overall_Ranking > 100
SELECT Name FROM member, club_leader WHERE member.Member_ID = club_leader.Member_ID AND club_leader.Year_Join < 2018
SELECT member.Name FROM member INNER JOIN club_leader ON member.Member_ID = club_leader.Member_ID INNER JOIN club ON club_leader.Club_ID = club.Club_ID WHERE club.Club_Name = 'Houston'
SELECT m.Name FROM member m LEFT JOIN club_leader cl ON m.Member_ID = cl.Member_ID WHERE cl.Member_ID IS NULL
SELECT Nationality FROM member GROUP BY Nationality HAVING SUM(CASE WHEN Age > 22 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Age < 19 THEN 1 ELSE 0 END) > 0
SELECT AVG(Age) FROM member WHERE Member_ID IN (SELECT Member_ID FROM club_leader)
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%' COLLATE NOCASE
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IS NOT NULL
SELECT cs.Collection_Subset_Name FROM Collection_Subsets AS cs
sql placeholder
SELECT Collections.Collection_Description FROM Collections INNER JOIN Collection_Subset_Members ON Collections.Collection_ID = Collection_Subset_Members.Collection_ID INNER JOIN Collection_Subsets ON Collection_Subset_Members.Collection_Subset_ID = Collection_Subsets.Collection_Subset_ID WHERE Collection_Subsets.Collection_Subset_Name = 'Top collection'
SELECT Document_Subset_Name AS SubsetName FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_Name IS NOT NULL
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000' AND Document_Subset_Details IS NOT NULL
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000' AND Document_Subset_ID IS NOT NULL
SELECT DISTINCT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID AS ObjectID FROM Document_Objects
SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner COLLATE NOCASE = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT DISTINCT d.Owner FROM Document_Objects d, Documents_in_Collections dc, Collections c WHERE d.Document_Object_ID = dc.Document_Object_ID AND dc.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Braeden Collection'
SELECT d2.Owner FROM Document_Objects d1 JOIN Document_Objects d2 ON d1.Parent_Document_Object_ID = d2.Document_Object_ID WHERE d1.Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT DISTINCT d1.Description FROM Document_Objects d1 JOIN Document_Objects d2 ON d1.Document_Object_ID = d2.Parent_Document_Object_ID
SELECT DISTINCT Description FROM Document_Objects AS D WHERE EXISTS (SELECT 1 FROM Document_Objects WHERE Parent_Document_Object_ID = D.Document_Object_ID)
SELECT COUNT(1) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(*) AS Document_Count FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects)
SELECT Document_Object_ID FROM Document_Objects d WHERE NOT EXISTS (SELECT NULL FROM Document_Objects WHERE Parent_Document_Object_ID = d.Document_Object_ID AND Parent_Document_Object_ID IS NOT NULL)
SELECT Parent_Document_Object_ID AS ParentID, COUNT(Document_Object_ID) AS ChildDocumentsCount FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT COUNT(Document_Object_ID) AS ChildCount, Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Collection_Name AS 'Collection Names' FROM Collections
SELECT Collections.Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT parent.Collection_Name FROM Collections AS child JOIN Collections AS parent ON child.Parent_Collection_ID = parent.Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT parent.Collection_Name FROM Collections child JOIN Collections parent ON child.Parent_Collection_ID = parent.Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT DISTINCT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Collection_Name FROM Collections WHERE NOT EXISTS (SELECT * FROM Collections AS C WHERE Collections.Collection_ID = C.Parent_Collection_ID)
SELECT d.Parent_Document_Object_ID FROM Document_Objects d GROUP BY d.Parent_Document_Object_ID HAVING COUNT(d.Document_Object_ID) > 1
SELECT d.Parent_Document_Object_ID FROM Document_Objects d GROUP BY d.Parent_Document_Object_ID HAVING COUNT(d.Document_Object_ID) > 1
SELECT COUNT(*) FROM Collections c1 JOIN Collections c2 ON c1.Parent_Collection_ID = c2.Collection_ID WHERE c2.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Child.Collection_ID) FROM Collections AS Parent JOIN Collections AS Child ON Parent.Collection_ID = Child.Parent_Collection_ID WHERE Parent.Collection_Name = 'Best'
SELECT Related_Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Objects DO ON DSM.Document_Object_ID = DO.Document_Object_ID WHERE DO.Owner = 'Ransom' GROUP BY Related_Document_Object_ID
SELECT DSM.Related_Document_Object_ID FROM Document_Objects DO JOIN Document_Subset_Members DSM ON DO.Document_Object_ID = DSM.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT Collection_Subset_ID, Collection_Subset_Name, (SELECT COUNT(*) FROM Collection_Subset_Members WHERE Collection_Subset_ID = cs.Collection_Subset_ID) AS Num_Collections FROM Collection_Subsets cs
SELECT a.Collection_Subset_ID, a.Collection_Subset_Name, COUNT(b.Collection_ID) FROM Collection_Subsets a LEFT JOIN Collection_Subset_Members b ON a.Collection_Subset_ID = b.Collection_Subset_ID GROUP BY a.Collection_Subset_ID, a.Collection_Subset_Name
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) = (SELECT MAX(ChildCount) FROM (SELECT COUNT(*) AS ChildCount FROM Document_Objects GROUP BY Parent_Document_Object_ID) AS SubQuery)
SELECT Parent_Document_Object_ID, COUNT(*) AS NumberOfChildren FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT a.Document_Object_ID, a.related_count FROM (SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS related_count FROM Document_Subset_Members GROUP BY Document_Object_ID) a WHERE a.related_count = (SELECT MIN(b.related_count) FROM (SELECT COUNT(Related_Document_Object_ID) AS related_count FROM Document_Subset_Members GROUP BY Document_Object_ID) b)
SELECT d.Document_Object_ID FROM Document_Objects d LEFT JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID ORDER BY COUNT(dc.Document_Object_ID) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(*) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Related_Count >= 2 AND Related_Count <= 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Total_Related FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Total_Related IN (2, 3, 4)
SELECT DISTINCT D.Owner FROM Document_Objects D, Document_Subset_Members DSM WHERE D.Document_Object_ID = DSM.Related_Document_Object_ID AND DSM.Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden')
SELECT DISTINCT D2.Owner FROM Document_Objects D1 INNER JOIN Document_Subset_Members DSM ON D1.Document_Object_ID = DSM.Document_Object_ID INNER JOIN Document_Objects D2 ON DSM.Related_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Braeden' AND D1.Document_Object_ID != D2.Document_Object_ID
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subset_Members JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Owner = 'Braeden')
SELECT Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name, COUNT(DISTINCT Document_Subset_Members.Document_Object_ID) FROM Document_Subsets LEFT JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name
SELECT DISTINCT cs.Collection_Subset_ID, cs.Collection_Subset_Name, (SELECT COUNT(DISTINCT Document_Object_ID) FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collection_Subset_Members WHERE Collection_Subset_ID = cs.Collection_Subset_ID)) FROM Collection_Subsets cs
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS DocumentCount FROM Document_Subsets DS LEFT JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name HAVING COUNT(DISTINCT DSM.Document_Object_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(DISTINCT Document_Object_ID) AS Count FROM Document_Subset_Members GROUP BY Document_Subset_ID) TempTable)
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS NumberOfDocuments FROM Document_Subsets DS JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name HAVING COUNT(DISTINCT DSM.Document_Object_ID) = (SELECT MAX(C) FROM (SELECT COUNT(DISTINCT Document_Object_ID) AS C FROM Document_Subset_Members GROUP BY Document_Subset_ID) AS Temp)
SELECT DSM.Document_Object_ID FROM Document_Subsets DS INNER JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000'
SELECT document_object_id FROM Document_Subset_Members, Document_Subsets WHERE Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID AND Document_Subsets.Document_Subset_Name = 'Best for 2000'
SELECT dsub.Document_Subset_Name AS Subset_Name, dmem.Document_Object_ID AS Doc_ID FROM Document_Subsets dsub JOIN Document_Subset_Members dmem ON dsub.Document_Subset_ID = dmem.Document_Subset_ID
SELECT dsub.Document_Subset_Name AS Subset_Name, dobj.Document_Object_ID AS Document_ID FROM Document_Subsets dsub JOIN Document_Subset_Members dsm ON dsub.Document_Subset_ID = dsm.Document_Subset_ID JOIN Document_Objects dobj ON dsm.Document_Object_ID = dobj.Document_Object_ID
SELECT Collection_Name FROM Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Documents_in_Collections WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom'))
SELECT C.Collection_Name FROM Collections C WHERE C.Collection_ID IN (SELECT DC.Collection_ID FROM Documents_in_Collections DC, Document_Objects D WHERE DC.Document_Object_ID = D.Document_Object_ID AND D.Owner = 'Ransom')
SELECT Document_Object_ID, COUNT(Collection_ID) AS Collection_Count FROM Documents_in_Collections GROUP BY Document_Object_ID HAVING COUNT(Collection_ID) > 0
SELECT COUNT(DISTINCT Collection_ID), Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT COUNT(DISTINCT doc.Document_Object_ID) FROM Documents_in_Collections doc JOIN Collections col ON doc.Collection_ID = col.Collection_ID WHERE col.Collection_Name = 'Best'
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections AS d INNER JOIN Collections AS c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections d JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT doc_obj.Document_Object_ID) FROM Documents_in_Collections AS doc_obj INNER JOIN Collections AS coll ON doc_obj.Collection_ID = coll.Collection_ID WHERE coll.Collection_Name = 'Best'
SELECT C.Collection_Name, C.Collection_ID, COUNT(D.Document_Object_ID) AS NumberOfDocuments FROM Collections C JOIN Documents_in_Collections D ON C.Collection_ID = D.Collection_ID GROUP BY C.Collection_ID ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT C.Collection_ID, C.Collection_Name, COUNT(D.Document_Object_ID) AS Document_Count FROM Collections C JOIN Documents_in_Collections D ON C.Collection_ID = D.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID, C.Collection_Name HAVING COUNT(D.Document_Object_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Document_Object_ID) AS Count FROM Documents_in_Collections GROUP BY Collection_ID) AS SubQuery)
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')) AND Document_Object_ID IN (SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT DISTINCT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')) AND Document_Object_ID IN (SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT DISTINCT d.Document_Object_ID FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID LEFT JOIN Document_Subset_Members dm ON d.Document_Object_ID = dm.Document_Object_ID LEFT JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID AND ds.Document_Subset_Name = 'Best for 2000' WHERE c.Collection_Name = 'Best' AND ds.Document_Subset_ID IS NULL
SELECT DISTINCT d.Document_Object_ID FROM Documents_in_Collections d, Collections c WHERE d.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Best' AND NOT EXISTS (SELECT 1 FROM Document_Subset_Members dm, Document_Subsets ds WHERE dm.Document_Subset_ID = ds.Document_Subset_ID AND ds.Document_Subset_Name = 'Best for 2000' AND dm.Document_Object_ID = d.Document_Object_ID)
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000') UNION SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
WITH Best2000 AS (SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subset_Name = 'Best for 2000'), BestCollection AS (SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collection_Name = 'Best') SELECT DISTINCT Document_Object_ID FROM Best2000 UNION SELECT DISTINCT Document_Object_ID FROM BestCollection
SELECT C.Collection_Name FROM Collections AS C, Collection_Subset_Members AS CSM WHERE C.Collection_ID = CSM.Related_Collection_ID AND CSM.Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT c.Collection_Name FROM Collections c INNER JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Related_Collection_ID WHERE csm.Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT csm.Related_Collection_ID) FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT csm.Related_Collection_ID) FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT Collection_Subsets.Collection_Subset_Name FROM Collection_Subsets JOIN Collection_Subset_Members ON Collection_Subsets.Collection_Subset_ID = Collection_Subset_Members.Collection_Subset_ID JOIN Collections ON Collection_Subset_Members.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT cs.Collection_Subset_Name FROM Collection_Subsets cs WHERE EXISTS (SELECT 1 FROM Collection_Subset_Members csm JOIN Collections c ON csm.Collection_ID = c.Collection_ID WHERE csm.Collection_Subset_ID = cs.Collection_Subset_ID AND c.Collection_Name = 'Best')
SELECT COUNT(id) FROM songs WHERE name LIKE '%Love%'
SELECT songs.name FROM songs ORDER BY songs.name ASC
SELECT `name`, `language` FROM `songs`
SELECT MAX(voice_sound_quality) maxVoiceQuality, MIN(voice_sound_quality) minVoiceQuality FROM performance_score
SELECT voice_sound_quality, rhythm_tempo, stage_presence FROM performance_score JOIN participants ON performance_score.participant_id = participants.id AND participants.name = 'Freeway'
SELECT songs.id, songs.language, songs.original_artist FROM songs WHERE songs.name <> 'Love'
SELECT DISTINCT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT stage_presence FROM performance_score INNER JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'English'
SELECT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id HAVING COUNT(ps.songs_id) >= 2
SELECT p.id, p.name, p.popularity, song_count FROM participants p JOIN (SELECT participant_id, COUNT(songs_id) AS song_count FROM performance_score GROUP BY participant_id) ps ON p.id = ps.participant_id ORDER BY ps.song_count DESC
SELECT p.id, p.name FROM participants p INNER JOIN performance_score ps ON p.id = ps.participant_id WHERE ps.voice_sound_quality = 5 UNION SELECT p.id, p.name FROM participants p INNER JOIN performance_score ps ON p.id = ps.participant_id WHERE ps.rhythm_tempo = 5
SELECT voice_sound_quality FROM performance_score INNER JOIN songs ON performance_score.songs_id = songs.id WHERE songs.name = 'The Balkan Girls' AND songs.language = 'English'
SELECT songs.id, songs.name FROM songs INNER JOIN (SELECT songs_id FROM performance_score GROUP BY songs_id HAVING COUNT(participant_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(participant_id) AS cnt FROM performance_score GROUP BY songs_id) AS subquery)) AS most_sung ON songs.id = most_sung.songs_id
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(DISTINCT songs.id) FROM songs LEFT OUTER JOIN performance_score ON songs.id = performance_score.songs_id WHERE performance_score.songs_id IS NULL
SELECT language, AVG(rhythm_tempo) AS AvgRhythmTempo FROM songs LEFT JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY language
SELECT DISTINCT name FROM participants WHERE EXISTS (SELECT 1 FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE participants.id = performance_score.participant_id AND songs.language = 'English')
SELECT name, popularity FROM participants WHERE id IN (SELECT participant_id FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'Croatian' INTERSECT SELECT participant_id FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'English')
SELECT name FROM songs WHERE name LIKE '%Is%' ESCAPE '\'
SELECT s.original_artist FROM songs s JOIN performance_score p ON s.id = p.songs_id WHERE p.rhythm_tempo > 5 ORDER BY p.voice_sound_quality DESC
SELECT COUNT(city_code) FROM City
SELECT COUNT(city_code) FROM City
SELECT DISTINCT City.state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(*) FROM (SELECT DISTINCT country FROM City) AS unique_countries
SELECT COUNT(*) FROM (SELECT DISTINCT country FROM City) AS unique_countries
SELECT DISTINCT city_name, city_code, state, country FROM City
SELECT DISTINCT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name LIKE 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name LIKE 'Baltimore'
SELECT City.city_name FROM City WHERE City.state = 'PA'
SELECT city_name FROM City c WHERE c.state = 'PA'
SELECT COUNT(*) FROM City WHERE country LIKE 'Canada'
SELECT COUNT(*) FROM City WHERE country LIKE 'Canada'
SELECT City.city_name FROM City WHERE City.country = 'USA' ORDER BY City.latitude ASC
SELECT City.city_name FROM City WHERE City.country = 'USA' ORDER BY City.latitude ASC
SELECT state, COUNT(city_name) AS num_cities FROM City GROUP BY state
SELECT state, COUNT(city_name) AS city_count FROM City GROUP BY state ORDER BY state
SELECT country, COUNT(city_name) AS TotalCities FROM City GROUP BY country
SELECT country, COUNT(city_code) FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(*) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(*) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(city_name) = (SELECT MAX(city_count) FROM (SELECT COUNT(city_name) AS city_count FROM City GROUP BY state) AS counts)
SELECT state FROM City GROUP BY state HAVING COUNT(city_name) = (SELECT MAX(city_count) FROM (SELECT state, COUNT(city_name) AS city_count FROM City GROUP BY state) AS counts)
SELECT country FROM City GROUP BY country HAVING COUNT(city_name) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_name) AS city_count FROM City GROUP BY country) AS subquery)
SELECT country FROM City GROUP BY country HAVING COUNT(city_name) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_name) AS city_count FROM City GROUP BY country) AS counts)
SELECT first_name, last_name FROM (SELECT Fname AS first_name, LName AS last_name, city_code FROM Student) AS students JOIN City ON students.city_code = City.city_code WHERE City.state = 'MD'
SELECT Student.Fname || ' ' || Student.LName AS FullName FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT COUNT(*) AS TotalStudents FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(*) FROM Student s INNER JOIN City c ON s.city_code = c.city_code WHERE c.country LIKE 'China'
SELECT Fname AS FirstName, Major FROM Student JOIN City USING(city_code) WHERE City.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT country, COUNT(StuID) FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country
SELECT country, COUNT(StuID) FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country
SELECT city_name, COUNT(StuID) FROM Student, City WHERE Student.city_code = City.city_code GROUP BY city_name
SELECT city_name, COUNT(*) AS student_count FROM Student INNER JOIN City ON Student.city_code = City.city_code GROUP BY city_name
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM City LEFT JOIN Student ON City.city_code = Student.city_code GROUP BY state HAVING COUNT(Student.StuID) = (SELECT MAX(student_count) FROM (SELECT COUNT(Student.StuID) AS student_count FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state) AS counts)
SELECT country FROM City LEFT JOIN Student ON City.city_code = Student.city_code GROUP BY country ORDER BY COUNT(Student.StuID) ASC LIMIT 1
SELECT country FROM City LEFT JOIN Student ON City.city_code = Student.city_code GROUP BY country ORDER BY COUNT(Student.StuID) ASC LIMIT 1
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(StuID) >= 3)
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(StuID) >= 3)
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state HAVING COUNT(Student.StuID) > 5
SELECT C.state FROM City C, Student S WHERE C.city_code = S.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT StuID FROM Student WHERE city_code IN (SELECT city_code FROM City WHERE country <> 'USA')
SELECT StuID FROM Student WHERE city_code IN (SELECT city_code FROM City WHERE country <> 'USA')
SELECT DISTINCT StuID FROM Student s JOIN City c ON s.city_code = c.city_code WHERE s.Sex = 'F' AND c.state = 'PA'
SELECT s.StuID FROM Student s, City c WHERE s.city_code = c.city_code AND s.Sex = 'female' AND c.state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'Male' AND Country <> 'USA'
SELECT StuID FROM Student AS s JOIN City AS c ON s.city_code = c.city_code WHERE s.Sex = 'male' AND c.country <> 'USA'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') OR (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') OR (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT distance FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code IN (SELECT city_code FROM City WHERE city_name = 'Newark')
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark')
SELECT MIN(Direct_distance.distance), AVG(Direct_distance.distance), MAX(Direct_distance.distance) FROM Direct_distance
SELECT AVG(Direct_distance.distance) AS Average, MIN(Direct_distance.distance) AS Minimum, MAX(Direct_distance.distance) AS Maximum FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance LIMIT 1)
SELECT city_code FROM City WHERE city_code IN (SELECT city1_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance) UNION ALL SELECT city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance))
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(DIST.distance) FROM Direct_distance DIST)
SELECT DISTINCT city_code FROM City JOIN Direct_distance ON City.city_code = Direct_distance.city1_code OR City.city_code = Direct_distance.city2_code WHERE Direct_distance.distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000 GROUP BY city1_code, city2_code
SELECT DISTINCT C.city_code FROM City C, Direct_distance D WHERE (C.city_code = D.city1_code OR C.city_code = D.city2_code) AND D.distance < 1000
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' UNION SELECT SUM(distance) FROM Direct_distance WHERE city2_code = 'BAL' ORDER BY SUM(distance) DESC LIMIT 1
SELECT AVG(distance) FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code IN (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(distance) FROM Direct_distance, City WHERE Direct_distance.city1_code = City.city_code AND City.city_name = 'Boston'
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY D.distance ASC LIMIT 1
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city2_code = T2.city_code WHERE T1.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY T1.distance ASC LIMIT 1
SELECT C.city_name FROM City C INNER JOIN (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1) D ON C.city_code = D.city2_code
SELECT T2.city_name FROM Direct_distance AS T1 JOIN City AS T2 ON T1.city2_code = T2.city_code WHERE T1.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND T1.distance = (SELECT max(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston'))
SELECT city_code, SUM(distance) FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_code
SELECT C.city_code, SUM(D.distance) FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_code UNION SELECT C.city_code, SUM(D.distance) FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code GROUP BY C.city_code
SELECT C.city_name, AVG(D.distance) AS avg_distance FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT city_name, AVG(distance) AS avg_distance FROM City INNER JOIN Direct_distance ON City.city_code = Direct_distance.city1_code OR City.city_code = Direct_distance.city2_code GROUP BY city_name
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city2_code = (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim')
SELECT D.distance FROM Direct_distance D CROSS JOIN Student S1 CROSS JOIN Student S2 WHERE S1.city_code = D.city1_code AND S2.city_code = D.city2_code AND S1.Fname = 'Linda' AND S1.LName = 'Smith' AND S2.Fname = 'Tracy' AND S2.LName = 'Kim'
SELECT S.Fname, S.LName FROM Student S WHERE EXISTS (SELECT 1 FROM City C1 JOIN Direct_distance D ON C1.city_code = D.city1_code JOIN City C2 ON C2.city_code = D.city2_code WHERE C2.city_name = 'Linda Smith' AND S.city_code = C1.city_code ORDER BY D.distance DESC LIMIT 1)
SELECT Fname || ' ' || LName AS FullName FROM Student WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith')))
SELECT state FROM City WHERE city_code IN (SELECT city_code FROM Student WHERE Fname = 'Linda')
SELECT DISTINCT state FROM City JOIN Student ON City.city_code = Student.city_code WHERE Student.Fname = 'Linda'
SELECT Sailors.sid, Sailors.name, Sailors.rating, Sailors.age FROM Sailors WHERE Sailors.age > 30
SELECT Sailors.sid, Sailors.name, Sailors.rating, Sailors.age FROM Sailors WHERE Sailors.age > 30
SELECT Sailors.name, Sailors.age FROM Sailors WHERE Sailors.age < 30
SELECT Sailors.name, Sailors.age FROM Sailors WHERE Sailors.age < 30
SELECT DISTINCT Boats.* FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = 1
SELECT DISTINCT R.bid FROM Reserves R WHERE R.sid = 1
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid AND bid = 102)
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Sailors.sid = Reserves.sid AND bid = 102)
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT Boats.bid FROM Boats, Reserves WHERE Boats.bid = Reserves.bid
SELECT Sailors.name FROM Sailors WHERE Sailors.name LIKE '%e%'
SELECT Sailors.name FROM Sailors WHERE Sailors.name LIKE '%e%'
SELECT sid FROM Sailors WHERE age = (SELECT max(age) FROM Sailors)
SELECT DISTINCT S.sid FROM Sailors S WHERE S.age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT S.name FROM Sailors S LEFT JOIN Sailors S2 ON S.age > S2.age WHERE S2.rating > 7
SELECT DISTINCT s1.name FROM Sailors s1, Sailors s2 WHERE s1.age > s2.age AND s2.rating > 7
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid
SELECT S.sid, S.name FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid, S.name HAVING COUNT(DISTINCT R.bid) > 1
SELECT S.name FROM Sailors S INNER JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) >= 2
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' OR Boats.color = 'blue')
SELECT DISTINCT s.sid, s.name FROM Sailors s, Reserves r, Boats b WHERE s.sid = r.sid AND r.bid = b.bid AND (b.color = 'red' OR b.color = 'blue')
SELECT DISTINCT s.sid, s.name FROM Sailors s, Reserves r, Boats b WHERE s.sid = r.sid AND r.bid = b.bid AND (b.color = 'red' OR b.color = 'blue')
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves R INNER JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue') GROUP BY sid HAVING COUNT(DISTINCT B.color) = 2)
SELECT DISTINCT R.sid FROM Reserves R, Boats B WHERE R.bid = B.bid AND B.color = 'red' INTERSECT SELECT DISTINCT R.sid FROM Reserves R, Boats B WHERE R.bid = B.bid AND B.color = 'blue'
SELECT DISTINCT S.sid, S.name FROM Sailors S, Reserves R, Boats B WHERE S.sid = R.sid AND R.bid = B.bid AND B.color IN ('red', 'blue') GROUP BY S.sid, S.name HAVING COUNT(DISTINCT B.color) = 2
SELECT S.name, S.sid FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue') GROUP BY S.sid HAVING COUNT(DISTINCT B.color) = 2
SELECT DISTINCT S.sid FROM Sailors S WHERE S.sid NOT IN (SELECT R.sid FROM Reserves R)
SELECT S.sid FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid WHERE R.sid IS NULL
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT Sailors.name, Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT S.sid FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid WHERE R.sid IS NULL
SELECT S.sid FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid WHERE R.sid IS NULL
SELECT Sailors.name FROM Sailors INNER JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.bid = 103
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Reserves.sid = Sailors.sid AND bid = 103)
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' AND rating IS NOT NULL)
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' AND rating IS NOT NULL)
SELECT name FROM Sailors WHERE rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT s.name, s.sid FROM Sailors s INNER JOIN Reserves r ON s.sid = r.sid WHERE s.rating > 2 GROUP BY s.sid, s.name
SELECT S.sid, S.name FROM Sailors S, Reserves R WHERE S.sid = R.sid AND S.rating >= 3 GROUP BY S.sid, S.name HAVING COUNT(R.sid) > 0
SELECT S.name, S.age FROM Sailors S WHERE S.age = (SELECT MAX(age) FROM Sailors)
SELECT S.name, S.age FROM Sailors S WHERE S.age = (SELECT MAX(age) FROM Sailors)
SELECT COUNT(sid) AS TotalSailors FROM Sailors
SELECT COUNT(DISTINCT S.sid) FROM Sailors S
SELECT AVG(Sailors.age) FROM Sailors WHERE Sailors.rating = 7
SELECT AVG(Sailors.age) FROM Sailors WHERE Sailors.rating = 7
SELECT COUNT(sid) FROM Sailors WHERE SUBSTR(name, 1, 1) = 'D'
SELECT COUNT(sid) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(Sailors.rating), MAX(Sailors.age) FROM Sailors
SELECT AVG(Sailors.rating) AS 'Average Rating', MAX(Sailors.age) AS 'Largest Age' FROM Sailors
SELECT name, COUNT(Reserves.bid) AS total_reservations FROM Boats, Reserves WHERE Boats.bid = Reserves.bid GROUP BY name
SELECT name, COUNT(Reserves.bid) FROM Boats, Reserves WHERE Boats.bid = Reserves.bid GROUP BY name
SELECT B.bid, COUNT(R.sid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid WHERE B.bid > 50 GROUP BY B.bid
SELECT B.bid, COUNT(R.sid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid WHERE B.bid > 50 GROUP BY B.bid
SELECT name, COUNT(*) FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY name HAVING COUNT(*) > 1
SELECT name, COUNT(Reserves.bid) FROM Boats, Reserves WHERE Boats.bid = Reserves.bid GROUP BY name HAVING COUNT(Reserves.bid) > 1
SELECT Boats.bid, COUNT(*) AS reservation_count FROM Reserves JOIN Sailors ON Reserves.sid = Sailors.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Sailors.sid > 1 GROUP BY Boats.bid
SELECT B.name, COUNT(*) FROM Boats B, Reserves R, Sailors S WHERE B.bid = R.bid AND R.sid = S.sid AND S.sid > 1 GROUP BY B.bid
SELECT rating, AVG(Sailors.age) AS AverageAge FROM Sailors, Reserves, Boats WHERE Sailors.sid = Reserves.sid AND Reserves.bid = Boats.bid AND Boats.color = 'red' GROUP BY Sailors.rating
SELECT S.rating, AVG(S.age) AS avg_age FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT S.name, S.rating, S.age FROM Sailors AS S ORDER BY S.rating, S.age
SELECT Sailors.name, Sailors.rating, Sailors.age FROM Sailors ORDER BY Sailors.rating ASC, Sailors.age ASC
SELECT COUNT(*) AS NumberOfBoats FROM Boats
SELECT COUNT(*) AS BoatCount FROM Boats
SELECT COUNT(bid) FROM Boats WHERE UPPER(color) = 'RED'
SELECT COUNT(bid) FROM Boats WHERE color LIKE 'red'
SELECT boat_name FROM (SELECT B.name AS boat_name, S.age AS sailor_age FROM Boats B INNER JOIN Reserves R ON B.bid = R.bid INNER JOIN Sailors S ON R.sid = S.sid) AS SubQuery WHERE sailor_age BETWEEN 20 AND 30
SELECT B.name FROM Boats B WHERE EXISTS (SELECT 1 FROM Reserves R JOIN Sailors S ON R.sid = S.sid WHERE R.bid = B.bid AND S.age BETWEEN 20 AND 30)
SELECT S.name FROM Sailors S WHERE NOT EXISTS (SELECT * FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' AND S2.rating >= S.rating)
SELECT S.name FROM Sailors S WHERE NOT EXISTS (SELECT 1 FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' AND S2.rating >= S.rating)
SELECT rating AS HighestRating FROM Sailors ORDER BY rating DESC LIMIT 1
SELECT rating FROM Sailors ORDER BY rating DESC LIMIT 1 OFFSET 0
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon')
SELECT s.name FROM Sailors s WHERE EXISTS (SELECT * FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.name = 'Melon')
SELECT `name`, `age` FROM `Sailors` ORDER BY `rating` DESC
SELECT `name`, `age` FROM `Sailors` ORDER BY `rating` DESC
SELECT Model FROM headphone WHERE Price IN (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price IN (SELECT MAX(Price) FROM headphone)
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model COLLATE NOCASE
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM headphone GROUP BY Class) AS Counts)
SELECT Class FROM headphone, stock WHERE headphone.Headphone_ID = stock.Headphone_ID GROUP BY Class HAVING SUM(Quantity) = (SELECT MAX(Total) FROM (SELECT SUM(Quantity) AS Total FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID GROUP BY Class) AS SubQuery)
SELECT Class FROM headphone h INNER JOIN stock s ON h.Headphone_ID = s.Headphone_ID GROUP BY h.Class HAVING COUNT(DISTINCT s.Headphone_ID) > 2
SELECT h.Class FROM headphone h GROUP BY h.Class HAVING COUNT(h.Headphone_ID) <= 2
SELECT Class, COUNT(Headphone_ID) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class ORDER BY COUNT(*) DESC
SELECT COUNT(*) FROM (SELECT Earpads FROM headphone GROUP BY Earpads) AS distinct_earpads
SELECT COUNT(DISTINCT Earpads) AS Earpad_Count FROM headphone
SELECT Earpads, TotalQuantity FROM (SELECT Earpads, SUM(Quantity) AS TotalQuantity FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID GROUP BY Earpads) AS SubQuery ORDER BY TotalQuantity DESC LIMIT 2
SELECT Earpads, COUNT(Headphone_ID) FROM headphone GROUP BY Earpads ORDER BY COUNT(Headphone_ID) DESC LIMIT 2
SELECT h.Model, h.Class, h.Construction FROM headphone h WHERE h.Price = (SELECT MIN(Price) FROM headphone)
SELECT h.Model, h.Class, h.Construction FROM headphone h WHERE h.Price = (SELECT MIN(Price) FROM headphone)
SELECT AVG(Price) AS AveragePrice, Construction FROM headphone GROUP BY Construction
SELECT headphone.Construction, AVG(headphone.Price) FROM headphone GROUP BY headphone.Construction
SELECT DISTINCT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2
SELECT DISTINCT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2
SELECT DISTINCT h.Earpads FROM headphone h WHERE h.Construction NOT LIKE '%plastic%'
SELECT Earpads FROM headphone WHERE UPPER(Construction) != 'PLASTIC'
SELECT H.Model FROM headphone H WHERE H.Price < (SELECT AVG(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone WHERE Price IS NOT NULL)
SELECT Name FROM store ORDER BY Date_Opened ASC
SELECT Name FROM store ORDER BY Date_Opened ASC
SELECT store.Name, store.Parking FROM store WHERE store.Neighborhood = 'Tarzana'
SELECT store.Name, store.Parking FROM store WHERE store.Neighborhood = 'Tarzana'
SELECT COUNT(*) FROM (SELECT DISTINCT Neighborhood FROM store) AS neighborhoods
SELECT COUNT(DISTINCT Neighborhood) AS NumberOfDistinctNeighborhoods FROM store
SELECT COUNT(Store_ID) AS NumberOfStores, Neighborhood FROM store GROUP BY Neighborhood ORDER BY Neighborhood
SELECT Neighborhood, COUNT(*) AS TotalNumberOfStores FROM store GROUP BY Neighborhood
SELECT Name, Total_Headphones FROM (SELECT store.Name AS Name, SUM(stock.Quantity) AS Total_Headphones FROM store JOIN stock ON store.Store_ID = stock.Store_ID GROUP BY store.Name ORDER BY SUM(stock.Quantity) DESC) AS RankedStores LIMIT 1
SELECT store.Name, AggregateQuantity FROM store JOIN (SELECT Store_ID, SUM(Quantity) AS AggregateQuantity FROM stock GROUP BY Store_ID) AS StockSummary ON store.Store_ID = StockSummary.Store_ID
SELECT s.Name FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT s.Name FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT Model FROM headphone EXCEPT SELECT Model FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID WHERE stock.Quantity > 0
SELECT Model FROM headphone h LEFT OUTER JOIN stock s ON h.Headphone_ID = s.Headphone_ID WHERE s.Headphone_ID IS NULL
SELECT H.Model FROM headphone H WHERE EXISTS (SELECT 1 FROM stock S WHERE S.Headphone_ID = H.Headphone_ID GROUP BY S.Headphone_ID HAVING SUM(S.Quantity) = (SELECT MAX(Total) FROM (SELECT SUM(Quantity) AS Total FROM stock GROUP BY Headphone_ID) AS Sub))
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT SUM(Quantity) FROM stock, store WHERE stock.Store_ID = store.Store_ID AND store.Name = 'Woodman'
SELECT SUM(Quantity) FROM stock s JOIN store st ON s.Store_ID = st.Store_ID WHERE st.Name = 'Woodman'
SELECT Neighborhood FROM store EXCEPT SELECT Neighborhood FROM store JOIN stock ON store.Store_ID = stock.Store_ID WHERE stock.Quantity > 0
SELECT DISTINCT Neighborhood FROM store EXCEPT SELECT DISTINCT Neighborhood FROM store JOIN stock ON store.Store_ID = stock.Store_ID WHERE stock.Quantity > 0
SELECT COUNT(DISTINCT author_id) FROM Author
SELECT COUNT(DISTINCT author_id) FROM Author
SELECT COUNT(1) FROM Paper
SELECT COUNT(1) FROM Paper
SELECT COUNT(DISTINCT affiliation_id) AS total_unique_affiliations FROM Affiliation
SELECT COUNT(affiliation_id) FROM Affiliation WHERE affiliation_id IS NOT NULL
SELECT COUNT(*) FROM Paper p WHERE p.venue = 'NAACL' AND p.year = 2000
SELECT COUNT(paper_id) AS PaperCount FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM (SELECT DISTINCT Paper.paper_id FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Paper.year = 2009 AND Affiliation.name = 'Columbia University') AS Result
SELECT COUNT(Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation WHERE name IS NOT NULL AND address IS NOT NULL
SELECT p.venue, p.year FROM Paper AS p ORDER BY p.year
SELECT DISTINCT venue FROM Paper ORDER BY year
SELECT P.title, P.paper_id FROM Paper AS P JOIN Author_list AS A ON P.paper_id = A.paper_id JOIN Affiliation AS AF ON A.affiliation_id = AF.affiliation_id WHERE AF.name LIKE 'Harvard University'
SELECT p.title, p.paper_id FROM Paper p, Author_list al, Affiliation af WHERE p.paper_id = al.paper_id AND al.affiliation_id = af.affiliation_id AND af.name = 'Harvard University'
SELECT p.title, p.paper_id FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown' GROUP BY p.paper_id, p.title
SELECT title, paper_id FROM Paper p WHERE p.paper_id IN (SELECT al.paper_id FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown')
SELECT title, paper_id FROM Paper WHERE EXISTS (SELECT * FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Stanford University' AND Author_list.paper_id = Paper.paper_id) AND EXISTS (SELECT * FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Author_list.paper_id = Paper.paper_id)
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford')) AND paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University'))
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown, Kathleen' OR A.name = 'Rambow, Owen' GROUP BY P.paper_id, P.title HAVING COUNT(DISTINCT A.name) = 2
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT AL.paper_id FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY AL.paper_id HAVING COUNT(DISTINCT A.name) = 2)
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Mckeown') AND paper_id NOT IN (SELECT paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Rambow')
SELECT P.title, P.paper_id FROM Paper P WHERE EXISTS (SELECT 1 FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown' AND AL.paper_id = P.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Rambow' AND AL.paper_id = P.paper_id)
SELECT P.title, P.paper_id FROM Paper AS P INNER JOIN Author_list AS AL ON P.paper_id = AL.paper_id INNER JOIN Author AS A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT P.title, P.paper_id FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND (A.name = 'Mckeown, Kathleen' OR A.name = 'Rambow, Owen')
SELECT A.name, COUNT(AL.paper_id) AS paper_total FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id ORDER BY paper_total DESC
SELECT A.name, COUNT(P.paper_id) AS num_of_papers FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.author_id ORDER BY num_of_papers DESC
SELECT A.name, COUNT(AL.paper_id) AS num_papers FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY A.affiliation_id ORDER BY num_papers ASC
SELECT name FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY name ORDER BY COUNT(AL.paper_id) DESC
SELECT A.name FROM Author A WHERE A.author_id IN (SELECT AL.author_id FROM Author_list AL GROUP BY AL.author_id HAVING COUNT(AL.paper_id) > 50)
SELECT A.name FROM Author A WHERE A.author_id IN (SELECT AL.author_id FROM Author_list AL GROUP BY AL.author_id HAVING COUNT(AL.paper_id) > 50)
SELECT A.name FROM Author A INNER JOIN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = 1) AS UniquePapers ON A.author_id = UniquePapers.author_id
SELECT A.name FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) = 1
SELECT venue, year FROM Paper GROUP BY venue, year HAVING COUNT(paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(paper_id) AS count FROM Paper GROUP BY venue, year) AS counts)
SELECT venue, year FROM Paper GROUP BY venue, year HAVING COUNT(paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(paper_id) as count FROM Paper GROUP BY venue, year) AS counts)
SELECT venue FROM Paper GROUP BY venue HAVING COUNT(paper_id) = (SELECT MIN(count) FROM (SELECT COUNT(paper_id) AS count FROM Paper GROUP BY venue) AS counts)
SELECT venue FROM Paper GROUP BY venue HAVING COUNT(paper_id) = (SELECT MIN(count) FROM (SELECT COUNT(paper_id) AS count FROM Paper GROUP BY venue) AS counts)
SELECT COUNT(DISTINCT paper_id) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT c.paper_id) FROM Citation c WHERE c.cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT P.paper_id, COUNT(C.cited_paper_id) AS num_citations FROM Paper P LEFT JOIN Citation C ON P.paper_id = C.cited_paper_id GROUP BY P.paper_id ORDER BY num_citations DESC LIMIT 1
SELECT cited_paper_id, COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY cited_paper_id HAVING COUNT(cited_paper_id) = (SELECT MAX(citation_count) FROM (SELECT COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY cited_paper_id) AS subquery)
SELECT P.title FROM Paper P JOIN (SELECT paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY paper_id) AS C ON P.paper_id = C.paper_id ORDER BY C.citation_count DESC LIMIT 1
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) = (SELECT MAX(citation_count) FROM (SELECT paper_id, COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY paper_id) AS counts))
sql placeholder
sql placeholder
SELECT COUNT(cited_paper_id) FROM Citation WHERE paper_id IN (SELECT paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen')
SELECT COUNT(*) FROM Citation JOIN Author_list ON Citation.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT COUNT(cited_paper_id) FROM Citation INNER JOIN Author_list ON Citation.paper_id = Author_list.paper_id INNER JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT C.cited_paper_id) FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id JOIN Citation C ON P.paper_id = C.paper_id WHERE A.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(C.cited_paper_id) FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Citation C ON AL.paper_id = C.paper_id GROUP BY A.author_id HAVING COUNT(C.cited_paper_id) = (SELECT MAX(citation_count) FROM (SELECT COUNT(C.cited_paper_id) AS citation_count FROM Author_list AL JOIN Citation C ON AL.paper_id = C.paper_id GROUP BY AL.author_id))
SELECT A.name, COUNT(C.cited_paper_id) AS citation_count FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Citation C ON AL.paper_id = C.paper_id GROUP BY A.author_id HAVING COUNT(C.cited_paper_id) = (SELECT MAX(citation_count) FROM (SELECT COUNT(C.cited_paper_id) AS citation_count FROM Author_list AL JOIN Citation C ON AL.paper_id = C.paper_id GROUP BY AL.author_id) AS MaxCitations)
SELECT DISTINCT venue, year FROM Paper p WHERE EXISTS (SELECT * FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen' AND al.paper_id = p.paper_id)
SELECT venue, year FROM Paper, Author_list, Author WHERE Paper.paper_id = Author_list.paper_id AND Author_list.author_id = Author.author_id AND Author.name = 'Mckeown, Kathleen'
SELECT venue, year FROM Paper P, Author_list AL, Affiliation A WHERE P.paper_id = AL.paper_id AND AL.affiliation_id = A.affiliation_id AND A.name = 'Columbia University'
SELECT venue, year FROM Paper WHERE paper_id IN (SELECT Author_list.paper_id FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University')
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name HAVING COUNT(P.paper_id) = (SELECT MAX(Cnt) FROM (SELECT COUNT(P.paper_id) AS Cnt FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY AL.author_id) T)
SELECT A.name FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id INNER JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name HAVING COUNT(P.paper_id) = (SELECT MAX(paper_count) FROM (SELECT COUNT(*) AS paper_count FROM Paper P INNER JOIN Author_list AL ON P.paper_id = AL.paper_id WHERE P.year = 2009 GROUP BY AL.author_id) AS SubQuery)
SELECT A.name FROM Affiliation A, Author_list AL, Paper P WHERE A.affiliation_id = AL.affiliation_id AND AL.paper_id = P.paper_id AND P.year = 2009 GROUP BY A.name ORDER BY COUNT(P.paper_id) DESC LIMIT 3
SELECT Affiliation.name, COUNT(Paper.paper_id) AS PaperCount FROM Affiliation, Author_list, Paper WHERE Affiliation.affiliation_id = Author_list.affiliation_id AND Author_list.paper_id = Paper.paper_id AND Paper.year = 2009 GROUP BY Affiliation.name ORDER BY PaperCount DESC LIMIT 3
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper, Author_list, Affiliation WHERE Paper.paper_id = Author_list.paper_id AND Author_list.affiliation_id = Affiliation.affiliation_id AND Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper, Author_list, Affiliation WHERE Paper.paper_id = Author_list.paper_id AND Author_list.affiliation_id = Affiliation.affiliation_id AND Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name = 'Stanford University' AND p.year >= 2000 AND p.year <= 2009
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p, Author_list al, Affiliation a WHERE p.paper_id = al.paper_id AND al.affiliation_id = a.affiliation_id AND a.name = 'Stanford University' AND p.year >= 2000 AND p.year <= 2009
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list GROUP BY paper_id HAVING COUNT(author_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(author_id) AS cnt FROM Author_list GROUP BY paper_id) T))
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list GROUP BY paper_id HAVING COUNT(author_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(author_id) AS cnt FROM Author_list GROUP BY paper_id) T))
WITH Collaborators AS (SELECT DISTINCT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND author_id != (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) SELECT COUNT(author_id) FROM Collaborators
SELECT COUNT(DISTINCT AL2.author_id) FROM Author A1 JOIN Author_list AL1 ON A1.author_id = AL1.author_id JOIN Author_list AL2 ON AL1.paper_id = AL2.paper_id WHERE A1.name = 'Mckeown, Kathleen' AND AL2.author_id != A1.author_id
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(paper_id) AS count FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) GROUP BY author_id) AS counts))
SELECT name FROM Author WHERE author_id = (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND author_id != (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen') GROUP BY author_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Author_list GROUP BY author_id) AS counts))
SELECT paper_id FROM Paper WHERE LOWER(title) LIKE '%translation%'
SELECT paper_id FROM Paper WHERE LOWER(title) LIKE '%translation%'
SELECT paper_id, title FROM Paper WHERE NOT EXISTS (SELECT 1 FROM Citation WHERE cited_paper_id = Paper.paper_id)
SELECT P.paper_id, P.title FROM Paper P LEFT JOIN Citation C ON P.paper_id = C.cited_paper_id WHERE C.cited_paper_id IS NULL
SELECT A.name FROM Affiliation A WHERE A.affiliation_id = (SELECT AL.affiliation_id FROM Author_list AL JOIN Affiliation AF ON AL.affiliation_id = AF.affiliation_id WHERE AF.address LIKE '%China%' GROUP BY AL.affiliation_id ORDER BY COUNT(AL.paper_id) DESC LIMIT 1)
SELECT Affiliation.name FROM Affiliation JOIN (SELECT affiliation_id, COUNT(paper_id) AS paper_count FROM Author_list GROUP BY affiliation_id) AS PaperCounts ON Affiliation.affiliation_id = PaperCounts.affiliation_id WHERE Affiliation.address LIKE '%China%' ORDER BY PaperCounts.paper_count DESC LIMIT 1
SELECT venue, COUNT(paper_id) AS count_of_papers, year FROM Paper GROUP BY venue, year ORDER BY year
SELECT year, venue, COUNT(*) AS paper_count FROM Paper GROUP BY year, venue ORDER BY paper_count DESC
SELECT affiliation.name, COUNT(DISTINCT paper.paper_id) AS num_papers FROM affiliation INNER JOIN author_list ON affiliation.affiliation_id = author_list.affiliation_id INNER JOIN paper ON author_list.paper_id = paper.paper_id GROUP BY affiliation.affiliation_id
SELECT A.name, COUNT(P.paper_id) FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id LEFT JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id, A.name
SELECT title FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(*) > 50)
SELECT title FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(*) > 50)
SELECT COUNT(*) FROM Author A WHERE NOT EXISTS (SELECT NULL FROM Author_list AL JOIN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(*) > 50) CP ON AL.paper_id = CP.cited_paper_id WHERE AL.author_id = A.author_id)
SELECT COUNT(DISTINCT author_id) FROM Author WHERE author_id NOT IN (SELECT AL.author_id FROM Author_list AL JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50) AS HighCite ON AL.paper_id = HighCite.paper_id)
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue IN ('NAACL', 'ACL') AND year = 2009))
WITH NAACL_Authors AS (SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'NAACL' AND P.year = 2009), ACL_Authors AS (SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND P.year = 2009) SELECT NAACL_Authors.name FROM NAACL_Authors JOIN ACL_Authors ON NAACL_Authors.name = ACL_Authors.name
SELECT A.name FROM Author A WHERE A.author_id NOT IN (SELECT AL.author_id FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id AND P.venue = 'ACL')
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list JOIN Paper ON Author_list.paper_id = Paper.paper_id AND Paper.venue = 'ACL')
SELECT COUNT(*) FROM conference WHERE Conference_Name != ''
SELECT COUNT(DISTINCT Conference_ID) AS TotalDistinctConferences FROM conference
SELECT DISTINCT Conference_Name FROM conference WHERE Conference_Name <> ''
SELECT DISTINCT Conference_Name FROM conference WHERE Conference_Name <> ''
SELECT c.Conference_Name, c.Year, c.Location FROM conference AS c
SELECT conf.Conference_Name, conf.Year, conf.Location FROM conference conf
SELECT c.Conference_Name, COUNT(cp.staff_ID) AS Total_Participations FROM conference AS c LEFT JOIN conference_participation AS cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name
SELECT Conference_Name, COUNT(*) AS occurrences FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(Conference_ID) FROM conference GROUP BY Year ORDER BY Year
SELECT COUNT(*), Year FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year HAVING COUNT(*) = (SELECT MIN(c) FROM (SELECT COUNT(*) AS c FROM conference GROUP BY Year) AS subquery)
SELECT Year FROM conference GROUP BY Year HAVING COUNT(Conference_ID) = (SELECT MIN(Cnt) FROM (SELECT COUNT(Conference_ID) AS Cnt FROM conference GROUP BY Year) AS SubQuery)
SELECT Location FROM (SELECT Location, COUNT(*) as ConferenceCount FROM conference GROUP BY Location) AS TempTable WHERE ConferenceCount >= 2
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2 AND Location IS NOT NULL
SELECT institution.Institution_Name, institution.Location, institution.Founded FROM institution
SELECT institution.Institution_Name, institution.Location, institution.Founded FROM institution
SELECT COUNT(*) AS CountOfInstitutions FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT COUNT(DISTINCT Institution_ID) FROM institution WHERE Founded >= 1850 AND Founded <= 1900
SELECT Institution_Name, Location FROM (SELECT Institution_Name, Location, RANK() OVER (ORDER BY Founded DESC) AS rank FROM institution) WHERE rank = 1
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution LIMIT 1)
SELECT Institution_Name, COUNT(staff_ID) FROM institution i LEFT OUTER JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE Founded > 1800 GROUP BY Institution_Name
SELECT i.Institution_ID, COUNT(s.staff_ID), s.name FROM institution i JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID, s.name
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff WHERE Institution_ID IS NOT NULL)
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(staff.Age) FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(staff.Age) FROM staff)
SELECT MAX(Age) AS MaximumAge, MIN(Age) AS MinimumAge FROM staff WHERE Nationality LIKE 'United States'
SELECT MAX(staff.Age) AS MaximumAge, MIN(staff.Age) AS MinimumAge FROM staff
SELECT c.Conference_Name FROM conference c WHERE EXISTS (SELECT 1 FROM conference_participation cp JOIN staff s ON cp.staff_ID = s.staff_ID WHERE cp.Conference_ID = c.Conference_ID AND s.Nationality = 'Canada')
SELECT DISTINCT c.Conference_Name FROM conference c WHERE c.Conference_ID IN (SELECT cp.Conference_ID FROM conference_participation cp JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada')
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp1 JOIN conference_participation cp2 ON cp1.staff_ID = cp2.staff_ID AND cp1.role = 'speaker' AND cp2.role = 'sponsor' WHERE cp1.staff_ID = s.staff_ID)
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker') AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL') AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'Naccl')))
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation CP1 WHERE CP1.Conference_ID = (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL') AND EXISTS (SELECT 1 FROM conference_participation CP2 WHERE CP2.staff_ID = CP1.staff_ID AND CP2.Conference_ID = (SELECT Conference_ID FROM conference WHERE Conference_Name = 'NACCL')))
SELECT s.name FROM staff s WHERE s.staff_ID IN (SELECT cp.staff_ID FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year IN (2003, 2004))
SELECT s.name FROM staff s WHERE s.staff_ID IN (SELECT cp.staff_ID FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year IN (2003, 2004))
SELECT c.Conference_Name, c.Year, COUNT(cp.staff_ID) FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year
SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(cp.Conference_ID) AS Total_Participants FROM conference AS c LEFT JOIN conference_participation AS cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID
SELECT conference.Conference_Name FROM conference INNER JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY conference.Conference_Name ORDER BY COUNT(conference_participation.staff_ID) DESC LIMIT 2
SELECT Conference_Name FROM (SELECT Conference_ID FROM conference_participation GROUP BY Conference_ID ORDER BY COUNT(*) DESC LIMIT 2) AS TopConferences JOIN conference ON TopConferences.Conference_ID = conference.Conference_ID
SELECT DISTINCT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE Conference_Name = 'ACL')
SELECT DISTINCT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp, conference c WHERE cp.Conference_ID = c.Conference_ID AND c.Conference_Name = 'ACL')
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT NULL FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills AS PS) ORDER BY age ASC
SELECT PS.pilot_name FROM PilotSkills AS PS WHERE PS.age < (SELECT AVG(age) FROM PilotSkills) ORDER BY PS.age
SELECT * FROM PilotSkills WHERE age BETWEEN 0 AND 29
SELECT PilotSkills.* FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35 GROUP BY pilot_name
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter' AND location IS NOT NULL
SELECT H.location FROM Hangar H WHERE H.plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar WHERE plane_name IS NOT NULL
SELECT COUNT(DISTINCT location) FROM Hangar WHERE location IS NOT NULL
SELECT plane_name FROM PilotSkills WHERE pilot_name LIKE 'Jones' AND age = 32
SELECT plane_name FROM Hangar WHERE EXISTS (SELECT 1 FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32 AND plane_name = Hangar.plane_name)
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT pilot_name) AS UniquePilots FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM Hangar WHERE plane_name = 'B-52 Bomber' AND plane_name IN (SELECT plane_name FROM PilotSkills WHERE age < 35)
SELECT COUNT(Hangar.plane_name) FROM Hangar INNER JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name WHERE PilotSkills.age < 35 AND Hangar.plane_name = 'B-52 Bombers'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT pilot_name FROM (SELECT pilot_name, age, RANK() OVER (ORDER BY age ASC) AS rank FROM PilotSkills WHERE plane_name = 'Piper Cub') AS RankedPilots WHERE rank = 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM PilotSkills GROUP BY plane_name) AS SubCounts)
WITH PlaneFrequency AS (SELECT plane_name, COUNT(*) AS Frequency FROM PilotSkills GROUP BY plane_name) SELECT plane_name FROM PlaneFrequency WHERE Frequency = (SELECT MAX(Frequency) FROM PlaneFrequency)
SELECT plane_name FROM Hangar ORDER BY (SELECT COUNT(*) FROM PilotSkills WHERE PilotSkills.plane_name = Hangar.plane_name) ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING COUNT(*) = (SELECT MIN(flight_count) FROM (SELECT COUNT(*) AS flight_count FROM PilotSkills GROUP BY plane_name) AS SubQuery)
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills INNER JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name AND Hangar.location = 'Chicago'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41
SELECT plane_name FROM Hangar h WHERE h.plane_name IN (SELECT p.plane_name FROM PilotSkills p WHERE p.pilot_name = 'Smith' AND p.age = 41)
SELECT COUNT(DISTINCT PilotSkills.plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT p.plane_name) FROM PilotSkills p
SELECT COUNT(plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(*) FROM Hangar WHERE location LIKE 'Smith'
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40 AND pilot_name IS NOT NULL
SELECT COUNT(*) FROM (SELECT DISTINCT plane_name FROM PilotSkills WHERE age > 40) AS unique_planes
SELECT pilot_name FROM PilotSkills WHERE age > 29 AND age < 41 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age IN (30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40) ORDER BY age ASC
SELECT PilotSkills.pilot_name FROM PilotSkills ORDER BY PilotSkills.age DESC
SELECT PilotSkills.pilot_name FROM PilotSkills ORDER BY PilotSkills.age DESC
SELECT Hangar.location FROM Hangar ORDER BY Hangar.plane_name ASC
SELECT location FROM Hangar WHERE plane_name IS NOT NULL ORDER BY plane_name
SELECT DISTINCT p.plane_name FROM PilotSkills p INNER JOIN Hangar h ON p.plane_name = h.plane_name ORDER BY p.plane_name ASC
SELECT plane_name FROM (SELECT DISTINCT plane_name FROM Hangar) AS unique_planes ORDER BY plane_name ASC
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter') AND ((plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30))
SELECT P.pilot_name, P.age FROM PilotSkills P WHERE (P.plane_name = 'Piper Cub' AND P.age > 35) OR (P.plane_name = 'F-14 Fighter' AND P.age < 30)
SELECT P.pilot_name FROM PilotSkills P WHERE P.plane_name = 'Piper Cub' AND NOT EXISTS (SELECT 1 FROM PilotSkills P2 WHERE P2.plane_name = 'B-52 Bomber' AND P2.pilot_name = P.pilot_name)
SELECT P.pilot_name FROM PilotSkills P LEFT JOIN PilotSkills Q ON P.pilot_name = Q.pilot_name AND Q.plane_name = 'B-52 Bomber' WHERE P.plane_name = 'Piper Cub' AND Q.pilot_name IS NULL
SELECT pilot_name FROM PilotSkills GROUP BY pilot_name HAVING SUM(CASE WHEN plane_name = 'Piper Cub' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN plane_name = 'B-52 Bomber' THEN 1 ELSE 0 END) > 0
SELECT pilot_name FROM PilotSkills WHERE pilot_name IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub') INTERSECT SELECT pilot_name FROM PilotSkills WHERE pilot_name IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT AVG(age) AS AvgAge, MIN(age) AS MinAge FROM PilotSkills
SELECT AVG(age) AS avg_age, MIN(age) AS min_age FROM PilotSkills
SELECT pilot_name FROM PilotSkills PS1 WHERE EXISTS (SELECT 1 FROM Hangar H1 WHERE H1.plane_name = PS1.plane_name AND H1.location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills PS2 WHERE EXISTS (SELECT 1 FROM Hangar H2 WHERE H2.plane_name = PS2.plane_name AND H2.location = 'Boston')
WITH AustinPilots AS (SELECT pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'), BostonPilots AS (SELECT pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Boston') SELECT pilot_name FROM AustinPilots INTERSECT SELECT pilot_name FROM BostonPilots
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION SELECT pilot_name FROM PilotSkills WHERE plane_name = 'F-14 Fighter'
SELECT DISTINCT ps.pilot_name FROM PilotSkills ps, Hangar h WHERE ps.plane_name = h.plane_name AND (h.plane_name = 'Piper Cub' OR h.plane_name = 'F-14 Fighter')
SELECT H.plane_name, AVG(P.age) AS average_age FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name
SELECT plane_name, AVG(age) AS AverageAge FROM PilotSkills GROUP BY plane_name
SELECT plane_name, COUNT(*) AS num_planes FROM Hangar GROUP BY plane_name
SELECT COUNT(*) AS total, plane_name FROM Hangar GROUP BY plane_name
SELECT P.pilot_name, P.plane_name FROM PilotSkills P INNER JOIN (SELECT plane_name, MAX(age) AS max_age FROM PilotSkills GROUP BY plane_name) AS MaxAges ON P.plane_name = MaxAges.plane_name AND P.age = MaxAges.max_age ORDER BY P.plane_name
SELECT H.plane_name, PS.pilot_name FROM Hangar H INNER JOIN PilotSkills PS ON H.plane_name = PS.plane_name WHERE PS.age = (SELECT MAX(age) FROM PilotSkills PS2 WHERE PS2.plane_name = H.plane_name) ORDER BY H.plane_name
SELECT A.pilot_name, A.plane_name FROM PilotSkills A INNER JOIN (SELECT plane_name, MAX(age) AS MaxAge FROM PilotSkills GROUP BY plane_name) B ON A.plane_name = B.plane_name AND A.age = B.MaxAge
SELECT plane_name, pilot_name FROM (SELECT plane_name, pilot_name, RANK() OVER (PARTITION BY plane_name ORDER BY age DESC) AS rnk FROM PilotSkills) WHERE rnk = 1
SELECT pilot_name, MAX(age) AS 'Max Age' FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) AS maximum_age FROM PilotSkills GROUP BY pilot_name ORDER BY pilot_name
SELECT location, COUNT(DISTINCT PilotSkills.pilot_name), AVG(PilotSkills.age) FROM Hangar INNER JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY location
SELECT location, COUNT(DISTINCT pilot_name) AS pilot_count, AVG(age) AS average_age FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY location
SELECT plane_name, COUNT(*) AS num_pilots FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT plane_name, COUNT(DISTINCT pilot_name) AS pilot_count FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT location FROM Hangar WHERE plane_name IN (SELECT plane_name FROM PilotSkills ORDER BY age ASC LIMIT 1)
SELECT location FROM Hangar WHERE EXISTS (SELECT 1 FROM PilotSkills WHERE PilotSkills.plane_name = Hangar.plane_name AND age = (SELECT MIN(age) FROM PilotSkills))
SELECT p.pilot_name, p.age FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name WHERE h.location = 'Austin'
SELECT p.pilot_name AS Name, p.age AS Age FROM PilotSkills p, Hangar h WHERE p.plane_name = h.plane_name AND h.location = 'Austin'
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1) ORDER BY pilot_name ASC
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > (SELECT MAX(P.age) FROM PilotSkills P WHERE P.plane_name = 'Piper Cub') ORDER BY pilot_name ASC
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter') GROUP BY pilot_name
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%' ORDER BY plane_name DESC
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%' ORDER BY plane_name ASC
SELECT count(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT min(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT Area_km, Government_website FROM district WHERE Population = (SELECT MIN(Population) FROM district)
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(district.Area_km) AS 'Max Area', AVG(district.Area_km) AS 'Avg Area' FROM district
SELECT SUM(Population) FROM district WHERE EXISTS (SELECT 1 FROM district AS sub WHERE sub.District_ID = district.District_ID ORDER BY sub.Area_km DESC LIMIT 3)
SELECT d.District_ID AS ID, d.Name AS DistrictName, d.Government_website AS Website FROM district d ORDER BY d.Population
SELECT Name FROM district WHERE Government_website LIKE '%.gov'
SELECT d.District_ID, d.Name FROM district d WHERE d.Population > 4000 OR d.Area_km > 3000
SELECT Name AS SpeakerName, Speach_title AS TitleOfSpeech FROM spokesman
SELECT AVG(spokesman.Points), AVG(spokesman.Age) FROM spokesman WHERE spokesman.Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age BETWEEN 0 AND 39
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
SELECT Name FROM spokesman WHERE Points < (SELECT AVG(Points) FROM spokesman WHERE Points IS NOT NULL)
SELECT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.Name HAVING COUNT(sd.Spokesman_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(sd1.Spokesman_ID) AS Cnt FROM spokesman_district sd1 GROUP BY sd1.District_ID) AS Sub)
SELECT s.Name FROM spokesman s JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID AND sd.Start_year < 2004
SELECT d.Name, COUNT(sd.Spokesman_ID) FROM district d LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.Name
SELECT d.Name FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 1) AND EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 2)
SELECT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID, d.Name HAVING COUNT(DISTINCT sd.Spokesman_ID) > 1
SELECT COUNT(*) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT s.Name FROM spokesman s LEFT JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Spokesman_ID IS NULL
SELECT SUM(Population) TotalPopulation, AVG(Population) AveragePopulation FROM district WHERE District_ID IN (SELECT DISTINCT District_ID FROM spokesman_district)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title, location FROM Paintings WHERE year IN (SELECT MIN(year) FROM Paintings)
SELECT title, location FROM Paintings WHERE year IN (SELECT MIN(year) FROM Paintings)
SELECT title FROM Sculptures WHERE location LIKE '%226%'
SELECT title FROM Sculptures WHERE location LIKE '%gallery 226%'
SELECT title, location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures WHERE location IS NOT NULL
SELECT title, location FROM Sculptures WHERE title IS NOT NULL AND location IS NOT NULL
SELECT medium FROM Paintings p WHERE p.paintingID = 80
SELECT medium FROM Paintings p WHERE p.paintingID = 80
SELECT `fname`, `lname` FROM `Artists` WHERE `birthYear` > 1850
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location <> '226'
SELECT title, year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT DISTINCT fname, lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE year < 1900 GROUP BY sculptorID)
SELECT DISTINCT fname, lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE year < 1900)
SELECT DISTINCT A.birthYear FROM Artists A, Sculptures S WHERE A.artistID = S.sculptorID AND S.year > 1920
SELECT DISTINCT A.birthYear FROM Artists A INNER JOIN Sculptures S ON A.artistID = S.sculptorID AND S.year > 1920
SELECT fname AS first_name, lname AS last_name FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname || ' ' || lname AS full_name FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1
SELECT MIN(deathYear - birthYear) FROM Artists WHERE deathYear IS NOT NULL
SELECT MIN(deathYear - birthYear) FROM Artists WHERE deathYear IS NOT NULL
SELECT fname, deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname, deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(*) FROM Paintings WHERE location LIKE 'gallery 240'
SELECT COUNT(*) AS TotalPaintings FROM Paintings WHERE location = '240'
SELECT COUNT(*) FROM Paintings p JOIN Artists a ON p.painterID = a.artistID WHERE (a.deathYear - a.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(P.paintingID) FROM Paintings P, Artists A WHERE P.painterID = A.artistID AND A.artistID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT p.title, p.year FROM Paintings p, Artists a WHERE p.painterID = a.artistID AND a.fname = 'Mary'
SELECT title AS 'Name of Painting', year AS 'Year of Creation' FROM Paintings JOIN Artists ON painterID = artistID WHERE fname = 'Mary'
SELECT width_mm FROM Paintings INNER JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT width_mm FROM Paintings INNER JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT location, medium FROM Paintings INNER JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT P.location, P.medium FROM Paintings P, Artists A WHERE P.painterID = A.artistID AND A.fname = 'Pablo'
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID IN (SELECT sculptorID FROM Sculptures)
SELECT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P) AND A.artistID IN (SELECT S.sculptorID FROM Sculptures S)
SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' INTERSECT SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'lithographic'
SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' INTERSECT SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'lithographic'
SELECT birthYear FROM Artists WHERE artistID = (SELECT painterID FROM Paintings WHERE year = 1884 AND mediumOn = 'canvas' LIMIT 1)
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884)
SELECT DISTINCT fname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium LIKE 'oil' AND P.location LIKE 'gallery 241'
SELECT A.fname FROM Artists A, Paintings P WHERE A.artistID = P.painterID AND P.medium LIKE 'oil' AND P.location LIKE 'gallery 241'
SELECT medium, COUNT(medium) AS total FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) GROUP BY medium
SELECT medium, COUNT(medium) AS count FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) GROUP BY medium
SELECT AVG(height_mm), medium FROM Paintings GROUP BY medium
SELECT AVG(height_mm), medium FROM Paintings GROUP BY medium
SELECT location, COUNT(paintingID) AS NumberOfPaintings FROM Paintings WHERE year < 1900 GROUP BY location
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location ORDER BY location
SELECT title FROM Paintings WHERE medium LIKE 'oil' AND year > 1910
SELECT title FROM Paintings WHERE medium LIKE 'oil' AND year > 1910
SELECT DISTINCT artistID FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.medium LIKE 'oil' AND p.location LIKE 'gallery 240'
SELECT DISTINCT artistID FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.medium = 'oil' AND p.location LIKE 'gallery 240'
SELECT DISTINCT title FROM Paintings P1 WHERE EXISTS (SELECT 1 FROM Paintings P2 WHERE P2.mediumOn = 'canvas' AND P1.height_mm > P2.height_mm)
SELECT DISTINCT P.title FROM Paintings P JOIN Paintings Q ON P.height_mm > Q.height_mm WHERE Q.medium = 'canvas'
SELECT DISTINCT paintingID FROM Paintings P1 WHERE P1.year < (SELECT MIN(P2.year) FROM Paintings P2 WHERE P2.location = 'gallery 240')
SELECT DISTINCT paintingID FROM Paintings P1 WHERE EXISTS (SELECT 1 FROM Paintings P2 WHERE P2.location = 'gallery 240' AND P1.year < P2.year)
SELECT paintingID FROM Paintings WHERE year IN (SELECT MIN(year) FROM Paintings)
SELECT paintingID FROM Paintings WHERE year IN (SELECT MIN(year) FROM Paintings)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE LOWER(title) LIKE '%female%')
SELECT Artists.fname || ' ' || Artists.lname AS FullName FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.title LIKE '%female%'
SELECT DISTINCT title FROM Paintings ORDER BY title COLLATE NOCASE
SELECT title FROM Paintings WHERE title IS NOT NULL GROUP BY title ORDER BY title ASC
SELECT DISTINCT title FROM Paintings ORDER BY width_mm
SELECT title FROM Paintings WHERE height_mm IS NOT NULL ORDER BY height_mm ASC
WITH CombinedArt AS (SELECT title, year FROM Paintings UNION ALL SELECT title, year FROM Sculptures) SELECT title FROM CombinedArt WHERE year BETWEEN 1900 AND 1950
SELECT Artwork.title FROM (SELECT title, year FROM Paintings UNION ALL SELECT title, year FROM Sculptures) AS Artwork WHERE Artwork.year BETWEEN 1900 AND 1950
SELECT title FROM (SELECT title, painterID AS artistID FROM Paintings UNION ALL SELECT title, sculptorID FROM Sculptures) AS Works WHERE artistID = 222
SELECT title FROM (SELECT title, 'Painting' AS Type FROM Paintings WHERE painterID = 222 UNION ALL SELECT title, 'Sculpture' FROM Sculptures WHERE sculptorID = 222) AS Artworks
SELECT painterID FROM Paintings WHERE year < 1900 GROUP BY painterID HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Paintings WHERE year < 1900 GROUP BY painterID) AS subquery)
WITH PaintingCounts AS (SELECT painterID, COUNT(*) AS NumberOfPaintings FROM Paintings WHERE year < 1900 GROUP BY painterID) SELECT painterID FROM PaintingCounts ORDER BY NumberOfPaintings DESC LIMIT 1
SELECT A.fname FROM Artists A, Sculptures S WHERE A.artistID = S.sculptorID GROUP BY A.artistID HAVING COUNT(S.sculptureID) = (SELECT MAX(COUNT) FROM (SELECT COUNT(S.sculptureID) AS COUNT FROM Sculptures S GROUP BY S.sculptorID) T)
SELECT fname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(sculptureID) = (SELECT MAX(cnt) FROM (SELECT COUNT(sculptureID) AS cnt FROM Sculptures GROUP BY sculptorID) tmp))
SELECT title FROM Paintings WHERE (width_mm < 600) OR (height_mm > 800)
SELECT title FROM Paintings WHERE (width_mm < 600) OR (height_mm > 800)
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930 GROUP BY location
SELECT location FROM Paintings WHERE year NOT BETWEEN 1885 AND 1930 GROUP BY location
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000 GROUP BY paintingID
SELECT paintingID FROM Paintings WHERE height_mm BETWEEN 501 AND 1999 GROUP BY paintingID HAVING COUNT(*) = 1
SELECT location FROM Paintings WHERE medium LIKE 'on panel' OR medium LIKE 'on canvas'
SELECT DISTINCT location FROM Paintings WHERE medium IN ('on panels', 'on canvas')
SELECT location FROM Paintings WHERE year < 1885 UNION ALL SELECT location FROM Paintings WHERE year > 1930
SELECT DISTINCT location FROM Paintings WHERE location IN (SELECT location FROM Paintings WHERE year < 1885) INTERSECT SELECT location FROM Paintings WHERE location IN (SELECT location FROM Paintings WHERE year > 1930)
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 241'
SELECT AVG(height_mm) as Height_Avg, AVG(width_mm) as Width_Avg FROM Paintings WHERE medium = 'oil' AND location = '241'
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 AND height_mm = (SELECT MAX(height_mm) FROM Paintings WHERE year < 1900)
SELECT MAX(height_mm) AS height, paintingID FROM Paintings WHERE year < 1900 GROUP BY paintingID ORDER BY height DESC LIMIT 1
SELECT year, MAX(height_mm) AS maxHeight, MAX(width_mm) AS maxWidth FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) AS maxHeight, MAX(width_mm) AS maxWidth FROM Paintings GROUP BY year
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID ORDER BY A.lname, A.fname
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.fname, COUNT(P.paintingID) FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT fname, COUNT(paintingID) FROM Artists JOIN Paintings ON artistID = painterID GROUP BY artistID, fname HAVING COUNT(paintingID) >= 2
SELECT A.deathYear FROM Artists A WHERE (SELECT COUNT(P.paintingID) FROM Paintings P WHERE P.painterID = A.artistID) <= 3
SELECT A.deathYear FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) < 4
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM (SELECT sculptorID, COUNT(*) AS num_sculptures FROM Sculptures GROUP BY sculptorID ORDER BY num_sculptures ASC) AS temp LIMIT 1)
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT paintingID, height_mm FROM Paintings WHERE location = 'gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT paintingID, height_mm FROM Paintings WHERE location = '240' ORDER BY width_mm DESC LIMIT 1 OFFSET 0
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240') GROUP BY paintingID HAVING COUNT(*) = 1
SELECT P.paintingID FROM Paintings P WHERE P.year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240' GROUP BY location)
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT MAX(P.height_mm) FROM Paintings P WHERE P.year > 1900)
SELECT DISTINCT paintingID FROM Paintings WHERE height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT A.fname, A.lname, COUNT(P.paintingID) AS TotalOilPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium LIKE 'oil' GROUP BY A.artistID ORDER BY TotalOilPaintings DESC LIMIT 3
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' GROUP BY painterID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT paintingID, location, title FROM Paintings WHERE medium LIKE 'oil' ORDER BY year ASC
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY Paintings.year ASC
SELECT year, location, title FROM Paintings WHERE height_mm > '1000' ORDER BY title
SELECT Paintings.year, Paintings.location, Paintings.title FROM Paintings WHERE Paintings.height_mm > 1000 ORDER BY Paintings.title ASC
SELECT a.fname, a.lname FROM Artists a WHERE a.artistID IN (SELECT painterID FROM Paintings) AND a.artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings EXCEPT SELECT sculptorID FROM Sculptures)
SELECT location FROM Paintings WHERE year < 1885 EXCEPT SELECT location FROM Paintings WHERE mediumOn = 'canvas'
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn NOT IN ('canvas')
SELECT COUNT(Race_Name) FROM race
SELECT COUNT(Race_Name) FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous' AND Pole_Position IS NOT NULL
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver WHERE Age IS NOT NULL ORDER BY Age ASC
SELECT Entrant FROM driver WHERE Age >= 20 GROUP BY Entrant
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20 AND Entrant <> ''
SELECT MAX(driver.Age), MIN(driver.Age) FROM driver
SELECT MAX(Age) AS MaximumAge, MIN(Age) AS MinimumAge FROM driver
SELECT DISTINCT COUNT(Engine) FROM driver GROUP BY Age HAVING Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver GROUP BY Engine HAVING Age > 30 OR Age < 20
SELECT d.Driver_Name FROM driver d ORDER BY d.Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY LOWER(Driver_Name) DESC
SELECT driver.Driver_Name, race.Race_Name FROM driver INNER JOIN race ON driver.Driver_ID = race.Driver_ID
SELECT driver.Driver_Name, race.Race_Name FROM driver JOIN race USING(Driver_ID)
SELECT d.Driver_Name AS Name, COUNT(r.Driver_ID) AS Races FROM driver d LEFT JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY Name
SELECT Driver_Name, COUNT(r.Race_Name) AS Races_Participated FROM driver JOIN race r USING (Driver_ID) GROUP BY Driver_Name
SELECT Age FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM race GROUP BY Driver_ID) T))
SELECT d.Age FROM driver d WHERE d.Driver_ID = (SELECT r.Driver_ID FROM race r GROUP BY r.Driver_ID HAVING COUNT(r.Driver_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(*) as Count FROM race GROUP BY Driver_ID) as RaceCounts))
SELECT driver.Driver_Name, driver.Age FROM driver, race WHERE driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID HAVING COUNT(race.Driver_ID) >= 2
SELECT D.Driver_Name, D.Age FROM driver D WHERE (SELECT COUNT(*) FROM race R WHERE R.Driver_ID = D.Driver_ID) >= 2
SELECT Race_Name FROM race, driver WHERE race.Driver_ID = driver.Driver_ID AND driver.Age >= 26
SELECT r.Race_Name FROM race AS r INNER JOIN driver AS d ON r.Driver_ID = d.Driver_ID AND d.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor NOT LIKE 'Bugatti'
SELECT Driver_Name FROM driver WHERE 'Bugatti' <> Constructor
SELECT Constructor, COUNT(Driver_ID) AS CountOfDrivers FROM driver GROUP BY Constructor HAVING COUNT(Driver_ID) > 0
SELECT Constructor, COUNT(Driver_Name) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM driver GROUP BY Engine) AS counts)
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM driver GROUP BY Engine) AS Counts)
SELECT DISTINCT Engine FROM driver GROUP BY Engine HAVING COUNT(*) > 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) > 1
SELECT d.Driver_Name FROM driver d LEFT JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Driver_ID IS NULL
SELECT d.Driver_Name FROM driver d LEFT JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Driver_ID IS NULL
SELECT DISTINCT d1.Constructor FROM driver d1 JOIN driver d2 ON d1.Constructor = d2.Constructor WHERE d1.Age < 20 AND d2.Age > 30
SELECT DISTINCT Constructor FROM driver WHERE Constructor IN (SELECT Constructor FROM driver WHERE Age < 20) AND Constructor IN (SELECT Constructor FROM driver WHERE Age > 30) GROUP BY Constructor HAVING COUNT(DISTINCT Age) > 1
SELECT r.Winning_team FROM race r GROUP BY r.Winning_team HAVING COUNT(r.Winning_team) > 1
SELECT r.Winning_team FROM race r GROUP BY r.Winning_team HAVING COUNT(r.Winning_team) > 1
SELECT Driver_Name FROM driver d WHERE (SELECT COUNT(*) FROM race WHERE Driver_ID = d.Driver_ID AND Pole_Position IN ('James Hinchcliffe', 'Carl Skerlong')) = 2
SELECT d.Driver_Name FROM driver d, race r WHERE d.Driver_ID = r.Driver_ID AND r.Pole_Position = 'James Hinchcliffe' INTERSECT SELECT d.Driver_Name FROM driver d, race r WHERE d.Driver_ID = r.Driver_ID AND r.Pole_Position = 'Carl Skerlong'
SELECT d.Driver_Name FROM driver d WHERE NOT EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT d.Driver_Name FROM driver d WHERE NOT EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT COUNT(*) AS language_count FROM languages
SELECT COUNT(*) AS language_count FROM languages
SELECT name FROM languages ORDER BY name
SELECT name FROM languages ORDER BY name
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name AS CountryName FROM countries ORDER BY overall_score DESC
SELECT name AS CountryName FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) AS avgJustice FROM countries
SELECT AVG(justice_score) FROM countries WHERE justice_score > 0
SELECT MAX(c.health_score), MIN(c.health_score) FROM countries c WHERE c.name <> 'Norway'
SELECT MAX(health_score) AS MaxHealth, MIN(health_score) AS MinHealth FROM countries WHERE NOT name = 'Norway'
SELECT COUNT(language_id) FROM (SELECT DISTINCT language_id FROM official_languages) AS distinct_languages
SELECT COUNT(DISTINCT language_id) AS total_official_languages FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT c.name AS Country, l.name AS Language FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT c.name AS Country, l.name AS Language FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT L.name, COUNT(DISTINCT O.country_id) AS num_countries FROM languages AS L LEFT JOIN official_languages AS O ON L.id = O.language_id GROUP BY L.name
SELECT name, COUNT(DISTINCT country_id) FROM languages LEFT OUTER JOIN official_languages ON languages.id = official_languages.language_id GROUP BY name
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(country_id) = (SELECT MAX(count) FROM (SELECT COUNT(country_id) AS count FROM official_languages GROUP BY language_id) AS counts))
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(DISTINCT country_id) > 1 ORDER BY language_id)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(country_id) >= 2)
SELECT AVG(overall_score) FROM countries WHERE EXISTS (SELECT 1 FROM official_languages JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English' AND countries.id = official_languages.country_id)
SELECT AVG(overall_score) FROM countries WHERE EXISTS (SELECT 1 FROM official_languages ol JOIN languages l ON ol.language_id = l.id WHERE ol.country_id = countries.id AND l.name = 'English')
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(language_id) DESC LIMIT 3)
SELECT name FROM languages AS L JOIN (SELECT language_id, COUNT(*) AS num_countries FROM official_languages GROUP BY language_id ORDER BY num_countries DESC LIMIT 3) AS OL ON L.id = OL.language_id
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages JOIN countries ON official_languages.country_id = countries.id GROUP BY language_id ORDER BY AVG(overall_score) DESC)
SELECT languages.name AS LanguageName FROM languages JOIN official_languages ON languages.id = official_languages.language_id JOIN countries ON official_languages.country_id = countries.id GROUP BY languages.name ORDER BY AVG(countries.overall_score) DESC
SELECT name FROM countries WHERE id = (SELECT country_id FROM official_languages GROUP BY country_id HAVING COUNT(language_id) = (SELECT MAX(count) FROM (SELECT COUNT(language_id) AS count FROM official_languages GROUP BY country_id) AS counts))
SELECT c.name FROM countries c WHERE EXISTS (SELECT NULL FROM official_languages ol WHERE ol.country_id = c.id GROUP BY ol.country_id HAVING COUNT(ol.language_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(language_id) AS cnt FROM official_languages GROUP BY country_id) sub))
SELECT L.name FROM languages L WHERE NOT EXISTS (SELECT 1 FROM official_languages O WHERE O.language_id = L.id)
SELECT L.name FROM languages L WHERE L.id NOT IN (SELECT O.language_id FROM official_languages O)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT DISTINCT L.name FROM languages L WHERE L.id IN (SELECT OL.language_id FROM official_languages OL JOIN countries C ON OL.country_id = C.id GROUP BY OL.language_id HAVING MAX(C.overall_score) > 95 AND MIN(C.overall_score) < 90)
SELECT language.name FROM languages language JOIN official_languages ol ON language.id = ol.language_id JOIN countries country ON ol.country_id = country.id GROUP BY language.id HAVING MAX(country.overall_score) > 95 AND MIN(country.overall_score) < 90
SELECT DISTINCT Addresses.country, Addresses.town_city FROM Addresses
SELECT country, town_city FROM Addresses
SELECT DISTINCT Properties.property_id, Addresses.county_state_province FROM Properties JOIN Addresses ON Properties.property_address_id = Addresses.address_id
SELECT DISTINCT P.property_id, A.county_state_province FROM Properties P INNER JOIN Addresses A ON P.property_address_id = A.address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT F.feature_name, F.feature_description FROM Features F, (SELECT feature_id FROM Property_Features GROUP BY feature_id HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Property_Features GROUP BY feature_id) AS counts)) AS MostCommon WHERE F.feature_id = MostCommon.feature_id
SELECT F.feature_name, F.feature_description FROM Features F INNER JOIN (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1) AS MostCommon ON F.feature_id = MostCommon.feature_id
sql placeholder
SELECT room_count FROM Properties ORDER BY room_count LIMIT 1
SELECT COUNT(*) AS NumberOfProperties FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y'
SELECT COUNT(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y' GROUP BY parking_lots, garage_yn
SELECT DISTINCT R.age_category_description FROM Users U INNER JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE U.other_user_details LIKE '%Mother%'
SELECT DISTINCT RAC.age_category_description FROM Users U LEFT JOIN Ref_Age_Categories RAC ON U.age_category_code = RAC.age_category_code WHERE U.other_user_details LIKE '%Mother%'
SELECT U.first_name FROM Users U WHERE EXISTS (SELECT 1 FROM Properties P WHERE P.owner_user_id = U.user_id GROUP BY P.owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT U.first_name FROM Users U WHERE U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) = (SELECT MAX(property_count) FROM (SELECT COUNT(*) AS property_count FROM Properties GROUP BY owner_user_id) AS Temp))
SELECT AVG(room_count) FROM Properties p WHERE EXISTS (SELECT 1 FROM Property_Features pf JOIN Features f ON pf.feature_id = f.feature_id WHERE pf.property_id = p.property_id AND f.feature_name = 'garden')
SELECT AVG(room_count) FROM Rooms r JOIN Properties p ON r.property_id = p.property_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'garden' AND pf.feature_value = 'Yes'
SELECT DISTINCT town_city FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name LIKE 'swimming pool'
SELECT DISTINCT town_city FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'swimming pool' GROUP BY a.town_city
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT AVG(room_count) FROM (SELECT COUNT(*) AS room_count FROM Rooms GROUP BY property_id) AS RoomSummary
SELECT AVG(room_count) FROM Properties p JOIN Rooms r ON p.property_id = r.property_id
SELECT COUNT(DISTINCT room_size) AS NumberOfUniqueRoomSizes FROM Rooms
SELECT COUNT(DISTINCT Rooms.room_size) FROM Rooms
SELECT DISTINCT user_id, search_string FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT U.user_id, US.search_seq FROM Users U, User_Searches US WHERE U.user_id = US.user_id AND U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2) GROUP BY U.user_id, US.search_seq
SELECT MAX(search_datetime) FROM User_Searches
SELECT MAX(search_datetime) FROM User_Searches
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC, search_datetime DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC, search_datetime DESC
SELECT zip_postcode FROM Addresses WHERE address_id IN (SELECT property_address_id FROM Properties P LEFT JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) > 2) AS X ON P.owner_user_id = X.owner_user_id WHERE X.owner_user_id IS NULL)
SELECT A.zip_postcode FROM Addresses A WHERE EXISTS (SELECT 1 FROM Properties P WHERE P.property_address_id = A.address_id AND P.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) <= 2))
SELECT U.user_id, U.user_category_code FROM Users U WHERE (SELECT COUNT(*) FROM User_Searches US WHERE US.user_id = U.user_id) = 1
SELECT U.user_id, U.user_category_code FROM Users U WHERE U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) = 1)
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM (SELECT user_id FROM User_Searches ORDER BY search_datetime ASC) AS FirstSearch))
SELECT age_category_code FROM Users WHERE user_id IN (SELECT user_id FROM User_Searches ORDER BY search_datetime ASC LIMIT 1)
SELECT U.login_name FROM Users U JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior Citizen' ORDER BY U.first_name
SELECT U.login_name FROM Users AS U JOIN Ref_Age_Categories AS R ON U.age_category_code = R.age_category_code AND R.age_category_description = 'Senior' ORDER BY U.first_name
SELECT COUNT(*) FROM User_Searches WHERE user_id IN (SELECT user_id FROM Users WHERE is_buyer = 'yes')
SELECT COUNT(User_Searches.search_seq) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = '1'
SELECT date_registered FROM Users WHERE login_name LIKE 'ratione'
SELECT date_registered FROM Users WHERE login_name LIKE 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = true
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT line_1_number_building, line_2_number_street, town_city FROM Addresses WHERE EXISTS (SELECT 1 FROM Users WHERE Users.user_address_id = Addresses.address_id AND age_category_code = (SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description = 'Senior Citizens'))
SELECT DISTINCT Addresses.line_1_number_building, Addresses.line_2_number_street, Addresses.town_city FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE Ref_Age_Categories.age_category_description = 'senior citizen'
SELECT COUNT(DISTINCT P.property_id) FROM Properties P JOIN Property_Features PF ON P.property_id = PF.property_id GROUP BY P.property_id HAVING COUNT(PF.feature_id) >= 2
SELECT COUNT(DISTINCT P.property_id) FROM Properties P JOIN Property_Features PF ON P.property_id = PF.property_id GROUP BY P.property_id HAVING COUNT(PF.feature_id) >= 2
SELECT property_id, COUNT(*) FROM Property_Photos GROUP BY property_id
SELECT p.property_id, COUNT(pp.photo_seq) FROM Properties p LEFT OUTER JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.property_id
SELECT U.user_id, COUNT(P.photo_seq) AS TotalPhotos FROM Users U CROSS JOIN Properties PR ON U.user_id = PR.owner_user_id CROSS JOIN Property_Photos P ON PR.property_id = P.property_id GROUP BY U.user_id
SELECT p.owner_user_id, COUNT(pp.photo_seq) AS photo_count FROM Properties p JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.owner_user_id
SELECT SUM(p.price_max) FROM Properties p, Users u, Ref_User_Categories r WHERE p.owner_user_id = u.user_id AND u.user_category_code = r.user_category_code AND (r.user_category_description = 'single mother' OR r.user_category_description = 'student')
SELECT SUM(price_max) FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id JOIN Ref_User_Categories r ON u.user_category_code = r.user_category_code WHERE r.user_category_description IN ('single mothers', 'students') GROUP BY u.user_id
SELECT User_Property_History.datestamp, Properties.property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp
SELECT User_Property_History.datestamp, Properties.property_name FROM User_Property_History JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp
SELECT R.property_type_description, R.property_type_code FROM Ref_Property_Types R WHERE R.property_type_code = (SELECT P.property_type_code FROM Properties P GROUP BY P.property_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT R.property_type_description FROM Ref_Property_Types R, (SELECT property_type_code FROM Properties GROUP BY property_type_code HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) as Cnt FROM Properties GROUP BY property_type_code) as Counts)) as MostCommon WHERE R.property_type_code = MostCommon.property_type_code
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60' ORDER BY age_category_description ASC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT room_size, COUNT(*) AS count FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(room_number) AS total_rooms FROM Rooms GROUP BY room_size ORDER BY total_rooms DESC
SELECT country FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id WHERE Users.first_name = 'Robbie'
SELECT A.country FROM Addresses A, Users U WHERE A.address_id = U.user_address_id AND U.first_name = 'Robbie'
SELECT first_name, middle_name, last_name FROM Users WHERE EXISTS (SELECT 1 FROM Properties WHERE owner_user_id = Users.user_id AND property_address_id = Users.user_address_id)
SELECT U.first_name || ' ' || COALESCE(U.middle_name, '') || ' ' || U.last_name AS FullName FROM Users U, Properties P WHERE U.user_id = P.owner_user_id
SELECT search_string FROM User_Searches AS US WHERE NOT EXISTS (SELECT NULL FROM Properties AS P WHERE P.owner_user_id = US.user_id)
SELECT search_string FROM User_Searches AS US WHERE NOT EXISTS (SELECT NULL FROM Properties AS P WHERE P.owner_user_id = US.user_id)
SELECT U.last_name, U.user_id FROM Users U INNER JOIN Properties P ON U.user_id = P.owner_user_id GROUP BY U.user_id, U.last_name HAVING COUNT(DISTINCT P.property_id) >= 2 AND (SELECT COUNT(*) FROM User_Searches S WHERE S.user_id = U.user_id) <= 2
SELECT U.user_id, U.last_name FROM Users U JOIN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) <= 2) US ON U.user_id = US.user_id JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) >= 2) P ON U.user_id = P.owner_user_id
SELECT COUNT(*) FROM bike WHERE weight > 780.0
SELECT product_name, weight FROM bike ORDER BY price
SELECT name, nation, heat FROM cyclist
SELECT (SELECT MAX(weight) FROM bike) AS MaxWeight, (SELECT MIN(weight) FROM bike) AS MinWeight
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC' AND price > 0
SELECT name, result FROM cyclist WHERE nation NOT LIKE 'Russia'
SELECT DISTINCT b.id AS BikeID, b.product_name AS BikeName FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id WHERE cob.purchase_year > 2015
SELECT id, product_name FROM bike WHERE EXISTS (SELECT 1 FROM cyclists_own_bikes WHERE bike.id = cyclists_own_bikes.bike_id GROUP BY bike_id HAVING COUNT(DISTINCT cyclist_id) >= 4)
SELECT c.id, c.name FROM cyclist c JOIN cyclists_own_bikes b ON c.id = b.cyclist_id GROUP BY c.id, c.name HAVING COUNT(b.bike_id) = (SELECT MAX(count) FROM (SELECT COUNT(bike_id) AS count FROM cyclists_own_bikes GROUP BY cyclist_id) as counts)
SELECT DISTINCT product_name FROM bike b INNER JOIN cyclists_own_bikes cob ON b.id = cob.bike_id INNER JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation IN ('Russia', 'Great Britain')
SELECT COUNT(DISTINCT heat) AS NumberOfHeats FROM cyclist
SELECT COUNT(*) FROM (SELECT id FROM cyclist EXCEPT SELECT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015) AS NonPurchasers
SELECT DISTINCT b.product_name FROM bike b, cyclists_own_bikes cob, cyclist c WHERE b.id = cob.bike_id AND cob.cyclist_id = c.id AND c.result < '4:21.558'
WITH BradleyBikes AS (SELECT bike_id FROM cyclists_own_bikes JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name = 'Bradley Wiggins'), AntonioBikes AS (SELECT bike_id FROM cyclists_own_bikes JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name = 'Antonio Tauler') SELECT product_name, price FROM bike WHERE id IN (SELECT bike_id FROM BradleyBikes INTERSECT SELECT bike_id FROM AntonioBikes)
SELECT c.name, c.nation, c.result FROM cyclist c LEFT JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id LEFT JOIN bike b ON cob.bike_id = b.id WHERE b.product_name LIKE '%racing%' AND cob.cyclist_id IS NULL
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist_id, COUNT(bike_id) AS count_of_bikes FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake')
SELECT Id, Flavor FROM (SELECT Id, Flavor, RANK() OVER (ORDER BY Price DESC) as rank FROM goods WHERE Food = 'cake') WHERE rank = 1
SELECT Flavor, MIN(Price) FROM goods WHERE Food = 'cookie' GROUP BY Flavor HAVING Price = MIN(Price) ORDER BY Price ASC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT DISTINCT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor LIKE 'apple'
SELECT goods.Id FROM goods WHERE Price < 3.00
SELECT goods.Id FROM goods WHERE Price < '3.0'
SELECT DISTINCT customers.Id FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'cake' AND goods.Flavor = 'lemon'
SELECT DISTINCT c.Id FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id AND g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT Food, COUNT(DISTINCT CustomerId) AS Customers FROM goods LEFT JOIN items ON goods.Id = items.Item LEFT JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY Food
SELECT Food, COUNT(DISTINCT CustomerId) AS Customers FROM goods LEFT JOIN items ON goods.Id = items.Item LEFT JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY Food
SELECT c.Id FROM customers c INNER JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) >= 15
SELECT Id FROM customers WHERE EXISTS (SELECT NULL FROM receipts WHERE CustomerId = customers.Id GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15)
SELECT c.LastName FROM customers c JOIN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) > 10) AS sub ON c.Id = sub.CustomerId
SELECT c.LastName FROM customers c WHERE c.Id IN (SELECT r.CustomerId FROM receipts r GROUP BY r.CustomerId HAVING COUNT(r.ReceiptNumber) > 10)
SELECT COUNT(Flavor) FROM (SELECT DISTINCT Flavor FROM goods WHERE Food = 'Cake')
SELECT COUNT(DISTINCT Id) FROM goods WHERE Food = 'cake'
SELECT Flavor FROM goods WHERE Food = 'Croissant' AND Flavor IS NOT NULL
SELECT DISTINCT Flavor FROM goods WHERE Food = 'croissant'
SELECT DISTINCT Flavor, Food FROM goods g JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber WHERE r.CustomerId = 15
SELECT DISTINCT goods.Flavor FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = 15
SELECT Food, AVG(Price) as AvgPrice, MAX(Price) as MaximumPrice, MIN(Price) as MinimumPrice FROM goods GROUP BY Food
SELECT g.Food, AVG(g.Price) as AvgPrice, MIN(g.Price) as MinPrice, MAX(g.Price) as MaxPrice FROM goods g GROUP BY g.Food
SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Food = 'Cake') INTERSECT SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Food = 'Cookie')
SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'cakes' INTERSECT SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'cookies'
SELECT receipts.ReceiptNumber FROM receipts INNER JOIN customers ON receipts.CustomerId = customers.Id INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id WHERE customers.LastName = 'LOGAN' AND goods.Food = 'Croissant' GROUP BY receipts.ReceiptNumber
SELECT ReceiptNumber FROM receipts WHERE CustomerId IN (SELECT Id FROM customers WHERE LastName = 'Logan') AND ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Food = 'croissant'))
SELECT R.ReceiptNumber, R.Date FROM receipts R WHERE R.ReceiptNumber IN (SELECT I.Receipt FROM items I JOIN goods G ON I.Item = G.Id WHERE G.Price = (SELECT MAX(Price) FROM goods))
SELECT ReceiptNumber, Date FROM receipts WHERE EXISTS (SELECT 1 FROM items JOIN goods ON items.Item = goods.Id WHERE receipts.ReceiptNumber = items.Receipt AND goods.Price = (SELECT MAX(Price) FROM goods))
SELECT T1.Food, T1.Flavor FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item GROUP BY T2.Item ORDER BY COUNT(*) ASC LIMIT 1
SELECT G.Food FROM goods G INNER JOIN items I ON G.Id = I.Item GROUP BY G.Id HAVING COUNT(I.Item) = (SELECT MIN(ItemCount) FROM (SELECT COUNT(Item) AS ItemCount FROM items GROUP BY Item) AS SubQuery)
SELECT Food, COUNT(Id) FROM goods GROUP BY Food
SELECT Food, COUNT(Id) FROM goods GROUP BY Food
SELECT Food, AVG(Price) average_price FROM goods GROUP BY Food
SELECT Food, AVG(Price) FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor LIKE 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor LIKE 'Apricot' AND Price < 5
SELECT g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price > 10
SELECT g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price > 10
SELECT DISTINCT g.Id, g.Price FROM goods g WHERE g.Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g.Id, g.Price FROM goods g WHERE g.Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(Price) FROM goods WHERE Flavor = 'Tart' GROUP BY Flavor)
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(g2.Price) FROM goods g2 WHERE g2.Flavor = 'Tart') AND g.Flavor <> 'Tart'
SELECT DISTINCT R.ReceiptNumber FROM receipts R, items I, goods G WHERE R.ReceiptNumber = I.Receipt AND I.Item = G.Id AND G.Price > 13
SELECT DISTINCT r.ReceiptNumber FROM receipts r WHERE r.ReceiptNumber IN (SELECT i.Receipt FROM items i WHERE i.Item IN (SELECT g.Id FROM goods g WHERE g.Price > 13))
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 15 GROUP BY r.Date HAVING COUNT(*) > 0
SELECT Date FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 15))
SELECT goods.Id FROM goods WHERE goods.Id LIKE '%%APP%%'
SELECT Id FROM goods WHERE UPPER(Id) LIKE UPPER('%APP%')
SELECT Flavor, Price FROM goods WHERE Id LIKE '%70_'
SELECT goods.Id, goods.Price FROM goods WHERE goods.Id LIKE '%70%'
SELECT c.LastName FROM customers c ORDER BY c.LastName ASC
SELECT c.LastName FROM customers c ORDER BY c.LastName ASC
SELECT goods.Id AS GoodID FROM goods ORDER BY GoodID ASC
SELECT DISTINCT g.Id FROM goods g ORDER BY g.Id
SELECT DISTINCT R.ReceiptNumber FROM receipts R LEFT JOIN items I ON R.ReceiptNumber = I.Receipt LEFT JOIN goods G ON I.Item = G.Id WHERE G.Flavor = 'apple' AND G.Food = 'pie' OR R.CustomerId = 12
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie' UNION SELECT ReceiptNumber FROM receipts WHERE CustomerId = 12
SELECT r.ReceiptNumber, r.Date FROM receipts r WHERE r.Date = (SELECT MAX(r2.Date) FROM receipts r2)
SELECT ReceiptNumber, Date FROM receipts WHERE Date IN (SELECT MAX(Date) FROM receipts)
SELECT DISTINCT r.ReceiptNumber FROM receipts r LEFT JOIN items i ON r.ReceiptNumber = i.Receipt LEFT JOIN goods g ON i.Item = g.Id WHERE r.Date = (SELECT MIN(Date) FROM receipts) OR g.Price > 10
SELECT ReceiptNumber FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10)) OR Date = (SELECT MIN(Date) FROM receipts)
SELECT Id FROM goods WHERE (Food = 'Cookie' OR Food = 'Cake') AND Price > 2.99 AND Price < 7.01
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price BETWEEN 3 AND 7 UNION SELECT Id FROM goods WHERE Food = 'Cakes' AND Price BETWEEN 3 AND 7
SELECT c.FirstName, c.LastName FROM customers c WHERE EXISTS (SELECT 1 FROM receipts r WHERE r.CustomerId = c.Id AND r.Date = (SELECT MIN(Date) FROM receipts))
SELECT FirstName, LastName FROM customers WHERE Id = (SELECT CustomerId FROM receipts ORDER BY Date ASC LIMIT 1)
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) AS AveragePrice FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT * FROM (SELECT Price FROM goods WHERE Flavor = 'cheese' ORDER BY Price) AS Cheapest LIMIT 1
SELECT * FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT Flavor, MAX(Price) AS MaximumPrice, MIN(Price) AS MinimumPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor ASC
SELECT Flavor, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor ASC
SELECT Food, MIN(Price) AS LowPrice, MAX(Price) AS HighPrice FROM goods GROUP BY Food ORDER BY Food ASC
SELECT Food, MIN(Price) AS Minimum, MAX(Price) AS Maximum FROM goods GROUP BY Food ORDER BY Food ASC
SELECT Date FROM (SELECT Date, COUNT(ReceiptNumber) AS ReceiptCount FROM receipts GROUP BY Date) AS ReceiptSummary ORDER BY ReceiptCount DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT c.FirstName, c.LastName, COUNT(r.ReceiptNumber) FROM customers c LEFT JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id ORDER BY COUNT(r.ReceiptNumber) DESC LIMIT 1
SELECT CustomerId, COUNT(*) FROM receipts GROUP BY CustomerId HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM receipts GROUP BY CustomerId) AS SubQuery)
SELECT receipts.Date, COUNT(DISTINCT customers.Id) AS NumberOfDistinctCustomers FROM receipts INNER JOIN customers ON receipts.CustomerId = customers.Id GROUP BY receipts.Date
SELECT r.Date, COUNT(DISTINCT CustomerId) AS TotalCustomers FROM receipts r GROUP BY r.Date ORDER BY r.Date
SELECT c.FirstName, c.LastName FROM customers c WHERE EXISTS (SELECT * FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE r.CustomerId = c.Id AND g.Flavor = 'apple' AND g.Food = 'Tart')
SELECT c.FirstName, c.LastName FROM customers AS c INNER JOIN receipts AS r ON c.Id = r.CustomerId INNER JOIN items AS i ON r.ReceiptNumber = i.Receipt INNER JOIN goods AS g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tarts'
SELECT g1.Id FROM goods g1 CROSS JOIN (SELECT MIN(Price) AS MinPrice FROM goods WHERE Food = 'Croissant') g2 WHERE g1.Food = 'Cookies' AND g1.Price < g2.MinPrice
SELECT Id FROM goods WHERE Food = 'cookies' AND Price < (SELECT MIN(g.Price) FROM goods g WHERE g.Food = 'croissant')
SELECT g.Id FROM goods g JOIN (SELECT AVG(Price) AS AvgPrice FROM goods WHERE Food = 'Tart') t ON g.Price >= t.AvgPrice WHERE g.Food = 'Cake'
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT AVG(Price) FROM goods g WHERE g.Food = 'Tart')
SELECT Id FROM goods WHERE Price > (SELECT AVG(Price) * 2 FROM goods)
SELECT Id FROM goods WHERE Price > (SELECT AVG(Price) * 2 FROM goods)
SELECT g.Id, g.Flavor, g.Food FROM goods g ORDER BY g.Price ASC
SELECT g.Id, g.Flavor, g.Food FROM goods g ORDER BY g.Price ASC
SELECT g.Id, g.Flavor FROM goods AS g WHERE g.Food = 'Cakes' ORDER BY g.Flavor
SELECT DISTINCT goods.Id, goods.Flavor FROM goods, items WHERE goods.Id = items.Item AND goods.Food = 'cake' ORDER BY goods.Flavor
SELECT g.Id FROM goods g LEFT JOIN items i ON g.Id = i.Item WHERE g.Flavor = 'chocolate' GROUP BY i.Item HAVING COUNT(i.Item) <= 10
SELECT goods.Id FROM goods JOIN items ON goods.Id = items.Item AND goods.Flavor = 'chocolate' GROUP BY goods.Id HAVING COUNT(items.Item) <= 10
SELECT Flavor FROM goods WHERE Food = 'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food = 'Tart'
SELECT Flavor FROM goods g1 WHERE g1.Food = 'Cake' AND NOT EXISTS (SELECT 1 FROM goods g2 WHERE g2.Food = 'Tart' AND g2.Flavor = g1.Flavor)
SELECT G.Flavor, G.Food FROM goods G, items I WHERE G.Id = I.Item GROUP BY G.Flavor, G.Food ORDER BY COUNT(I.Item) DESC LIMIT 3
SELECT G.Flavor, COUNT(*) AS TotalPurchases FROM items I JOIN goods G ON I.Item = G.Id GROUP BY I.Item ORDER BY TotalPurchases DESC LIMIT 3
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING SUM(Price) > 150
SELECT c.Id FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id GROUP BY c.Id HAVING SUM(g.Price) > 150
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING AVG(Price) > 5
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING AVG(Price) > 5
SELECT Date FROM (SELECT receipts.Date, SUM(goods.Price) AS Total FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY receipts.Date) AS DailySales WHERE Total > 100
SELECT Date FROM (SELECT receipts.Date, SUM(goods.Price) AS Total FROM receipts INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id GROUP BY receipts.Date) AS Sales WHERE Total > 100
SELECT COUNT(Driver_ID) AS NumberOfDrivers FROM driver
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Driver_ID IS NOT NULL
SELECT Make, COUNT(Driver_ID) AS TotalDrivers FROM driver WHERE Points > 150 GROUP BY Make
SELECT d.Make, COUNT(*) AS DriverCount FROM driver d WHERE d.Points > 150 GROUP BY d.Make
SELECT Make, AVG(Age) AS Average_Age FROM driver WHERE Age IS NOT NULL GROUP BY Make
SELECT Make, AVG(Age) AS AverageAge FROM driver GROUP BY Make ORDER BY Make
SELECT AVG(Laps) AS Average_Laps FROM driver WHERE Age < 20
SELECT AVG(Laps) AS Average_Laps FROM driver WHERE Age < 20
SELECT Manager AS Team_Manager, Sponsor AS Team_Sponsor FROM team ORDER BY Car_Owner ASC
SELECT Manager AS Team_Manager, Sponsor AS Team_Sponsor FROM team ORDER BY Car_Owner ASC
SELECT Make FROM team GROUP BY Make HAVING COUNT(Make) > 1
SELECT t.Make FROM team t GROUP BY t.Make HAVING COUNT(t.Team_ID) > 1
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) Maximum, MIN(Points) Minimum FROM driver
SELECT MAX(Points) AS MaxPoints, MIN(Points) AS MinPoints FROM driver
SELECT COUNT(*) AS NumberOfDrivers FROM driver WHERE Points < 150
SELECT COUNT(*) AS NumberOfDrivers FROM driver WHERE Points < 150
SELECT Driver FROM driver WHERE Age IS NOT NULL ORDER BY Age
SELECT Driver AS Name FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Points DESC, Driver ASC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT `Driver`, `Country` FROM `driver`
SELECT d.Driver, d.Country FROM driver AS d
SELECT MAX(driver.Points) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT MAX(driver.Points) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT AVG(Age) AS AverageAge FROM driver INNER JOIN country ON driver.Country = country.Country_Id WHERE country.Official_native_language = 'English'
SELECT AVG(driver.Age) AS AverageAge FROM driver INNER JOIN country ON driver.Country = country.Country_Id WHERE country.Official_native_language = 'English'
SELECT DISTINCT Country FROM driver d WHERE d.Points > 150
SELECT DISTINCT Country FROM driver d WHERE d.Points > 150
SELECT c.Capital FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Points = (SELECT MAX(Points) FROM driver))
SELECT Capital FROM (SELECT country.Capital, driver.Points FROM country JOIN driver ON country.Country = driver.Country ORDER BY driver.Points DESC) AS ranked LIMIT 1
SELECT driver.Make, COUNT(driver.Driver_ID) FROM driver GROUP BY driver.Make
SELECT Make, COUNT(Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Make
SELECT Make FROM (SELECT Make, RANK() OVER (ORDER BY COUNT(Driver_ID) DESC) as rank FROM driver GROUP BY Make) ranked WHERE rank = 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM driver GROUP BY Make) AS SubQuery)
SELECT d.Make FROM driver d GROUP BY d.Make HAVING COUNT(d.Driver_ID) >= 3
SELECT D.Make FROM driver D JOIN team_driver TD ON D.Driver_ID = TD.Driver_ID GROUP BY D.Make HAVING COUNT(DISTINCT D.Driver_ID) >= 3
SELECT Team FROM team AS t WHERE NOT EXISTS (SELECT * FROM team_driver AS td WHERE td.Team_ID = t.Team_ID)
SELECT T.Team FROM team T LEFT JOIN team_driver TD ON T.Team_ID = TD.Team_ID WHERE TD.Driver_ID IS NULL
SELECT Country FROM driver WHERE Make = 'Dodge' INTERSECT SELECT Country FROM driver WHERE Make = 'Chevrolet'
SELECT Country FROM driver WHERE Make = 'Dodge' INTERSECT SELECT Country FROM driver WHERE Make = 'Chevrolet'
SELECT SUM(driver.Points) AS Total_Points, AVG(driver.Points) AS Average_Points FROM driver
SELECT SUM(driver.Points) AS TotalPoints, AVG(driver.Points) AS AveragePoints FROM driver
SELECT Country FROM country EXCEPT SELECT DISTINCT Country FROM driver
SELECT Country FROM country EXCEPT SELECT DISTINCT Country FROM driver
SELECT Manager, Sponsor FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Driver_ID) AS cnt FROM team_driver GROUP BY Team_ID) sub))
SELECT Manager, Sponsor FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Driver_ID) AS cnt FROM team_driver GROUP BY Team_ID) tmp))
SELECT t.Manager, t.Car_Owner FROM team t JOIN team_driver td ON t.Team_ID = td.Team_ID GROUP BY t.Team_ID, t.Manager, t.Car_Owner HAVING COUNT(td.Driver_ID) >= 2
SELECT Manager, Car_Owner FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(*) > 1)
SELECT COUNT(*) AS total_institutions FROM institution
SELECT COUNT(Institution_ID) AS InstitutionCount FROM institution
SELECT institution.Name FROM institution ORDER BY Name
SELECT institution.Name FROM institution ORDER BY institution.Name ASC
SELECT institution.Name FROM institution ORDER BY institution.Founded ASC
SELECT institution.Name FROM institution ORDER BY institution.Founded ASC
SELECT institution.City AS City, institution.Province AS Province FROM institution
SELECT City AS CityName, Province AS ProvinceName FROM institution
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution
SELECT * FROM (SELECT MAX(Enrollment) AS MaxEnroll, MIN(Enrollment) AS MinEnroll FROM institution) AS SubQuery
SELECT Affiliation FROM institution WHERE City NOT IN ('Vancouver')
SELECT Affiliation FROM institution WHERE City NOT IN ('Vancouver')
SELECT Stadium AS StadiumName FROM institution ORDER BY Capacity DESC
SELECT institution.Stadium FROM institution ORDER BY institution.Capacity DESC
SELECT T1.Stadium FROM institution T1 WHERE T1.Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Stadium FROM institution WHERE Enrollment IN (SELECT MAX(Enrollment) FROM institution)
SELECT Name, Nickname FROM institution, Championship WHERE institution.Institution_ID = Championship.Institution_ID
SELECT Name, Nickname FROM institution, Championship WHERE institution.Institution_ID = Championship.Institution_ID
SELECT C.Nickname FROM Championship C, institution I WHERE C.Institution_ID = I.Institution_ID AND I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT C.Nickname FROM Championship C LEFT JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT Name FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID GROUP BY Name ORDER BY COUNT(Championship.Number_of_Championships) DESC
SELECT Name FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID GROUP BY Name ORDER BY COUNT(Championship.Number_of_Championships) DESC, Name ASC
SELECT Name FROM institution WHERE Institution_ID IN (SELECT DISTINCT Institution_ID FROM Championship)
SELECT Name FROM institution WHERE EXISTS (SELECT 1 FROM Championship WHERE Championship.Institution_ID = institution.Institution_ID AND Number_of_Championships >= 1)
SELECT TOTAL(Championship.Number_of_Championships) FROM Championship, institution WHERE Championship.Institution_ID = institution.Institution_ID AND institution.Affiliation = 'public'
SELECT TOTAL(Championship.Number_of_Championships) FROM Championship JOIN institution ON Championship.Institution_ID = institution.Institution_ID WHERE institution.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM institution GROUP BY Affiliation) AS Sub)
WITH AffiliationCounts AS (SELECT Affiliation, COUNT(*) AS Count FROM institution GROUP BY Affiliation) SELECT Affiliation FROM AffiliationCounts WHERE Count = (SELECT MAX(Count) FROM AffiliationCounts)
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT Founded, COUNT(Institution_ID) FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1
SELECT C.Nickname AS InstitutionNickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID ORDER BY I.Capacity DESC
SELECT c.Nickname FROM Championship c INNER JOIN institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC
SELECT TOTAL(Enrollment) FROM institution WHERE City = 'Vancouver' OR City = 'Calgary'
SELECT i.Enrollment FROM institution i WHERE i.City = 'Vancouver' OR i.City = 'Calgary'
SELECT DISTINCT i1.Province FROM institution i1 JOIN institution i2 ON i1.Province = i2.Province WHERE i1.Founded < 1920 AND i2.Founded > 1950
SELECT DISTINCT Province FROM institution WHERE Province IN (SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950)
SELECT COUNT(*) FROM (SELECT DISTINCT Province FROM institution WHERE Province IS NOT NULL)
SELECT COUNT(Province) FROM (SELECT DISTINCT Province FROM institution WHERE Province IS NOT NULL) AS provinces
SELECT ALL * FROM Warehouses
SELECT Warehouses.Code, Location, Capacity FROM Warehouses
SELECT DISTINCT Contents FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York'
SELECT DISTINCT Contents FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150.00
SELECT Contents FROM Boxes WHERE Value > 150 AND Contents IS NOT NULL
SELECT Warehouses.Code, AVG(Boxes.Value) AS AverageValue FROM Warehouses LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT w.Code, AVG(b.Value) AS AvgBoxValue FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT AVG(Boxes.Value) Average_Value, SUM(Boxes.Value) Total_Value FROM Boxes
SELECT AVG(Value) as Average_Value, SUM(Value) as Total_Value FROM Boxes
SELECT AVG(Capacity), SUM(Capacity) FROM Warehouses
SELECT AVG(Capacity), SUM(Capacity) FROM Warehouses
SELECT Contents, AVG(Value) average_value, MAX(Value) maximum_value FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) as Average_Value, MAX(Value) as Maximum_Value FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents HAVING SUM(Value) = (SELECT MAX(total_sum) FROM (SELECT SUM(Value) AS total_sum FROM Boxes GROUP BY Contents) AS sub_totals)
SELECT B.Contents FROM Boxes B WHERE B.Value = (SELECT MAX(Value) FROM Boxes)
SELECT AVG(Boxes.Value) AS AvgValue FROM Boxes
SELECT AVG(Boxes.Value) AS AvgValue FROM Boxes
SELECT DISTINCT Contents FROM Boxes WHERE Contents != ''
SELECT Contents FROM Boxes GROUP BY Contents
SELECT DISTINCT COUNT(*) FROM (SELECT Contents FROM Boxes GROUP BY Contents)
SELECT COUNT(*) FROM (SELECT DISTINCT Contents FROM Boxes) unique_contents
SELECT DISTINCT Location FROM Warehouses WHERE Location <> ''
SELECT DISTINCT Location FROM Warehouses WHERE Location <> ''
SELECT b.Code FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Location IN ('Chicago', 'New York')
SELECT b.Code FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Location IN ('Chicago', 'New York')
SELECT SUM(Value) FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT SUM(Boxes.Value) FROM Boxes LEFT JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT DISTINCT Boxes.Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('New York', 'Chicago')
SELECT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location IN ('Chicago', 'New York') GROUP BY Contents HAVING COUNT(DISTINCT Location) = 2
SELECT DISTINCT Contents FROM Boxes WHERE Contents NOT IN (SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York')
SELECT DISTINCT B.Contents FROM Boxes B WHERE NOT EXISTS (SELECT 1 FROM Boxes B2 JOIN Warehouses W ON B2.Warehouse = W.Code WHERE W.Location = 'New York' AND B2.Contents = B.Contents)
SELECT W.Location FROM Warehouses W WHERE EXISTS (SELECT 1 FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents = 'Rocks') AND NOT EXISTS (SELECT 1 FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' EXCEPT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Code FROM Warehouses W WHERE EXISTS (SELECT 1 FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents IN ('Rocks', 'Scissors'))
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
WITH Rocks AS (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks'), Scissors AS (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors') SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Rocks INTERSECT SELECT Warehouse FROM Scissors)
SELECT W.Location FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors') GROUP BY W.Location HAVING COUNT(DISTINCT B.Contents) = 2
SELECT Code, Contents FROM Boxes ORDER BY Boxes.Value ASC
SELECT B.Code, B.Contents FROM Boxes B ORDER BY B.Value
SELECT Code, Contents FROM Boxes AS B WHERE B.Value = (SELECT MIN(B2.Value) FROM Boxes B2)
SELECT Code, Contents FROM Boxes AS B WHERE B.Value = (SELECT MIN(B2.Value) FROM Boxes B2)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT B.Contents FROM Boxes AS B WHERE B.Value > (SELECT AVG(B2.Value) FROM Boxes AS B2)
SELECT DISTINCT Contents AS BoxContents FROM Boxes ORDER BY BoxContents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents COLLATE NOCASE
SELECT Code FROM Boxes B WHERE B.Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Rocks') AND B.Contents <> 'Rocks'
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(B.Value) FROM Boxes B WHERE B.Contents = 'Rocks')
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors' AND Value IS NOT NULL)
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors' GROUP BY Contents)
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT W.Code, AVG(B.Value) AS AvgValue FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code HAVING AVG(B.Value) > 150
SELECT Warehouse, AVG(Value) AS AvgValue FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150
SELECT Contents, COUNT(Code) AS NumberOfBoxes, SUM(Value) AS TotalValue FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) as Total_Value, COUNT(Code) as Number_Of_Boxes FROM Boxes GROUP BY Contents
SELECT Location, TOTAL(Capacity) as TotalCapacity, AVG(Capacity) as AvgCapacity, MAX(Capacity) as MaxCapacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS Total_Capacity, AVG(Capacity) AS Avg_Capacity, MAX(Capacity) AS Maximum_Capacity FROM Warehouses GROUP BY Location
SELECT SUM(W.Capacity) AS TotalCapacity FROM Warehouses W
SELECT TOTAL(Warehouses.Capacity) AS TotalCapacity FROM Warehouses
SELECT W.Location, MAX(B.Value) AS MaxValue FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code GROUP BY W.Location
SELECT Location, MAX(Value) FROM Warehouses W LEFT JOIN Boxes B ON W.Code = B.Warehouse GROUP BY Location
SELECT Code, (SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code) AS BoxCount FROM Warehouses
SELECT w.Code, IFNULL(COUNT(b.Code), 0) AS BoxCount FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT COUNT(DISTINCT W.Location) FROM Warehouses W, Boxes B WHERE W.Code = B.Warehouse AND B.Contents = 'Rocks'
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents = 'Rocks' GROUP BY Warehouse
SELECT b.code AS BoxCode, w.location AS WarehouseLocation FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code
SELECT Boxes.Code, Warehouses.Location FROM Boxes, Warehouses WHERE Boxes.Warehouse = Warehouses.Code
SELECT b.Code FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code AND w.Location = 'Chicago'
SELECT b.Code FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Location = 'Chicago'
SELECT w.Code, COUNT(b.Code) FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code ORDER BY w.Code
SELECT Code, (SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code) AS BoxCount FROM Warehouses
SELECT w.Code AS WarehouseID, COUNT(DISTINCT b.Contents) AS CountOfContents FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT Warehouse, COUNT(DISTINCT Contents) FROM Boxes GROUP BY Warehouse
SELECT Code FROM Warehouses WHERE EXISTS (SELECT 1 FROM Boxes WHERE Warehouse = Code GROUP BY Warehouse HAVING SUM(Value) > (SELECT Capacity FROM Warehouses WHERE Code = Warehouse))
SELECT Code FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes GROUP BY Warehouse HAVING COUNT(Warehouse) > (SELECT Capacity FROM Warehouses WHERE Code = Warehouse))
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location LIKE 'Chicago')
SELECT SUM(Boxes.Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location NOT LIKE 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT University_Name, City, State FROM university ORDER BY University_Name, City, State
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT SUM(CASE WHEN State IN ('Illinois', 'Ohio') THEN 1 ELSE 0 END) FROM university
SELECT MAX(Enrollment) AS Maximum, AVG(Enrollment) AS Average, MIN(Enrollment) AS Minimum FROM university
SELECT MAX(Enrollment) 'Max Enrollment', AVG(Enrollment) 'Avg Enrollment', MIN(Enrollment) 'Min Enrollment' FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(U.Enrollment) FROM university U)
SELECT university.Team_Name FROM university WHERE university.Enrollment > (SELECT AVG(university.Enrollment) FROM university)
SELECT Home_Conference FROM university WHERE Home_Conference IS NOT NULL
SELECT Home_Conference FROM university WHERE Home_Conference IS NOT NULL GROUP BY Home_Conference
SELECT u.Home_Conference, COUNT(*) FROM university u GROUP BY u.Home_Conference
SELECT COUNT(University_ID), Home_Conference FROM university GROUP BY Home_Conference HAVING COUNT(University_ID) > 0
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM university GROUP BY State) AS counts)
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM university GROUP BY State) AS counts)
SELECT DISTINCT Home_Conference FROM university WHERE EXISTS (SELECT 1 FROM university AS u2 WHERE university.Home_Conference = u2.Home_Conference GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000)
SELECT DISTINCT u.Home_Conference FROM university u WHERE (SELECT AVG(Enrollment) FROM university WHERE Home_Conference = u.Home_Conference) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) AS subquery)
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) sub)
SELECT m.Major_Name, m.Major_Code FROM major AS m ORDER BY m.Major_Code
SELECT m.Major_Name, m.Major_Code FROM major AS m ORDER BY m.Major_Code ASC
SELECT major.Major_Name AS Major, major_ranking.Rank AS Rank FROM major, major_ranking, university WHERE major.Major_ID = major_ranking.Major_ID AND major_ranking.University_ID = university.University_ID AND university.University_Name = 'Augustana College'
SELECT m.Major_Name AS 'Major Name', mr.Rank AS 'Rank' FROM major AS m JOIN major_ranking AS mr ON m.Major_ID = mr.Major_ID JOIN university AS u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT U.University_Name, U.City, U.State FROM university U, major_ranking MR, major M WHERE U.University_ID = MR.University_ID AND MR.Major_ID = M.Major_ID AND MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT DISTINCT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT U.University_Name FROM university U JOIN major_ranking M ON U.University_ID = M.University_ID WHERE M.Rank = 1 GROUP BY U.University_ID, U.University_Name HAVING COUNT(M.Major_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) AS SubQuery)
SELECT U.University_Name FROM university U WHERE U.University_ID IN (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) AS Sub))
SELECT u.University_Name FROM university u WHERE NOT EXISTS (SELECT NULL FROM major_ranking m WHERE m.University_ID = u.University_ID AND m.Rank = 1)
SELECT u.University_Name FROM university u WHERE u.University_ID NOT IN (SELECT m.University_ID FROM major_ranking m WHERE m.Rank = 1)
SELECT U.University_Name FROM university U WHERE (SELECT COUNT(DISTINCT M.Major_Name) FROM major_ranking MR JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.University_ID = U.University_ID AND M.Major_Name IN ('Accounting', 'Urban Education')) = 2
SELECT u.University_Name FROM university u WHERE u.University_ID IN (SELECT mr.University_ID FROM major_ranking mr WHERE mr.Major_ID IN (SELECT m.Major_ID FROM major m WHERE m.Major_Name = 'Accounting')) AND u.University_ID IN (SELECT mr.University_ID FROM major_ranking mr WHERE mr.Major_ID IN (SELECT m.Major_ID FROM major m WHERE m.Major_Name = 'Urban Education'))
SELECT university.University_Name, overall_ranking.Rank FROM university, overall_ranking WHERE university.University_ID = overall_ranking.University_ID AND university.State = 'Wisconsin'
SELECT university.University_Name, overall_ranking.Rank FROM university, overall_ranking WHERE university.University_ID = overall_ranking.University_ID AND university.State = 'Wisconsin'
SELECT U.University_Name FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE O.Research_point = (SELECT MAX(Research_point) FROM overall_ranking)
SELECT University_Name FROM (SELECT U.University_Name, RANK() OVER (ORDER BY O.Research_point DESC) AS rk FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID) WHERE rk = 1
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point ASC
SELECT University_Name FROM university JOIN overall_ranking USING (University_ID) ORDER BY Reputation_point ASC
SELECT DISTINCT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') AND Rank <= 3)
SELECT U.University_Name FROM university U LEFT JOIN major_ranking MR ON U.University_ID = MR.University_ID LEFT JOIN major M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name = 'Accounting' AND MR.Rank <= 3
SELECT SUM(Enrollment) FROM university WHERE University_ID IN (SELECT University_ID FROM overall_ranking WHERE Rank <= 5)
SELECT SUM(Enrollment) AS TotalEnrollment FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID AND overall_ranking.Rank <= 5
SELECT U.University_Name, O.Citation_point FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE O.Reputation_point >= (SELECT MIN(Reputation_point) FROM (SELECT Reputation_point FROM overall_ranking ORDER BY Reputation_point DESC LIMIT 3) AS SubQuery)
SELECT U.University_Name, O.Citation_point FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(*) > 2
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(*) > 2
SELECT Title FROM Movies WHERE Rating NOT IN (SELECT Rating FROM Movies WHERE Rating IS NOT NULL)
SELECT DISTINCT M.Title FROM Movies M WHERE M.Rating = ''
SELECT Movies.Title FROM Movies WHERE Movies.Rating = 'G'
SELECT Movies.Title FROM Movies WHERE Movies.Rating = 'G'
SELECT M.Title FROM Movies M LEFT JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name = 'Odeon'
SELECT Title FROM Movies WHERE EXISTS (SELECT 1 FROM MovieTheaters WHERE MovieTheaters.Movie = Movies.Code AND MovieTheaters.Name = 'Odeon')
SELECT a.Title, b.Name FROM Movies a CROSS JOIN MovieTheaters b ON a.Code = b.Movie
SELECT movie_title, theater_name FROM (SELECT Title AS movie_title, Code FROM Movies) AS M JOIN (SELECT Name AS theater_name, Movie FROM MovieTheaters) AS MT ON M.Code = MT.Movie
SELECT COUNT(Code) FROM Movies WHERE Rating = 'G'
SELECT COUNT(Code) FROM Movies WHERE Rating = 'G'
SELECT COUNT(*) FROM (SELECT DISTINCT Movie AS UniqueMovie FROM MovieTheaters) temp
SELECT COUNT(DISTINCT MT.Movie) FROM MovieTheaters MT WHERE MT.Movie IS NOT NULL
SELECT COUNT(DISTINCT Movies.Title) FROM Movies, MovieTheaters WHERE Movies.Code = MovieTheaters.Movie
SELECT DISTINCT COUNT(Title) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie GROUP BY Title
SELECT COUNT(DISTINCT Code) AS NumberOfTheaters FROM MovieTheaters
SELECT COUNT(DISTINCT Code) AS NumberOfTheaters FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT M.Rating FROM Movies M WHERE M.Title LIKE '%Citizen%'
SELECT Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code AND Movies.Rating IN ('G', 'PG')
SELECT Name FROM MovieTheaters INNER JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating = 'G' OR Movies.Rating = 'PG'
SELECT Title FROM Movies, MovieTheaters WHERE Movies.Code = MovieTheaters.Movie AND (MovieTheaters.Name = 'Odeon' OR MovieTheaters.Name = 'Imperial')
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial'))
SELECT DISTINCT M.Title FROM Movies M, MovieTheaters MT1, MovieTheaters MT2 WHERE M.Code = MT1.Movie AND M.Code = MT2.Movie AND MT1.Name = 'Odeon' AND MT2.Name = 'Imperial'
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon' INTERSECT SELECT Movie FROM MovieTheaters WHERE Name = 'Imperial')
SELECT Title FROM Movies WHERE NOT EXISTS (SELECT 1 FROM MovieTheaters WHERE MovieTheaters.Movie = Movies.Code AND MovieTheaters.Name = 'Odeon')
SELECT Title FROM Movies WHERE NOT EXISTS (SELECT 1 FROM MovieTheaters WHERE MovieTheaters.Movie = Movies.Code AND MovieTheaters.Name = 'Odeon')
SELECT Movies.Title FROM Movies ORDER BY Movies.Title ASC
SELECT Movies.Title FROM Movies ORDER BY Movies.Title ASC
SELECT Title FROM Movies ORDER BY Rating
SELECT Title FROM Movies ORDER BY Rating, Title
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(DISTINCT Movie) = (SELECT MAX(MovieCount) FROM (SELECT COUNT(DISTINCT Movie) AS MovieCount FROM MovieTheaters GROUP BY Name) AS SubQuery)
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(Movie) = (SELECT MAX(MovieCount) FROM (SELECT COUNT(Movie) AS MovieCount FROM MovieTheaters GROUP BY Name) AS SubQuery)
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters GROUP BY Movie HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM MovieTheaters GROUP BY Movie) AS subquery))
SELECT M.Title FROM Movies M, MovieTheaters T WHERE M.Code = T.Movie GROUP BY M.Title HAVING COUNT(T.Movie) = (SELECT MAX(C) FROM (SELECT COUNT(*) AS C FROM MovieTheaters GROUP BY Movie) AS MaxCount)
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT Rating, COUNT(Code) AS NumberOfMovies FROM Movies GROUP BY Rating
SELECT COUNT(Movies.Code) FROM Movies WHERE Movies.Rating IS NOT NULL
SELECT COUNT(*) AS MovieCount FROM Movies WHERE Rating IS NOT NULL
SELECT Name FROM MovieTheaters WHERE EXISTS (SELECT 1 FROM Movies WHERE Movies.Code = MovieTheaters.Movie)
SELECT MT.Name FROM MovieTheaters MT WHERE EXISTS (SELECT 1 FROM Movies M WHERE MT.Movie = M.Code)
SELECT Name FROM MovieTheaters WHERE IFNULL(Movie, '') = ''
SELECT Name FROM MovieTheaters WHERE Movie IS NULL OR Movie = 'not available'
SELECT mt.Name FROM MovieTheaters mt JOIN Movies m ON mt.Movie = m.Code AND m.Rating = 'G'
SELECT MT.Name FROM MovieTheaters MT INNER JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT [Title] FROM [Movies]
SELECT Title AS MovieNames FROM Movies
SELECT DISTINCT Rating FROM Movies WHERE Rating IS NOT NULL
SELECT DISTINCT Rating AS MovieRatings FROM Movies
SELECT * FROM Movies WHERE Rating = 'unrated' OR Rating IS NULL
SELECT * FROM Movies WHERE Rating = 'unrated' OR Rating IS NULL
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Client.Name FROM Client, Package WHERE Client.AccountNumber = Package.Recipient AND Package.Weight = (SELECT MAX(Weight) FROM Package)
SELECT Client.Name FROM Client, Package WHERE Client.AccountNumber = Package.Recipient AND Package.Weight = (SELECT MAX(Weight) FROM Package)
SELECT SUM(weight) FROM Package P, Client C WHERE P.Sender = C.AccountNumber AND C.Name = 'Leo Wong'
SELECT TOTAL(Package.Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position AS JobTitle, Salary AS Income FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela' AND Position IS NOT NULL
SELECT AVG(Salary) AS AverageSalary FROM Employee WHERE Position LIKE 'intern'
SELECT AVG(Salary) AS AverageSalary FROM Employee WHERE Position LIKE 'intern'
SELECT DISTINCT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'Physician'
SELECT Level FROM Has_Clearance INNER JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position LIKE 'physician'
SELECT P.PackageNumber FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name LIKE 'Leo Wong'
SELECT COUNT(*) FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT DISTINCT PackageNumber FROM Package JOIN Client ON Recipient = AccountNumber WHERE Name = 'Leo Wong'
SELECT Package.PackageNumber FROM Package INNER JOIN Client ON Package.Recipient = Client.AccountNumber AND Client.Name = 'Leo Wong'
SELECT * FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT DISTINCT Package.PackageNumber FROM Package, Client WHERE (Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber) AND Client.Name = 'Leo Wong'
SELECT COUNT(1) FROM Package p, Client s, Client r WHERE p.Sender = s.AccountNumber AND p.Recipient = r.AccountNumber AND s.Name = 'Ogden Wernstrom' AND r.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package p WHERE EXISTS (SELECT 1 FROM Client c WHERE c.AccountNumber = p.Sender AND c.Name = 'Ogden Wernstrom') AND EXISTS (SELECT 1 FROM Client c WHERE c.AccountNumber = p.Recipient AND c.Name = 'Leo Wong')
SELECT Contents FROM Package, Client WHERE Package.Sender = Client.AccountNumber AND Client.Name = 'John Zoidfarb'
SELECT Contents FROM Package, Client WHERE Package.Sender = Client.AccountNumber AND Client.Name = 'John Zoidfarb'
SELECT PackageNumber, MAX(Weight) AS Weight FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE '%John%' GROUP BY PackageNumber ORDER BY Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package INNER JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE 'John%' ORDER BY Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package AS p ORDER BY p.Weight ASC LIMIT 3
SELECT PackageNumber, Weight FROM (SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC) AS SubQuery LIMIT 3
SELECT Client.Name, COUNT(*) AS TotalPackages FROM Client INNER JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber ORDER BY TotalPackages DESC LIMIT 1
SELECT Name, COUNT(PackageNumber) FROM Client, Package WHERE Client.AccountNumber = Package.Sender GROUP BY Name HAVING COUNT(PackageNumber) = (SELECT MAX(Count) FROM (SELECT COUNT(PackageNumber) AS Count FROM Package GROUP BY Sender))
SELECT Client.Name, COUNT(Package.Recipient) AS TotalPackages FROM Client LEFT JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Client.Name ORDER BY TotalPackages ASC LIMIT 1
SELECT MIN(package_count), Name FROM (SELECT COUNT(*) AS package_count, Recipient FROM Package GROUP BY Recipient) AS package_counts JOIN Client ON package_counts.Recipient = Client.AccountNumber
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Sender FROM Package GROUP BY Sender HAVING COUNT(*) > 1)
SELECT C.Name FROM Client C WHERE (SELECT COUNT(*) FROM Package P WHERE P.Sender = C.AccountNumber) > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name AS PlanetName, Coordinates AS PlanetCoordinates FROM Planet ORDER BY PlanetName
SELECT Name AS PlanetName, Coordinates AS PlanetCoordinates FROM Planet ORDER BY PlanetName
SELECT s.ShipmentID FROM Shipment s INNER JOIN Employee e ON s.Manager = e.EmployeeID WHERE e.Name = 'Phillip J. Fry'
SELECT s.ShipmentID FROM Shipment s INNER JOIN Employee e ON s.Manager = e.EmployeeID WHERE e.Name = 'Phillip J Fry'
SELECT Date AS ShipmentDate FROM Shipment
SELECT Date AS ShipmentDate FROM Shipment
SELECT s.ShipmentID FROM Shipment s INNER JOIN Planet p ON s.Planet = p.PlanetID WHERE p.Name = 'Mars'
SELECT s.ShipmentID FROM Shipment s INNER JOIN Planet p ON s.Planet = p.PlanetID WHERE p.Name = 'Mars'
SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars') AND Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
SELECT Shipment.ShipmentID FROM Shipment, Planet, Employee WHERE Shipment.Planet = Planet.PlanetID AND Shipment.Manager = Employee.EmployeeID AND Planet.Name LIKE 'Mars' AND Employee.Name LIKE 'Turanga Leela'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name = 'Mars' OR Employee.Name = 'Turanga Leela'
SELECT s.ShipmentID FROM Shipment s JOIN Planet p ON s.Planet = p.PlanetID JOIN Employee e ON s.Manager = e.EmployeeID WHERE p.Name = 'Mars' AND e.Name = 'Turanga Leela'
SELECT Planet.Name, COUNT(Shipment.ShipmentID) FROM Planet LEFT JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.Name
SELECT Name, COUNT(*) FROM Planet JOIN Shipment ON PlanetID = Planet GROUP BY Name
SELECT P.Name FROM Planet P, Shipment S WHERE P.PlanetID = S.Planet GROUP BY P.Name HAVING COUNT(S.ShipmentID) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Shipment GROUP BY Planet) AS SubQuery)
SELECT P.Name FROM Planet P JOIN (SELECT Planet, COUNT(*) AS ShipCount FROM Shipment GROUP BY Planet) AS S ON P.PlanetID = S.Planet ORDER BY S.ShipCount DESC LIMIT 1
SELECT Name, COUNT(*) AS ShipmentsCount FROM Employee JOIN Shipment ON EmployeeID = Manager GROUP BY Name
SELECT E.Name, COUNT(S.ShipmentID) AS NumberOfShipments FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.EmployeeID, E.Name
SELECT SUM(P.Weight) TotalWeight FROM Package P INNER JOIN Shipment S ON P.Shipment = S.ShipmentID INNER JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT SUM(P.Weight) FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars' GROUP BY Pl.Name
SELECT Planet.Name, TOTAL(Package.Weight) FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name
SELECT DISTINCT p.Name, SUM(pk.Weight) AS TotalWeight FROM Planet p JOIN Shipment s ON p.PlanetID = s.Planet JOIN Package pk ON s.ShipmentID = pk.Shipment GROUP BY p.Name
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package Pa ON S.ShipmentID = Pa.Shipment GROUP BY P.PlanetID HAVING SUM(Pa.Weight) > 30
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Shipment.Planet FROM Package, Shipment WHERE Package.Shipment = Shipment.ShipmentID GROUP BY Shipment.Planet HAVING SUM(Package.Weight) > 30)
SELECT PackageNumber FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8')) AND Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan')
SELECT COUNT(Package.PackageNumber) AS NumberOfPackages FROM Package, Client, Shipment, Planet WHERE Package.Sender = Client.AccountNumber AND Package.Shipment = Shipment.ShipmentID AND Shipment.Planet = Planet.PlanetID AND Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT P.PackageNumber FROM Package P WHERE EXISTS (SELECT 1 FROM Shipment S JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE S.ShipmentID = P.Shipment AND Pl.Name = 'Omicron Persei 8') OR EXISTS (SELECT 1 FROM Client C JOIN Employee E ON C.AccountNumber = E.EmployeeID WHERE C.AccountNumber = P.Sender AND E.Name = 'Zapp Brannigan')
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Client ON Package.Sender = Client.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' OR Client.Name = 'Zapp Brannigan'
SELECT p.PackageNumber, p.Weight FROM Package AS p WHERE p.Weight BETWEEN 10 AND 30
SELECT Package.PackageNumber, Package.Weight FROM Package WHERE Package.Weight >= 10 AND Package.Weight <= 30
SELECT E.Name FROM Employee E WHERE NOT EXISTS (SELECT * FROM Has_Clearance H JOIN Planet P ON H.Planet = P.PlanetID WHERE P.Name = 'Mars' AND H.Employee = E.EmployeeID)
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance, Planet WHERE Has_Clearance.Planet = Planet.PlanetID AND Planet.Name = 'Mars')
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT HC.Employee FROM Has_Clearance HC INNER JOIN Planet P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III')
SELECT Name FROM Employee WHERE EmployeeID IN (SELECT Employee FROM Has_Clearance HC JOIN Planet P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III')
SELECT P.Name FROM Planet P JOIN Has_Clearance H ON P.PlanetID = H.Planet GROUP BY P.PlanetID, P.Name HAVING COUNT(DISTINCT H.Employee) = 1
SELECT P.Name FROM Planet P JOIN Has_Clearance H ON P.PlanetID = H.Planet GROUP BY P.PlanetID HAVING COUNT(DISTINCT H.Employee) = 1
SELECT Name FROM Employee WHERE Salary > 4999 AND Salary < 10001
SELECT Name FROM Employee WHERE Salary > 4999 AND Salary < 10001
SELECT E.Name FROM Employee E WHERE E.Salary > 5000 OR E.Salary > (SELECT AVG(Salary) FROM Employee)
SELECT E.Name FROM Employee E WHERE E.Salary > 5000 OR E.Salary > (SELECT AVG(Salary) FROM Employee)
SELECT COUNT(*) FROM Employee WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars' AND Has_Clearance.Employee = Employee.EmployeeID)
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT COUNT(Game_ID) FROM game
SELECT COUNT(Game_ID) FROM game
SELECT g.Title, g.Developers FROM game g ORDER BY g.Units_sold_Millions DESC
SELECT g.Title, g.Developers FROM game g ORDER BY g.Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers NOT LIKE '%Nintendo%'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers NOT LIKE '%Nintendo%'
SELECT p.Platform_name, p.Market_district FROM platform AS p
SELECT platform.Platform_name AS Name, platform.Market_district AS District FROM platform
SELECT p.Platform_name, p.Platform_ID FROM platform p WHERE p.Download_rank = 1
SELECT DISTINCT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year) max_rank, MIN(Rank_of_the_year) min_rank FROM player
SELECT MAX(Rank_of_the_year) AS 'Maximum Rank', MIN(Rank_of_the_year) AS 'Minimum Rank' FROM player
SELECT COUNT(*) FROM player p WHERE p.Rank_of_the_year < 3
SELECT COUNT(DISTINCT Player_ID) FROM player WHERE Rank_of_the_year <= 3
SELECT player.Player_name FROM player ORDER BY player.Player_name ASC
SELECT Player_name FROM player ORDER BY UPPER(Player_name) ASC
SELECT p.Player_name, p.College FROM player AS p ORDER BY p.Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT DISTINCT player.Player_name, player.Rank_of_the_year FROM player, game_player, game WHERE player.Player_ID = game_player.Player_ID AND game_player.Game_ID = game.Game_ID AND game.Title = 'Super Mario World'
SELECT Player_name, Rank_of_the_year FROM player, game_player, game WHERE player.Player_ID = game_player.Player_ID AND game_player.Game_ID = game.Game_ID AND game.Title = 'Super Mario World'
SELECT DISTINCT g.Developers FROM game g, game_player gp, player p WHERE g.Game_ID = gp.Game_ID AND gp.Player_ID = p.Player_ID AND p.College = 'Auburn'
SELECT DISTINCT g.Developers FROM game g, game_player gp, player p WHERE g.Game_ID = gp.Game_ID AND gp.Player_ID = p.Player_ID AND p.College = 'Auburn'
SELECT AVG(Units_sold_Millions) FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT AVG(g.Units_sold_Millions) AS AvgUnitsSold FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT Title, Platform_name FROM game g, platform p WHERE g.Platform_ID = p.Platform_ID
SELECT Title, Platform_name FROM game g, platform p WHERE g.Platform_ID = p.Platform_ID
SELECT g.Title FROM game g, platform p WHERE g.Platform_ID = p.Platform_ID AND (p.Market_district = 'Asia' OR p.Market_district = 'USA')
SELECT Title FROM game JOIN platform USING(Platform_ID) WHERE Market_district IN ('Asia', 'USA')
SELECT g.Franchise, COUNT(g.Game_ID) AS TotalGames FROM game g GROUP BY g.Franchise
SELECT COUNT(*), Franchise FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) = (SELECT MAX(CountGames) FROM (SELECT COUNT(Game_ID) AS CountGames FROM game GROUP BY Franchise) AS SubQuery)
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) = (SELECT MAX(GameCount) FROM (SELECT COUNT(*) AS GameCount FROM game GROUP BY Franchise) AS SubQuery)
SELECT Franchise FROM (SELECT Franchise, COUNT(Game_ID) AS GameCount FROM game GROUP BY Franchise) AS subquery WHERE GameCount >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) > 1
SELECT p.Player_name FROM player p WHERE p.Player_ID NOT IN (SELECT DISTINCT gp.Player_ID FROM game_player gp)
SELECT p.Player_name FROM player p WHERE p.Player_ID NOT IN (SELECT gp.Player_ID FROM game_player gp)
SELECT DISTINCT g.Title FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Oklahoma' AND g.Game_ID IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Auburn')
SELECT Title FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE College IN ('Oklahoma', 'Auburn'))
SELECT Franchise FROM game WHERE Franchise IS NOT NULL GROUP BY Franchise
SELECT Franchise FROM game WHERE Franchise IS NOT NULL GROUP BY Franchise
SELECT g.Title FROM game g WHERE g.Game_ID NOT IN (SELECT gp.Game_ID FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard')
SELECT g.Title FROM game g WHERE g.Game_ID NOT IN (SELECT gp.Game_ID FROM game_player gp INNER JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard')
SELECT p.Name FROM press p ORDER BY p.Year_Profits_billion DESC
SELECT p.Name FROM press p ORDER BY p.Year_Profits_billion DESC
SELECT press.Name FROM press WHERE press.Year_Profits_billion > 15 OR press.Month_Profits_billion > 1
SELECT press.Name FROM press WHERE press.Year_Profits_billion > 15 OR press.Month_Profits_billion > 1
SELECT AVG(Year_Profits_billion) AS AverageProfit, MAX(Year_Profits_billion) AS MaximumProfit FROM press
SELECT Name, AVG(Year_Profits_billion) as AverageProfit, MAX(Year_Profits_billion) as MaxProfit FROM press GROUP BY Press_ID, Name
SELECT Name FROM press WHERE Month_Profits_billion IN (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press AS p WHERE p.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
WITH ProfitExtremes AS (SELECT MAX(Month_Profits_billion) AS MaxProfit, MIN(Month_Profits_billion) AS MinProfit FROM press) SELECT Name FROM press WHERE Month_Profits_billion IN (SELECT MaxProfit FROM ProfitExtremes UNION SELECT MinProfit FROM ProfitExtremes)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT max(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT min(Month_Profits_billion) FROM press)
SELECT COUNT(*) FROM author WHERE Age < 30 AND Age > 0
SELECT COUNT(1) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, COUNT(Author_ID) FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(*) AS NumberOfAuthors FROM author WHERE Age > 30 GROUP BY Gender
SELECT book.Title FROM book ORDER BY book.Release_date DESC
SELECT book.Title FROM book ORDER BY book.Release_date DESC
SELECT Book_Series, COUNT(Book_ID) AS Total FROM book GROUP BY Book_Series
SELECT COUNT(Book_ID), Book_Series FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT DISTINCT Book_Series FROM book WHERE Book_Series IN (SELECT Book_Series FROM book WHERE Sale_Amount > 1000) AND Book_Series IN (SELECT Book_Series FROM book WHERE Sale_Amount < 500)
SELECT Book_Series FROM book GROUP BY Book_Series HAVING SUM(CASE WHEN Sale_Amount > 1000 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Sale_Amount < 500 THEN 1 ELSE 0 END) > 0
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'MM') AND EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'LT')
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'MM') AND EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'LT')
SELECT author.Name, author.Age FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID WHERE book.Author_ID IS NULL
SELECT author.Name FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID WHERE book.Author_ID IS NULL
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID GROUP BY b.Author_ID HAVING COUNT(*) > 1)
SELECT Name FROM author AS a JOIN book AS b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT b.Title, a.Name, p.Name FROM book b JOIN author a ON b.Author_ID = a.Author_ID JOIN press p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT b.Title, a.Name, p.Name FROM book b JOIN author a ON b.Author_ID = a.Author_ID JOIN press p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT press.Name, Total_Sales FROM press JOIN (SELECT Press_ID, SUM(Sale_Amount) AS Total_Sales FROM book GROUP BY Press_ID) b ON press.Press_ID = b.Press_ID
SELECT p.Name, Aggregate_Sales FROM press p JOIN (SELECT Press_ID, SUM(Sale_Amount) AS Aggregate_Sales FROM book GROUP BY Press_ID) b ON p.Press_ID = b.Press_ID
SELECT p.Name, COUNT(b.Book_ID) FROM book b, press p WHERE b.Press_ID = p.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Press_ID
SELECT p.Name, COUNT(b.Book_ID) AS TotalBooks FROM press p LEFT JOIN book b ON p.Press_ID = b.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Name
SELECT author.Name FROM author, book WHERE author.Author_ID = book.Author_ID AND book.Sale_Amount = (SELECT MAX(Sale_Amount) FROM book)
SELECT author.Name FROM author, book WHERE author.Author_ID = book.Author_ID AND book.Sale_Amount = (SELECT MAX(Sale_Amount) FROM book)
SELECT Name, Gender FROM author WHERE Author_ID IN (SELECT Author_ID FROM (SELECT Author_ID, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM book GROUP BY Author_ID) WHERE rank = 1)
SELECT author.Name, author.Gender FROM author, book WHERE author.Author_ID = book.Author_ID GROUP BY author.Author_ID HAVING COUNT(book.Book_ID) = (SELECT MAX(book_count) FROM (SELECT COUNT(book.Book_ID) AS book_count FROM book GROUP BY book.Author_ID))
SELECT author.Name FROM author WHERE author.Author_ID NOT IN (SELECT book.Author_ID FROM book, press WHERE book.Press_ID = press.Press_ID AND press.Name = 'Accor')
SELECT a.Name FROM author a WHERE a.Author_ID NOT IN (SELECT b.Author_ID FROM book b INNER JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor')
SELECT p.Name, p.Year_Profits_billion FROM press p WHERE (SELECT COUNT(*) FROM book b WHERE b.Press_ID = p.Press_ID) > 2
SELECT p.Name, p.Year_Profits_billion FROM press p WHERE EXISTS (SELECT 1 FROM book b WHERE b.Press_ID = p.Press_ID GROUP BY b.Press_ID HAVING COUNT(b.Book_ID) > 2)
SELECT COUNT(DISTINCT author_name) FROM Authors
SELECT a.author_name FROM Authors a
SELECT DISTINCT author_name, other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name LIKE 'Addison Denesik'
SELECT COUNT(document_id) FROM Documents
SELECT author_name FROM Documents WHERE document_id = (SELECT document_id FROM Documents WHERE document_id = 4)
SELECT d.author_name FROM Documents d WHERE d.document_name = 'Travel to Brazil'
SELECT COUNT(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings' AND document_id IS NOT NULL
SELECT DISTINCT a.author_name, a.other_details FROM Authors a LEFT JOIN Documents d ON a.author_name = d.author_name WHERE d.document_name = 'Travel to China'
SELECT a.author_name, COUNT(d.document_id) FROM Authors a LEFT JOIN Documents d ON a.author_name = d.author_name GROUP BY a.author_name
SELECT author_name FROM (SELECT author_name, RANK() OVER (ORDER BY COUNT(document_id) DESC) AS rank FROM Documents GROUP BY author_name) AS ranked_docs WHERE rank = 1
SELECT A.author_name FROM Authors A INNER JOIN Documents D ON A.author_name = D.author_name GROUP BY A.author_name HAVING COUNT(*) >= 2
SELECT COUNT(process_id) AS NumberOfProcesses FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = (SELECT process_id FROM Business_Processes WHERE process_id = 9)
SELECT B.process_name FROM Business_Processes A, Business_Processes B WHERE A.next_process_id = B.process_id AND A.process_id = 9
SELECT COUNT(*) FROM Process_Outcomes WHERE process_outcome_code IS NOT NULL
SELECT * FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code LIKE 'working'
SELECT COUNT(*) FROM (SELECT process_status_code FROM Process_Status GROUP BY process_status_code) AS status_count
SELECT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(*) FROM Staff
SELECT Staff.staff_id, Staff.staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT COUNT(*) FROM (SELECT DISTINCT staff_role_code FROM Ref_Staff_Roles) AS unique_roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR' LIMIT 1
SELECT COUNT(DISTINCT document_id) FROM Documents WHERE document_id IN (SELECT DISTINCT document_id FROM Documents_Processes)
SELECT DISTINCT process_id FROM Documents_Processes WHERE document_id IS NOT NULL
SELECT D.document_id FROM Documents D LEFT JOIN Documents_Processes DP ON D.document_id = DP.document_id WHERE DP.process_id IS NULL
SELECT DISTINCT process_id FROM Business_Processes EXCEPT SELECT DISTINCT process_id FROM Documents_Processes
SELECT outcome_desc.process_outcome_description, status_desc.process_status_description FROM Documents_Processes dp LEFT JOIN Process_Outcomes outcome_desc ON dp.process_outcome_code = outcome_desc.process_outcome_code LEFT JOIN Process_Status status_desc ON dp.process_status_code = status_desc.process_status_code WHERE dp.document_id = 0
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT process_id FROM Documents_Processes WHERE document_id = (SELECT document_id FROM Documents WHERE document_name = 'Travel to Brazil'))
SELECT p.process_id, COUNT(DISTINCT d.document_id) AS total_documents FROM Business_Processes p LEFT JOIN Documents_Processes d ON p.process_id = d.process_id GROUP BY p.process_id
SELECT COUNT(DISTINCT s.staff_id) FROM Staff_in_Processes s WHERE s.document_id = 0 AND s.process_id = 9
SELECT staff_id, (SELECT COUNT(DISTINCT document_id) FROM Staff_in_Processes WHERE staff_id = Staff.staff_id) AS num_processes FROM Staff
SELECT R.staff_role_code, COUNT(S.document_id) AS num_processes FROM Ref_Staff_Roles R LEFT JOIN Staff_in_Processes S ON R.staff_role_code = S.staff_role_code GROUP BY R.staff_role_code
SELECT COUNT(*) FROM (SELECT DISTINCT staff_role_code FROM Staff_in_Processes WHERE staff_id = 3) AS distinct_roles
SELECT COUNT(agency_id) FROM (SELECT DISTINCT agency_id FROM Agencies) AS distinct_agencies
SELECT COUNT(1) FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT COUNT(*) AS ClientCount FROM Clients
SELECT COUNT(DISTINCT client_id) FROM Clients
SELECT DISTINCT client_id, client_details FROM Clients
SELECT DISTINCT client_id, client_details FROM Clients
SELECT A.agency_id, COUNT(C.client_id) AS num_clients FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id
SELECT Agencies.agency_id, COUNT(Clients.client_id) FROM Agencies LEFT JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE EXISTS (SELECT 1 FROM Clients C WHERE C.agency_id = A.agency_id GROUP BY C.agency_id HAVING COUNT(*) = (SELECT MAX(client_count) FROM (SELECT COUNT(*) AS client_count FROM Clients GROUP BY agency_id) AS subquery))
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE EXISTS (SELECT 1 FROM Clients C WHERE C.agency_id = A.agency_id GROUP BY C.agency_id HAVING COUNT(*) = (SELECT MAX(client_count) FROM (SELECT COUNT(*) AS client_count FROM Clients GROUP BY agency_id) AS subquery))
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT A.agency_details FROM Agencies A INNER JOIN Clients C ON A.agency_id = C.agency_id AND C.client_details = 'Mac'
SELECT agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients WHERE client_details LIKE '%Mac%')
SELECT Clients.client_id AS ClientID, Clients.client_details AS ClientDetails, Agencies.agency_id AS AgencyID, Agencies.agency_details AS AgencyDetails FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT c.client_details, a.agency_details FROM Clients c JOIN Agencies a ON c.agency_id = a.agency_id
SELECT COUNT(client_id), sic_code FROM Clients GROUP BY sic_code
SELECT COUNT(client_id) AS NumberOfClients, sic_code FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE A.agency_id IN (SELECT agency_id FROM Clients)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id)
SELECT A.agency_id FROM Agencies A LEFT OUTER JOIN Clients C ON A.agency_id = C.agency_id WHERE C.agency_id IS NULL
SELECT agency_id FROM Agencies EXCEPT SELECT agency_id FROM Clients
SELECT COUNT(1) FROM Invoices
SELECT COUNT(invoice_id) AS InvoiceCount FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT c.client_id, COUNT(i.invoice_id) AS invoice_count FROM Clients c LEFT JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id
SELECT i.client_id, COUNT(*) FROM Invoices i GROUP BY i.client_id
SELECT C.client_id, C.client_details FROM Clients C WHERE EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id GROUP BY I.client_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT client_id, client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) = (SELECT MAX(invoice_count) FROM (SELECT client_id, COUNT(*) AS invoice_count FROM Invoices GROUP BY client_id) AS Sub))
SELECT I.client_id FROM Invoices I GROUP BY I.client_id HAVING COUNT(*) >= 2
SELECT c.client_id FROM Clients c INNER JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id HAVING COUNT(i.invoice_id) >= 2
SELECT invoice_status, COUNT(*) AS count FROM Invoices GROUP BY invoice_status ORDER BY count DESC
SELECT invoice_status, COUNT(invoice_id) AS NumberOfInvoices FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(invoice_id) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Invoices GROUP BY invoice_status) AS subquery)
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Invoices GROUP BY invoice_status) AS subquery)
SELECT Invoices.invoice_status, Invoices.invoice_details, Clients.client_id, Clients.client_details, Agencies.agency_id, Agencies.agency_details FROM Invoices, Clients, Agencies WHERE Invoices.client_id = Clients.client_id AND Clients.agency_id = Agencies.agency_id
SELECT Invoices.invoice_status, Invoices.invoice_details, Clients.client_id, Clients.client_details, Agencies.agency_id, Agencies.agency_details FROM Invoices, Clients, Agencies WHERE Invoices.client_id = Clients.client_id AND Clients.agency_id = Agencies.agency_id
SELECT Meetings.meeting_type, Meetings.other_details FROM Meetings
SELECT Meetings.meeting_type, Meetings.other_details FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings WHERE meeting_outcome IS NOT NULL
SELECT meeting_outcome, purpose_of_meeting FROM Meetings WHERE meeting_outcome IS NOT NULL AND purpose_of_meeting IS NOT NULL
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status LIKE 'Working'
SELECT DISTINCT p.payment_id, p.payment_details FROM Payments p JOIN Invoices i ON p.invoice_id = i.invoice_id WHERE i.invoice_status = 'Working'
SELECT i.invoice_id, i.invoice_status FROM Invoices i WHERE NOT EXISTS (SELECT 1 FROM Payments p WHERE p.invoice_id = i.invoice_id)
SELECT Invoices.invoice_id, Invoices.invoice_status FROM Invoices LEFT OUTER JOIN Payments ON Invoices.invoice_id = Payments.invoice_id WHERE Payments.invoice_id IS NULL
SELECT COUNT(*) AS NumberOfPayments FROM Payments
SELECT COUNT(*) FROM Payments AS p
SELECT Payments.payment_id, Payments.invoice_id, Invoices.invoice_details FROM Payments, Invoices WHERE Payments.invoice_id = Invoices.invoice_id
SELECT Payments.payment_id, Payments.invoice_id, Payments.payment_details FROM Payments
SELECT DISTINCT i.invoice_id, i.invoice_status FROM Invoices i INNER JOIN Payments p ON i.invoice_id = p.invoice_id
SELECT DISTINCT i.invoice_id, i.invoice_status FROM Invoices i INNER JOIN Payments p ON i.invoice_id = p.invoice_id
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS payment_count FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS payment_count FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I WHERE I.invoice_id IN (SELECT invoice_id FROM Payments GROUP BY invoice_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Payments GROUP BY invoice_id) AS sub))
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I WHERE EXISTS (SELECT 1 FROM Payments P WHERE P.invoice_id = I.invoice_id GROUP BY P.invoice_id HAVING COUNT(P.payment_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(payment_id) AS cnt FROM Payments GROUP BY invoice_id) AS subquery))
SELECT COUNT(*) FROM Staff
SELECT COUNT(*) FROM Staff
SELECT A.agency_id, COUNT(S.staff_id) AS staff_number FROM Agencies A, Staff S WHERE A.agency_id = S.agency_id GROUP BY A.agency_id
SELECT a.agency_id, COUNT(s.staff_id) FROM Agencies a LEFT JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE EXISTS (SELECT 1 FROM Staff S WHERE S.agency_id = A.agency_id GROUP BY S.agency_id HAVING COUNT(*) = (SELECT MAX(staff_count) FROM (SELECT COUNT(*) AS staff_count FROM Staff GROUP BY agency_id) AS StaffCounts))
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE A.agency_id IN (SELECT agency_id FROM Staff GROUP BY agency_id HAVING COUNT(*) = (SELECT MAX(staff_count) FROM (SELECT agency_id, COUNT(*) AS staff_count FROM Staff GROUP BY agency_id) AS Temp))
SELECT DISTINCT meeting_outcome, COUNT(*) OVER (PARTITION BY meeting_outcome) AS num_meetings FROM Meetings
SELECT meeting_outcome, COUNT(*) AS NumberOfMeetings FROM Meetings GROUP BY meeting_outcome
SELECT Clients.client_id AS ClientID, COUNT(Meetings.meeting_id) AS MeetingsCount FROM Clients LEFT OUTER JOIN Meetings ON Clients.client_id = Meetings.client_id GROUP BY Clients.client_id
SELECT client_id AS ClientID, COUNT(*) AS TotalMeetings FROM Meetings GROUP BY ClientID
SELECT M.client_id, M.meeting_type, COUNT(*) AS MeetingCount FROM Meetings M GROUP BY M.client_id, M.meeting_type HAVING COUNT(*) > 1
SELECT meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type HAVING COUNT(*) > 0
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM Meetings m JOIN Clients c ON m.client_id = c.client_id WHERE m.meeting_id IS NOT NULL
SELECT m.meeting_id, m.meeting_outcome, m.meeting_type, c.client_details FROM Meetings m, Clients c WHERE m.client_id = c.client_id
SELECT m.meeting_id, COUNT(s.staff_id) AS number_of_staff FROM Meetings m LEFT JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT meeting_id, COUNT(*) AS number_of_staff FROM Staff_in_Meetings GROUP BY meeting_id
WITH StaffMeetingCounts AS (SELECT staff_id, COUNT(meeting_id) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id) SELECT staff_id, meeting_count FROM StaffMeetingCounts WHERE meeting_count = (SELECT MIN(meeting_count) FROM StaffMeetingCounts)
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) > 0 ORDER BY COUNT(meeting_id) ASC LIMIT 1
SELECT COUNT(*) FROM (SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id) AS counted_staff
SELECT COUNT(DISTINCT Staff.staff_id) AS NumberOfDistinctStaff FROM Staff INNER JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id
SELECT COUNT(DISTINCT Staff.staff_id) FROM Staff LEFT JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id WHERE Staff_in_Meetings.staff_id IS NULL
SELECT COUNT(*) FROM (SELECT staff_id FROM Staff EXCEPT SELECT staff_id FROM Staff_in_Meetings) AS MissingStaff
SELECT DISTINCT c.client_id, c.client_details FROM Clients c LEFT JOIN Meetings m ON c.client_id = m.client_id LEFT JOIN Invoices i ON c.client_id = i.client_id WHERE m.client_id IS NOT NULL OR i.client_id IS NOT NULL
SELECT client_id, client_details FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT s.staff_id, s.staff_details FROM Staff s WHERE EXISTS (SELECT 1 FROM Staff_in_Meetings sm WHERE sm.staff_id = s.staff_id) AND s.staff_details LIKE '%s%'
SELECT Staff.staff_id, Staff.staff_details FROM Staff JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id WHERE Staff.staff_details LIKE '%s%' GROUP BY Staff.staff_id HAVING COUNT(Staff_in_Meetings.meeting_id) >= 1
SELECT client_id, sic_code, agency_id FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings GROUP BY client_id HAVING COUNT(*) = 1) AND client_id IN (SELECT client_id FROM Invoices GROUP BY client_id)
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE (SELECT COUNT(*) FROM Meetings M WHERE M.client_id = C.client_id) = 1 AND EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id)
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M LEFT OUTER JOIN Clients C ON M.client_id = C.client_id LEFT OUTER JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id LEFT OUTER JOIN Staff S ON SM.staff_id = S.staff_id
SELECT Meetings.start_date_time, Meetings.end_date_time, Clients.client_details, Staff.staff_details FROM Meetings LEFT JOIN Clients ON Meetings.client_id = Clients.client_id LEFT JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id LEFT JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
