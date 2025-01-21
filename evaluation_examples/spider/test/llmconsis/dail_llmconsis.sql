SELECT COUNT(Club_ID) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT club.Name FROM club WHERE club.Manufacturer <> 'Nike'
SELECT Name FROM player ORDER BY Wins_count ASC
SELECT p.Name FROM player p ORDER BY p.Wins_count ASC
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT DISTINCT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT DISTINCT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Wins_count > 2
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT c.Name FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Club_ID ORDER BY AVG(p.Earnings) DESC
SELECT c.Name FROM club AS c JOIN (SELECT Club_ID, AVG(Earnings) AS AverageEarnings FROM player GROUP BY Club_ID) AS p ON c.Club_ID = p.Club_ID ORDER BY p.AverageEarnings DESC
SELECT Manufacturer, COUNT(Club_ID) AS NumberOfClubs FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(Club_ID) AS NumberOfClubs FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT c.Manufacturer FROM club c GROUP BY c.Manufacturer HAVING COUNT(c.Club_ID) > 1
SELECT p.Country FROM player p GROUP BY p.Country HAVING COUNT(p.Player_ID) > 1
SELECT p.Country FROM player p GROUP BY p.Country HAVING COUNT(p.Player_ID) > 1
SELECT Name FROM club WHERE NOT EXISTS (SELECT 1 FROM player WHERE player.Club_ID = club.Club_ID)
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Club_ID IS NULL
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000 GROUP BY Country HAVING COUNT(DISTINCT CASE WHEN Earnings > 1400000 THEN 'high' WHEN Earnings < 1100000 THEN 'low' END) = 2
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT player.Earnings FROM player WHERE player.Country IN ('Australia', 'Zimbabwe')
SELECT player.Earnings FROM player WHERE player.Country IN ('Australia', 'Zimbabwe')
SELECT DISTINCT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C INNER JOIN Orders O ON C.customer_id = O.customer_id INNER JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.customer_id HAVING COUNT(DISTINCT O.order_id) > 2 AND COUNT(OI.order_item_id) >= 3
SELECT Customers.customer_id, Customers.customer_first_name, Customers.customer_last_name FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Customers.customer_id HAVING COUNT(DISTINCT Orders.order_id) > 2 AND COUNT(Order_Items.order_item_id) >= 3
SELECT O.order_id, O.order_status_code, COUNT(OI.product_id) AS product_count FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT o.order_id, o.order_status_code, COUNT(oi.order_item_id) AS product_count FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id GROUP BY o.order_id, o.order_status_code
SELECT DISTINCT O.date_order_placed FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING COUNT(OI.order_item_id) > 1 OR O.date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1) UNION ALL SELECT MIN(date_order_placed) FROM Orders
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name FROM Customers c LEFT JOIN Orders o ON c.customer_id = o.customer_id WHERE o.customer_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_id) >= 2) as Filtered ON p.product_id = Filtered.product_id WHERE Filtered.product_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p LEFT JOIN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_id) >= 2) sub ON p.product_id = sub.product_id WHERE sub.product_id IS NULL
SELECT O.order_id, O.date_order_placed FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING COUNT(OI.product_id) >= 2
SELECT a.order_id, a.date_order_placed FROM Orders a JOIN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) >= 2) b ON a.order_id = b.order_id
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY Products.product_id, Products.product_name, Products.product_price ORDER BY COUNT(Order_Items.order_item_id) DESC LIMIT 1
SELECT product_id, product_name, product_price FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_item_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(order_item_id) as cnt FROM Order_Items GROUP BY product_id) t))
SELECT o.order_id, SUM(p.product_price) AS total_price FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id ORDER BY total_price ASC LIMIT 1
SELECT o.order_id, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id ORDER BY total_cost ASC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Customers.gender_code, COUNT(DISTINCT Products.product_id) AS number_of_products FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customers.gender_code
SELECT Customers.gender_code, COUNT(DISTINCT Products.product_id) AS count_of_products FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customers.gender_code
SELECT c.gender_code, COUNT(o.order_id) AS order_count FROM Customers c INNER JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.gender_code
SELECT c.gender_code, COUNT(o.order_id) FROM Customers c INNER JOIN Orders o ON c.customer_id = o.customer_id GROUP BY c.gender_code
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, cp.payment_method_code FROM Customers c INNER JOIN Customer_Payment_Methods cp ON c.customer_id = cp.customer_id
SELECT I.invoice_status_code, I.invoice_date, S.shipment_date FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number
SELECT I.invoice_status_code, I.invoice_date, S.shipment_date FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number
SELECT P.product_name, S.shipment_date FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipments S ON OI.order_id = S.order_id
SELECT Products.product_name, Shipments.shipment_date FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi INNER JOIN Shipments s ON oi.order_id = s.order_id
SELECT oi.order_item_status_code, s.shipment_tracking_number FROM Order_Items oi JOIN Shipments s ON oi.order_id = s.order_id
SELECT DISTINCT p.product_name, p.product_color FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id JOIN Shipments s ON oi.order_id = s.order_id
SELECT DISTINCT product_name, product_color FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id INNER JOIN Shipments ON Order_Items.order_id = Shipments.order_id
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'Female'
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT o.order_id, o.date_order_placed AS date, SUM(p.product_price) AS total_cost FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id GROUP BY o.order_id, o.date_order_placed
SELECT O.order_id, O.date_order_placed, SUM(P.product_price) AS total_amount FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name AS username, login_password AS password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(DISTINCT Products.product_id) FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT COUNT(DISTINCT p.product_id) FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT COUNT(c.customer_id) FROM Customers c LEFT JOIN Customer_Payment_Methods cp ON c.customer_id = cp.customer_id WHERE cp.customer_id IS NULL
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c LEFT JOIN Customer_Payment_Methods cp ON c.customer_id = cp.customer_id WHERE cp.customer_id IS NULL
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT COUNT(order_item_id) FROM Shipment_Items
SELECT COUNT(DISTINCT Order_Items.product_id) FROM Order_Items INNER JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id;
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(p.product_price) FROM Products p JOIN Order_Items oi ON p.product_id = oi.product_id
SELECT AVG(product_price) FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id
SELECT c.email_address, c.town_city, c.county FROM Customers c JOIN (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1) g ON c.gender_code = g.gender_code
SELECT email_address, town_city, county FROM Customers WHERE gender_code IN (SELECT gender_code FROM Customers c JOIN Orders o ON c.customer_id = o.customer_id GROUP BY gender_code ORDER BY COUNT(o.order_id) ASC LIMIT 1)
SELECT o.date_order_placed FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT o.date_order_placed FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT P.product_id, P.product_description FROM Products P WHERE P.product_id IN (SELECT OI.product_id FROM Order_Items OI GROUP BY OI.product_id HAVING COUNT(OI.order_item_id) > 3)
SELECT product_id, product_description FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 3)
SELECT I.invoice_date, I.invoice_number FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(S.shipment_id) >= 2
SELECT I.invoice_number, I.invoice_date FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(S.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT p.product_color, p.product_description, p.product_size FROM Products p WHERE p.product_price < (SELECT MAX(pp.product_price) FROM Products pp)
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(Channel_ID) FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT d.Name, d.Age FROM director AS d JOIN program AS p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT c.Name, c.Internet FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID HAVING COUNT(p.Program_ID) > 1
SELECT c.Name, COUNT(p.Program_ID) AS program_count FROM channel c LEFT JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name
SELECT count(*) FROM channel c WHERE NOT EXISTS (SELECT 1 FROM program p WHERE p.Channel_ID = c.Channel_ID)
SELECT d.Name FROM director AS d JOIN program AS p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT channel.Name, channel.Internet FROM channel INNER JOIN director_admin ON channel.Channel_ID = director_admin.Channel_ID GROUP BY channel.Channel_ID ORDER BY COUNT(director_admin.Director_ID) DESC LIMIT 1
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT c.Name FROM channel c WHERE EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE da.Channel_ID = c.Channel_ID AND d.Age < 40) AND EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE da.Channel_ID = c.Channel_ID AND d.Age > 60)
SELECT c.Channel_ID, c.Name FROM channel c WHERE c.Channel_ID NOT IN (SELECT p.Channel_ID FROM program p JOIN director d ON p.Director_ID = d.Director_ID WHERE d.Name = 'Hank Baskett')
SELECT COUNT(Radio_ID) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation, COUNT(ID) AS ChannelCount FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Affiliation FROM city_channel AS c GROUP BY c.Affiliation HAVING COUNT(c.ID) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT R.Transmitter, CC.City FROM radio R JOIN city_channel_radio CCR ON R.Radio_ID = CCR.Radio_ID JOIN city_channel CC ON CCR.City_channel_ID = CC.ID
SELECT R.Transmitter, CC.Station_name FROM radio R JOIN city_channel_radio CCR ON R.Radio_ID = CCR.Radio_ID JOIN city_channel CC ON CCR.City_channel_ID = CC.ID ORDER BY R.ERP_kW DESC
SELECT r.Transmitter, COUNT(DISTINCT ccr.City_channel_ID) FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT r.Transmitter FROM radio r LEFT JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID WHERE ccr.Radio_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT vd.Driver_ID, COUNT(*) AS Num_Vehicles FROM vehicle_driver AS vd GROUP BY vd.Driver_ID ORDER BY Num_Vehicles DESC LIMIT 1
SELECT vd.Driver_ID, COUNT(*) AS Total_Vehicles FROM vehicle_driver AS vd GROUP BY vd.Driver_ID ORDER BY Total_Vehicles DESC LIMIT 1
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(v.Power) AS MaxPower, AVG(v.Power) AS AvgPower FROM vehicle v WHERE v.Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver WHERE driver.Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT d.Name FROM driver AS d JOIN vehicle_driver AS vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle AS v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE V.Builder = 'Ziyang' OR V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) >= 2)
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' UNION SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2)
SELECT v.Vehicle_ID, v.Model FROM vehicle v WHERE v.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2) OR EXISTS (SELECT 1 FROM vehicle_driver vd JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' AND vd.Vehicle_ID = v.Vehicle_ID)
SELECT v.Vehicle_ID, v.Model FROM vehicle v JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID JOIN driver d ON vd.Driver_ID = d.Driver_ID WHERE d.Name = 'Jeff Gordon' OR v.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) > 2)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Racing_Series
SELECT count(DISTINCT D.Driver_ID), D.Racing_Series FROM driver D GROUP BY D.Racing_Series
SELECT d.Name, d.Citizenship FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT D.Name, D.Citizenship FROM driver AS D JOIN vehicle_driver AS VD ON D.Driver_ID = VD.Driver_ID JOIN vehicle AS V ON VD.Vehicle_ID = V.Vehicle_ID WHERE V.Model = 'DJ1'
SELECT COUNT(*) FROM driver d WHERE NOT EXISTS (SELECT 1 FROM vehicle_driver vd WHERE vd.Driver_ID = d.Driver_ID)
SELECT COUNT(d.Driver_ID) FROM driver d LEFT JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID WHERE vd.Vehicle_ID IS NULL
SELECT COUNT(Exam_ID) FROM Exams
SELECT count(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code <> 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code <> 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC;
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(Question_ID) AS QuestionCount FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(Question_ID) AS Total FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) AS Count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Count DESC
SELECT Student_Answer_Text, COUNT(*) AS Frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Frequency DESC
SELECT S.First_Name, SA.Date_of_Answer FROM Students S INNER JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID
SELECT S.First_Name, A.Date_of_Answer FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID
SELECT S.Email_Adress, SA.Date_of_Answer FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID ORDER BY SA.Date_of_Answer DESC
SELECT s.Email_Adress, sa.Date_of_Answer FROM Students s JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID ORDER BY sa.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment, COUNT(*) AS Frequency FROM Student_Assessments GROUP BY Assessment ORDER BY Frequency ASC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(Student_Answer_ID) >= 2)
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(Student_Answer_ID) >= 2)
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT VA.Valid_Answer_Text FROM Valid_Answers AS VA JOIN Student_Assessments AS SA ON VA.Valid_Answer_ID = SA.Valid_Answer_ID GROUP BY VA.Valid_Answer_Text ORDER BY COUNT(SA.Valid_Answer_ID) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU AS Gender, COUNT(Student_ID) AS NumberOfStudents FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT s.First_Name FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT s.First_Name FROM Students s LEFT JOIN Student_Answers sa ON s.Student_ID = sa.Student_ID WHERE sa.Student_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT q.Type_of_Question_Code FROM Questions q GROUP BY q.Type_of_Question_Code HAVING COUNT(q.Question_ID) >= 3
SELECT Q.Type_of_Question_Code FROM Questions AS Q GROUP BY Q.Type_of_Question_Code HAVING COUNT(Q.Question_ID) >= 3
SELECT * FROM Students
SELECT * FROM Students
SELECT count(*) FROM Addresses
SELECT count(*) FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT COUNT(product_id) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM Products
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) AS AveragePrice FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(product_id) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(product_id) FROM Products WHERE product_type_code = 'Hardware'
SELECT DISTINCT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'hardware' AND P.product_price > (SELECT AVG(P2.product_price) FROM Products P2 WHERE P2.product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT p.product_id, p.product_name FROM Products AS p WHERE p.product_type_code = 'Hardware' ORDER BY p.product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT * FROM Products WHERE product_type_code = 'hardware' ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS average_price FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) DESC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT C.customer_address, C.customer_phone, C.customer_email FROM Customers C WHERE C.customer_name = 'Jeromy'
SELECT c.customer_address, c.customer_phone, c.customer_email FROM Customers c WHERE c.customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(customer_id) AS NumberOfUsers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(customer_id) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.customer_name FROM Customers c JOIN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1) pmc ON c.payment_method_code = pmc.payment_method_code
SELECT c.customer_name FROM Customers c WHERE c.payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(payment_method_code) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_id, product_type_code FROM Products ORDER BY product_name ASC
SELECT p.product_type_code FROM Products p GROUP BY p.product_type_code ORDER BY COUNT(p.product_id) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT count(*) FROM Customer_Orders
SELECT count(*) FROM Customer_Orders
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders CO JOIN Customers C ON CO.customer_id = C.customer_id WHERE C.customer_name = 'Jeromy'
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders CO JOIN Customers C ON CO.customer_id = C.customer_id WHERE C.customer_name = 'Jeromy'
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS total_orders FROM Customers AS C LEFT JOIN Customer_Orders AS O ON C.customer_id = O.customer_id GROUP BY C.customer_id
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS number_of_orders FROM Customers C LEFT JOIN Customer_Orders O ON C.customer_id = O.customer_id GROUP BY C.customer_id, C.customer_name
SELECT customer_id, customer_name, customer_phone, customer_email FROM Customers WHERE customer_id = (SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(order_id) DESC LIMIT 1)
SELECT c.customer_id, c.customer_name, c.customer_phone, c.customer_email FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id GROUP BY c.customer_id ORDER BY COUNT(co.order_id) DESC LIMIT 1
SELECT order_status_code, COUNT(*) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(*) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers AS c LEFT JOIN Customer_Orders AS co ON c.customer_id = co.customer_id WHERE co.customer_id IS NULL
SELECT COUNT(*) FROM Customers c LEFT JOIN Customer_Orders co ON c.customer_id = co.customer_id WHERE co.customer_id IS NULL
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT p.product_name FROM Products p LEFT JOIN Order_Items oi ON p.product_id = oi.product_id WHERE oi.product_id IS NULL
SELECT SUM(order_quantity) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE product_name = 'Monitor'
SELECT SUM(Order_Items.order_quantity) FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c JOIN Customer_Orders co ON c.customer_id = co.customer_id JOIN Order_Items oi ON co.order_id = oi.order_id JOIN Products p ON oi.product_id = p.product_id WHERE p.product_name = 'Monitor'
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c INNER JOIN Customer_Orders co ON c.customer_id = co.customer_id INNER JOIN Order_Items oi ON co.order_id = oi.order_id INNER JOIN Products p ON oi.product_id = p.product_id WHERE p.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT C.customer_id FROM Customers C LEFT JOIN Customer_Orders CO ON C.customer_id = CO.customer_id WHERE CO.customer_id IS NULL
SELECT o.order_date, o.order_id FROM Customer_Orders o JOIN Order_Items i ON o.order_id = i.order_id GROUP BY o.order_id HAVING MAX(i.order_quantity) > 6 OR COUNT(i.order_item_id) > 3
SELECT o.order_id, o.order_date FROM Customer_Orders o JOIN Order_Items i ON o.order_id = i.order_id GROUP BY o.order_id HAVING SUM(i.order_quantity) > 6 OR COUNT(i.order_item_id) > 3
SELECT COUNT(Building_ID) FROM building
SELECT COUNT(Building_ID) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT b.Name FROM building b ORDER BY b.Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT max(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT AVG(Population) FROM region
SELECT AVG(Population) FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT r.Capital FROM region r WHERE r.Area > 10000
SELECT Capital FROM region WHERE Area > 10000
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT r.Capital FROM region r WHERE r.Population = (SELECT MAX(Population) FROM region)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT b.Name, r.Name FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT b.Name, r.Name FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT r.Name FROM region r JOIN building b ON r.Region_ID = b.Region_ID GROUP BY r.Region_ID HAVING COUNT(b.Building_ID) > 1
SELECT R.Name FROM region R JOIN building B ON R.Region_ID = B.Region_ID GROUP BY R.Region_ID HAVING COUNT(B.Building_ID) > 1
SELECT region.Capital FROM region INNER JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID ORDER BY COUNT(building.Building_ID) DESC LIMIT 1
SELECT r.Capital FROM region AS r JOIN (SELECT Region_ID FROM building GROUP BY Region_ID ORDER BY COUNT(*) DESC LIMIT 1) AS b ON r.Region_ID = b.Region_ID
SELECT T1.Address, T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
SELECT b.Address, r.Name FROM building b JOIN region r ON b.Region_ID = r.Region_ID
SELECT b.Number_of_Stories FROM building b JOIN region r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT b.Number_of_Stories FROM building b JOIN region r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT b.Completed_Year, COUNT(b.Building_ID) AS NumberOfBuildings FROM building b GROUP BY b.Completed_Year
SELECT b.Completed_Year, COUNT(b.Building_ID) AS NumberOfBuildings FROM building b GROUP BY b.Completed_Year
SELECT b.Completed_Year FROM building b GROUP BY b.Completed_Year ORDER BY COUNT(b.Building_ID) DESC LIMIT 1
SELECT b.Completed_Year FROM building b GROUP BY b.Completed_Year ORDER BY COUNT(b.Building_ID) DESC LIMIT 1
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Building_ID IS NULL
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Building_ID IS NULL
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING MAX(Number_of_Stories) > 20 AND MIN(Number_of_Stories) < 15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT * FROM Channels ORDER BY Channel_Details
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT COUNT(Service_ID) FROM Services
SELECT COUNT(*) FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch'
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch'
SELECT DISTINCT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) > 3)
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID GROUP BY S.Service_ID HAVING COUNT(DISTINCT CS.Customer_ID) > 3
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT CS.Customer_ID FROM Customers_and_Services CS GROUP BY CS.Customer_ID ORDER BY COUNT(CS.Service_ID) DESC LIMIT 1)
SELECT C.Customer_Details FROM Customers C JOIN (SELECT Customer_ID, COUNT(Service_ID) AS Service_Count FROM Customers_and_Services GROUP BY Customer_ID ORDER BY Service_Count DESC LIMIT 1) CS ON C.Customer_ID = CS.Customer_ID
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT c.Customer_Details FROM Customers c JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID GROUP BY c.Customer_ID ORDER BY COUNT(DISTINCT cs.Service_ID) DESC LIMIT 1
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT DISTINCT c.Customer_Details FROM Customers c INNER JOIN Customers_and_Services cs ON c.Customer_ID = cs.Customer_ID WHERE cs.Service_ID IN (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM Customers_and_Services GROUP BY Service_ID))
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT COUNT(*) FROM Customers_and_Services WHERE Customers_and_Services_Details IS NOT NULL AND Customers_and_Services_Details <> ''
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT * FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT DISTINCT S.Service_Details FROM Services S WHERE EXISTS (SELECT 1 FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE CS.Service_ID = S.Service_ID AND C.Customer_Details = 'Hardy Kutch') OR EXISTS (SELECT 1 FROM Customer_Interactions CI WHERE CI.Service_ID = S.Service_ID AND CI.Status_Code = 'good')
SELECT DISTINCT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID = (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')) OR Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT DISTINCT S.Service_Details FROM Services S WHERE S.Service_ID IN (SELECT CS.Service_ID FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch') AND S.Service_ID IN (SELECT CI.Service_ID FROM Customer_Interactions CI WHERE CI.Status_Code = 'bad')
SELECT DISTINCT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID = (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')) AND Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'bad')
SELECT s.Service_Details FROM Services s JOIN Customer_Interactions ci ON s.Service_ID = ci.Service_ID JOIN Channels c ON ci.Channel_ID = c.Channel_ID WHERE c.Channel_Details = '15 ij'
SELECT DISTINCT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Channels.Channel_Details = '15 ij'
SELECT C.* FROM Customers C JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID WHERE CI.Status_Code = 'Stuck' AND CI.Services_and_Channels_Details = 'bad'
SELECT DISTINCT C.Customer_Details FROM Customers C INNER JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID WHERE CI.Status_Code = 'Stuck' AND CI.Services_and_Channels_Details = 'bad'
SELECT COUNT(DISTINCT ip.Integration_Platform_ID) FROM Integration_Platform ip INNER JOIN Customer_Interactions ci ON ip.Customer_Interaction_ID = ci.Customer_Interaction_ID WHERE ci.Status_Code = 'Success'
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT CI.Customer_ID FROM Customer_Interactions CI INNER JOIN Integration_Platform IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE IP.Integration_Platform_Details LIKE '%failed%')
SELECT DISTINCT c.Customer_Details FROM Customers c JOIN Customer_Interactions ci ON c.Customer_ID = ci.Customer_ID JOIN Integration_Platform ip ON ci.Customer_Interaction_ID = ip.Customer_Interaction_ID WHERE ip.Integration_Platform_Details = 'Fail'
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT DISTINCT Service_ID FROM Customers_and_Services)
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) AS UsageCount FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) AS Usage_Count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT S.Service_Details FROM Services S INNER JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID WHERE CS.Customers_and_Services_Details = 'unsatisfied'
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID WHERE CS.Customers_and_Services_Details = 'unsatisfied'
SELECT COUNT(*) FROM Vehicles
SELECT COUNT(*) FROM Vehicles
SELECT Vehicles.name FROM Vehicles ORDER BY Vehicles.Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year IN (2013, 2014) GROUP BY Type_of_powertrain HAVING COUNT(DISTINCT Model_year) = 2
SELECT DISTINCT v.Type_of_powertrain FROM Vehicles v WHERE v.Model_year IN (2013, 2014) GROUP BY v.Type_of_powertrain HAVING COUNT(DISTINCT v.Model_year) = 2
SELECT Type_of_powertrain, COUNT(id) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(*) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT v.Type_of_powertrain FROM Vehicles v GROUP BY v.Type_of_powertrain ORDER BY COUNT(v.id) DESC LIMIT 1
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT MIN(Annual_fuel_cost) AS MinCost, MAX(Annual_fuel_cost) AS MaxCost, AVG(Annual_fuel_cost) AS AvgCost FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT V.Type_of_powertrain, AVG(V.Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles V GROUP BY V.Type_of_powertrain HAVING COUNT(V.id) >= 2
SELECT v.Type_of_powertrain, AVG(v.Annual_fuel_cost) AS AverageAnnualFuelCost FROM Vehicles v GROUP BY v.Type_of_powertrain HAVING COUNT(v.id) > 1
SELECT name, age, membership_credit FROM Customers
SELECT name, age, membership_credit FROM Customers
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT C.name, C.age FROM Customers AS C WHERE C.membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT AVG(age) AS AverageAge FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT Vehicles.name, SUM(Renting_history.total_hours) AS TotalHours FROM Vehicles INNER JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.name
SELECT V.name, SUM(R.total_hours) AS TotalRentalHours FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.name
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT V.name FROM Vehicles V LEFT JOIN Renting_history R ON V.id = R.vehicles_id WHERE R.vehicles_id IS NULL
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(id) >= 2)
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(id) >= 2)
SELECT name, Model_year FROM Vehicles WHERE id = (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT V.name, V.Model_year FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY R.vehicles_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Vehicles.name, SUM(Renting_history.total_hours) AS total_renting_hours FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY Vehicles.id ORDER BY total_renting_hours DESC
SELECT name FROM Vehicles JOIN (SELECT vehicles_id, SUM(total_hours) AS total FROM Renting_history GROUP BY vehicles_id) AS Subquery ON Vehicles.id = Subquery.vehicles_id ORDER BY Subquery.total DESC
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.id ORDER BY COUNT(R.id) DESC LIMIT 1
SELECT V.name, V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id WHERE R.total_hours > 30
SELECT name, Type_of_powertrain FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id HAVING SUM(total_hours) > 30)
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate), AVG(Highway_fuel_economy_rate) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate), AVG(Highway_fuel_economy_rate) FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT s.student_id, s.bio_data FROM Students s INNER JOIN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) >= 2) c ON s.student_id = c.student_id LEFT JOIN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(detention_id) >= 2) d ON s.student_id = d.student_id WHERE d.student_id IS NULL
SELECT student_id, bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2) OR student_id IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2)
SELECT T.teacher_details FROM Teachers T WHERE EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE '%data%') AND NOT EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE 'net%')
SELECT DISTINCT T.teacher_details FROM Teachers T WHERE EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE '%data%') AND NOT EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id AND C.class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE NOT EXISTS (SELECT 1 FROM Detention WHERE Detention.student_id = Students.student_id) AND NOT EXISTS (SELECT 1 FROM Student_Loans WHERE Student_Loans.student_id = Students.student_id)
SELECT bio_data FROM Students WHERE NOT EXISTS (SELECT 1 FROM Detention WHERE Detention.student_id = Students.student_id) AND NOT EXISTS (SELECT 1 FROM Student_Loans WHERE Student_Loans.student_id = Students.student_id)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl JOIN Students s ON sl.student_id = s.student_id WHERE s.student_id IN (SELECT a.student_id FROM Achievements a GROUP BY a.student_id HAVING COUNT(a.achievement_id) >= 2)
SELECT sl.amount_of_loan, sl.date_of_loan FROM Student_Loans sl JOIN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2) a ON sl.student_id = a.student_id
SELECT T.teacher_details, T.teacher_id FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id GROUP BY T.teacher_id ORDER BY COUNT(C.class_id) DESC LIMIT 1
SELECT T.teacher_details, T.teacher_id FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id GROUP BY T.teacher_id ORDER BY COUNT(C.class_id) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT S.bio_data, A.address_type_description FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Ref_Address_Types A ON SA.address_type_code = A.address_type_code
SELECT S.bio_data, R.address_type_description FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Ref_Address_Types R ON SA.address_type_code = R.address_type_code
SELECT A.address_details, S.bio_data FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Addresses A ON SA.address_id = A.address_id
SELECT S.bio_data, A.address_details FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Addresses A ON SA.address_id = A.address_id
SELECT s.bio_data, t.date_of_transcript FROM Students s INNER JOIN Transcripts t ON s.student_id = t.student_id
SELECT s.bio_data, t.date_of_transcript FROM Students s INNER JOIN Transcripts t ON s.student_id = t.student_id
SELECT behaviour_monitoring_details, COUNT(student_id) AS num_students FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY num_students DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT S.bio_data, S.student_details FROM Students S WHERE S.student_id IN (SELECT BM.student_id FROM Behaviour_Monitoring BM GROUP BY BM.behaviour_monitoring_details HAVING COUNT(BM.behaviour_monitoring_details) = 3 AND BM.behaviour_monitoring_details = (SELECT BM2.behaviour_monitoring_details FROM Behaviour_Monitoring BM2 GROUP BY BM2.behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT s.bio_data, s.student_details FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id WHERE bm.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(student_id) = 3)
SELECT s.bio_data FROM Students s JOIN Behaviour_Monitoring bm ON s.student_id = bm.student_id GROUP BY s.student_id HAVING COUNT(DISTINCT bm.behaviour_monitoring_details) = 1 AND MAX(bm.behaviour_monitoring_details) = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT S.bio_data, SE.event_date FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id
SELECT S.bio_data, SE.event_date FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id
SELECT COUNT(DISTINCT SE.student_id) AS StudentCount, SE.event_type_code, ET.event_type_description FROM Student_Events SE JOIN Ref_Event_Types ET ON SE.event_type_code = ET.event_type_code GROUP BY SE.event_type_code, ET.event_type_description ORDER BY StudentCount DESC LIMIT 1
SELECT event_type_code, Ref_Event_Types.event_type_description, COUNT(DISTINCT Student_Events.student_id) AS num_students FROM Student_Events INNER JOIN Ref_Event_Types ON Student_Events.event_type_code = Ref_Event_Types.event_type_code GROUP BY event_type_code ORDER BY num_students DESC LIMIT 1
SELECT A.achievement_details, R.achievement_type_description FROM Achievements A JOIN Ref_Achievement_Type R ON A.achievement_type_code = R.achievement_type_code
SELECT achievement_details, achievement_type_description FROM Achievements JOIN Ref_Achievement_Type ON Achievements.achievement_type_code = Ref_Achievement_Type.achievement_type_code
SELECT COUNT(DISTINCT T.teacher_id) FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id LEFT JOIN Achievements A ON C.student_id = A.student_id WHERE A.achievement_id IS NULL
SELECT COUNT(DISTINCT T.teacher_id) FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id WHERE C.student_id NOT IN (SELECT student_id FROM Achievements)
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T1.teacher_details, T2.student_details FROM Teachers AS T1 JOIN Classes AS T3 ON T1.teacher_id = T3.teacher_id JOIN Students AS T2 ON T3.student_id = T2.student_id
SELECT T1.teacher_details, T2.student_details FROM Teachers AS T1 JOIN Classes AS T3 ON T1.teacher_id = T3.teacher_id JOIN Students AS T2 ON T3.student_id = T2.student_id
SELECT t.teacher_id, COUNT(c.class_id) AS total_classes FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id GROUP BY t.teacher_id ORDER BY total_classes DESC LIMIT 1
SELECT teacher_id, COUNT(*) AS num_courses FROM Classes GROUP BY teacher_id ORDER BY num_courses DESC LIMIT 1;
SELECT student_id, COUNT(class_id) AS num_courses FROM Classes GROUP BY student_id ORDER BY num_courses DESC LIMIT 1
SELECT student_id, COUNT(*) AS num_courses FROM Classes GROUP BY student_id ORDER BY num_courses DESC LIMIT 1
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(DISTINCT class_id) = 2)
SELECT student_id, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(class_id) = 2)
SELECT D.detention_type_code, R.detention_type_description FROM Detention D INNER JOIN Ref_Detention_Type R ON D.detention_type_code = R.detention_type_code GROUP BY D.detention_type_code ORDER BY COUNT(D.detention_type_code) ASC LIMIT 1
SELECT dt.detention_type_code, dt.detention_type_description FROM Ref_Detention_Type dt WHERE dt.detention_type_code IN (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT S.bio_data, S.student_details FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT s.bio_data, s.student_details FROM Students s WHERE s.student_id IN (SELECT sl.student_id FROM Student_Loans sl WHERE sl.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT s.bio_data FROM Students s, Student_Loans sl WHERE s.student_id = sl.student_id AND sl.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT s.bio_data FROM Students s JOIN Student_Loans sl ON s.student_id = sl.student_id ORDER BY sl.amount_of_loan ASC LIMIT 1
SELECT t.date_of_transcript FROM Transcripts t JOIN Student_Loans sl ON t.student_id = sl.student_id WHERE sl.amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans)
SELECT T.date_of_transcript FROM Transcripts T INNER JOIN (SELECT student_id FROM Student_Loans GROUP BY student_id ORDER BY SUM(amount_of_loan) DESC LIMIT 1) AS S ON T.student_id = S.student_id
SELECT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Transcripts tr ON c.student_id = tr.student_id WHERE tr.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT t.teacher_details FROM Teachers t JOIN Classes c ON t.teacher_id = c.teacher_id JOIN Transcripts tr ON c.student_id = tr.student_id WHERE tr.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT student_id, SUM(amount_of_loan) AS total_loan FROM Student_Loans GROUP BY student_id
SELECT S.student_id, SUM(L.amount_of_loan) AS total_loan FROM Students S JOIN Student_Loans L ON S.student_id = L.student_id GROUP BY S.student_id
SELECT S.student_id, S.bio_data, COUNT(*) AS course_count FROM Students S JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id, S.bio_data
SELECT s.student_id, s.bio_data, COUNT(c.class_id) AS number_of_courses FROM Students s LEFT JOIN Classes c ON s.student_id = c.student_id GROUP BY s.student_id, s.bio_data
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT address_type_code, address_type_description FROM Ref_Address_Types WHERE address_type_code IN (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT address_type_code, address_type_description FROM Ref_Address_Types WHERE address_type_code IN (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code ORDER BY COUNT(address_type_code) DESC LIMIT 1)
SELECT s.bio_data FROM Students s WHERE EXISTS (SELECT * FROM Student_Events se WHERE se.student_id = s.student_id) AND NOT EXISTS (SELECT * FROM Student_Loans sl WHERE sl.student_id = s.student_id)
SELECT bio_data FROM Students WHERE EXISTS (SELECT 1 FROM Student_Events WHERE Student_Events.student_id = Students.student_id) AND NOT EXISTS (SELECT 1 FROM Student_Loans WHERE Student_Loans.student_id = Students.student_id)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa JOIN Students s ON sa.student_id = s.student_id WHERE s.student_id IN (SELECT t.student_id FROM Transcripts t GROUP BY t.student_id HAVING COUNT(t.transcript_id) = 2)
SELECT sa.date_from, sa.date_to FROM Students_Addresses sa JOIN Students s ON sa.student_id = s.student_id WHERE s.student_id IN (SELECT t.student_id FROM Transcripts t GROUP BY t.student_id HAVING COUNT(t.transcript_id) = 2)
SELECT datetime_detention_start FROM Detention ORDER BY datetime_detention_start
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name, Address FROM Client
SELECT Name, Address FROM Client
SELECT Title, ISBN, SalePrice FROM Book
SELECT Title, ISBN, SalePrice FROM Book
SELECT COUNT(ISBN) FROM Book
SELECT COUNT(*) FROM Book
SELECT COUNT(idAuthor) FROM Author
SELECT COUNT(idAuthor) FROM Author
SELECT COUNT(IdClient) FROM Client
SELECT COUNT(IdClient) FROM Client
SELECT Name, Address FROM Client ORDER BY Name
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT B.Title, A.Name FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor
SELECT Book.Title, Author.Name FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor
SELECT o.IdOrder, c.Name FROM Orders o JOIN Client c ON o.IdClient = c.IdClient
SELECT o.IdOrder, c.Name FROM Orders o INNER JOIN Client c ON o.IdClient = c.IdClient
SELECT a.Name, COUNT(ab.ISBN) FROM Author a JOIN Author_Book ab ON a.idAuthor = ab.Author GROUP BY a.idAuthor
SELECT a.Name AS AuthorName, COUNT(ab.ISBN) AS NumberOfBooks FROM Author a LEFT JOIN Author_Book ab ON a.idAuthor = ab.Author GROUP BY a.idAuthor
SELECT ISBN, COUNT(IdOrder) AS num_orders FROM Books_Order GROUP BY ISBN
SELECT b.ISBN, COUNT(o.ISBN) AS OrderCount FROM Book b LEFT JOIN Books_Order o ON b.ISBN = o.ISBN GROUP BY b.ISBN
SELECT Books_Order.ISBN, SUM(Books_Order.amount) AS TotalOrderedAmount FROM Books_Order GROUP BY Books_Order.ISBN
SELECT b.ISBN, SUM(bo.amount) AS TotalAmount FROM Books_Order bo RIGHT JOIN Book b ON bo.ISBN = b.ISBN GROUP BY b.ISBN
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order GROUP BY ISBN ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Book.Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN ORDER BY COUNT(*) DESC LIMIT 1
SELECT Book.Title, Book.PurchasePrice FROM Book INNER JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN, Book.Title, Book.PurchasePrice ORDER BY SUM(Books_Order.amount) DESC LIMIT 1
SELECT Title, PurchasePrice FROM Book JOIN (SELECT ISBN, SUM(amount) AS total_amount FROM Books_Order GROUP BY ISBN ORDER BY total_amount DESC LIMIT 1) AS MostOrdered ON Book.ISBN = MostOrdered.ISBN
SELECT DISTINCT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order)
SELECT DISTINCT B.Title FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN
SELECT DISTINCT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient
SELECT DISTINCT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient
SELECT c.Name, COUNT(o.IdOrder) AS OrdersCount FROM Client c LEFT JOIN Orders o ON c.IdClient = o.IdClient GROUP BY c.IdClient
SELECT Client.Name, COUNT(Orders.IdOrder) FROM Client LEFT OUTER JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Client.IdClient
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders GROUP BY IdClient ORDER BY COUNT(IdOrder) DESC LIMIT 1)
SELECT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient GROUP BY c.IdClient ORDER BY COUNT(o.IdOrder) DESC LIMIT 1
SELECT c.Name, SUM(b.amount) AS TotalBooks FROM Client c INNER JOIN Orders o ON c.IdClient = o.IdClient INNER JOIN Books_Order b ON o.IdOrder = b.IdOrder GROUP BY c.IdClient
SELECT Client.Name, IFNULL(SUM(Books_Order.amount), 0) AS TotalBooks FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient LEFT JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY Client.Name
SELECT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY C.IdClient ORDER BY SUM(BO.amount) DESC LIMIT 1
SELECT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient JOIN Books_Order bo ON o.IdOrder = bo.IdOrder GROUP BY c.IdClient ORDER BY SUM(bo.amount) DESC LIMIT 1
SELECT B.Title FROM Book B LEFT JOIN Books_Order BO ON B.ISBN = BO.ISBN WHERE BO.ISBN IS NULL
SELECT b.Title FROM Book b LEFT JOIN Books_Order bo ON b.ISBN = bo.ISBN WHERE bo.ISBN IS NULL
SELECT c.Name FROM Client c LEFT JOIN Orders o ON c.IdClient = o.IdClient WHERE o.IdOrder IS NULL
SELECT c.Name FROM Client c WHERE c.IdClient NOT IN (SELECT o.IdClient FROM Orders o)
SELECT MAX(SalePrice) AS MaximumSalePrice, MIN(SalePrice) AS MinimumSalePrice FROM Book
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT AVG(PurchasePrice) AS AveragePurchasePrice, AVG(SalePrice) AS AverageSalePrice FROM Book
SELECT AVG(PurchasePrice) AS AveragePurchasePrice, AVG(SalePrice) AS AverageSalePrice FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell'
SELECT AVG(SalePrice) FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell'
SELECT B.SalePrice FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato'
SELECT B.SalePrice FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato'
SELECT B.Title FROM Book B INNER JOIN Author_Book AB ON B.ISBN = AB.ISBN INNER JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT b.Title FROM Book b JOIN Author a ON b.Author = a.idAuthor WHERE a.Name = 'Plato' AND b.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT a.Name FROM Author a JOIN Book b ON a.idAuthor = b.Author WHERE b.Title = 'Pride and Prejudice'
SELECT a.Name FROM Author a JOIN Book b ON a.idAuthor = b.Author WHERE b.Title = 'Pride and Prejudice'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name LIKE '%Plato%'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name LIKE '%Plato%'
SELECT COUNT(DISTINCT IdOrder) FROM Books_Order INNER JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT COUNT(DISTINCT Books_Order.IdOrder) FROM Books_Order, Book WHERE Books_Order.ISBN = Book.ISBN AND Book.Title = 'Pride and Prejudice'
SELECT DISTINCT o.IdOrder FROM Orders o INNER JOIN Books_Order bo ON o.IdOrder = bo.IdOrder INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY o.IdOrder HAVING COUNT(DISTINCT b.Title) = 2
SELECT o.IdOrder FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY o.IdOrder HAVING COUNT(DISTINCT b.Title) = 2
SELECT b.ISBN FROM Books_Order b INNER JOIN Orders o ON b.IdOrder = o.IdOrder INNER JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'Peter Doe' OR c.Name = 'James Smith' GROUP BY b.ISBN HAVING COUNT(DISTINCT c.IdClient) = 2
SELECT b.ISBN FROM Books_Order b JOIN Orders o ON b.IdOrder = o.IdOrder JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name IN ('Peter Doe', 'James Smith') GROUP BY b.ISBN HAVING COUNT(DISTINCT c.Name) = 2
SELECT b.Title FROM Book b JOIN Books_Order bo ON b.ISBN = bo.ISBN JOIN Orders o ON bo.IdOrder = o.IdOrder JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'Peter Doe' AND b.ISBN NOT IN (SELECT b.ISBN FROM Book b JOIN Books_Order bo ON b.ISBN = bo.ISBN JOIN Orders o ON bo.IdOrder = o.IdOrder JOIN Client c ON o.IdClient = c.IdClient WHERE c.Name = 'James Smith')
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND ISBN NOT IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice'
SELECT DISTINCT c.Name FROM Client c INNER JOIN Orders o ON c.IdClient = o.IdClient INNER JOIN Books_Order bo ON o.IdOrder = bo.IdOrder INNER JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice'
SELECT COUNT(Book_ID) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT book.Type, MAX(book.Chapters), MIN(book.Chapters) FROM book GROUP BY book.Type
SELECT Title FROM book WHERE Type != 'Poet'
SELECT AVG(Rating) FROM review
SELECT book.Title, review.Rating FROM book INNER JOIN review ON book.Book_ID = review.Book_ID
SELECT r.Rating FROM review r INNER JOIN book b ON r.Book_ID = b.Book_ID WHERE b.Chapters = (SELECT MAX(Chapters) FROM book)
SELECT r.Rank FROM review r INNER JOIN book b ON r.Book_ID = b.Book_ID ORDER BY b.Pages ASC LIMIT 1
SELECT b.Title FROM book b JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Rank = (SELECT MAX(Rank) FROM review)
SELECT AVG(Readers_in_Million) FROM review JOIN book ON review.Book_ID = book.Book_ID WHERE book.Type = 'Novel'
SELECT b.Type, COUNT(b.Book_ID) AS NumberOfBooks FROM book AS b GROUP BY b.Type
SELECT Type FROM book GROUP BY Type ORDER BY COUNT(*) DESC LIMIT 1
SELECT Type FROM book GROUP BY Type HAVING COUNT(Book_ID) >= 3
SELECT b.Title FROM book b INNER JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Rating ASC
SELECT b.Title, b.Audio FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Readers_in_Million DESC
SELECT COUNT(*) FROM book b LEFT JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Book_ID IS NULL
SELECT Type FROM book GROUP BY Type HAVING MAX(Chapters) > 75 AND MIN(Chapters) < 50
SELECT COUNT(DISTINCT Type) FROM book
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT COUNT(Customer_ID) FROM customer
SELECT COUNT(Customer_ID) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Name FROM customer ORDER BY Level_of_Membership ASC
SELECT Nationality, Card_Credit FROM customer
SELECT Nationality, Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT Card_Credit FROM customer WHERE Level_of_Membership = (SELECT MAX(Level_of_Membership) FROM customer)
SELECT c.Card_Credit FROM customer c ORDER BY c.Level_of_Membership DESC LIMIT 1
SELECT Nationality, COUNT(Customer_ID) AS NumberOfCustomers FROM customer GROUP BY Nationality
SELECT c.Nationality, COUNT(c.Customer_ID) FROM customer c GROUP BY c.Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.Nationality FROM customer c GROUP BY c.Nationality ORDER BY COUNT(c.Customer_ID) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality HAVING MIN(Card_Credit) < 50 AND MAX(Card_Credit) > 75
SELECT c1.Nationality FROM customer c1 WHERE c1.Card_Credit > 50 AND EXISTS (SELECT 1 FROM customer c2 WHERE c2.Nationality = c1.Nationality AND c2.Card_Credit < 75)
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, SUM(co.Quantity) FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Name
SELECT c.Name, SUM(co.Quantity) AS Total_Quantity FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Name
SELECT c.Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID HAVING SUM(co.Quantity) > 1
SELECT c.Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID HAVING SUM(co.Quantity) > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT c.Name FROM customer c LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID WHERE co.Customer_ID IS NULL
SELECT c.Name FROM customer c LEFT JOIN customer_order co ON c.Customer_ID = co.Customer_ID WHERE co.Customer_ID IS NULL
SELECT COUNT(Member_ID) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name, Nationality FROM member
SELECT m.Name FROM member m WHERE m.Nationality <> 'England'
SELECT Name FROM member WHERE Age IN (19, 20)
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(Member_ID) AS members_count FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT m.Nationality FROM member m GROUP BY m.Nationality HAVING COUNT(m.Member_ID) >= 2
SELECT M.Name, C.Club_Name FROM member M JOIN club_leader CL ON M.Member_ID = CL.Member_ID JOIN club C ON CL.Club_ID = C.Club_ID
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Overall_Ranking > 100
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID WHERE cl.Year_Join < 2018
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Club_Name = 'Houston'
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member GROUP BY Nationality HAVING MAX(Age) > 22 AND MIN(Age) < 19
SELECT AVG(m.Age) FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets;
SELECT Collection_Subsets.Collecrtion_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT C.Collection_Description FROM Collections C INNER JOIN Collection_Subset_Members CSM ON C.Collection_ID = CSM.Collection_ID INNER JOIN Collection_Subsets CS ON CSM.Collection_Subset_ID = CS.Collection_Subset_ID WHERE CS.Collection_Subset_Name = 'Top collection'
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects;
SELECT Document_Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Document_Object_ID = (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT d.Owner FROM Document_Objects d JOIN Document_Objects child ON d.Document_Object_ID = child.Parent_Document_Object_ID WHERE child.Owner = 'Marlin'
SELECT DISTINCT d.Description FROM Document_Objects d WHERE EXISTS (SELECT 1 FROM Document_Objects WHERE Document_Object_ID = d.Parent_Document_Object_ID)
SELECT DISTINCT Description FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT COUNT(Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT d1.Document_Object_ID FROM Document_Objects d1 WHERE NOT EXISTS (SELECT 1 FROM Document_Objects d2 WHERE d2.Parent_Document_Object_ID = d1.Document_Object_ID)
SELECT Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL AND Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NULL)
SELECT d.Parent_Document_Object_ID, COUNT(d.Document_Object_ID) AS NumberOfChildren FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID
SELECT d.Parent_Document_Object_ID, COUNT(d.Document_Object_ID) AS NumberOfChildren FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID
SELECT Collections.Collection_Name FROM Collections;
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Name FROM Collections WHERE Collection_ID = (SELECT Parent_Collection_ID FROM Collections WHERE Collection_Name = 'Nice')
SELECT DISTINCT p.Collection_Name FROM Collections c JOIN Collections p ON c.Parent_Collection_ID = p.Collection_ID WHERE c.Collection_Name = 'Nice'
SELECT c.Collection_Name FROM Collections c WHERE NOT EXISTS (SELECT 1 FROM Collections pc WHERE pc.Parent_Collection_ID = c.Collection_ID)
SELECT Collection_Name FROM Collections c WHERE NOT EXISTS (SELECT 1 FROM Collections p WHERE p.Parent_Collection_ID = c.Collection_ID)
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(Document_Object_ID) > 1
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM Collections c JOIN Collections p ON c.Parent_Collection_ID = p.Collection_ID WHERE p.Collection_Name = 'Best'
SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom')
SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom')
SELECT CS.Collection_Subset_ID, CS.Collection_Subset_Name, COUNT(*) AS CollectionCount FROM Collection_Subsets CS LEFT JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID GROUP BY CS.Collection_Subset_ID, CS.Collection_Subset_Name
SELECT CS.Collection_Subset_ID, CS.Collection_Subset_Name, COUNT(DISTINCT CSM.Collection_ID) AS Collection_Count FROM Collection_Subsets CS LEFT JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID GROUP BY CS.Collection_Subset_ID, CS.Collection_Subset_Name
SELECT d.Parent_Document_Object_ID, COUNT(d.Document_Object_ID) AS Total_Children FROM Document_Objects d WHERE d.Parent_Document_Object_ID IS NOT NULL GROUP BY d.Parent_Document_Object_ID ORDER BY Total_Children DESC LIMIT 1
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS ChildrenCount FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT d.Document_Object_ID, COUNT(d.Related_Document_Object_ID) AS Num_Related FROM Document_Subset_Members d GROUP BY d.Document_Object_ID ORDER BY Num_Related ASC LIMIT 1
SELECT d.Document_Object_ID FROM Document_Objects d LEFT JOIN Documents_in_Collections dc ON d.Document_Object_ID = dc.Document_Object_ID GROUP BY d.Document_Object_ID ORDER BY COUNT(dc.Document_Object_ID) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Documents_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Related_Count BETWEEN 2 AND 4
SELECT DISTINCT d.Owner FROM Document_Objects d WHERE d.Document_Object_ID IN (SELECT dsm.Related_Document_Object_ID FROM Document_Subset_Members dsm WHERE dsm.Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden'))
SELECT DISTINCT d.Owner FROM Document_Objects d WHERE d.Document_Object_ID IN (SELECT ds.Related_Document_Object_ID FROM Document_Subset_Members ds JOIN Document_Objects d2 ON ds.Document_Object_ID = d2.Document_Object_ID WHERE d2.Owner = 'Braeden')
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden')
SELECT ds.Document_Subset_ID, ds.Document_Subset_Name, COUNT(DISTINCT dsm.Document_Object_ID) AS Num_Documents FROM Document_Subsets ds INNER JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID GROUP BY ds.Document_Subset_ID, ds.Document_Subset_Name
SELECT Document_Subset_ID, Document_Subset_Name, COUNT(DISTINCT Document_Object_ID) AS TotalDocuments FROM Document_Subsets JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subset_ID, Document_Subset_Name
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS NumberOfDocuments FROM Document_Subsets DS JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS Document_Count FROM Document_Subsets DS INNER JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID ORDER BY Document_Count DESC LIMIT 1
SELECT dsm.Document_Object_ID FROM Document_Subset_Members dsm JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000'
SELECT dsm.Document_Object_ID FROM Document_Subset_Members dsm JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000'
SELECT ds.Document_Subset_Name, dsm.Document_Object_ID FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID
SELECT D.Document_Object_ID, DS.Document_Subset_Name FROM Document_Objects AS D JOIN Document_Subset_Members AS DSM ON D.Document_Object_ID = DSM.Document_Object_ID JOIN Document_Subsets AS DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID
SELECT c.Collection_Name FROM Collections c JOIN Documents_in_Collections dc ON c.Collection_ID = dc.Collection_ID JOIN Document_Objects do ON dc.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT c.Collection_Name FROM Collections c JOIN Documents_in_Collections dc ON c.Collection_ID = dc.Collection_ID JOIN Document_Objects do ON dc.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Ransom'
SELECT Document_Object_ID, COUNT(Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(*) AS NumOfCollections FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT count(Documents_in_Collections.Document_Object_ID) FROM Documents_in_Collections, Collections WHERE Documents_in_Collections.Collection_ID = Collections.Collection_ID AND Collections.Collection_Name = 'Best'
SELECT COUNT(*) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collection_Name = 'Best';
SELECT COUNT(DISTINCT do.Document_Object_ID) FROM Document_Objects do JOIN Documents_in_Collections dic ON do.Document_Object_ID = dic.Document_Object_ID JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT C.Collection_Name, C.Collection_ID, COUNT(D.Document_Object_ID) AS NumberOfDocuments FROM Collections C JOIN Documents_in_Collections D ON C.Collection_ID = D.Collection_ID GROUP BY C.Collection_ID, C.Collection_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT C.Collection_ID, C.Collection_Name, COUNT(DIC.Document_Object_ID) AS Document_Count FROM Collections C JOIN Documents_in_Collections DIC ON C.Collection_ID = DIC.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID ORDER BY Document_Count DESC LIMIT 1
SELECT D.Document_Object_ID FROM Document_Objects D WHERE EXISTS (SELECT 1 FROM Documents_in_Collections DC JOIN Collections C ON DC.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best' AND DC.Document_Object_ID = D.Document_Object_ID) AND EXISTS (SELECT 1 FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' AND DSM.Document_Object_ID = D.Document_Object_ID)
SELECT DISTINCT do.Document_Object_ID FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID JOIN Documents_in_Collections dic ON do.Document_Object_ID = dic.Document_Object_ID JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE ds.Document_Subset_Name = 'Best for 2000' AND c.Collection_Name = 'Best'
SELECT DISTINCT doc.Document_Object_ID FROM Documents_in_Collections doc INNER JOIN Collections col ON doc.Collection_ID = col.Collection_ID WHERE col.Collection_Name = 'Best' AND doc.Document_Object_ID NOT IN (SELECT dsm.Document_Object_ID FROM Document_Subset_Members dsm INNER JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000')
SELECT d.Document_Object_ID FROM Documents_in_Collections d JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID = (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') UNION SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')
SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') UNION SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')
SELECT C.Collection_Name FROM Collections C WHERE C.Collection_ID IN (SELECT Related_Collection_ID FROM Collection_Subset_Members WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT C.Collection_Name FROM Collections C INNER JOIN Collection_Subset_Members CSM ON C.Collection_ID = CSM.Related_Collection_ID WHERE CSM.Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT CS.Collection_Subset_Name FROM Collection_Subsets CS JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID JOIN Collections C ON CSM.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name ASC
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality) AS MaximumQuality, MIN(voice_sound_quality) AS MinimumQuality FROM performance_score
SELECT voice_sound_quality, rhythm_tempo, stage_presence FROM performance_score JOIN participants ON performance_score.participant_id = participants.id WHERE participants.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name != 'Love'
SELECT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT p.stage_presence FROM performance_score AS p JOIN songs AS s ON p.songs_id = s.id WHERE s.language = 'English'
SELECT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id HAVING COUNT(ps.songs_id) >= 2
SELECT p.id, p.name, p.popularity FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id ORDER BY COUNT(ps.songs_id) DESC
SELECT id, name FROM participants WHERE id IN (SELECT participant_id FROM performance_score WHERE voice_sound_quality = 5 OR rhythm_tempo = 5)
SELECT ps.voice_sound_quality FROM performance_score ps JOIN songs s ON ps.songs_id = s.id WHERE s.name = 'The Balkan Girls' AND s.language = 'English'
SELECT s.id, s.name FROM songs s JOIN performance_score ps ON s.id = ps.songs_id GROUP BY s.id, s.name ORDER BY COUNT(ps.participant_id) DESC LIMIT 1
SELECT count(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT count(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT AVG(p.rhythm_tempo), s.language FROM performance_score p JOIN songs s ON p.songs_id = s.id GROUP BY s.language
SELECT DISTINCT name FROM participants WHERE id IN (SELECT original_artist FROM songs WHERE language = 'English')
SELECT p.name, p.popularity FROM participants p WHERE EXISTS (SELECT 1 FROM songs s JOIN performance_score ps ON s.id = ps.songs_id WHERE s.language = 'Croatian' AND ps.participant_id = p.id) AND EXISTS (SELECT 1 FROM songs s JOIN performance_score ps ON s.id = ps.songs_id WHERE s.language = 'English' AND ps.participant_id = p.id)
SELECT name FROM songs WHERE name LIKE '%Is%'
SELECT s.original_artist FROM songs s INNER JOIN performance_score ps ON s.id = ps.songs_id WHERE ps.rhythm_tempo > 5 ORDER BY ps.voice_sound_quality DESC
SELECT COUNT(city_code) FROM City
SELECT COUNT(*) AS NumberOfCities FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(DISTINCT country) FROM City
SELECT COUNT(DISTINCT country) FROM City
SELECT city_name, city_code, state, country FROM City
SELECT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT city_name FROM City WHERE state = 'PA'
SELECT city_name FROM City WHERE state = 'PA'
SELECT COUNT(city_code) FROM City WHERE country = 'Canada'
SELECT COUNT(city_code) FROM City WHERE country = 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT City.city_name FROM City WHERE City.country = 'USA' ORDER BY City.latitude
SELECT state, COUNT(city_code) AS NumberOfCities FROM City GROUP BY state
SELECT state, COUNT(city_code) FROM City GROUP BY state
SELECT country, COUNT(city_code) FROM City GROUP BY country
SELECT country, COUNT(city_code) AS city_count FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(city_code) >= 2
SELECT state FROM City GROUP BY state ORDER BY COUNT(city_code) DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY COUNT(city_code) ASC LIMIT 1
SELECT c.country FROM City c GROUP BY c.country ORDER BY COUNT(c.city_code) ASC LIMIT 1
SELECT Fname, Lname FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT Fname || ' ' || LName AS full_name FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT COUNT(DISTINCT Student.StuID) FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(DISTINCT Student.StuID) FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT City.country, COUNT(Student.StuID) AS num_students FROM City INNER JOIN Student ON City.city_code = Student.city_code GROUP BY City.country
SELECT c.country, COUNT(s.StuID) AS num_students FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY c.country
SELECT city_code, COUNT(StuID) AS NumberOfStudents FROM Student GROUP BY city_code
SELECT city_code, COUNT(*) AS student_count FROM Student GROUP BY city_code
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code GROUP BY C.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.state FROM Student S JOIN City C ON S.city_code = C.city_code GROUP BY C.state ORDER BY COUNT(*) DESC LIMIT 1
SELECT c.country FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY c.country ORDER BY COUNT(s.StuID) ASC LIMIT 1
SELECT C.country FROM City C INNER JOIN Student S ON C.city_code = S.city_code GROUP BY C.country ORDER BY COUNT(S.StuID) ASC LIMIT 1
SELECT c.city_name FROM City c JOIN Student s ON c.city_code = s.city_code GROUP BY c.city_name HAVING COUNT(s.StuID) >= 3
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT C.state FROM City C INNER JOIN Student S ON C.city_code = S.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT C.state FROM City C INNER JOIN Student S ON C.city_code = S.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country <> 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA'
SELECT Student.StuID FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'F' AND City.state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'F' AND state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'M' AND country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'M' AND Country != 'USA'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT d.distance FROM Direct_distance d WHERE (d.city1_code = 'BOS' AND d.city2_code = 'NWK') OR (d.city1_code = 'NWK' AND d.city2_code = 'BOS')
SELECT distance FROM Direct_distance WHERE (city1_code = 'BOS' AND city2_code = 'NWK') OR (city1_code = 'NWK' AND city2_code = 'BOS')
SELECT avg(distance), min(distance), max(distance) FROM Direct_distance
SELECT AVG(distance), MIN(distance), MAX(distance) FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT d.city1_code, d.city2_code FROM Direct_distance d WHERE d.distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT DISTINCT city1_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000
SELECT DISTINCT city1_code FROM Direct_distance WHERE distance < 1000 UNION SELECT DISTINCT city2_code FROM Direct_distance WHERE distance < 1000
SELECT sum(D.distance) FROM Direct_distance D WHERE D.city1_code = 'BAL' OR D.city2_code = 'BAL'
SELECT SUM(distance) FROM Direct_distance WHERE 'BAL' IN (city1_code, city2_code)
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY distance ASC LIMIT 1)
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY D.distance LIMIT 1
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY D.distance DESC LIMIT 1
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY D.distance DESC LIMIT 1
SELECT city1_code, SUM(distance) FROM Direct_distance GROUP BY city1_code
SELECT city1_code, SUM(distance) FROM Direct_distance GROUP BY city1_code
SELECT C.city_name, AVG(D.distance) FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT C.city_name, AVG(D.distance) FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT dd.distance FROM Direct_distance dd JOIN Student s1 ON dd.city1_code = s1.city_code JOIN Student s2 ON dd.city2_code = s2.city_code WHERE s1.Fname = 'Linda' AND s1.Lname = 'Smith' AND s2.Fname = 'Tracy' AND s2.Lname = 'Kim'
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE LName = 'Smith' AND Fname = 'Linda') AND city2_code = (SELECT city_code FROM Student WHERE LName = 'Kim' AND Fname = 'Tracy')
SELECT S.Fname, S.LName FROM Student S JOIN City C1 ON S.city_code = C1.city_code JOIN City C2 WHERE C2.city_name = 'Linda Smith' ORDER BY (C1.latitude - C2.latitude)*(C1.latitude - C2.latitude) + (C1.longitude - C2.longitude)*(C1.longitude - C2.longitude) DESC LIMIT 1
SELECT Fname || ' ' || LName AS FullName FROM Student WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') ORDER BY distance DESC LIMIT 1)
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code WHERE S.Fname = 'Linda'
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code WHERE S.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT * FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT Boats.bid, Boats.name FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = 1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE r.bid = 102
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE R.bid = 102
SELECT DISTINCT bid FROM Reserves
SELECT DISTINCT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age > ALL (SELECT age FROM Sailors)
SELECT DISTINCT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT S.name FROM Sailors S WHERE S.age > ALL (SELECT age FROM Sailors WHERE rating > 7)
SELECT DISTINCT S1.name FROM Sailors S1 WHERE S1.age > ANY (SELECT S2.age FROM Sailors S2 WHERE S2.rating > 7)
SELECT s.name, s.sid FROM Sailors s WHERE EXISTS (SELECT 1 FROM Reserves r WHERE r.sid = s.sid)
SELECT DISTINCT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid
SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) > 1
SELECT DISTINCT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) >= 2
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT R.sid FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' OR B.color = 'blue'
SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue')
SELECT DISTINCT Sailors.sid, Sailors.name FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue')
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' INTERSECT SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'blue'
SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red' UNION ALL SELECT bid FROM Boats WHERE color = 'blue') GROUP BY sid HAVING COUNT(DISTINCT color) = 2
SELECT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue') GROUP BY s.sid, s.name HAVING COUNT(DISTINCT b.color) = 2
SELECT s.sid, s.name FROM Sailors s WHERE EXISTS (SELECT 1 FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.color = 'red') AND EXISTS (SELECT 1 FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.color = 'blue')
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT s.sid FROM Sailors s WHERE s.sid NOT IN (SELECT r.sid FROM Reserves r)
SELECT s.sid, s.name FROM Sailors s LEFT JOIN Reserves r ON s.sid = r.sid WHERE r.sid IS NULL
SELECT s.name, s.sid FROM Sailors s LEFT JOIN Reserves r ON s.sid = r.sid WHERE r.sid IS NULL
SELECT s.sid FROM Sailors s LEFT JOIN Reserves r ON s.sid = r.sid WHERE r.sid IS NULL
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid = 103)
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid WHERE r.bid = 103
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis')
SELECT s.name FROM Sailors s WHERE s.rating > ALL (SELECT s2.rating FROM Sailors s2 WHERE s2.name = 'Luis')
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis')
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis')
SELECT DISTINCT S.name, S.sid FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE S.rating > 2
SELECT DISTINCT S.name, S.sid FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE S.rating >= 3
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT count(*) FROM Sailors;
SELECT count(*) FROM Sailors
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT COUNT(sid) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(sid) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating) AS AverageRating, MAX(age) AS MaximumAge FROM Sailors
SELECT AVG(rating) AS AverageRating, MAX(age) AS MaximumAge FROM Sailors
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid
SELECT bid, COUNT(*) FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT bid, COUNT(*) AS num_reservations FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT bid, COUNT(*) AS reservation_count FROM Reserves GROUP BY bid HAVING COUNT(*) > 1
SELECT Boats.bid, Boats.name, COUNT(*) AS reservation_count FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid GROUP BY Boats.bid HAVING COUNT(*) > 1
SELECT B.name, COUNT(R.sid) FROM Boats B INNER JOIN Reserves R ON B.bid = R.bid WHERE R.sid > 1 GROUP BY B.name
SELECT B.name, COUNT(*) AS TotalReservations FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE R.sid > 1 GROUP BY B.name
SELECT S.rating, AVG(S.age) AS average_age FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT S.rating, AVG(S.age) FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT s.name, s.rating, s.age FROM Sailors s ORDER BY s.rating ASC, s.age ASC
SELECT s.name, s.rating, s.age FROM Sailors s ORDER BY s.rating ASC, s.age ASC
SELECT count(*) FROM Boats
SELECT count(*) FROM Boats
SELECT COUNT(bid) FROM Boats WHERE color = 'red'
SELECT COUNT(bid) FROM Boats WHERE color = 'red'
SELECT DISTINCT Boats.name FROM Boats INNER JOIN Reserves ON Boats.bid = Reserves.bid INNER JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age > 19 AND Sailors.age < 31
SELECT DISTINCT Boats.name FROM Boats INNER JOIN Reserves ON Boats.bid = Reserves.bid INNER JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.age >= 20 AND Sailors.age <= 30
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red')
SELECT name FROM Sailors WHERE rating > ALL (SELECT Sailors.rating FROM Sailors JOIN Reserves ON Sailors.sid = Reserves.sid JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red')
SELECT MAX(rating) FROM Sailors
SELECT MAX(rating) AS MaximumRating FROM Sailors
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.name = 'Melon'
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.name = 'Melon'
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(*) DESC LIMIT 1
SELECT `Class` FROM `headphone` GROUP BY `Class` ORDER BY COUNT(Headphone_ID) DESC LIMIT 1
SELECT h.Class FROM headphone h GROUP BY h.Class HAVING COUNT(h.Headphone_ID) > 2
SELECT h.Class FROM headphone h GROUP BY h.Class HAVING COUNT(h.Headphone_ID) <= 2
SELECT Class, COUNT(Headphone_ID) AS NumberOfHeadphones FROM headphone WHERE Price > 200 GROUP BY Class
SELECT h.Class, COUNT(h.Headphone_ID) FROM headphone h WHERE h.Price > 200 GROUP BY h.Class
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT Earpads FROM headphone GROUP BY Earpads ORDER BY COUNT(Headphone_ID) DESC LIMIT 2
SELECT h.Earpads, COUNT(h.Headphone_ID) AS Total FROM headphone h GROUP BY h.Earpads ORDER BY Total DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT h.Model, h.Class, h.Construction FROM headphone h WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT DISTINCT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2
SELECT DISTINCT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2
SELECT Earpads FROM headphone EXCEPT SELECT Earpads FROM headphone WHERE Construction = 'Plastic'
SELECT Earpads FROM headphone WHERE Construction != 'Plastic'
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT store.Name, store.Parking FROM store WHERE store.Neighborhood = 'Tarzana'
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT Neighborhood, COUNT(Store_ID) AS NumberOfStores FROM store GROUP BY Neighborhood
SELECT Neighborhood, count(Store_ID) AS StoreCount FROM store GROUP BY Neighborhood
SELECT store.Name, SUM(stock.Quantity) AS TotalHeadphones FROM store JOIN stock ON store.Store_ID = stock.Store_ID GROUP BY store.Store_ID ORDER BY TotalHeadphones DESC LIMIT 1
SELECT s.Name, SUM(st.Quantity) AS Total_Quantity FROM store s JOIN stock st ON s.Store_ID = st.Store_ID GROUP BY s.Store_ID
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock)
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT DISTINCT Store_ID FROM stock)
SELECT h.Model FROM headphone h LEFT JOIN stock s ON h.Headphone_ID = s.Headphone_ID WHERE s.Headphone_ID IS NULL
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID = (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT h.Model FROM headphone h JOIN stock s ON h.Headphone_ID = s.Headphone_ID GROUP BY s.Headphone_ID ORDER BY SUM(s.Quantity) DESC LIMIT 1
SELECT SUM(Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT sum(Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT DISTINCT Store_ID FROM stock WHERE Quantity > 0)
SELECT s.Neighborhood FROM store s WHERE NOT EXISTS (SELECT 1 FROM stock st WHERE st.Store_ID = s.Store_ID AND st.Quantity > 0)
SELECT COUNT(author_id) FROM Author
SELECT COUNT(author_id) FROM Author
SELECT COUNT(paper_id) FROM Paper
SELECT COUNT(*) FROM Paper
SELECT COUNT(affiliation_id) FROM Affiliation
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(paper_id) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) AS NumberOfPapers FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Paper.year = 2009 AND Affiliation.name = 'Columbia University'
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT p.venue FROM Paper p ORDER BY p.year
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Harvard University'
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Harvard University'
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown'
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown'
SELECT p.paper_id, p.title FROM Paper p WHERE EXISTS (SELECT 1 FROM Author_list al JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE al.paper_id = p.paper_id AND a.name = 'Stanford University') AND EXISTS (SELECT 1 FROM Author_list al JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE al.paper_id = p.paper_id AND a.name = 'Columbia University')
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name IN ('Stanford', 'Columbia University') GROUP BY p.paper_id, p.title HAVING COUNT(DISTINCT a.name) = 2
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY p.paper_id, p.title HAVING COUNT(DISTINCT a.name) = 2
SELECT title, paper_id FROM Paper WHERE paper_id IN (SELECT AL.paper_id FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY AL.paper_id HAVING COUNT(DISTINCT A.author_id) = 2)
SELECT p.title, p.paper_id FROM Paper p WHERE EXISTS (SELECT 1 FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown' AND al.paper_id = p.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Rambow' AND al.paper_id = p.paper_id)
SELECT p.title, p.paper_id FROM Paper p WHERE EXISTS (SELECT 1 FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown' AND al.paper_id = p.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Rambow' AND al.paper_id = p.paper_id)
SELECT p.paper_id, p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Author a ON al.author_id = a.author_id WHERE a.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT Author.name, COUNT(Paper.paper_id) AS num_papers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Author.author_id ORDER BY num_papers DESC
SELECT Author.name, COUNT(Paper.paper_id) AS NumPapers FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Paper ON Author_list.paper_id = Paper.paper_id GROUP BY Author.author_id ORDER BY NumPapers DESC
SELECT a.name, COUNT(DISTINCT al.paper_id) AS num_papers FROM Affiliation a LEFT JOIN Author_list al ON a.affiliation_id = al.affiliation_id GROUP BY a.affiliation_id ORDER BY num_papers ASC
SELECT A.name FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id ORDER BY COUNT(P.paper_id) DESC
SELECT a.name FROM Author a WHERE a.author_id IN (SELECT al.author_id FROM Author_list al GROUP BY al.author_id HAVING COUNT(al.paper_id) > 50)
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) > 50
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(DISTINCT AL.paper_id) = 1
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(DISTINCT AL.paper_id) = 1
SELECT p.venue, p.year FROM Paper p GROUP BY p.venue, p.year ORDER BY COUNT(p.paper_id) DESC LIMIT 1
SELECT p.venue, p.year FROM Paper p GROUP BY p.venue, p.year ORDER BY COUNT(p.paper_id) DESC LIMIT 1
SELECT P.venue FROM Paper P GROUP BY P.venue ORDER BY COUNT(P.paper_id) ASC LIMIT 1
SELECT P.venue FROM Paper AS P GROUP BY P.venue ORDER BY COUNT(P.paper_id) ASC LIMIT 1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT paper_id) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(*) AS ReferenceCount FROM Citation WHERE paper_id = 'D12-1027'
SELECT COUNT(cited_paper_id) FROM Citation WHERE paper_id = 'D12-1027'
SELECT C.paper_id, COUNT(*) AS num_citations FROM Citation AS C GROUP BY C.paper_id ORDER BY num_citations DESC LIMIT 1
SELECT C.paper_id, COUNT(*) AS num_citations FROM Citation AS C GROUP BY C.paper_id ORDER BY num_citations DESC LIMIT 1
SELECT P.title FROM Paper P JOIN (SELECT paper_id, COUNT(cited_paper_id) AS citations FROM Citation GROUP BY paper_id ORDER BY citations DESC LIMIT 1) C ON P.paper_id = C.paper_id
SELECT P.title FROM Paper P JOIN (SELECT paper_id, COUNT(cited_paper_id) AS citations FROM Citation GROUP BY paper_id ORDER BY citations DESC LIMIT 1) C ON P.paper_id = C.paper_id
SELECT P.title, COUNT(C.cited_paper_id) AS citation_count FROM Paper P JOIN Citation C ON P.paper_id = C.cited_paper_id GROUP BY P.paper_id ORDER BY citation_count DESC LIMIT 10
SELECT P.title, COUNT(C.cited_paper_id) AS citation_count FROM Paper P JOIN Citation C ON P.paper_id = C.cited_paper_id GROUP BY P.paper_id ORDER BY citation_count DESC LIMIT 10
SELECT COUNT(*) FROM Citation WHERE paper_id IN (SELECT al.paper_id FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown, Kathleen')
SELECT COUNT(Citation.cited_paper_id) FROM Citation, Author_list, Author WHERE Citation.paper_id = Author_list.paper_id AND Author_list.author_id = Author.author_id AND Author.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT Citation.cited_paper_id) FROM Citation INNER JOIN Author_list ON Citation.paper_id = Author_list.paper_id INNER JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT Citation.cited_paper_id) FROM Citation INNER JOIN Author_list ON Citation.paper_id = Author_list.paper_id INNER JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(C.cited_paper_id) AS citation_count FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT Author.name, COUNT(Citation.cited_paper_id) AS num_citations FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Citation ON Author_list.paper_id = Citation.cited_paper_id GROUP BY Author.author_id ORDER BY num_citations DESC LIMIT 1
SELECT DISTINCT P.venue, P.year FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Author AS A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown, Kathleen'
SELECT P.venue, P.year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown, Kathleen'
SELECT DISTINCT P.venue, P.year FROM Paper AS P JOIN Author_list AS AL ON P.paper_id = AL.paper_id JOIN Affiliation AS A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT DISTINCT P.venue, P.year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.author_id ORDER BY COUNT(P.paper_id) DESC LIMIT 1
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.author_id ORDER BY COUNT(P.paper_id) DESC LIMIT 1
SELECT a.name FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id JOIN Paper p ON al.paper_id = p.paper_id WHERE p.year = 2009 GROUP BY a.name ORDER BY COUNT(p.paper_id) DESC LIMIT 3
SELECT A.name FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY COUNT(*) DESC LIMIT 3
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Stanford University' AND Paper.year >= 2000 AND Paper.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper, Author_list, Affiliation WHERE Paper.paper_id = Author_list.paper_id AND Author_list.affiliation_id = Affiliation.affiliation_id AND Affiliation.name = 'Stanford University' AND Paper.year BETWEEN 2000 AND 2009
SELECT p.title FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id GROUP BY p.paper_id ORDER BY COUNT(al.author_id) DESC LIMIT 1
SELECT title FROM Paper WHERE paper_id = (SELECT paper_id FROM Author_list GROUP BY paper_id ORDER BY COUNT(author_id) DESC LIMIT 1)
SELECT COUNT(DISTINCT al2.author_id) FROM Author_list al1 JOIN Author_list al2 ON al1.paper_id = al2.paper_id AND al1.author_id != al2.author_id WHERE al1.author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')
SELECT COUNT(DISTINCT AL.author_id) FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE AL.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) AND A.name != 'Mckeown, Kathleen'
SELECT A2.name FROM Author A1 JOIN Author_list AL1 ON A1.author_id = AL1.author_id JOIN Paper P ON AL1.paper_id = P.paper_id JOIN Author_list AL2 ON P.paper_id = AL2.paper_id JOIN Author A2 ON AL2.author_id = A2.author_id WHERE A1.name = 'Mckeown, Kathleen' AND A2.name != 'Mckeown, Kathleen' GROUP BY A2.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT a.name FROM Author a JOIN Author_list al ON a.author_id = al.author_id JOIN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) p ON al.paper_id = p.paper_id WHERE a.name != 'Mckeown, Kathleen' GROUP BY a.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT a.name FROM Affiliation a JOIN Author_list al ON a.affiliation_id = al.affiliation_id JOIN Paper p ON al.paper_id = p.paper_id WHERE a.address LIKE '%China%' GROUP BY a.affiliation_id ORDER BY COUNT(p.paper_id) DESC LIMIT 1
SELECT A.name FROM Affiliation A INNER JOIN (SELECT affiliation_id, COUNT(*) AS total FROM Author_list GROUP BY affiliation_id) AS B ON A.affiliation_id = B.affiliation_id WHERE A.address LIKE '%China%' ORDER BY B.total DESC LIMIT 1
SELECT year, venue, COUNT(*) FROM Paper GROUP BY year, venue
SELECT year, venue, COUNT(paper_id) AS total_papers FROM Paper GROUP BY year, venue
SELECT affiliation.name, COUNT(DISTINCT paper.paper_id) FROM affiliation JOIN author_list ON affiliation.affiliation_id = author_list.affiliation_id JOIN paper ON author_list.paper_id = paper.paper_id GROUP BY affiliation.affiliation_id
SELECT A.name, COUNT(*) AS paper_count FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id
SELECT p.title FROM Paper p JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50) AS c ON p.paper_id = c.paper_id
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50)
SELECT COUNT(DISTINCT a.author_id) FROM Author a LEFT JOIN Author_list al ON a.author_id = al.author_id LEFT JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50) c ON al.paper_id = c.paper_id WHERE c.paper_id IS NULL
SELECT COUNT(DISTINCT A.author_id) FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50) C ON AL.paper_id = C.paper_id WHERE C.paper_id IS NULL
SELECT DISTINCT a.name FROM Author a WHERE EXISTS (SELECT 1 FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE al.author_id = a.author_id AND p.venue IN ('NAACL', 'ACL') AND p.year = 2009)
SELECT a.name FROM Author a WHERE a.author_id IN (SELECT al.author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'NAACL' AND p.year = 2009 INTERSECT SELECT al.author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'ACL' AND p.year = 2009)
SELECT DISTINCT a.name FROM Author a WHERE a.author_id NOT IN (SELECT al.author_id FROM Author_list al JOIN Paper p ON al.paper_id = p.paper_id WHERE p.venue = 'ACL')
SELECT A.name FROM Author A WHERE NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND AL.author_id = A.author_id)
SELECT COUNT(Conference_ID) FROM conference
SELECT COUNT(Conference_ID) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT c.Conference_Name, COUNT(cp.Conference_ID) AS Participation_Count FROM conference c INNER JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name
SELECT c.Conference_Name, COUNT(*) AS Occurrences FROM conference AS c GROUP BY c.Conference_Name
SELECT Year, COUNT(Conference_ID) FROM conference GROUP BY Year
SELECT Year, COUNT(Conference_ID) AS Total_Conferences FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(Conference_ID) ASC LIMIT 1
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(Conference_ID) ASC LIMIT 1
SELECT c.Location FROM conference c GROUP BY c.Location HAVING COUNT(c.Conference_ID) >= 2
SELECT c.Location FROM conference c GROUP BY c.Location HAVING COUNT(c.Conference_ID) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution
SELECT count(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT COUNT(*) FROM institution WHERE Founded >= 1850 AND Founded <= 1900
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT i.Institution_Name, COUNT(s.staff_ID) FROM institution i JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID
SELECT i.Institution_ID, COUNT(s.staff_ID) FROM institution i JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE i.Founded > 1800 GROUP BY i.Institution_ID
SELECT i.Institution_Name FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE s.staff_ID IS NULL
SELECT i.Institution_Name FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE s.staff_ID IS NULL
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age) AS MaximumAge, MIN(Age) AS MinimumAge FROM staff
SELECT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada'
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID JOIN institution i ON s.Institution_ID = i.Institution_ID WHERE i.Location = 'Canada'
SELECT s.name FROM staff s WHERE EXISTS (SELECT 1 FROM conference_participation cp WHERE cp.staff_ID = s.staff_ID AND cp.role = 'speaker') AND EXISTS (SELECT 1 FROM conference_participation cp WHERE cp.staff_ID = s.staff_ID AND cp.role = 'sponsor')
SELECT s.name FROM staff s WHERE s.staff_ID IN (SELECT cp.staff_ID FROM conference_participation cp WHERE cp.role = 'speaker' INTERSECT SELECT cp.staff_ID FROM conference_participation cp WHERE cp.role = 'sponsor')
SELECT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL' INTERSECT SELECT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'Naccl'
SELECT DISTINCT s.name FROM staff s, conference_participation cp, conference c WHERE s.staff_ID = cp.staff_ID AND cp.Conference_ID = c.Conference_ID AND c.Conference_Name IN ('ACL', 'NACCL') GROUP BY s.name HAVING COUNT(DISTINCT c.Conference_Name) = 2
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2003 OR c.Year = 2004
SELECT DISTINCT s.name FROM staff s, conference_participation cp, conference c WHERE s.staff_ID = cp.staff_ID AND cp.Conference_ID = c.Conference_ID AND (c.Year = 2003 OR c.Year = 2004)
SELECT c.Conference_Name, c.Year, COUNT(*) AS Num_Participants FROM conference c INNER JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year
SELECT c.Conference_ID, c.Conference_Name, c.Year, COUNT(DISTINCT cp.staff_ID) AS Num_Participants FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name, c.Year
SELECT c.Conference_Name FROM conference AS c INNER JOIN conference_participation AS cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID ORDER BY COUNT(cp.staff_ID) DESC LIMIT 2
SELECT c.Conference_Name FROM conference c INNER JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID ORDER BY COUNT(cp.staff_ID) DESC LIMIT 2
SELECT s.name, s.Nationality FROM staff s WHERE NOT EXISTS (SELECT * FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE cp.staff_ID = s.staff_ID AND c.Conference_Name = 'ACL')
SELECT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL')
SELECT i.Institution_Name, i.Location FROM institution i WHERE i.Institution_ID NOT IN (SELECT s.Institution_ID FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004)
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT p.pilot_name FROM PilotSkills p WHERE p.age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT PS.pilot_name FROM PilotSkills PS WHERE PS.age < (SELECT AVG(age) FROM PilotSkills) ORDER BY PS.age ASC
SELECT * FROM PilotSkills WHERE age < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT PilotSkills.plane_name FROM PilotSkills WHERE PilotSkills.pilot_name = 'Jones' AND PilotSkills.age = 32
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40
SELECT count(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT count(*) FROM PilotSkills WHERE plane_name = 'B-52 Bomber' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT H.plane_name FROM Hangar H LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name ORDER BY COUNT(P.pilot_name) ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(DISTINCT ps.pilot_name) FROM PilotSkills ps INNER JOIN Hangar h ON ps.plane_name = h.plane_name WHERE h.location = 'Chicago'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT PS.plane_name FROM PilotSkills AS PS WHERE PS.pilot_name = 'Smith' AND PS.age = 41
SELECT PS.plane_name FROM PilotSkills AS PS WHERE PS.pilot_name = 'Smith' AND PS.age = 41
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE pilot_name = 'Smith'
SELECT COUNT(DISTINCT ps.plane_name) FROM PilotSkills ps WHERE ps.age > 40
SELECT COUNT(DISTINCT PilotSkills.plane_name) FROM PilotSkills WHERE PilotSkills.age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT p.pilot_name FROM PilotSkills p ORDER BY p.age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC;
SELECT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar ORDER BY plane_name ASC
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber') GROUP BY pilot_name HAVING COUNT(DISTINCT plane_name) = 2
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston')
SELECT p.pilot_name FROM PilotSkills p INNER JOIN Hangar h ON p.plane_name = h.plane_name WHERE h.location IN ('Austin', 'Boston') GROUP BY p.pilot_name HAVING COUNT(DISTINCT h.location) = 2
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT plane_name, avg(age) AS AverageAge FROM PilotSkills GROUP BY plane_name
SELECT plane_name, AVG(age) FROM PilotSkills GROUP BY plane_name
SELECT plane_type, COUNT(*) FROM Planes GROUP BY plane_type
SELECT plane_name, COUNT(*) FROM PilotSkills GROUP BY plane_name
SELECT p.plane_name, p.pilot_name FROM (SELECT plane_name, pilot_name, RANK() OVER (PARTITION BY plane_name ORDER BY age ASC) AS rnk FROM PilotSkills) p WHERE p.rnk = 1 ORDER BY p.plane_name
SELECT H.plane_name, PS.pilot_name FROM Hangar H LEFT JOIN PilotSkills PS ON H.plane_name = PS.plane_name WHERE PS.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = H.plane_name) ORDER BY H.plane_name
SELECT p.plane_name, p.pilot_name FROM PilotSkills p JOIN (SELECT plane_name, MAX(age) AS max_age FROM PilotSkills GROUP BY plane_name) max_p ON p.plane_name = max_p.plane_name AND p.age = max_p.max_age
SELECT p.plane_name, p.pilot_name FROM PilotSkills p INNER JOIN (SELECT plane_name, MIN(age) AS min_age FROM PilotSkills GROUP BY plane_name) AS min_ages ON p.plane_name = min_ages.plane_name AND p.age = min_ages.min_age
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT p.pilot_name, MAX(p.age) AS max_age FROM PilotSkills p GROUP BY p.pilot_name
SELECT location, COUNT(pilot_name) AS total_pilots, AVG(age) AS average_age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name GROUP BY location
SELECT h.location, COUNT(p.pilot_name) AS num_pilots, AVG(p.age) AS average_age FROM Hangar h JOIN PilotSkills p ON h.plane_name = p.plane_name GROUP BY h.location
SELECT plane_name, COUNT(pilot_name) FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT plane_name, COUNT(pilot_name) AS pilot_count FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35) GROUP BY plane_name
SELECT location FROM Hangar WHERE plane_name = (SELECT plane_name FROM PilotSkills ORDER BY age LIMIT 1)
SELECT location FROM Hangar WHERE plane_name = (SELECT plane_name FROM PilotSkills ORDER BY age LIMIT 1)
SELECT p.pilot_name, p.age FROM PilotSkills p JOIN Hangar h ON p.plane_name = h.plane_name WHERE h.location = 'Austin'
SELECT pilot_name, age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE location = 'Austin'
SELECT pilot_name FROM PilotSkills WHERE age > ANY (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name ASC
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > ALL (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills p1 WHERE p1.age > ANY (SELECT age FROM PilotSkills p2 WHERE p2.plane_name = 'Piper Cub')
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT Area_km, Government_website FROM district WHERE Population = (SELECT MIN(Population) FROM district)
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(Area_km) AS LargestArea, AVG(Area_km) AS AverageArea FROM district
SELECT SUM(Population) FROM district WHERE District_ID IN (SELECT District_ID FROM district ORDER BY Area_km DESC LIMIT 3)
SELECT district.District_ID, district.Name, district.Government_website FROM district ORDER BY district.Population ASC
SELECT Name FROM district WHERE Government_website LIKE '%.gov%'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman
SELECT AVG(Points) AS Average_Points, AVG(Age) AS Average_Age FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
SELECT s.Name FROM spokesman s WHERE s.Points < (SELECT AVG(s2.Points) FROM spokesman s2)
SELECT d.Name FROM district d WHERE d.District_ID IN (SELECT sd.District_ID FROM spokesman_district sd GROUP BY sd.District_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT s.Name FROM spokesman s JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Start_year < 2004
SELECT d.Name, COUNT(s.Spokesman_ID) AS Num_Spokesmen FROM district d LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID LEFT JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID GROUP BY d.District_ID, d.Name
SELECT d.Name FROM district d WHERE d.District_ID IN (SELECT sd.District_ID FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE s.Rank_position IN (1, 2) GROUP BY sd.District_ID HAVING COUNT(DISTINCT s.Rank_position) = 2)
SELECT d.Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID HAVING COUNT(sd.Spokesman_ID) > 1
SELECT count(d.District_ID) FROM district d LEFT JOIN spokesman_district sd ON d.District_ID = sd.District_ID WHERE sd.District_ID IS NULL
SELECT count(District_ID) FROM district d LEFT OUTER JOIN spokesman_district sd ON d.District_ID = sd.District_ID WHERE sd.Spokesman_ID IS NULL
SELECT SUM(Population) AS Total_Population, AVG(Population) AS Average_Population FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT P.title, P.location FROM Paintings P ORDER BY P.year ASC LIMIT 1
SELECT Sculptures.title FROM Sculptures WHERE Sculptures.location = 'gallery 226'
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title, location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures
SELECT title, location FROM Sculptures
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT fname, lname FROM Artists WHERE birthYear > 1850;
SELECT CONCAT(fname, ' ', lname) AS FullName FROM Artists WHERE birthYear > 1850
SELECT Sculptures.title, Sculptures.year FROM Sculptures WHERE Sculptures.location <> 'gallery 226'
SELECT Sculptures.title, Sculptures.year FROM Sculptures WHERE location != 'gallery 226'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.year < 1900
SELECT DISTINCT A.birthYear FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year > 1920
SELECT DISTINCT A.birthYear FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year > 1920
SELECT fname, lname FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT birthYear, deathYear, (deathYear - birthYear) AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MIN(deathYear - birthYear) FROM Artists)
SELECT deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MIN(deathYear - birthYear) FROM Artists)
SELECT A.fname, (A.deathYear - A.birthYear) AS age FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT A.fname, (A.deathYear - A.birthYear) AS age FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(paintingID) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(paintingID) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists))
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists))
SELECT P.title, P.year FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Mary'
SELECT P.title, P.year FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Mary'
SELECT width_mm FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE birthYear < 1850)
SELECT width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT P.location, P.medium FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Pablo'
SELECT DISTINCT location, medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT DISTINCT a.fname, a.lname FROM Artists a WHERE EXISTS (SELECT 1 FROM Paintings p WHERE p.painterID = a.artistID) AND EXISTS (SELECT 1 FROM Sculptures s WHERE s.sculptorID = a.artistID)
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID
SELECT DISTINCT a.fname, a.lname FROM Artists a WHERE a.artistID IN (SELECT painterID FROM Paintings WHERE medium = 'Oil') AND a.artistID IN (SELECT painterID FROM Paintings WHERE medium = 'Lithographic')
SELECT DISTINCT a.fname, a.lname FROM Artists a WHERE EXISTS (SELECT 1 FROM Paintings p WHERE p.painterID = a.artistID AND p.medium = 'oil') AND EXISTS (SELECT 1 FROM Paintings p WHERE p.painterID = a.artistID AND p.medium = 'lithographic')
SELECT a.birthYear FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.year = 1884 AND p.mediumOn = 'canvas'
SELECT a.birthYear FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.year = 1884
SELECT DISTINCT a.fname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.medium = 'oil' AND p.location = 'gallery 241'
SELECT fname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241')
SELECT medium, COUNT(*) FROM Paintings GROUP BY medium UNION ALL SELECT medium, COUNT(*) FROM Sculptures GROUP BY medium
SELECT Combined.medium, COUNT(*) AS Total FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) AS Combined GROUP BY Combined.medium
SELECT medium, AVG(height_mm) AS avg_height FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) AS AverageHeight FROM Paintings GROUP BY medium
SELECT location, COUNT(paintingID) AS NumberOfPaintings FROM Paintings WHERE year < 1900 GROUP BY location
SELECT COUNT(DISTINCT location) FROM Paintings WHERE year < 1900
SELECT title FROM Paintings WHERE year > 1910 AND medium = 'oil'
SELECT title FROM Paintings WHERE medium = 'oil' AND year > 1910
SELECT DISTINCT Paintings.painterID FROM Paintings WHERE Paintings.medium = 'oil' AND Paintings.location = 'gallery 240'
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location = 'gallery 240'
SELECT DISTINCT title FROM Paintings WHERE height_mm > ANY (SELECT height_mm FROM Paintings WHERE mediumOn = 'canvas')
SELECT DISTINCT title FROM Paintings WHERE height_mm > ANY (SELECT height_mm FROM Paintings WHERE medium = 'canvas')
SELECT DISTINCT p.paintingID FROM Paintings p WHERE EXISTS (SELECT 1 FROM Paintings p2 WHERE p2.location = 'gallery 240' AND p.year < p2.year)
SELECT DISTINCT paintingID FROM Paintings WHERE year < ANY (SELECT year FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT a.fname, a.lname FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.title LIKE '%female%'
SELECT a.fname || ' ' || a.lname AS full_name FROM Artists a JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.title LIKE '%female%'
SELECT DISTINCT title FROM Paintings ORDER BY title
SELECT DISTINCT title FROM Paintings ORDER BY title
SELECT DISTINCT title FROM Paintings ORDER BY LENGTH(title)
SELECT DISTINCT title FROM Paintings ORDER BY height_mm ASC
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT p.painterID FROM Paintings p WHERE p.year < 1900 GROUP BY p.painterID ORDER BY COUNT(p.paintingID) DESC LIMIT 1
SELECT p.painterID FROM Paintings p WHERE p.year < 1900 GROUP BY p.painterID ORDER BY COUNT(p.paintingID) DESC LIMIT 1
SELECT A.fname FROM Artists A JOIN (SELECT sculptorID, COUNT(*) AS num_sculptures FROM Sculptures GROUP BY sculptorID ORDER BY num_sculptures DESC LIMIT 1) S ON A.artistID = S.sculptorID
SELECT A.fname FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID GROUP BY S.sculptorID ORDER BY COUNT(S.sculptureID) DESC LIMIT 1
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800;
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800;
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT DISTINCT location FROM Paintings WHERE mediumOn IN ('on panel', 'on canvas')
SELECT DISTINCT location FROM Paintings p WHERE p.mediumOn IN ('panels', 'canvas')
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930 GROUP BY location HAVING MIN(year) < 1885 AND MAX(year) > 1930
SELECT DISTINCT location FROM Paintings WHERE year NOT BETWEEN 1885 AND 1930
SELECT AVG(height_mm) AS AverageHeight, AVG(width_mm) AS AverageWidth FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT p.paintingID, p.height_mm FROM Paintings p WHERE p.year < 1900 ORDER BY p.height_mm DESC LIMIT 1
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, max(height_mm) AS MaxHeight, max(width_mm) AS MaxWidth FROM Paintings GROUP BY year
SELECT year, max(height_mm) AS MaxHeight, max(width_mm) AS MaxWidth FROM Paintings GROUP BY year
SELECT a.fname || ' ' || a.lname AS artist_name, AVG(p.height_mm) AS avg_height, AVG(p.width_mm) AS avg_width FROM Artists a JOIN Paintings p ON a.artistID = p.painterID GROUP BY a.artistID ORDER BY a.lname, a.fname
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.fname, COUNT(*) AS num_paintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(*) >= 2
SELECT A.fname, COUNT(*) AS num_paintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(*) >= 2
SELECT A.deathYear FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P GROUP BY P.painterID HAVING COUNT(P.paintingID) <= 3)
SELECT A.deathYear FROM Artists A WHERE (SELECT COUNT(*) FROM Paintings P WHERE P.painterID = A.artistID) < 4
SELECT A.deathYear FROM Artists A INNER JOIN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1) AS S ON A.artistID = S.sculptorID
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM Sculptures GROUP BY sculptorID))
SELECT p.paintingID, p.height_mm FROM Paintings p WHERE p.location = 'gallery 240' ORDER BY p.width_mm DESC LIMIT 1
SELECT P.height_mm, P.paintingID FROM Paintings P WHERE P.width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = 'gallery 240') AND P.location = 'gallery 240'
SELECT p.paintingID FROM Paintings p WHERE NOT EXISTS (SELECT 1 FROM Paintings WHERE location = 'gallery 240' AND year <= p.year)
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE height_mm > ALL (SELECT height_mm FROM Paintings WHERE year > 1900)
SELECT P.paintingID FROM Paintings P WHERE P.height_mm > (SELECT MAX(P2.height_mm) FROM Paintings P2 WHERE P2.year > 1900)
SELECT A.fname, A.lname, COUNT(*) AS NumberOfPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY NumberOfPaintings DESC LIMIT 3
SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY COUNT(P.paintingID) DESC LIMIT 1
SELECT p.paintingID, p.location, p.title FROM Paintings p WHERE p.medium = 'oil' ORDER BY p.year
SELECT p.paintingID, p.location, p.title FROM Paintings p WHERE p.medium = 'oil' ORDER BY p.year ASC
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT Paintings.year, Paintings.location, Paintings.title FROM Paintings WHERE Paintings.height_mm > 1000 ORDER BY Paintings.title ASC
SELECT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P) AND A.artistID NOT IN (SELECT S.sculptorID FROM Sculptures S)
SELECT fname, lname FROM Artists WHERE EXISTS (SELECT 1 FROM Paintings WHERE painterID = Artists.artistID) AND NOT EXISTS (SELECT 1 FROM Sculptures WHERE sculptorID = Artists.artistID)
SELECT P.location FROM Paintings P WHERE P.year < 1885 AND NOT EXISTS (SELECT 1 FROM Paintings P2 WHERE P2.mediumOn = 'canvas' AND P2.location = P.location)
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas'
SELECT COUNT(*) AS TotalRaces FROM race
SELECT COUNT(*) FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT DISTINCT Winning_driver FROM race WHERE NOT Pole_Position = 'Junior Strous'
SELECT DISTINCT Winning_driver FROM race WHERE Pole_Position <> 'Junior Strous'
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver ORDER BY Age ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT MAX(Age), MIN(Age) FROM driver
SELECT MAX(Age), MIN(Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT d.Driver_Name, r.Race_Name FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID
SELECT d.Driver_Name, r.Race_Name FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID
SELECT d.Driver_Name, COUNT(r.Road) AS Races_Participated FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_Name
SELECT d.Driver_Name, COUNT(r.Road) AS Number_of_Races FROM driver d INNER JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID
SELECT Age FROM driver WHERE Driver_ID = (SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT d.Age FROM driver d JOIN (SELECT Driver_ID, COUNT(*) as num_races FROM race GROUP BY Driver_ID ORDER BY num_races DESC LIMIT 1) r ON d.Driver_ID = r.Driver_ID
SELECT d.Driver_Name, d.Age FROM driver d WHERE d.Driver_ID IN (SELECT r.Driver_ID FROM race r GROUP BY r.Driver_ID HAVING COUNT(r.Road) >= 2)
SELECT d.Driver_Name, d.Age FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_ID HAVING COUNT(r.Road) >= 2
SELECT Race_Name FROM race JOIN driver ON race.Driver_ID = driver.Driver_ID WHERE driver.Age >= 26
SELECT R.Race_Name FROM race R JOIN driver D ON R.Driver_ID = D.Driver_ID WHERE D.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT d.Driver_Name FROM driver d WHERE d.Constructor <> 'Bugatti'
SELECT d.Constructor, COUNT(DISTINCT d.Driver_ID) AS NumberOfDrivers FROM driver d GROUP BY d.Constructor
SELECT Constructor, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(Driver_ID) >= 2
SELECT d.Driver_Name FROM driver d LEFT JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Driver_ID IS NULL
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT r.Winning_team FROM race r GROUP BY r.Winning_team HAVING COUNT(r.Winning_team) > 1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT DISTINCT d.Driver_Name FROM driver d, race r WHERE d.Driver_ID = r.Driver_ID AND (r.Pole_Position = 'James Hinchcliffe' OR r.Pole_Position = 'Carl Skerlong') GROUP BY d.Driver_Name HAVING COUNT(DISTINCT r.Pole_Position) > 1
SELECT d.Driver_Name FROM driver d WHERE EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe') AND EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'Carl Skerlong')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT COUNT(*) AS total_languages FROM languages
SELECT COUNT(*) AS total_languages FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries
SELECT AVG(justice_score) FROM countries
SELECT max(health_score), min(health_score) FROM countries WHERE name != 'Norway'
SELECT MAX(health_score) AS HighestHealthScore, MIN(health_score) AS LowestHealthScore FROM countries WHERE name <> 'Norway'
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC;
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT c.name AS Country, l.name AS Language FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT countries.name, languages.name FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id
SELECT l.name, COUNT(o.country_id) AS num_countries FROM languages l JOIN official_languages o ON l.id = o.language_id GROUP BY l.name
SELECT languages.name, COUNT(DISTINCT official_languages.country_id) AS num_countries FROM languages JOIN official_languages ON languages.id = official_languages.language_id GROUP BY languages.name
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.id ORDER BY COUNT(ol.language_id) DESC LIMIT 1
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name HAVING COUNT(DISTINCT OL.country_id) >= 2
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(DISTINCT country_id) >= 2)
SELECT AVG(c.overall_score) FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id WHERE l.name = 'English'
SELECT AVG(c.overall_score) FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id WHERE l.name = 'English'
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.id ORDER BY COUNT(ol.language_id) DESC LIMIT 3
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id GROUP BY l.name ORDER BY COUNT(ol.country_id) DESC LIMIT 3
SELECT l.name, AVG(c.overall_score) AS avg_score FROM languages l JOIN official_languages ol ON l.id = ol.language_id JOIN countries c ON ol.country_id = c.id GROUP BY l.name ORDER BY avg_score DESC
SELECT l.name FROM languages l JOIN official_languages ol ON l.id = ol.language_id JOIN countries c ON ol.country_id = c.id GROUP BY l.name ORDER BY AVG(c.overall_score) DESC
SELECT name FROM countries WHERE id = (SELECT country_id FROM official_languages GROUP BY country_id ORDER BY COUNT(language_id) DESC LIMIT 1)
SELECT c.name FROM countries c JOIN official_languages ol ON c.id = ol.country_id GROUP BY c.name ORDER BY COUNT(ol.language_id) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score > 95)) AND id IN (SELECT language_id FROM official_languages WHERE country_id IN (SELECT id FROM countries WHERE overall_score < 90))
SELECT language.name FROM languages language WHERE EXISTS (SELECT 1 FROM official_languages ol JOIN countries c ON ol.country_id = c.id WHERE c.overall_score > 95 AND ol.language_id = language.id) AND EXISTS (SELECT 1 FROM official_languages ol JOIN countries c ON ol.country_id = c.id WHERE c.overall_score < 90 AND ol.language_id = language.id)
SELECT DISTINCT country, town_city FROM Addresses
SELECT country, town_city FROM Addresses
SELECT DISTINCT county_state_province FROM Addresses JOIN Properties ON Addresses.address_id = Properties.property_address_id
SELECT county_state_province FROM Addresses JOIN Properties ON Addresses.address_id = Properties.property_address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT f.feature_name, f.feature_description FROM Features AS f JOIN Property_Features AS pf ON f.feature_id = pf.feature_id GROUP BY pf.feature_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT feature_name, feature_description FROM Features WHERE feature_id = (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT MIN(room_count) AS MinimumRooms FROM Properties
SELECT MIN(room_count) FROM Properties
SELECT COUNT(property_id) FROM Properties WHERE parking_lots = '1' OR garage_yn = '1'
SELECT COUNT(property_id) FROM Properties WHERE garage_yn = '1' OR parking_lots = '1'
SELECT DISTINCT rac.age_category_description FROM Users u JOIN Ref_Age_Categories rac ON u.age_category_code = rac.age_category_code WHERE u.other_user_details LIKE '%Mother%'
SELECT R.age_category_description FROM Ref_Age_Categories R JOIN Users U ON R.age_category_code = U.age_category_code JOIN Ref_User_Categories UC ON U.user_category_code = UC.user_category_code WHERE UC.user_category_description LIKE '%Mother%'
SELECT U.first_name FROM Users U INNER JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1) AS P ON U.user_id = P.owner_user_id
SELECT U.first_name FROM Users U WHERE U.user_id = (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(property_id) DESC LIMIT 1)
SELECT AVG(p.room_count) FROM Properties p WHERE p.property_description LIKE '%garden%'
SELECT AVG(room_count) FROM Properties WHERE property_id IN (SELECT property_id FROM Property_Features WHERE feature_id IN (SELECT feature_id FROM Features WHERE feature_name LIKE '%garden%'))
SELECT DISTINCT a.town_city FROM Addresses a WHERE EXISTS (SELECT NULL FROM Properties p JOIN Property_Features pf ON p.property_id = pf.property_id WHERE pf.feature_name = 'swimming pool' AND p.property_address_id = a.address_id)
SELECT DISTINCT town_city FROM Addresses WHERE EXISTS (SELECT 1 FROM Properties p JOIN Property_Features pf ON p.property_id = pf.property_id WHERE Addresses.address_id = p.property_address_id AND pf.feature_name = 'swimming pool')
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT p.property_id, p.vendor_requested_price FROM Properties p ORDER BY p.vendor_requested_price ASC LIMIT 1
SELECT AVG(room_count) FROM Properties
SELECT AVG(room_count) FROM Properties
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT DISTINCT user_id, search_string FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT DISTINCT user_id, search_seq FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT MAX(search_datetime) AS MostRecentSearch FROM User_Searches
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT DISTINCT a.zip_postcode FROM Addresses a INNER JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) > 2)
SELECT DISTINCT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT U.user_id, U.user_category_code FROM Users U WHERE U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) = 1)
SELECT u.user_id, u.user_category_code FROM Users u INNER JOIN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) = 1) s ON u.user_id = s.user_id
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1))
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT u.age_category_code FROM Users u JOIN User_Searches us ON u.user_id = us.user_id ORDER BY us.search_datetime ASC LIMIT 1)
SELECT U.login_name FROM Users U INNER JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior Citizen' ORDER BY U.first_name ASC
SELECT U.login_name FROM Users U JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior Citizen' ORDER BY U.first_name
SELECT COUNT(search_seq) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = '1'
SELECT COUNT(*) FROM User_Searches INNER JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = '1'
SELECT Users.date_registered FROM Users WHERE Users.login_name = 'ratione'
SELECT Users.date_registered FROM Users WHERE Users.login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = '1'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = '1'
SELECT line_1_number_building AS Building, line_2_number_street AS Street, town_city AS City FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id JOIN Ref_User_Categories ON Users.user_category_code = Ref_User_Categories.user_category_code WHERE Ref_User_Categories.user_category_description = 'Senior Citizen'
SELECT a.line_1_number_building, a.line_2_number_street, a.town_city FROM Addresses a INNER JOIN Users u ON a.address_id = u.user_address_id WHERE u.age_category_code IN (SELECT age_category_code FROM Ref_Age_Categories WHERE age_category_description LIKE '%senior%')
SELECT COUNT(unique_properties.property_id) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2) AS unique_properties
SELECT COUNT(DISTINCT property_id) FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2
SELECT property_id, COUNT(photo_seq) AS photo_count FROM Property_Photos GROUP BY property_id
SELECT property_id, COUNT(*) AS photo_count FROM Property_Photos GROUP BY property_id
SELECT Users.user_id, COUNT(Property_Photos.photo_id) AS num_photos FROM Users INNER JOIN Properties ON Users.user_id = Properties.owner_user_id INNER JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Users.user_id
SELECT p.owner_user_id, COUNT(pp.photo_seq) AS photo_count FROM Properties p INNER JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.owner_user_id
SELECT SUM(Properties.price_max) FROM Properties INNER JOIN Users ON Properties.owner_user_id = Users.user_id INNER JOIN Ref_User_Categories ON Users.user_category_code = Ref_User_Categories.user_category_code WHERE Ref_User_Categories.user_category_description IN ('Single Mother', 'Student')
SELECT SUM(p.price_max) FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN ('single_mother', 'student')
SELECT User_Property_History.datestamp, Properties.property_name FROM User_Property_History INNER JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp ASC
SELECT User_Property_History.datestamp, Properties.property_name FROM User_Property_History INNER JOIN Properties ON User_Property_History.property_id = Properties.property_id ORDER BY User_Property_History.datestamp ASC
SELECT property_type_description, property_type_code FROM Ref_Property_Types JOIN (SELECT property_type_code, COUNT(*) AS count FROM Properties GROUP BY property_type_code ORDER BY COUNT(*) DESC LIMIT 1) AS MostCommon ON Ref_Property_Types.property_type_code = MostCommon.property_type_code
SELECT R.property_type_code, R.property_type_description FROM Ref_Property_Types R JOIN (SELECT property_type_code, COUNT(*) AS count FROM Properties GROUP BY property_type_code ORDER BY count DESC LIMIT 1) P ON R.property_type_code = P.property_type_code
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT Ref_Age_Categories.age_category_description FROM Ref_Age_Categories WHERE Ref_Age_Categories.age_category_code = 'Over 60'
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT country FROM Addresses JOIN Users ON Addresses.address_id = Users.user_address_id WHERE first_name = 'Robbie'
SELECT A.country FROM Addresses A JOIN Users U ON A.address_id = U.user_address_id WHERE U.first_name = 'Robbie'
SELECT U.first_name, U.middle_name, U.last_name FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id
SELECT CONCAT(u.first_name, ' ', u.last_name) AS full_name FROM Users u JOIN Properties p ON u.user_id = p.owner_user_id WHERE u.user_address_id = p.property_address_id
SELECT US.search_string FROM User_Searches AS US LEFT JOIN Properties AS P ON US.user_id = P.owner_user_id WHERE P.property_id IS NULL
SELECT US.search_string FROM User_Searches US LEFT JOIN Properties P ON US.user_id = P.owner_user_id WHERE P.property_id IS NULL
SELECT u.last_name, u.user_id FROM Users u WHERE (SELECT COUNT(*) FROM Properties p WHERE p.owner_user_id = u.user_id) >= 2 AND (SELECT COUNT(*) FROM User_Searches us WHERE us.user_id = u.user_id) <= 2
SELECT U.last_name, U.user_id FROM Users U JOIN User_Searches US ON U.user_id = US.user_id GROUP BY U.user_id HAVING COUNT(DISTINCT US.search_seq) <= 2 AND (SELECT COUNT(*) FROM Properties P WHERE P.owner_user_id = U.user_id) >= 2
SELECT COUNT(*) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight) AS MaximumWeight, MIN(weight) AS MinimumWeight FROM bike
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
SELECT name, result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015
SELECT bike.id, bike.product_name FROM bike INNER JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id GROUP BY bike.id HAVING COUNT(DISTINCT cyclists_own_bikes.cyclist_id) >= 4
SELECT id, name FROM cyclist WHERE id = (SELECT cyclist_id FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY COUNT(bike_id) DESC LIMIT 1)
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation IN ('Russia', 'Great Britain')
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(c.id) FROM cyclist c WHERE NOT EXISTS (SELECT 1 FROM cyclists_own_bikes cob WHERE cob.cyclist_id = c.id AND cob.purchase_year > 2015)
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.result < '4:21.558'
SELECT b.product_name, b.price FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY b.id HAVING COUNT(DISTINCT c.name) = 2
SELECT c.name, c.nation, c.result FROM cyclist c LEFT JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id WHERE cob.cyclist_id IS NULL
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT c.id, COUNT(cb.bike_id) AS bike_count FROM cyclist c LEFT JOIN cyclists_own_bikes cb ON c.id = cb.cyclist_id GROUP BY c.id ORDER BY c.id
SELECT g.Food, g.Flavor FROM goods g WHERE g.Food = 'cake' AND g.Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake')
SELECT Id, Flavor FROM goods WHERE Food = 'cake' AND Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake')
SELECT Flavor, Food FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
SELECT DISTINCT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT g.Food, COUNT(DISTINCT r.CustomerId) FROM goods g JOIN items i ON g.Id = i.Item JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food
SELECT g.Food, COUNT(DISTINCT r.CustomerId) AS CustomerCount FROM goods g INNER JOIN items i ON g.Id = i.Item INNER JOIN receipts r ON i.Receipt = r.ReceiptNumber GROUP BY g.Food
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'bakery' GROUP BY r.CustomerId HAVING COUNT(DISTINCT r.ReceiptNumber) >= 15
SELECT r.CustomerId FROM receipts r GROUP BY r.CustomerId HAVING COUNT(r.ReceiptNumber) >= 15
SELECT c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10
SELECT c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'Cake'
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'cake'
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Croissant'
SELECT Flavor FROM goods WHERE Food = 'croissant'
SELECT DISTINCT i.Item FROM items i JOIN receipts r ON i.Receipt = r.ReceiptNumber WHERE r.CustomerId = 15
SELECT DISTINCT goods.Id FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = 15
SELECT Food, AVG(Price) AS AveragePrice, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food
SELECT DISTINCT i1.Receipt FROM items i1 JOIN goods g1 ON i1.Item = g1.Id JOIN items i2 ON i1.Receipt = i2.Receipt JOIN goods g2 ON i2.Item = g2.Id WHERE g1.Food = 'Cake' AND g2.Food = 'Cookie'
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food IN ('cakes', 'cookies') GROUP BY r.ReceiptNumber HAVING COUNT(DISTINCT g.Food) = 2
SELECT r.ReceiptNumber FROM receipts r JOIN customers c ON r.CustomerId = c.Id JOIN items i ON i.Receipt = r.ReceiptNumber JOIN goods g ON g.Id = i.Item WHERE c.LastName = 'LOGAN' AND g.Food = 'Croissant'
SELECT r.ReceiptNumber FROM receipts r JOIN customers c ON r.CustomerId = c.Id JOIN items i ON i.Receipt = r.ReceiptNumber JOIN goods g ON i.Item = g.Id WHERE c.LastName = 'Logan' AND g.Food = 'croissant'
SELECT r.ReceiptNumber, r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price = (SELECT MAX(Price) FROM goods)
SELECT r.ReceiptNumber, r.Date FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id WHERE g.Price = (SELECT MAX(Price) FROM goods)
SELECT i.Item FROM items i GROUP BY i.Item ORDER BY COUNT(i.Item) ASC LIMIT 1
SELECT g.Id, g.Food FROM goods g JOIN items i ON g.Id = i.Item GROUP BY i.Item ORDER BY COUNT(*) ASC LIMIT 1
SELECT Food, COUNT(Id) AS NumberOfGoods FROM goods GROUP BY Food
SELECT Food, COUNT(Id) AS NumberOfGoods FROM goods GROUP BY Food
SELECT g.Food, AVG(g.Price) AS AveragePrice FROM goods g GROUP BY g.Food
SELECT Food, avg(Price) FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT DISTINCT Flavor FROM goods WHERE Food LIKE 'cake' AND Price > 10
SELECT DISTINCT Flavor FROM goods WHERE Food = 'cake' AND Price > 10
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g.Id FROM goods g WHERE EXISTS (SELECT 1 FROM goods g2 WHERE g2.Food = 'Tart' AND g.Price < g2.Price)
SELECT DISTINCT g.Id FROM goods g WHERE g.Price < (SELECT MIN(Price) FROM goods WHERE Food = 'Tart')
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT R.ReceiptNumber FROM receipts R JOIN items I ON R.ReceiptNumber = I.Receipt JOIN goods G ON I.Item = G.Id WHERE G.Price > 13
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 15
SELECT r.Date FROM receipts AS r JOIN items AS i ON r.ReceiptNumber = i.Receipt JOIN goods AS g ON i.Item = g.Id WHERE g.Price > 15
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT g.Flavor, g.Price FROM goods g WHERE g.Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT Id FROM goods ORDER BY Id ASC
SELECT DISTINCT Id FROM goods ORDER BY Id
SELECT r.ReceiptNumber FROM receipts r WHERE r.CustomerId = 12 OR r.ReceiptNumber IN (SELECT i.Receipt FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie')
SELECT r.ReceiptNumber FROM receipts r WHERE r.CustomerId = 12 OR EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE i.Receipt = r.ReceiptNumber AND g.Flavor = 'apple' AND g.Food = 'pie')
SELECT r.ReceiptNumber, r.Date FROM receipts r WHERE r.Date = (SELECT MAX(Date) FROM receipts)
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT * FROM receipts WHERE Date = (SELECT MIN(Date) FROM receipts) OR ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10))
SELECT r.ReceiptNumber FROM receipts r WHERE EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE i.Receipt = r.ReceiptNumber AND g.Price > 10) OR r.Date = (SELECT MIN(Date) FROM receipts)
SELECT Id FROM goods WHERE (Food = 'Cookie' OR Food = 'Cake') AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE (Food = 'Cookies' OR Food = 'Cakes') AND Price BETWEEN 3 AND 7
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId WHERE r.Date = (SELECT MIN(Date) FROM receipts)
SELECT c.FirstName || ' ' || c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId ORDER BY r.Date ASC LIMIT 1
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT Id FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT Flavor, MAX(Price) AS HighestPrice, MIN(Price) AS LowestPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT g.Flavor, MAX(g.Price) AS MaxPrice, MIN(g.Price) AS MinPrice, AVG(g.Price) AS AvgPrice FROM goods g GROUP BY g.Flavor ORDER BY g.Flavor
SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice FROM goods GROUP BY Food ORDER BY Food ASC
SELECT Food, MIN(Price) AS MinimumPrice, MAX(Price) AS MaximumPrice FROM goods GROUP BY Food ORDER BY Food ASC
SELECT r.Date FROM receipts r GROUP BY r.Date ORDER BY COUNT(r.ReceiptNumber) DESC LIMIT 3
SELECT r.Date FROM receipts r GROUP BY r.Date ORDER BY COUNT(r.ReceiptNumber) DESC LIMIT 3
SELECT CustomerId, COUNT(*) AS TimesShopped FROM receipts GROUP BY CustomerId ORDER BY TimesShopped DESC LIMIT 1
SELECT CustomerId, COUNT(*) AS NumberOfPurchases FROM receipts GROUP BY CustomerId ORDER BY NumberOfPurchases DESC LIMIT 1
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT DISTINCT customers.FirstName, customers.LastName FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id WHERE goods.Flavor = 'apple' AND goods.Food = 'Tart'
SELECT c.FirstName || ' ' || c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tarts'
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price < ALL (SELECT Price FROM goods WHERE Food = 'Croissant')
SELECT g.Id FROM goods g WHERE g.Food = 'cookies' AND g.Price < (SELECT MIN(Price) FROM goods WHERE Food = 'croissant')
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT g.Id FROM goods AS g WHERE g.Food = 'cake' AND g.Price >= (SELECT AVG(g2.Price) FROM goods AS g2 WHERE g2.Flavor = 'Tart')
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id, Flavor, Food FROM goods ORDER BY Price ASC
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT g.Id, g.Flavor FROM goods g WHERE g.Food = 'Cake' ORDER BY g.Flavor
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Flavor
SELECT goods.Id FROM goods WHERE Flavor = 'chocolate' AND goods.Id NOT IN (SELECT Item FROM items GROUP BY Item HAVING COUNT(Receipt) > 10)
SELECT DISTINCT g.Id FROM goods g, items i WHERE g.Id = i.Item AND g.Flavor = 'chocolate' GROUP BY g.Id HAVING COUNT(DISTINCT i.Receipt) <= 10
SELECT Flavor FROM goods WHERE Food = 'Cake' EXCEPT SELECT Flavor FROM goods WHERE Food = 'Tart'
SELECT DISTINCT g1.Flavor FROM goods g1 WHERE g1.Food = 'Cake' AND g1.Flavor NOT IN (SELECT g2.Flavor FROM goods g2 WHERE g2.Food = 'Tart')
SELECT g.Id FROM goods AS g INNER JOIN items AS i ON g.Id = i.Item GROUP BY g.Id ORDER BY COUNT(i.Item) DESC LIMIT 3
SELECT g.Id, g.Food, COUNT(*) AS TotalPurchased FROM items i JOIN goods g ON i.Item = g.Id GROUP BY i.Item ORDER BY TotalPurchased DESC LIMIT 3
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id HAVING SUM(g.Price) > 150
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY c.Id HAVING SUM(g.Price) > 150
SELECT r.CustomerId FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5
SELECT c.Id FROM customers c WHERE c.Id IN (SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5)
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT COUNT(Driver_ID) FROM driver
SELECT COUNT(Driver_ID) FROM driver
SELECT d.Make, COUNT(d.Driver_ID) FROM driver d WHERE d.Points > 150 GROUP BY d.Make
SELECT d.Make, COUNT(d.Driver_ID) AS NumberOfDrivers FROM driver d WHERE d.Points > 150 GROUP BY d.Make
SELECT Make, AVG(Age) FROM driver GROUP BY Make
SELECT d.Make, AVG(d.Age) AS Average_Age FROM driver d GROUP BY d.Make
SELECT AVG(d.Laps) FROM driver d WHERE d.Age < 20
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner ASC
SELECT t.Manager, t.Sponsor FROM team t ORDER BY t.Car_Owner
SELECT t.Make FROM team t GROUP BY t.Make HAVING COUNT(t.Team_ID) > 1
SELECT t.Make FROM team AS t GROUP BY t.Make HAVING COUNT(t.Team_ID) > 1
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) AS Maximum_Points, MIN(Points) AS Minimum_Points FROM driver
SELECT MAX(Points) AS HighestPoints, MIN(Points) AS LowestPoints FROM driver
SELECT COUNT(Driver_ID) FROM driver WHERE Points < 150
SELECT COUNT(Driver_ID) FROM driver WHERE Points < 150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT driver.Driver FROM driver ORDER BY driver.Age ASC
SELECT d.Driver FROM driver d ORDER BY d.Points DESC
SELECT Driver FROM driver ORDER BY Points DESC
SELECT d.Driver, c.Country FROM driver AS d JOIN country AS c ON d.Country = c.Country_Id
SELECT d.Driver, c.Country FROM driver d JOIN country c ON d.Country = c.Country_Id
SELECT MAX(d.Points) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Capital = 'Dublin'
SELECT MAX(d.Points) FROM driver AS d JOIN country AS c ON d.Country = c.Country_Id WHERE c.Capital = 'Dublin'
SELECT AVG(d.Age) FROM driver AS d JOIN country AS c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT AVG(d.Age) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT DISTINCT c.Country FROM country c JOIN driver d ON c.Country_Id = d.Country WHERE d.Points > 150
SELECT DISTINCT c.Country FROM country c JOIN driver d ON c.Country_Id = d.Country WHERE d.Points > 150
SELECT Capital FROM country WHERE Country_Id = (SELECT Country FROM driver d WHERE d.Points = (SELECT MAX(Points) FROM driver))
SELECT c.Capital FROM country c INNER JOIN driver d ON c.Country_Id = d.Country WHERE d.Points = (SELECT MAX(Points) FROM driver)
SELECT d.Make, COUNT(d.Driver_ID) AS NumberOfDrivers FROM driver AS d GROUP BY d.Make
SELECT Make, COUNT(*) FROM driver GROUP BY Make
SELECT d.Make FROM driver d GROUP BY d.Make ORDER BY COUNT(Driver_ID) DESC LIMIT 1
SELECT d.Make FROM driver d GROUP BY d.Make ORDER BY COUNT(d.Driver_ID) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT c.Country FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Make = 'Dodge') AND EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Make = 'Chevrolet')
SELECT DISTINCT c.Country FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Make = 'Dodge') AND EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Make = 'Chevrolet')
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT SUM(Points), AVG(Points) FROM driver
SELECT Country FROM country WHERE NOT EXISTS (SELECT 1 FROM driver WHERE driver.Country = country.Country_Id)
SELECT Country FROM country WHERE NOT EXISTS (SELECT 1 FROM driver WHERE driver.Country = country.Country_Id)
SELECT manager, sponsor FROM team WHERE Team_ID = (SELECT Team_ID FROM team_driver GROUP BY Team_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Manager, Sponsor FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM team_driver GROUP BY Team_ID))
SELECT manager, car_owner FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(DISTINCT Driver_ID) >= 2)
SELECT Manager, Car_Owner FROM team t INNER JOIN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) >= 2) AS sub ON t.Team_ID = sub.Team_ID
SELECT COUNT(Institution_ID) FROM institution
SELECT COUNT(Institution_ID) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT Name FROM institution ORDER BY Founded ASC
SELECT City, Province FROM institution
SELECT City, Province FROM institution
SELECT MAX(Enrollment) AS MaximumEnrollment, MIN(Enrollment) AS MinimumEnrollment FROM institution
SELECT MAX(Enrollment) AS MaximumEnrollment, MIN(Enrollment) AS MinimumEnrollment FROM institution
SELECT DISTINCT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT institution.Name, Championship.Nickname FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT i.Name, c.Nickname FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID
SELECT Nickname FROM Championship WHERE Institution_ID = (SELECT Institution_ID FROM institution ORDER BY Enrollment ASC LIMIT 1)
SELECT C.Nickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT Name FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID ORDER BY Championship.Number_of_Championships DESC
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY c.Number_of_Championships DESC
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship)
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship WHERE Number_of_Championships >= 1)
SELECT SUM(Number_of_Championships) FROM Championship JOIN institution ON Championship.Institution_ID = institution.Institution_ID WHERE institution.Affiliation = 'public'
SELECT SUM(c.Number_of_Championships) FROM Championship AS c JOIN institution AS i ON c.Institution_ID = i.Institution_ID WHERE i.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT i.Affiliation FROM institution i GROUP BY i.Affiliation ORDER BY COUNT(i.Affiliation) DESC LIMIT 1
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Founded FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT Founded, COUNT(*) AS Num_Institutions FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT c.Nickname FROM Championship c INNER JOIN institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC
SELECT C.Nickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID ORDER BY I.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City = 'Vancouver' OR City = 'Calgary'
SELECT DISTINCT Province FROM institution WHERE Founded < 1920 AND Province IN (SELECT Province FROM institution WHERE Founded > 1950)
SELECT DISTINCT i.Province FROM institution i WHERE i.Founded < 1920 AND i.Province IN (SELECT Province FROM institution WHERE Founded > 1950)
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York'
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT B.Warehouse, AVG(B.Value) AS AverageValue FROM Boxes B GROUP BY B.Warehouse
SELECT Warehouse, AVG(Value) AS AverageValue FROM Boxes GROUP BY Warehouse
SELECT AVG(Value) AS AverageBoxValue, SUM(Value) AS TotalBoxValue FROM Boxes
SELECT AVG(Value) AS AverageValue, SUM(Value) AS TotalValue FROM Boxes
SELECT AVG(Warehouses.Capacity) AS AverageCapacity, SUM(Warehouses.Capacity) AS TotalCapacity FROM Warehouses
SELECT AVG(Warehouses.Capacity) AS AverageCapacity, SUM(Warehouses.Capacity) AS TotalCapacity FROM Warehouses
SELECT Contents, AVG(Value), MAX(Value) FROM Boxes GROUP BY Contents
SELECT Contents, avg(Value) AS AverageValue, max(Value) AS MaxValue FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1
SELECT Contents FROM Boxes WHERE Value = (SELECT MAX(Value) FROM Boxes)
SELECT AVG(Value) FROM Boxes
SELECT AVG(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT b.Code FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location = 'Chicago' OR w.Location = 'New York'
SELECT Code FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT SUM(b.Value) FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location IN ('Chicago', 'New York')
SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location IN ('Chicago', 'New York'))
SELECT DISTINCT B.Contents FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York') GROUP BY B.Contents HAVING COUNT(DISTINCT W.Location) = 2
SELECT DISTINCT Contents FROM Boxes EXCEPT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT Contents FROM Boxes EXCEPT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT w.Location FROM Warehouses w WHERE EXISTS (SELECT 1 FROM Boxes b WHERE b.Warehouse = w.Code AND b.Contents = 'Rocks') AND NOT EXISTS (SELECT 1 FROM Boxes b WHERE b.Warehouse = w.Code AND b.Contents = 'Scissors')
SELECT W.Location FROM Warehouses W WHERE EXISTS (SELECT 1 FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents = 'Rocks') AND NOT EXISTS (SELECT 1 FROM Boxes B WHERE B.Warehouse = W.Code AND B.Contents = 'Scissors')
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' INTERSECT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' INTERSECT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Boxes.Code, Boxes.Contents FROM Boxes ORDER BY Boxes.Value ASC
SELECT Boxes.Code, Boxes.Contents FROM Boxes ORDER BY Boxes.Value
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT b.Code FROM Boxes b WHERE b.Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Rocks')
SELECT b.Code FROM Boxes b WHERE b.Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Rocks')
SELECT b.Code, b.Contents FROM Boxes b WHERE b.Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT Code, Contents FROM Boxes WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT SUM(b.Value) FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT SUM(b.Value) FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT b.Warehouse, AVG(b.Value) AS AvgValue FROM Boxes b GROUP BY b.Warehouse HAVING AVG(b.Value) > 150
SELECT w.Code, AVG(b.Value) AS AvgValue FROM Warehouses w JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code HAVING AVG(b.Value) > 150
SELECT Contents AS ContentType, COUNT(Code) AS BoxCount, SUM(Value) AS TotalValue FROM Boxes GROUP BY Contents
SELECT b.Contents, SUM(b.Value) AS TotalValue, COUNT(b.Code) AS NumberOfBoxes FROM Boxes b GROUP BY b.Contents
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaximumCapacity FROM Warehouses GROUP BY Location
SELECT SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT W.Location, MAX(B.Value) FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT W.Location, MAX(B.Value) FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT w.Code, COUNT(b.Code) AS BoxCount FROM Warehouses w INNER JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT Warehouse, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Warehouse
SELECT COUNT(DISTINCT Location) FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks')
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents = 'Rocks'
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'
SELECT b.Warehouse, COUNT(b.Code) AS Box_Count FROM Boxes b GROUP BY b.Warehouse
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT b.Warehouse, COUNT(DISTINCT b.Contents) AS TypesOfContents FROM Boxes b GROUP BY b.Warehouse
SELECT b.Warehouse, COUNT(DISTINCT b.Contents) AS Types_of_Contents FROM Boxes b GROUP BY b.Warehouse
SELECT W.Code FROM Warehouses W JOIN (SELECT Warehouse, COUNT(*) AS BoxCount FROM Boxes GROUP BY Warehouse) AS B ON W.Code = B.Warehouse WHERE B.BoxCount > W.Capacity
SELECT Code FROM Warehouses WHERE (SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code) > Capacity
SELECT SUM(b.Value) FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code WHERE w.Location <> 'Chicago'
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location <> 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT u.Team_Name FROM university u WHERE u.Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(University_ID) FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(University_ID) FROM university GROUP BY Home_Conference
SELECT u.State FROM university u GROUP BY u.State ORDER BY COUNT(u.University_ID) DESC LIMIT 1
SELECT u.State FROM university u GROUP BY u.State ORDER BY COUNT(u.University_ID) DESC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT u.Home_Conference FROM university u GROUP BY u.Home_Conference HAVING AVG(u.Enrollment) > 2000
SELECT Home_Conference FROM (SELECT Home_Conference, SUM(Enrollment) AS Total_Enrollment FROM university GROUP BY Home_Conference) AS Enrollment_Sum ORDER BY Enrollment_Sum.Total_Enrollment ASC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) T)
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT m.Major_Name, mr.Rank FROM major m JOIN major_ranking mr ON m.Major_ID = mr.Major_ID JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT mr.Rank, m.Major_Name FROM major_ranking mr INNER JOIN major m ON mr.Major_ID = m.Major_ID INNER JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT u.University_Name, u.City, u.State FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank = 1
SELECT u.University_Name, u.City, u.State FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank = 1
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID WHERE mr.Rank = 1 GROUP BY u.University_ID ORDER BY COUNT(mr.Major_ID) DESC LIMIT 1
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID WHERE mr.Rank = 1 GROUP BY u.University_ID ORDER BY COUNT(mr.Major_ID) DESC LIMIT 1
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT u.University_Name FROM university u WHERE NOT EXISTS (SELECT 1 FROM major_ranking mr WHERE mr.University_ID = u.University_ID AND mr.Rank = 1)
SELECT u.University_Name FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.University_ID = u.University_ID) AND EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Urban Education' AND mr.University_ID = u.University_ID)
SELECT DISTINCT u.University_Name FROM university u WHERE EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.University_ID = u.University_ID) AND EXISTS (SELECT 1 FROM major_ranking mr JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Urban Education' AND mr.University_ID = u.University_ID)
SELECT U.University_Name, O.Rank FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE U.State = 'Wisconsin'
SELECT U.University_Name, O.Rank FROM university U INNER JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE U.State = 'Wisconsin'
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Research_point = (SELECT MAX(Research_point) FROM overall_ranking)
SELECT u.University_Name FROM university u JOIN overall_ranking r ON u.University_ID = r.University_ID ORDER BY r.Research_point DESC LIMIT 1
SELECT u.University_Name FROM university u INNER JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point ASC
SELECT u.University_Name FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID ORDER BY o.Reputation_point ASC
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank <= 3
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name = 'Accounting' AND mr.Rank <= 3
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Rank <= 5
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking r ON u.University_ID = r.University_ID WHERE r.Rank <= 5
SELECT u.University_Name, o.Citation_point FROM university u INNER JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Reputation_point >= 3 ORDER BY o.Reputation_point DESC
SELECT university.University_Name, overall_ranking.Citation_point FROM university INNER JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point DESC LIMIT 3
SELECT u.State FROM university u WHERE u.Enrollment < 3000 GROUP BY u.State HAVING COUNT(u.University_ID) > 2
SELECT u.State FROM university u WHERE u.Enrollment < 3000 GROUP BY u.State HAVING COUNT(u.University_ID) > 2
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name = 'Odeon'
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name = 'Odeon'
SELECT M.Title, T.Name FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie
SELECT M.Title, T.Name FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie
SELECT count(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(Code) FROM Movies WHERE Rating = 'G'
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT MovieTheaters.Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Name) FROM MovieTheaters
SELECT COUNT(*) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Name FROM MovieTheaters WHERE Movie IN (SELECT Code FROM Movies WHERE Rating IN ('G', 'PG'))
SELECT mt.Name FROM MovieTheaters mt JOIN Movies m ON mt.Movie = m.Code WHERE m.Rating = 'G' OR m.Rating = 'PG'
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial'))
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name IN ('Odeon', 'Imperial'))
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial') GROUP BY M.Title HAVING COUNT(DISTINCT MT.Name) = 2
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name = 'Odeon' OR MT.Name = 'Imperial' GROUP BY M.Title HAVING COUNT(DISTINCT MT.Name) = 2
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT M.Title FROM Movies M WHERE NOT EXISTS (SELECT 1 FROM MovieTheaters MT WHERE MT.Movie = M.Code AND MT.Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Title
SELECT Title FROM Movies ORDER BY Rating
SELECT Title FROM Movies ORDER BY Rating
SELECT MT.Name FROM MovieTheaters MT INNER JOIN (SELECT Movie, COUNT(*) AS Cnt FROM MovieTheaters GROUP BY Movie ORDER BY Cnt DESC LIMIT 1) AS SubQ ON MT.Movie = SubQ.Movie
SELECT Name FROM MovieTheaters MT JOIN (SELECT Movie, COUNT(*) AS Cnt FROM MovieTheaters GROUP BY Movie) AS Sub ON MT.Movie = Sub.Movie ORDER BY Sub.Cnt DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie GROUP BY M.Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie GROUP BY M.Title ORDER BY COUNT(*) DESC LIMIT 1
SELECT Rating, COUNT(*) AS NumberOfMovies FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT count(*) FROM Movies WHERE Rating IS NOT NULL
SELECT count(*) FROM Movies WHERE Rating IS NOT NULL
SELECT MT.Name FROM MovieTheaters MT INNER JOIN Movies M ON MT.Movie = M.Code
SELECT mt.Name FROM MovieTheaters mt JOIN Movies m ON mt.Movie = m.Code
SELECT Name FROM MovieTheaters LEFT JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Code IS NULL
SELECT Name FROM MovieTheaters WHERE Movie NOT IN (SELECT Code FROM Movies)
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT Title FROM Movies
SELECT Title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating IS NULL
SELECT * FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT C.Name FROM Client C INNER JOIN Package P ON C.AccountNumber = P.Recipient ORDER BY P.Weight DESC LIMIT 1
SELECT c.Name FROM Client c JOIN Package p ON c.AccountNumber = p.Recipient WHERE p.Weight = (SELECT MAX(Weight) FROM Package)
SELECT SUM(P.Weight) FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT SUM(Package.Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT AVG(Salary) AS AverageSalary FROM Employee WHERE Position = 'intern'
SELECT AVG(Salary) AS AverageSalary FROM Employee WHERE Position = 'intern'
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'Physician'
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Position = 'physician'
SELECT P.PackageNumber FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT * FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT DISTINCT PackageNumber FROM Package WHERE Sender = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient = (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT count(*) FROM Package JOIN Client AS Sender ON Package.Sender = Sender.AccountNumber JOIN Client AS Recipient ON Package.Recipient = Recipient.AccountNumber WHERE Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client AS Sender ON Package.Sender = Sender.AccountNumber JOIN Client AS Recipient ON Package.Recipient = Recipient.AccountNumber WHERE Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT P.Contents FROM Package P INNER JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'John Zoidfarb'
SELECT P.Contents FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'John Zoidfarb'
SELECT p.PackageNumber, p.Weight FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name LIKE '%John%' ORDER BY p.Weight DESC LIMIT 1
SELECT p.PackageNumber, p.Weight FROM Package p JOIN Client c ON p.Sender = c.AccountNumber WHERE c.Name LIKE 'John%' ORDER BY p.Weight DESC LIMIT 1
SELECT p.PackageNumber, p.Weight FROM Package p ORDER BY p.Weight ASC LIMIT 3
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT C.Name, COUNT(P.PackageNumber) AS TotalPackages FROM Client C INNER JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber ORDER BY TotalPackages DESC LIMIT 1;
SELECT C.Name, COUNT(*) AS TotalPackages FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber ORDER BY TotalPackages DESC LIMIT 1
SELECT C.Name, COUNT(P.Recipient) AS PackageCount FROM Client C LEFT JOIN Package P ON C.AccountNumber = P.Recipient GROUP BY C.AccountNumber ORDER BY PackageCount ASC LIMIT 1
SELECT C.Name, MIN(PkgCount) FROM Client C JOIN (SELECT Recipient, COUNT(*) AS PkgCount FROM Package GROUP BY Recipient) AS PackageInfo ON C.AccountNumber = PackageInfo.Recipient
SELECT C.Name FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber HAVING COUNT(*) > 1
SELECT C.Name FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber HAVING COUNT(*) > 1
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry'
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J Fry'
SELECT Date FROM Shipment;
SELECT Date FROM Shipment
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars';
SELECT s.ShipmentID FROM Shipment s JOIN Employee e ON s.Manager = e.EmployeeID JOIN Planet p ON s.Planet = p.PlanetID WHERE e.Name = 'Turanga Leela' AND p.Name = 'Mars'
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Employee.Name = 'Turanga Leela' AND Planet.Name = 'Mars'
SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars') OR Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Turanga Leela')
SELECT s.ShipmentID FROM Shipment s JOIN Employee e ON s.Manager = e.EmployeeID JOIN Planet p ON s.Planet = p.PlanetID WHERE e.Name = 'Turanga Leela' AND p.Name = 'Mars'
SELECT P.Name, COUNT(S.ShipmentID) AS TotalShipments FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.PlanetID, P.Name
SELECT Planet.Name, COUNT(Shipment.ShipmentID) AS NumberOfShipments FROM Planet INNER JOIN Shipment ON Planet.PlanetID = Shipment.Planet GROUP BY Planet.PlanetID
SELECT Name FROM Planet WHERE PlanetID = (SELECT Planet FROM Shipment GROUP BY Planet ORDER BY COUNT(ShipmentID) DESC LIMIT 1)
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.PlanetID ORDER BY COUNT(*) DESC LIMIT 1
SELECT e.Name, COUNT(s.ShipmentID) AS NumberOfShipments FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.EmployeeID
SELECT e.Name, COUNT(s.ShipmentID) AS NumberOfShipments FROM Employee e JOIN Shipment s ON e.EmployeeID = s.Manager GROUP BY e.EmployeeID, e.Name
SELECT sum(P.Weight) FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT SUM(Package.Weight) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Planet.Name, SUM(Package.Weight) FROM Planet JOIN Shipment ON Planet.PlanetID = Shipment.Planet JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name
SELECT P.Name, SUM(Pa.Weight) FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package Pa ON S.ShipmentID = Pa.Shipment GROUP BY P.Name
SELECT Name FROM Planet WHERE PlanetID IN (SELECT S.Planet FROM Shipment S JOIN Package PK ON S.ShipmentID = PK.Shipment GROUP BY S.Planet HAVING SUM(PK.Weight) > 30)
SELECT p.Name FROM Planet p JOIN Shipment s ON p.PlanetID = s.Planet JOIN Package pk ON s.ShipmentID = pk.Shipment GROUP BY p.PlanetID HAVING SUM(pk.Weight) > 30
SELECT p.PackageNumber FROM Package p JOIN Shipment s ON p.Shipment = s.ShipmentID JOIN Planet pl ON s.Planet = pl.PlanetID JOIN Client c ON p.Sender = c.AccountNumber WHERE pl.Name = 'Omicron Persei 8' AND c.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Client ON Package.Sender = Client.AccountNumber JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT PackageNumber FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8')) OR Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Zapp Brannigan')
SELECT COUNT(*) FROM Package WHERE Shipment IN (SELECT ShipmentID FROM Shipment WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Omicron Persei 8') OR Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Zapp Brannigan'))
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT e.Name FROM Employee e WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE hc.Employee = e.EmployeeID AND p.Name = 'Mars')
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT e.Name FROM Employee e JOIN Has_Clearance hc ON e.EmployeeID = hc.Employee JOIN Planet p ON hc.Planet = p.PlanetID WHERE p.Name = 'Omega III'
SELECT E.Name FROM Employee E JOIN Has_Clearance H ON E.EmployeeID = H.Employee WHERE H.Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Omega III')
SELECT P.Name FROM Planet P JOIN Has_Clearance H ON P.PlanetID = H.Planet GROUP BY P.PlanetID HAVING COUNT(DISTINCT H.Employee) = 1
SELECT P.Name FROM Planet P JOIN Has_Clearance H ON P.PlanetID = H.Planet GROUP BY P.PlanetID HAVING COUNT(DISTINCT H.Employee) = 1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT COUNT(*) FROM Employee e WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE p.Name = 'Mars' AND hc.Employee = e.EmployeeID)
SELECT COUNT(*) FROM Employee e WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance hc JOIN Planet p ON hc.Planet = p.PlanetID WHERE hc.Employee = e.EmployeeID AND p.Name = 'Mars')
SELECT COUNT(Game_ID) FROM game
SELECT count(*) FROM game
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers <> 'Nintendo'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT MAX(Rank_of_the_year) AS MaxRank, MIN(Rank_of_the_year) AS MinRank FROM player
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(Player_ID) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT p.Player_name, p.Rank_of_the_year FROM player p JOIN game_player gp ON p.Player_ID = gp.Player_ID JOIN game g ON gp.Game_ID = g.Game_ID WHERE g.Title = 'Super Mario World'
SELECT p.Player_name, p.Rank_of_the_year FROM player p JOIN game_player gp ON p.Player_ID = gp.Player_ID JOIN game g ON gp.Game_ID = g.Game_ID WHERE g.Title = 'Super Mario World'
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn'
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn'
SELECT AVG(g.Units_sold_Millions) FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT AVG(g.Units_sold_Millions) FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard'
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT g.Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district IN ('Asia', 'USA')
SELECT g.Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district IN ('Asia', 'USA')
SELECT g.Franchise, COUNT(g.Game_ID) AS NumberOfGames FROM game g GROUP BY g.Franchise
SELECT g.Franchise, COUNT(g.Game_ID) FROM game g GROUP BY g.Franchise
SELECT g.Franchise FROM game g GROUP BY g.Franchise ORDER BY COUNT(g.Game_ID) DESC LIMIT 1
SELECT g.Franchise FROM game g GROUP BY g.Franchise ORDER BY COUNT(g.Game_ID) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT p.Player_name FROM player p LEFT JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Player_ID IS NULL
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT g.Title FROM game AS g WHERE EXISTS (SELECT 1 FROM game_player AS gp JOIN player AS p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.College = 'Oklahoma') AND EXISTS (SELECT 1 FROM game_player AS gp JOIN player AS p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.College = 'Auburn')
SELECT DISTINCT g.Title FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Oklahoma' OR p.College = 'Auburn'
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT g.Title FROM game g WHERE NOT EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.Position = 'Guard')
SELECT g.Title FROM game g WHERE NOT EXISTS (SELECT * FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.Position = 'Guard')
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT AVG(Year_Profits_billion) AS Average_Yearly_Profit, MAX(Year_Profits_billion) AS Maximum_Yearly_Profit FROM press
SELECT Press_ID, AVG(Year_Profits_billion) AS AvgProfit, MAX(Year_Profits_billion) AS MaxProfit FROM press GROUP BY Press_ID
SELECT p.Name FROM press p WHERE p.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT COUNT(Author_ID) FROM author WHERE Age < 30
SELECT count(Author_ID) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, COUNT(Author_ID) FROM author WHERE Age > 30 GROUP BY Gender
SELECT a.Gender, COUNT(a.Author_ID) FROM author a WHERE a.Age > 30 GROUP BY a.Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(Book_ID) AS NumberOfBooks FROM book GROUP BY Book_Series
SELECT b.Book_Series, COUNT(b.Book_ID) AS TotalBooks FROM book b GROUP BY b.Book_Series
SELECT book.Title, book.Release_date FROM book ORDER BY book.Sale_Amount DESC LIMIT 5
SELECT b.Title, b.Release_date FROM book b ORDER BY b.Sale_Amount DESC LIMIT 5
SELECT DISTINCT b.Book_Series FROM book b WHERE EXISTS (SELECT 1 FROM book WHERE Book_Series = b.Book_Series AND Sale_Amount > 1000) AND EXISTS (SELECT 1 FROM book WHERE Book_Series = b.Book_Series AND Sale_Amount < 500)
SELECT Book_Series FROM book GROUP BY Book_Series HAVING MAX(Sale_Amount) > 1000 AND MIN(Sale_Amount) < 500
SELECT DISTINCT author.Name FROM author INNER JOIN book ON author.Author_ID = book.Author_ID WHERE book.Book_Series IN ('MM', 'LT') GROUP BY author.Author_ID HAVING COUNT(DISTINCT book.Book_Series) = 2
SELECT a.Name FROM author a WHERE a.Author_ID IN (SELECT b.Author_ID FROM book b WHERE b.Book_Series = 'MM') AND a.Author_ID IN (SELECT b.Author_ID FROM book b WHERE b.Book_Series = 'LT')
SELECT author.Name, author.Age FROM author LEFT JOIN book ON author.Author_ID = book.Author_ID WHERE book.Book_ID IS NULL
SELECT a.Name FROM author a LEFT JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Book_ID IS NULL
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT b.Title, a.Name, p.Name FROM book b JOIN author a ON b.Author_ID = a.Author_ID JOIN press p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT b.Title, a.Name AS AuthorName, p.Name AS PressName FROM book b JOIN author a ON b.Author_ID = a.Author_ID JOIN press p ON b.Press_ID = p.Press_ID ORDER BY b.Sale_Amount DESC LIMIT 3
SELECT p.Name, SUM(b.Sale_Amount) AS Total_Sales FROM press p INNER JOIN book b ON p.Press_ID = b.Press_ID GROUP BY p.Press_ID
SELECT p.Name, SUM(b.Sale_Amount) FROM press p JOIN book b ON p.Press_ID = b.Press_ID GROUP BY p.Name
SELECT p.Name, COUNT(b.Book_ID) AS NumberOfBooks FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE b.Sale_Amount > 1000 GROUP BY p.Press_ID
SELECT press.Name, COUNT(book.Book_ID) FROM press INNER JOIN book ON press.Press_ID = book.Press_ID WHERE book.Sale_Amount > 1000 GROUP BY press.Press_ID
SELECT Name FROM author WHERE Author_ID = (SELECT Author_ID FROM book ORDER BY Sale_Amount DESC LIMIT 1)
SELECT Name FROM author WHERE Author_ID = (SELECT Author_ID FROM book WHERE Sale_Amount = (SELECT MAX(Sale_Amount) FROM book))
SELECT Name, Gender FROM author WHERE Author_ID = (SELECT Author_ID FROM book GROUP BY Author_ID ORDER BY COUNT(Book_ID) DESC LIMIT 1)
SELECT Name, Gender FROM author WHERE Author_ID = (SELECT Author_ID FROM book GROUP BY Author_ID ORDER BY COUNT(Book_ID) DESC LIMIT 1)
SELECT a.Name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor' AND b.Author_ID = a.Author_ID)
SELECT a.Name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor' AND b.Author_ID = a.Author_ID)
SELECT p.Name, p.Year_Profits_billion FROM press p INNER JOIN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(*) > 2) AS sub ON p.Press_ID = sub.Press_ID
SELECT Name, Year_Profits_billion FROM press WHERE Press_ID IN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(Book_ID) > 2)
SELECT COUNT(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT count(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil'
SELECT COUNT(document_id) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings'
SELECT a.author_name, a.other_details FROM Authors a JOIN Documents d ON a.author_name = d.author_name WHERE d.document_name = 'Travel to China'
SELECT Authors.author_name, COUNT(Documents.document_id) FROM Authors JOIN Documents ON Authors.author_name = Documents.author_name GROUP BY Authors.author_name
SELECT a.author_name FROM Authors a JOIN Documents d ON a.author_name = d.author_name GROUP BY a.author_name ORDER BY COUNT(d.document_id) DESC LIMIT 1
SELECT a.author_name FROM Authors a JOIN Documents d ON a.author_name = d.author_name GROUP BY a.author_name HAVING COUNT(d.document_id) >= 2
SELECT COUNT(process_id) FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9)
SELECT count(*) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working'
SELECT COUNT(process_status_code) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(staff_id) FROM Staff
SELECT staff_id, staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT COUNT(staff_role_code) FROM Ref_Staff_Roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT COUNT(DISTINCT document_id) FROM Documents_Processes
SELECT DISTINCT process_id FROM Documents_Processes
SELECT d.document_id FROM Documents d LEFT JOIN Documents_Processes dp ON d.document_id = dp.document_id WHERE dp.document_id IS NULL
SELECT bp.process_id FROM Business_Processes bp LEFT JOIN Documents_Processes dp ON bp.process_id = dp.process_id WHERE dp.document_id IS NULL
SELECT P.process_outcome_description, S.process_status_description FROM Documents_Processes AS DP INNER JOIN Process_Outcomes AS P ON DP.process_outcome_code = P.process_outcome_code INNER JOIN Process_Status AS S ON DP.process_status_code = S.process_status_code WHERE DP.document_id = 0
SELECT BP.process_name FROM Business_Processes BP JOIN Documents_Processes DP ON BP.process_id = DP.process_id JOIN Documents D ON DP.document_id = D.document_id WHERE D.document_name = 'Travel to Brazil'
SELECT dp.process_id, COUNT(dp.document_id) AS DocumentCount FROM Documents_Processes dp GROUP BY dp.process_id
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9
SELECT S.staff_id, COUNT(*) AS process_count FROM Staff_in_Processes S GROUP BY S.staff_id
SELECT sr.staff_role_code, COUNT(DISTINCT sip.document_id, sip.process_id) FROM Staff_in_Processes sip, Ref_Staff_Roles sr WHERE sip.staff_role_code = sr.staff_role_code GROUP BY sr.staff_role_code
SELECT COUNT(DISTINCT staff_role_code) FROM Staff_in_Processes WHERE staff_id = 3
SELECT COUNT(agency_id) FROM Agencies
SELECT COUNT(agency_id) FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT COUNT(*) AS NumberOfClients FROM Clients
SELECT count(*) FROM Clients
SELECT client_id, client_details FROM Clients
SELECT client_id, client_details FROM Clients
SELECT Agencies.agency_id, COUNT(Clients.client_id) AS number_of_clients FROM Agencies LEFT JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id
SELECT agency_id, COUNT(client_id) FROM Clients GROUP BY agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A INNER JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id ORDER BY COUNT(C.client_id) DESC LIMIT 1
SELECT agency_id, agency_details FROM Agencies WHERE agency_id = (SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(client_id) >= 2)
SELECT A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details = 'Mac'
SELECT A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT C.client_details, A.agency_details FROM Clients C JOIN Agencies A ON C.agency_id = A.agency_id
SELECT Clients.client_details, Agencies.agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT Clients.sic_code, COUNT(Clients.client_id) AS NumberOfClients FROM Clients GROUP BY Clients.sic_code
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT DISTINCT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id
SELECT DISTINCT Agencies.agency_id, Agencies.agency_details FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id
SELECT a.agency_id FROM Agencies a LEFT JOIN Clients c ON a.agency_id = c.agency_id WHERE c.client_id IS NULL
SELECT a.agency_id FROM Agencies a LEFT JOIN Clients c ON a.agency_id = c.agency_id WHERE c.client_id IS NULL
SELECT count(*) FROM Invoices
SELECT COUNT(*) FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT Clients.client_id, COUNT(*) FROM Clients LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
SELECT client_id, COUNT(invoice_id) FROM Invoices GROUP BY client_id
SELECT C.client_id, C.client_details FROM Clients C JOIN Invoices I ON C.client_id = I.client_id GROUP BY C.client_id ORDER BY COUNT(I.invoice_id) DESC LIMIT 1
SELECT Clients.client_id, Clients.client_details FROM Clients INNER JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id ORDER BY COUNT(Invoices.invoice_id) DESC LIMIT 1
SELECT I.client_id FROM Invoices I GROUP BY I.client_id HAVING COUNT(I.invoice_id) >= 2
SELECT i.client_id FROM Invoices i GROUP BY i.client_id HAVING COUNT(i.invoice_id) >= 2
SELECT invoice_status, COUNT(invoice_id) AS NumberOfInvoices FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT i.invoice_status FROM Invoices i GROUP BY i.invoice_status ORDER BY COUNT(i.invoice_id) DESC LIMIT 1
SELECT I.invoice_status FROM Invoices I GROUP BY I.invoice_status ORDER BY COUNT(I.invoice_id) DESC LIMIT 1
SELECT I.invoice_status, I.invoice_details, C.client_id, C.client_details, A.agency_id, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
SELECT i.invoice_status, i.invoice_details, c.client_id, c.client_details, a.agency_id, a.agency_details FROM Invoices i JOIN Clients c ON i.client_id = c.client_id JOIN Agencies a ON c.agency_id = a.agency_id
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT DISTINCT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE invoice_status = 'Working'
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE invoice_status = 'Working'
SELECT i.invoice_id, i.invoice_status FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id WHERE p.payment_id IS NULL
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT count(*) FROM Payments
SELECT COUNT(*) AS total_payments FROM Payments
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT DISTINCT invoice_id, invoice_status FROM Invoices
SELECT DISTINCT invoice_id, invoice_status FROM Invoices JOIN Payments ON Invoices.invoice_id = Payments.invoice_id
SELECT i.invoice_id, COUNT(p.payment_id) AS payment_count FROM Invoices i LEFT JOIN Payments p ON i.invoice_id = p.invoice_id GROUP BY i.invoice_id
SELECT invoice_id, COUNT(payment_id) AS payment_count FROM Payments GROUP BY invoice_id
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices AS I WHERE I.invoice_id = (SELECT invoice_id FROM Payments GROUP BY invoice_id ORDER BY COUNT(payment_id) DESC LIMIT 1)
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I JOIN (SELECT invoice_id, COUNT(*) AS num_payments FROM Payments GROUP BY invoice_id ORDER BY num_payments DESC LIMIT 1) AS P ON I.invoice_id = P.invoice_id
SELECT COUNT(staff_id) FROM Staff
SELECT COUNT(staff_id) FROM Staff
SELECT s.agency_id, COUNT(s.staff_id) AS staff_count FROM Staff s GROUP BY s.agency_id
SELECT Agencies.agency_id, COUNT(Staff.staff_id) FROM Agencies LEFT JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id
SELECT agency_id, agency_details FROM Agencies WHERE agency_id = (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(staff_id) DESC LIMIT 1)
SELECT agency_id, agency_details FROM Agencies WHERE agency_id = (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT meeting_outcome, COUNT(meeting_id) AS MeetingCount FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(meeting_id) AS TotalMeetings FROM Meetings GROUP BY meeting_outcome
SELECT client_id, COUNT(meeting_id) AS number_of_meetings FROM Meetings GROUP BY client_id
SELECT client_id, COUNT(meeting_id) AS total_meetings FROM Meetings GROUP BY client_id
SELECT M.meeting_type, M.client_id, COUNT(M.meeting_id) AS NumMeetings FROM Meetings M GROUP BY M.meeting_type, M.client_id
SELECT meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type
SELECT M.meeting_id, M.meeting_outcome, M.meeting_type, C.client_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id
SELECT M.meeting_id, M.meeting_outcome, M.meeting_type, C.client_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id
SELECT meeting_id, COUNT(staff_id) AS number_of_staff FROM Staff_in_Meetings GROUP BY meeting_id
SELECT meeting_id, COUNT(staff_id) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id, COUNT(*) FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(*) = (SELECT MIN(meeting_count) FROM (SELECT COUNT(*) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id) AS SubQuery)
SELECT staff_id FROM (SELECT staff_id, COUNT(meeting_id) AS num_meetings FROM Staff_in_Meetings GROUP BY staff_id) AS MeetingCounts ORDER BY num_meetings ASC LIMIT 1
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(s.staff_id) FROM Staff s LEFT JOIN Staff_in_Meetings sm ON s.staff_id = sm.staff_id WHERE sm.staff_id IS NULL
SELECT COUNT(*) FROM Staff AS s LEFT JOIN Staff_in_Meetings AS sim ON s.staff_id = sim.staff_id WHERE sim.staff_id IS NULL
SELECT C.client_id, C.client_details FROM Clients C WHERE EXISTS (SELECT 1 FROM Meetings M WHERE M.client_id = C.client_id) OR EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id)
SELECT DISTINCT c.client_id, c.client_details FROM Clients c WHERE c.client_id IN (SELECT client_id FROM Meetings UNION SELECT client_id FROM Invoices)
SELECT staff_id, staff_details FROM Staff WHERE staff_details LIKE '%s%' AND staff_id IN (SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(*) >= 1)
SELECT s.staff_id, s.staff_details FROM Staff s WHERE EXISTS (SELECT 1 FROM Staff_in_Meetings sim WHERE sim.staff_id = s.staff_id) AND s.staff_details LIKE '%s%'
SELECT c.client_id, c.sic_code, c.agency_id FROM Clients c WHERE (SELECT COUNT(m.meeting_id) FROM Meetings m WHERE m.client_id = c.client_id) = 1 AND EXISTS (SELECT 1 FROM Invoices i WHERE i.client_id = c.client_id)
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C INNER JOIN (SELECT client_id FROM Meetings GROUP BY client_id HAVING COUNT(meeting_id) = 1) AS M ON C.client_id = M.client_id INNER JOIN Invoices I ON C.client_id = I.client_id
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M INNER JOIN Clients C ON M.client_id = C.client_id INNER JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id INNER JOIN Staff S ON SM.staff_id = S.staff_id
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id JOIN Staff S ON SM.staff_id = S.staff_id
