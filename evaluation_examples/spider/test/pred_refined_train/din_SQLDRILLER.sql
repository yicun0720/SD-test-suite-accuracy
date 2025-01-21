SELECT COUNT(DISTINCT Club_ID) AS UniqueClubCount FROM club
SELECT COUNT(*) AS TotalNumberOfClubs FROM club
SELECT club.Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY LOWER(Name) ASC
SELECT c.Manager, c.Captain FROM club c
SELECT c.Manager, c.Captain FROM club c
SELECT Name FROM club WHERE Manufacturer NOT LIKE 'Nike'
SELECT Name FROM club WHERE LOWER(Manufacturer) <> 'nike'
SELECT p.Name FROM player p ORDER BY p.Wins_count ASC
SELECT p.Name FROM player p ORDER BY p.Wins_count ASC
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT DISTINCT Country FROM player p WHERE p.Earnings > 1200000
SELECT Country FROM player WHERE Earnings > 1200000 GROUP BY Country HAVING COUNT(*) > 0
SELECT Country FROM player WHERE Earnings IN (SELECT MAX(Earnings) FROM player WHERE Wins_count > 2) AND Wins_count > 2
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC, Country ASC LIMIT 1
SELECT p.Name AS Player, c.Name AS Club FROM player p JOIN club c ON p.Club_ID = c.Club_ID
SELECT player.Name, club.Name FROM player LEFT JOIN club ON player.Club_ID = club.Club_ID
SELECT c.Name FROM club c WHERE EXISTS (SELECT 1 FROM player p WHERE p.Club_ID = c.Club_ID AND p.Wins_count > 2)
SELECT c.Name FROM club c WHERE EXISTS (SELECT p.Club_ID FROM player p WHERE p.Club_ID = c.Club_ID GROUP BY p.Club_ID HAVING MAX(p.Wins_count) > 2)
SELECT p.Name FROM player p WHERE EXISTS (SELECT 1 FROM club c WHERE p.Club_ID = c.Club_ID AND c.Manager = 'Sam Allardyce')
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT Name FROM club WHERE Club_ID IN (SELECT Club_ID FROM player GROUP BY Club_ID ORDER BY AVG(Earnings) DESC)
SELECT C.Name FROM club C JOIN player P ON C.Club_ID = P.Club_ID GROUP BY C.Name ORDER BY AVG(P.Earnings) DESC
SELECT c.Manufacturer, COUNT(*) FROM club c GROUP BY c.Manufacturer
SELECT Manufacturer, COUNT(*) AS NumberOfClubs FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM club GROUP BY Manufacturer) AS counts)
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM club GROUP BY Manufacturer) AS counts)
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Name FROM club c WHERE NOT EXISTS (SELECT NULL FROM player p WHERE p.Club_ID = c.Club_ID)
SELECT Name FROM club c WHERE NOT EXISTS (SELECT NULL FROM player p WHERE p.Club_ID = c.Club_ID)
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT COUNT(*) FROM (SELECT DISTINCT Country FROM player)
SELECT COUNT(*) FROM (SELECT DISTINCT Country FROM player)
SELECT p.Earnings FROM player p WHERE p.Country = 'Australia' OR p.Country = 'Zimbabwe'
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C WHERE C.customer_id IN (SELECT O.customer_id FROM Orders O GROUP BY O.customer_id HAVING COUNT(*) > 2) AND C.customer_id IN (SELECT O.customer_id FROM Orders O JOIN Order_Items I ON O.order_id = I.order_id GROUP BY O.customer_id HAVING COUNT(I.order_item_id) >= 3)
SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c WHERE EXISTS (SELECT 1 FROM Orders o WHERE o.customer_id = c.customer_id GROUP BY o.customer_id HAVING COUNT(o.order_id) > 2) AND EXISTS (SELECT 1 FROM Orders o JOIN Order_Items oi ON o.order_id = oi.order_id WHERE o.customer_id = c.customer_id GROUP BY o.customer_id HAVING COUNT(oi.order_item_id) >= 3)
SELECT o.order_id, o.order_status_code, (SELECT COUNT(*) FROM Order_Items WHERE Order_Items.order_id = o.order_id) AS ProductCount FROM Orders o WHERE EXISTS (SELECT 1 FROM Order_Items WHERE Order_Items.order_id = o.order_id) GROUP BY o.order_id, o.order_status_code
SELECT O.order_id, O.order_status_code, (SELECT COUNT(*) FROM Order_Items WHERE Order_Items.order_id = O.order_id) AS product_count FROM Orders O
SELECT date_order_placed FROM Orders WHERE EXISTS (SELECT 1 FROM Order_Items WHERE Orders.order_id = Order_Items.order_id GROUP BY order_id HAVING COUNT(order_item_id) > 1) OR date_order_placed = (SELECT MIN(date_order_placed) FROM Orders)
SELECT DISTINCT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders WHERE Orders.customer_id IS NOT NULL)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders GROUP BY customer_id)
SELECT product_id, product_name, product_price, product_color FROM Products WHERE NOT EXISTS (SELECT 1 FROM Order_Items WHERE Products.product_id = Order_Items.product_id GROUP BY product_id HAVING COUNT(*) >= 2)
SELECT P.product_id, P.product_name, P.product_price, P.product_color FROM Products P WHERE (SELECT COUNT(*) FROM Order_Items OI WHERE OI.product_id = P.product_id) < 2
SELECT o.order_id, o.date_order_placed FROM Orders o, Order_Items oi WHERE o.order_id = oi.order_id GROUP BY o.order_id, o.date_order_placed HAVING COUNT(oi.product_id) >= 2
SELECT order_id, date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(product_id) >= 2)
SELECT P.product_id, P.product_name, P.product_price FROM Products P WHERE P.product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id ORDER BY COUNT(product_id) DESC LIMIT 1)
SELECT Products.product_id, Products.product_name, Products.product_price FROM Products INNER JOIN (SELECT product_id, COUNT(product_id) AS freq FROM Order_Items GROUP BY product_id) AS MostOrdered ON Products.product_id = MostOrdered.product_id ORDER BY MostOrdered.freq DESC LIMIT 1
SELECT Orders.order_id, SUM(Products.product_price) AS total_price FROM Orders, Order_Items, Products WHERE Orders.order_id = Order_Items.order_id AND Order_Items.product_id = Products.product_id GROUP BY Orders.order_id HAVING SUM(Products.product_price) = (SELECT MIN(total_price) FROM (SELECT SUM(Products.product_price) AS total_price FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id) AS SubQuery)
SELECT O.order_id, SUM(P.product_price) AS Total_Cost FROM Orders O, Order_Items OI, Products P WHERE O.order_id = OI.order_id AND OI.product_id = P.product_id GROUP BY O.order_id HAVING Total_Cost = (SELECT MIN(Total_Cost) FROM (SELECT SUM(P.product_price) AS Total_Cost FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id) AS MinCostTable)
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code HAVING COUNT(payment_method_code) = (SELECT MAX(count) FROM (SELECT COUNT(payment_method_code) AS count FROM Customer_Payment_Methods GROUP BY payment_method_code) AS counts)
SELECT payment_method_code FROM (SELECT payment_method_code, RANK() OVER (ORDER BY COUNT(customer_id) DESC) AS rank FROM Customer_Payment_Methods GROUP BY payment_method_code) ranked WHERE rank = 1
SELECT gender_code, COUNT(DISTINCT Products.product_id) AS total_products FROM Customers, Orders, Order_Items, Products WHERE Customers.customer_id = Orders.customer_id AND Orders.order_id = Order_Items.order_id AND Order_Items.product_id = Products.product_id GROUP BY gender_code
SELECT Customers.gender_code, COUNT(DISTINCT Products.product_id) AS total_products FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customers.gender_code
SELECT gender_code, COUNT(Orders.order_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT gender_code, COUNT(Orders.order_id) FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, p.payment_method_code FROM Customers c JOIN Customer_Payment_Methods p ON c.customer_id = p.customer_id
SELECT A.customer_first_name, A.customer_middle_initial, A.customer_last_name, B.payment_method_code FROM Customers A LEFT JOIN Customer_Payment_Methods B ON A.customer_id = B.customer_id
SELECT I.invoice_status_code, I.invoice_date, S.shipment_date FROM Invoices I, Shipments S WHERE I.invoice_number = S.invoice_number
SELECT invoice_status_code AS "Invoice Status", invoice_date AS "Invoice Date", shipment_date AS "Shipment Date" FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT p.product_name, s.shipment_date FROM Products p, Order_Items oi, Shipment_Items si, Shipments s WHERE p.product_id = oi.product_id AND oi.order_item_id = si.order_item_id AND si.shipment_id = s.shipment_id
SELECT P.product_name, S.shipment_date FROM Products P, Order_Items OI, Shipment_Items SI, Shipments S WHERE P.product_id = OI.product_id AND OI.order_item_id = SI.order_item_id AND SI.shipment_id = S.shipment_id
SELECT DISTINCT OI.order_item_status_code, S.shipment_tracking_number FROM Order_Items OI, Orders O, Shipments S, Shipment_Items SI WHERE OI.order_id = O.order_id AND O.order_id = S.order_id AND OI.order_item_id = SI.order_item_id AND SI.shipment_id = S.shipment_id
SELECT OI.order_item_status_code, S.shipment_tracking_number FROM Order_Items OI LEFT JOIN Shipments S ON OI.order_id = S.order_id LEFT JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id WHERE SI.shipment_id = S.shipment_id
SELECT product_name, product_color FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.order_item_id IN (SELECT order_item_id FROM Shipment_Items)
SELECT product_name, product_color FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items WHERE order_item_id IN (SELECT order_item_id FROM Shipment_Items))
SELECT DISTINCT product_name, product_price, product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
SELECT DISTINCT product_name, product_price, product_description FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id JOIN Orders ON Order_Items.order_id = Orders.order_id JOIN Customers ON Orders.customer_id = Customers.customer_id WHERE Customers.gender_code = 'female'
sql placeholder
SELECT invoice_status_code FROM Invoices I WHERE NOT EXISTS (SELECT * FROM Shipments S WHERE S.invoice_number = I.invoice_number)
sql placeholder
sql placeholder
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(*) FROM (SELECT DISTINCT order_item_status_code FROM Order_Items)
SELECT COUNT(*) FROM (SELECT DISTINCT order_item_status_code FROM Order_Items)
SELECT COUNT(*) FROM (SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods)
SELECT COUNT(payment_method_code) FROM (SELECT DISTINCT payment_method_code FROM Customer_Payment_Methods)
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_size IS NOT NULL)
SELECT P.product_price, P.product_size FROM Products AS P WHERE P.product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items WHERE product_id IS NOT NULL)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items WHERE product_id IS NOT NULL)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c LEFT JOIN Customer_Payment_Methods p ON c.customer_id = p.customer_id WHERE p.customer_id IS NULL
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT Customers.address_line_1, Customers.town_city, Customers.county FROM Customers WHERE Customers.country = 'USA'
SELECT DISTINCT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT COUNT(order_item_id) FROM Shipment_Items
SELECT COUNT(DISTINCT order_item_id) AS shipped_products_count FROM Shipment_Items
SELECT AVG(product_price) FROM Products WHERE product_price > 0
SELECT AVG(product_price) AS AvgPrice FROM Products WHERE product_price > 0
SELECT AVG(product_price) FROM Products WHERE EXISTS (SELECT 1 FROM Order_Items WHERE Order_Items.product_id = Products.product_id)
SELECT AVG(product_price) FROM Products WHERE EXISTS (SELECT 1 FROM Order_Items WHERE Order_Items.product_id = Products.product_id)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1 OFFSET 0)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code ORDER BY COUNT(Orders.order_id) ASC LIMIT 1)
SELECT O.date_order_placed FROM Orders O WHERE EXISTS (SELECT 1 FROM Customer_Payment_Methods CPM WHERE CPM.customer_id = O.customer_id GROUP BY CPM.customer_id HAVING COUNT(CPM.payment_method_code) >= 2)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT order_status_code FROM Orders GROUP BY order_status_code HAVING COUNT(order_status_code) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM Orders GROUP BY order_status_code) as counts)
SELECT order_status_code FROM Orders GROUP BY order_status_code HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Orders GROUP BY order_status_code) AS counts)
SELECT product_id, product_description FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 3)
SELECT product_id, product_description FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 3)
SELECT invoice_date, invoice_number FROM Invoices WHERE invoice_number IN (SELECT invoice_number FROM Shipments GROUP BY invoice_number HAVING COUNT(*) >= 2)
SELECT invoice_date, invoice_number FROM Invoices WHERE invoice_number IN (SELECT invoice_number FROM Shipments GROUP BY invoice_number HAVING COUNT(*) >= 2)
SELECT shipment_date, shipment_tracking_number FROM Shipments
SELECT s.shipment_tracking_number, s.shipment_date FROM Shipments s
SELECT P.product_color, P.product_description, P.product_size FROM Products P WHERE P.product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price NOT IN (SELECT MAX(product_price) FROM Products)
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director d GROUP BY d.Age)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(Channel_ID) AS TotalChannels FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT d.Name FROM director d INNER JOIN program p ON d.Director_ID = p.Director_ID GROUP BY d.Director_ID HAVING COUNT(p.Program_ID) = (SELECT MAX(Count) FROM (SELECT COUNT(Program_ID) AS Count FROM program GROUP BY Director_ID) AS Counts)
SELECT Name, Age FROM director WHERE Director_ID IN (SELECT Director_ID FROM program GROUP BY Director_ID HAVING COUNT(Program_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Program_ID) AS cnt FROM program GROUP BY Director_ID) tmp))
SELECT Title FROM program WHERE Start_Year = (SELECT MAX(Start_Year) FROM program)
SELECT channel.Name, channel.Internet FROM channel JOIN program ON channel.Channel_ID = program.Channel_ID GROUP BY channel.Channel_ID HAVING COUNT(DISTINCT program.Program_ID) > 1
SELECT Name, (SELECT COUNT(*) FROM program WHERE Channel_ID = channel.Channel_ID) AS ProgramCount FROM channel
SELECT COUNT(*) FROM channel LEFT JOIN program ON channel.Channel_ID = program.Channel_ID WHERE program.Channel_ID IS NULL
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID IN (SELECT Channel_ID FROM director_admin GROUP BY Channel_ID HAVING COUNT(Director_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Director_ID) AS cnt FROM director_admin GROUP BY Channel_ID) t))
SELECT director.Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT c.Name FROM channel c WHERE EXISTS (SELECT 1 FROM director_admin da INNER JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age < 40 AND da.Channel_ID = c.Channel_ID) AND EXISTS (SELECT 1 FROM director_admin da INNER JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age > 60 AND da.Channel_ID = c.Channel_ID)
SELECT c.Channel_ID, c.Name FROM channel c WHERE c.Channel_ID NOT IN (SELECT da.Channel_ID FROM director_admin da INNER JOIN director d ON da.director_id = d.director_id WHERE d.name = 'Hank Baskett')
SELECT COUNT(Radio_ID) FROM radio WHERE Radio_ID IS NOT NULL
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC, Transmitter ASC
SELECT t.tv_show_name, t.Original_Airdate FROM tv_show t
SELECT Station_name FROM city_channel WHERE Affiliation NOT LIKE 'ABC'
SELECT radio.Transmitter FROM radio WHERE radio.ERP_kW > 150 OR radio.ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT AVG(ERP_kW) FROM radio AS AverageERP
SELECT Affiliation, COUNT(*) AS NumberOfChannels FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(Affiliation) DESC LIMIT 1
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(ID) > 3
SELECT city_channel.City, city_channel.Station_name FROM city_channel ORDER BY Station_name
SELECT r.Transmitter AS Transmitter, cc.City AS City FROM radio AS r INNER JOIN city_channel_radio AS ccr ON r.Radio_ID = ccr.Radio_ID INNER JOIN city_channel AS cc ON ccr.City_channel_ID = cc.ID
SELECT r.Transmitter, cc.Station_name FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID ORDER BY r.ERP_kW DESC
SELECT r.Transmitter, COUNT(c.City_channel_ID) AS Channel_Count FROM radio r LEFT OUTER JOIN city_channel_radio c ON r.Radio_ID = c.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE NOT EXISTS (SELECT 1 FROM city_channel_radio WHERE Radio_ID = radio.Radio_ID)
SELECT Model FROM vehicle WHERE Power > 6000 AND Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000)
SELECT Model FROM vehicle WHERE Power > 6000 AND Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000)
SELECT Name FROM driver WHERE Citizenship = 'United States' AND Citizenship IS NOT NULL
SELECT Name FROM driver WHERE Citizenship LIKE 'United States'
SELECT Driver_ID, COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(Vehicle_ID) = (SELECT MAX(vehicle_count) FROM (SELECT COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID) subquery)
SELECT Driver_ID, COUNT(*) FROM vehicle_driver GROUP BY Driver_ID HAVING COUNT(*) = (SELECT MAX(VehicleCount) FROM (SELECT COUNT(*) AS VehicleCount FROM vehicle_driver GROUP BY Driver_ID) AS SubQuery)
SELECT MAX(Power) max_power, AVG(Power) avg_power FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS MaxPower, AVG(Power) AS AvgPower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(*) = (SELECT MIN(usage_count) FROM (SELECT COUNT(*) AS usage_count FROM vehicle_driver GROUP BY Vehicle_ID) tmp)
SELECT V.Vehicle_ID FROM vehicle_driver V GROUP BY V.Vehicle_ID HAVING COUNT(V.Driver_ID) = (SELECT MIN(count) FROM (SELECT COUNT(*) as count FROM vehicle_driver GROUP BY Vehicle_ID) AS counts)
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT Driver_ID) FROM vehicle_driver vd JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Build_Year = 2012
SELECT COUNT(DISTINCT driver.Driver_ID) AS NumberOfDrivers FROM driver INNER JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID INNER JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series LIKE '%NASCAR%'
SELECT COUNT(Driver_ID) FROM driver WHERE Racing_Series IN ('NASCAR')
SELECT AVG(vehicle.Top_Speed) AS Avg_Top_Speed FROM vehicle
SELECT AVG(Top_Speed) AS AverageTopSpeed FROM vehicle
SELECT DISTINCT Name FROM driver WHERE EXISTS (SELECT 1 FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle_driver.Driver_ID = driver.Driver_ID AND vehicle.Power > 5000)
SELECT Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle WHERE Power > 5000))
SELECT Model FROM vehicle WHERE Total_Production > 100 UNION SELECT Model FROM vehicle WHERE Top_Speed > 150
SELECT vehicle.Model FROM vehicle WHERE vehicle.Total_Production > 100 OR vehicle.Top_Speed > 150
SELECT v.Model, v.Build_Year FROM vehicle v WHERE v.Model LIKE '%DJ%'
SELECT v.Model, v.Build_Year FROM vehicle v WHERE v.Model LIKE '%DJ%'
SELECT v.Model FROM vehicle v WHERE NOT EXISTS (SELECT NULL FROM vehicle_driver vd WHERE vd.Vehicle_ID = v.Vehicle_ID)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT v.Vehicle_ID, v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID GROUP BY v.Vehicle_ID HAVING COUNT(DISTINCT vd.Driver_ID) = 2 OR v.Builder = 'Ziyang'
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE Builder = 'Ziyang' UNION SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle JOIN vehicle_driver ON vehicle.Vehicle_ID = vehicle_driver.Vehicle_ID GROUP BY vehicle.Vehicle_ID HAVING COUNT(vehicle_driver.Driver_ID) = 2
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE EXISTS (SELECT 1 FROM vehicle_driver D WHERE D.Vehicle_ID = V.Vehicle_ID GROUP BY D.Vehicle_ID HAVING COUNT(DISTINCT D.Driver_ID) > 2) OR EXISTS (SELECT 1 FROM vehicle_driver D JOIN driver DR ON D.Driver_ID = DR.Driver_ID WHERE DR.Name = 'Jeff Gordon' AND D.Vehicle_ID = V.Vehicle_ID)
SELECT vehicle.Vehicle_ID, vehicle.Model FROM vehicle WHERE vehicle.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2) OR vehicle.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon')
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle AS v)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed IN (SELECT MAX(Top_Speed) FROM vehicle)
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT driver.Name FROM driver ORDER BY driver.Name ASC
SELECT COUNT(*) AS CountOfDrivers, Racing_Series FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(Driver_ID) FROM driver GROUP BY Racing_Series
SELECT Name, Citizenship FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM vehicle_driver, vehicle WHERE vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID AND vehicle.Model = 'DJ1')
SELECT Name, Citizenship FROM driver WHERE EXISTS (SELECT 1 FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle_driver.Driver_ID = driver.Driver_ID AND vehicle.Model = 'DJ1')
SELECT COUNT(Driver_ID) FROM driver d WHERE NOT EXISTS (SELECT 1 FROM vehicle_driver vd WHERE vd.Driver_ID = d.Driver_ID)
SELECT COUNT(DISTINCT d.Driver_ID) FROM driver d LEFT OUTER JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID WHERE vd.Driver_ID IS NULL
SELECT COUNT(Exam_ID) AS NumberOfExams FROM Exams
SELECT COUNT(Exam_ID) AS NumberOfExams FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC, Exam_ID ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY 1
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code IS NOT 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE 'Database' != Subject_Code
SELECT Exam_Date FROM Exams WHERE LOWER(Subject_Code) LIKE LOWER('%data%') ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE LOWER(Subject_Code) LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(Question_ID) AS count FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(Question_ID) AS Total FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) AS NumberOfOccurrences FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY NumberOfOccurrences DESC
SELECT Student_Answer_Text, COUNT(*) AS Frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Frequency DESC
SELECT S.First_Name, A.Date_of_Answer FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID
SELECT S.First_Name, A.Date_of_Answer FROM Students AS S, Student_Answers AS A WHERE S.Student_ID = A.Student_ID
SELECT Email_Adress, Date_of_Answer FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID ORDER BY Student_Answers.Date_of_Answer DESC
SELECT email, date FROM (SELECT Email_Adress AS email, Date_of_Answer AS date FROM Students JOIN Student_Answers ON Students.Student_ID = Student_Answers.Student_ID) AS subquery ORDER BY date DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment HAVING COUNT(*) = (SELECT MIN(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Student_Assessments GROUP BY Assessment) AS SubCounts)
WITH AssessmentCounts AS (SELECT Assessment, COUNT(*) AS Count FROM Student_Assessments GROUP BY Assessment) SELECT Assessment FROM AssessmentCounts WHERE Count = (SELECT MIN(Count) FROM AssessmentCounts)
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2)
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2)
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Valid_Answers GROUP BY Valid_Answer_Text) AS SubQuery)
SELECT Valid_Answer_Text FROM Valid_Answers V, Student_Assessments S WHERE V.Valid_Answer_ID = S.Valid_Answer_ID GROUP BY V.Valid_Answer_Text HAVING COUNT(S.Valid_Answer_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Student_Assessments GROUP BY Valid_Answer_ID) AS Sub)
sql placeholder
SELECT Last_Name FROM Students WHERE Gender_MFU = 'F' OR Gender_MFU = 'U' OR Gender_MFU IS NULL
SELECT Gender_MFU, COUNT(Student_ID) AS NumberOfStudents FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(Student_ID) AS NumberOfStudents FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('M', 'F')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('M', 'F')
SELECT S.First_Name FROM Students S WHERE S.Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT S.First_Name FROM Students S WHERE S.Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT a.Student_Answer_Text FROM Student_Answers a, Student_Answers b WHERE a.Student_Answer_ID = b.Student_Answer_ID AND a.Comments = 'Normal' AND b.Comments = 'Absent'
SELECT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_Text IN (SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal') INTERSECT SELECT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_Text IN (SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent')
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) > 2
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) > 2
SELECT Students.Student_ID, Students.First_Name, Students.Middle_Name, Students.Last_Name, Students.Gender_MFU, Students.Student_Address, Students.Email_Adress, Students.Cell_Mobile_Phone, Students.Home_Phone FROM Students WHERE Student_ID > 0
SELECT * FROM Students WHERE Student_ID IS NOT NULL
SELECT COUNT(1) FROM Addresses
SELECT COUNT(1) FROM Addresses
SELECT * FROM Addresses
SELECT * FROM Addresses
SELECT COUNT(*) AS ProductCount FROM Products
SELECT COUNT(product_name) FROM Products
SELECT Products.product_id, Products.product_type_code, Products.product_name FROM Products
SELECT product_id AS ID, product_type_code AS TypeCode, product_name AS Name FROM Products
SELECT Products.product_price FROM Products WHERE Products.product_name = 'Monitor'
SELECT Products.product_price FROM Products WHERE Products.product_name = 'Monitor'
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM Products
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM Products
SELECT AVG(product_price) FROM Products WHERE product_type_code LIKE 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code LIKE 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code LIKE 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT P.product_name FROM Products P WHERE P.product_price > (SELECT AVG(product_price) FROM Products)
SELECT P.product_name FROM Products P WHERE P.product_price > (SELECT AVG(product_price) FROM Products)
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'hardware' AND P.product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'Clothes' AND P.product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT Products.product_name FROM Products ORDER BY Products.product_price DESC
SELECT product_name FROM Products WHERE product_type_code = 'hardware' ORDER BY product_price ASC
SELECT p.product_name FROM Products p WHERE p.product_type_code = 'Hardware' ORDER BY p.product_price ASC
SELECT p.product_type_code, COUNT(p.product_id) FROM Products p GROUP BY p.product_type_code
SELECT product_type_code, COUNT(*) AS total_products FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS AveragePrice FROM Products GROUP BY product_type_code ORDER BY AveragePrice DESC
SELECT product_type_code, AVG(product_price) AS avg_price FROM Products GROUP BY product_type_code HAVING AVG(product_price) IS NOT NULL
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) = (SELECT MAX(count) FROM (SELECT COUNT(product_id) AS count FROM Products GROUP BY product_type_code) AS counts)
SELECT product_type_code FROM Products P INNER JOIN Order_Items O ON P.product_id = O.product_id GROUP BY product_type_code HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Products JOIN Order_Items ON Products.product_id = Order_Items.product_id GROUP BY product_type_code) T)
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT c.customer_address, c.customer_phone, c.customer_email FROM Customers c WHERE c.customer_name = 'Jeromy'
SELECT customer_address AS Address, customer_phone AS Phone, customer_email AS Email FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(*) AS num_customers FROM Customers WHERE payment_method_code <> '' GROUP BY payment_method_code
SELECT payment_method_code, COUNT(customer_id) AS customer_count FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(customer_id) = (SELECT MAX(count) FROM (SELECT COUNT(customer_id) AS count FROM Customers GROUP BY payment_method_code) AS counts)
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(payment_method_code) = (SELECT MAX(count) FROM (SELECT COUNT(payment_method_code) AS count FROM Customers GROUP BY payment_method_code) AS counts)
SELECT customer_name FROM Customers WHERE payment_method_code IN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) = (SELECT MIN(cnt) FROM (SELECT COUNT(*) AS cnt FROM Customers GROUP BY payment_method_code) AS sub))
SELECT customer_name FROM Customers WHERE EXISTS (SELECT 1 FROM Customers GROUP BY payment_method_code HAVING Customers.payment_method_code = payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name COLLATE NOCASE = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name LIKE '%Jeromy%'
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) > 0
SELECT payment_method_code FROM Customers GROUP BY payment_method_code HAVING COUNT(*) > 0
SELECT p.product_id, p.product_type_code FROM Products AS p ORDER BY p.product_name ASC
SELECT product_id, product_type_code FROM Products ORDER BY LOWER(product_name)
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(*) = (SELECT MIN(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Products GROUP BY product_type_code) sub)
WITH TypeCounts AS (SELECT product_type_code, COUNT(*) AS TypeCount FROM Products GROUP BY product_type_code) SELECT product_type_code FROM TypeCounts WHERE TypeCount = (SELECT MIN(TypeCount) FROM TypeCounts)
SELECT COUNT(*) AS TotalOrders FROM Customer_Orders
SELECT COUNT(*) AS TotalOrders FROM Customer_Orders
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders AS CO INNER JOIN Customers AS C ON CO.customer_id = C.customer_id WHERE C.customer_name = 'Jeromy'
SELECT CO.order_id, CO.order_date, CO.order_status_code FROM Customer_Orders AS CO INNER JOIN Customers AS C ON CO.customer_id = C.customer_id WHERE C.customer_name = 'Jeromy'
SELECT C.customer_name, C.customer_id, (SELECT COUNT(*) FROM Customer_Orders WHERE customer_id = C.customer_id) AS order_count FROM Customers C
SELECT C.customer_name, C.customer_id, (SELECT COUNT(*) FROM Customer_Orders WHERE customer_id = C.customer_id) AS num_orders FROM Customers C
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C WHERE EXISTS (SELECT 1 FROM Customer_Orders CO WHERE CO.customer_id = C.customer_id GROUP BY CO.customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C WHERE EXISTS (SELECT 1 FROM Customer_Orders CO WHERE CO.customer_id = C.customer_id GROUP BY CO.customer_id HAVING COUNT(*) = (SELECT MAX(order_count) FROM (SELECT COUNT(*) AS order_count FROM Customer_Orders GROUP BY customer_id) AS Orders))
SELECT order_status_code, COUNT(*) AS num_orders FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(*) FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC
WITH OrderCounts AS (SELECT order_status_code, COUNT(*) AS TotalCount FROM Customer_Orders GROUP BY order_status_code) SELECT order_status_code FROM OrderCounts WHERE TotalCount = (SELECT MAX(TotalCount) FROM OrderCounts)
SELECT order_status_code FROM (SELECT order_status_code, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM Customer_Orders GROUP BY order_status_code) ranked WHERE rank = 1
SELECT COUNT(DISTINCT customer_id) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE NOT EXISTS (SELECT 1 FROM Customer_Orders WHERE Customer_Orders.customer_id = Customers.customer_id)
SELECT product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT product_name FROM Products WHERE NOT EXISTS (SELECT 1 FROM Order_Items WHERE Products.product_id = Order_Items.product_id)
SELECT COUNT(*) FROM Order_Items, Products WHERE Order_Items.product_id = Products.product_id AND Products.product_name = 'Monitor'
SELECT SUM(order_quantity) FROM Order_Items OI JOIN Products P ON OI.product_id = P.product_id WHERE P.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id WHERE P.product_name = 'Monitor' GROUP BY CO.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customers WHERE customer_id IN (SELECT customer_id FROM Customer_Orders WHERE order_id IN (SELECT order_id FROM Order_Items WHERE product_id IN (SELECT product_id FROM Products WHERE product_name = 'Monitor')))
SELECT COUNT(DISTINCT c.customer_id) FROM Customers c, Customer_Orders co WHERE c.customer_id = co.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders WHERE customer_id IS NOT NULL
SELECT Customers.customer_id FROM Customers LEFT OUTER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT Customers.customer_id FROM Customers LEFT OUTER JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT C.order_id, C.order_date FROM Customer_Orders C WHERE C.order_id IN (SELECT order_id FROM Order_Items WHERE order_quantity > 6 UNION SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3)
SELECT order_id, order_date FROM Customer_Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING SUM(order_quantity) > 6) OR order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3)
SELECT COUNT(Building_ID) AS BuildingCount FROM building
SELECT COUNT(*) FROM (SELECT DISTINCT Building_ID FROM building) AS UniqueBuildings
SELECT Name FROM building ORDER BY Number_of_Stories ASC, Name ASC
SELECT b.Name FROM building b ORDER BY b.Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT MAX(b.Number_of_Stories) FROM building AS b WHERE b.Completed_Year != 1980
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year NOT LIKE '1980'
SELECT AVG(Population) AS Average_Population FROM region
SELECT AVG(Population) AS Average_Population FROM region
SELECT r.Name AS RegionName FROM region r ORDER BY RegionName ASC
SELECT Name FROM region ORDER BY Name
SELECT Capital FROM region WHERE Area > 10000 AND Capital IS NOT NULL
SELECT Capital FROM region WHERE Area > 10000 AND Capital IS NOT NULL
SELECT Capital FROM region WHERE Population IN (SELECT MAX(Population) FROM region)
SELECT Capital FROM region WHERE Population IN (SELECT MAX(Population) FROM region)
SELECT Name FROM region WHERE Area >= (SELECT MIN(Area) FROM (SELECT Area FROM region ORDER BY Area DESC LIMIT 5) AS subquery)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5;
SELECT building.Name AS Building, region.Name AS Region FROM building INNER JOIN region ON building.Region_ID = region.Region_ID
SELECT Name AS Building, (SELECT Name FROM region WHERE Region_ID = building.Region_ID) AS Region FROM building
SELECT region.Name FROM region INNER JOIN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) > 1) AS SubQuery ON region.Region_ID = SubQuery.Region_ID
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) > 1)
WITH RankedRegions AS (SELECT Region_ID, RANK() OVER (ORDER BY COUNT(*) DESC) AS rank FROM building GROUP BY Region_ID) SELECT Capital FROM region WHERE Region_ID IN (SELECT Region_ID FROM RankedRegions WHERE rank = 1)
SELECT region.Capital FROM region INNER JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID, region.Capital HAVING COUNT(building.Building_ID) = (SELECT MAX(BuildingCount) FROM (SELECT COUNT(building.Building_ID) AS BuildingCount FROM building GROUP BY building.Region_ID) AS SubQuery)
SELECT Address AS 'Building Address', Capital AS 'Region Capital' FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT A.Address, N.Name FROM building A, region N WHERE A.Region_ID = N.Region_ID
SELECT b.Number_of_Stories FROM building b WHERE EXISTS (SELECT 1 FROM region r WHERE r.Region_ID = b.Region_ID AND r.Name = 'Abruzzo')
SELECT b.Name, b.Number_of_Stories FROM building AS b INNER JOIN region AS r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT Completed_Year, COUNT(Building_ID) AS BuildingCount FROM building GROUP BY Completed_Year ORDER BY Completed_Year
SELECT Completed_Year AS Year, COUNT(Building_ID) AS CountOfBuildings FROM building GROUP BY Completed_Year
WITH YearlyCount AS (SELECT Completed_Year, COUNT(*) AS TotalBuildings FROM building GROUP BY Completed_Year) SELECT Completed_Year FROM YearlyCount WHERE TotalBuildings = (SELECT MAX(TotalBuildings) FROM YearlyCount)
SELECT Completed_Year FROM building GROUP BY Completed_Year HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM building GROUP BY Completed_Year) AS counts)
SELECT Name FROM region AS r WHERE NOT EXISTS (SELECT * FROM building AS b WHERE b.Region_ID = r.Region_ID)
SELECT r.Name FROM region r WHERE NOT EXISTS (SELECT * FROM building b WHERE b.Region_ID = r.Region_ID)
SELECT Completed_Year FROM building WHERE Completed_Year IN (SELECT Completed_Year FROM building WHERE Number_of_Stories > 20) INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT DISTINCT Completed_Year FROM building WHERE Number_of_Stories > 20 AND Completed_Year IN (SELECT Completed_Year FROM building WHERE Number_of_Stories < 15)
SELECT DISTINCT b.Address FROM building b
SELECT DISTINCT b.Address FROM building b
SELECT b.Completed_Year FROM building b ORDER BY b.Number_of_Stories DESC
SELECT building.Name, building.Completed_Year FROM building ORDER BY building.Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY 1
SELECT Channel_Details FROM Channels ORDER BY 1
SELECT COUNT(DISTINCT Service_ID) AS TotalUniqueServices FROM Services
SELECT COUNT(DISTINCT Service_ID) AS TotalServices FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(*) = (SELECT MAX(CountType) FROM (SELECT COUNT(*) AS CountType FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) AS SubQuery)
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code) tmp)
SELECT DISTINCT service_details FROM services INNER JOIN customers_and_services ON services.service_id = customers_and_services.service_id INNER JOIN customers ON customers_and_services.customer_id = customers.customer_id WHERE customer_details = 'Hardy Kutch'
SELECT service_details FROM services WHERE service_id IN (SELECT service_id FROM customers_and_services WHERE customer_id = (SELECT customer_id FROM customers WHERE customer_details = 'Hardy Kutch'))
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(*) > 3)
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(*) > 3)
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions GROUP BY Customer_ID HAVING COUNT(Customer_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Customer_ID) as cnt FROM Customer_Interactions GROUP BY Customer_ID) T))
SELECT Customers.* FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(Service_ID) = (SELECT MAX(Service_Count) FROM (SELECT COUNT(Service_ID) AS Service_Count FROM Customers_and_Services GROUP BY Customer_ID) AS Temp))
SELECT C.Customer_Details FROM Customers C WHERE EXISTS (SELECT 1 FROM Customers_and_Services CAS WHERE C.Customer_ID = CAS.Customer_ID GROUP BY CAS.Customer_ID HAVING COUNT(DISTINCT CAS.Service_ID) = (SELECT MAX(CountServices) FROM (SELECT COUNT(DISTINCT Service_ID) AS CountServices FROM Customers_and_Services GROUP BY Customer_ID) AS Sub))
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID HAVING COUNT(DISTINCT Service_ID) = (SELECT MAX(service_count) FROM (SELECT Customer_ID, COUNT(DISTINCT Service_ID) AS service_count FROM Customers_and_Services GROUP BY Customer_ID) AS Temp))
SELECT C.Customer_Details FROM Customers C LEFT JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Customer_ID IS NULL
SELECT C.Customer_Details FROM Customers C LEFT JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Customer_ID IS NULL
SELECT C.Customer_Details FROM Customers C WHERE C.Customer_ID IN (SELECT CS.Customer_ID FROM Customers_and_Services CS WHERE CS.Service_ID = (SELECT Service_ID FROM (SELECT Service_ID, COUNT(*) AS UsageCount FROM Customers_and_Services GROUP BY Service_ID) AS ServiceUsage ORDER BY ServiceUsage.UsageCount ASC LIMIT 1))
WITH LeastUsedService AS (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1) SELECT DISTINCT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID AND CS.Service_ID IN (SELECT Service_ID FROM LeastUsedService)
SELECT DISTINCT COUNT(Customers_and_Services_Details) FROM Customers_and_Services
SELECT (SELECT COUNT(DISTINCT Customer_Details) FROM Customers) + (SELECT COUNT(DISTINCT Service_Details) FROM Services) AS Total_Details
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT * FROM Customers WHERE Customer_Details LIKE '%Kutch%'
WITH HardyServices AS (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')), GoodServices AS (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good') SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM HardyServices UNION SELECT Service_ID FROM GoodServices)
SELECT Service_Details FROM Services WHERE EXISTS (SELECT 1 FROM Customers_and_Services CS JOIN Customer_Interactions CI ON CS.Service_ID = CI.Service_ID JOIN Customers C ON CI.Customer_ID = C.Customer_ID WHERE Services.Service_ID = CS.Service_ID AND (C.Customer_Details = 'Hardy Kutch' OR CI.Status_Code = 'good'))
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT CS.Service_ID FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch') INTERSECT SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT CI.Service_ID FROM Customer_Interactions CI WHERE CI.Status_Code = 'bad')
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID JOIN Customer_Interactions CI ON CI.Service_ID = S.Service_ID WHERE C.Customer_Details = 'Hardy Kutch' AND CI.Status_Code = 'bad' GROUP BY S.Service_ID
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT CI.Service_ID FROM Customer_Interactions CI JOIN Channels C ON CI.Channel_ID = C.Channel_ID WHERE C.Channel_Details = '15 ij')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Channel_ID IN (SELECT Channel_ID FROM Channels WHERE Channel_Details = '15 ij'))
SELECT DISTINCT Customers.* FROM Customers, Customer_Interactions WHERE Customers.Customer_ID = Customer_Interactions.Customer_ID AND Customer_Interactions.Status_Code = 'Stuck' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Status_Code = 'Stuck' AND Services_and_Channels_Details = 'bad')
SELECT COUNT(*) FROM Integration_Platform JOIN Customer_Interactions ON Integration_Platform.Customer_Interaction_ID = Customer_Interactions.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'successful'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Customer_Interaction_ID IN (SELECT Customer_Interaction_ID FROM Integration_Platform WHERE Status_Code = 'failed'))
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customer_Interactions WHERE Customer_Interaction_ID IN (SELECT Customer_Interaction_ID FROM Integration_Platform WHERE Integration_Platform_Details = 'Fail'))
SELECT Services.* FROM Services WHERE NOT EXISTS (SELECT 1 FROM Customer_Interactions WHERE Customer_Interactions.Service_ID = Services.Service_ID)
SELECT S.Service_Details FROM Services S LEFT JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID WHERE CS.Service_ID IS NULL
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) AS Usage_Count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code HAVING COUNT(*) > 0
SELECT S.Service_Details FROM Services AS S, Customers_and_Services AS CS WHERE S.Service_ID = CS.Service_ID AND CS.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT S.Service_Details FROM Services AS S, Customers_and_Services AS CS WHERE S.Service_ID = CS.Service_ID AND CS.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT COUNT(*) FROM Vehicles WHERE id IS NOT NULL
SELECT COUNT(*) FROM Vehicles WHERE id IS NOT NULL
SELECT V.name FROM Vehicles V ORDER BY V.Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT V.Type_of_powertrain FROM Vehicles V
SELECT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IS NOT NULL GROUP BY Type_of_powertrain
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2013 UNION ALL SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year = 2014
SELECT name AS 'Vehicle Name', Type_of_powertrain AS 'Powertrain Type', Annual_fuel_cost AS 'Annual Fuel Cost' FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IN (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014) INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013
SELECT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IN (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013) INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Type_of_powertrain IN (SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014)
SELECT COUNT(id), Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain
SELECT COUNT(DISTINCT id), Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM (SELECT Type_of_powertrain, COUNT(*) AS num_vehicles FROM Vehicles GROUP BY Type_of_powertrain) AS subquery ORDER BY num_vehicles DESC LIMIT 1
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(Type_of_powertrain) = (SELECT MAX(count) FROM (SELECT COUNT(Type_of_powertrain) AS count FROM Vehicles GROUP BY Type_of_powertrain) AS counts)
SELECT MIN(Annual_fuel_cost) AS MinCost, MAX(Annual_fuel_cost) AS MaxCost, AVG(Annual_fuel_cost) AS AvgCost FROM Vehicles
SELECT MIN(Annual_fuel_cost) AS MinCost, MAX(Annual_fuel_cost) AS MaxCost, AVG(Annual_fuel_cost) AS AvgCost FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate AND Model_year IS NOT NULL
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate AND Combined_fuel_economy_rate IS NOT NULL
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS Average_Annual_Fuel_Cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) > 1
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS Avg_Fuel_Cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(Vehicles.id) > 1
SELECT Customers.name, Customers.age, Customers.membership_credit FROM Customers
SELECT Customers.name, Customers.age, Customers.membership_credit FROM Customers
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers LIMIT 1)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT DISTINCT name, SUM(total_hours) OVER (PARTITION BY Vehicles.id) FROM Vehicles JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id
SELECT name, TOTAL(total_hours) AS TotalHours FROM Vehicles LEFT JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id GROUP BY name
SELECT Vehicles.name FROM Vehicles LEFT JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.vehicles_id IS NULL
SELECT Vehicles.name FROM Vehicles LEFT JOIN Renting_history ON Vehicles.id = Renting_history.vehicles_id WHERE Renting_history.vehicles_id IS NULL
SELECT C.name FROM Customers C WHERE EXISTS (SELECT 1 FROM Renting_history R WHERE R.customer_id = C.id GROUP BY R.customer_id HAVING COUNT(*) >= 2)
SELECT C.name FROM Customers C WHERE EXISTS (SELECT 1 FROM Renting_history R WHERE R.customer_id = C.id GROUP BY R.customer_id HAVING COUNT(*) >= 2)
SELECT name, Model_year FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id ORDER BY COUNT(vehicles_id) DESC LIMIT 1)
SELECT name, Model_year FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id ORDER BY COUNT(vehicles_id) DESC LIMIT 1)
SELECT name FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history ORDER BY total_hours DESC)
SELECT name FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history ORDER BY total_hours DESC)
SELECT D.name FROM Discount D, Renting_history R WHERE D.id = R.discount_id GROUP BY D.name HAVING COUNT(R.id) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Renting_history GROUP BY discount_id) T)
SELECT name FROM Discount WHERE id IN (SELECT discount_id FROM Renting_history GROUP BY discount_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Renting_history GROUP BY discount_id) AS subquery))
SELECT name, Type_of_powertrain FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history WHERE total_hours > 30)
SELECT name, Type_of_powertrain FROM Vehicles WHERE id IN (SELECT vehicles_id FROM Renting_history R GROUP BY R.vehicles_id HAVING SUM(R.total_hours) > 30)
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS AvgCityFuel, AVG(Highway_fuel_economy_rate) AS AvgHighwayFuel FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS City_Fuel_Economy_Average, AVG(Highway_fuel_economy_rate) AS Highway_Fuel_Economy_Average FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) AS average_loan_amount FROM Student_Loans
SELECT AVG(amount_of_loan) AS average_loan FROM Student_Loans
SELECT bio_data, student_id FROM Students WHERE EXISTS (SELECT 1 FROM Classes WHERE Students.student_id = Classes.student_id GROUP BY Classes.student_id HAVING COUNT(*) >= 2) AND NOT EXISTS (SELECT 1 FROM Detention WHERE Students.student_id = Detention.student_id GROUP BY Detention.student_id HAVING COUNT(*) >= 2)
SELECT S.bio_data, S.student_id FROM Students S WHERE (SELECT COUNT(*) FROM Classes C WHERE C.student_id = S.student_id) >= 2 OR (SELECT COUNT(*) FROM Detention D WHERE D.student_id = S.student_id) < 2
SELECT DISTINCT T.* FROM Teachers T, Classes C1 WHERE T.teacher_id = C1.teacher_id AND C1.class_details LIKE '%data%' AND NOT EXISTS (SELECT 1 FROM Classes C2 WHERE C2.teacher_id = T.teacher_id AND C2.class_details LIKE 'net%')
SELECT teacher_details FROM Teachers WHERE EXISTS (SELECT 1 FROM Classes WHERE teacher_id = Teachers.teacher_id AND class_details LIKE '%data%') AND NOT EXISTS (SELECT 1 FROM Classes WHERE teacher_id = Teachers.teacher_id AND class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT SL.date_of_loan, SL.amount_of_loan FROM Student_Loans SL JOIN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2) AS Sub ON SL.student_id = Sub.student_id
SELECT amount_of_loan, date_of_loan FROM Student_Loans WHERE student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT T.teacher_id, T.teacher_details FROM Teachers T WHERE EXISTS (SELECT 1 FROM Classes C WHERE C.teacher_id = T.teacher_id GROUP BY C.teacher_id HAVING COUNT(*) = (SELECT MAX(course_count) FROM (SELECT COUNT(*) AS course_count FROM Classes GROUP BY teacher_id) AS counts))
SELECT T1.teacher_id, T1.teacher_details FROM Teachers T1 WHERE T1.teacher_id = (SELECT teacher_id FROM Classes GROUP BY teacher_id HAVING COUNT(class_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(class_id) AS cnt FROM Classes GROUP BY teacher_id) AS subquery))
SELECT DISTINCT d.detention_summary FROM Detention d
SELECT DISTINCT d.detention_summary FROM Detention d
SELECT student_details, address_type_description FROM Students INNER JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id INNER JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT student_details, address_type_description FROM Students INNER JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id INNER JOIN Ref_Address_Types ON Students_Addresses.address_type_code = Ref_Address_Types.address_type_code
SELECT address_details, bio_data FROM Addresses INNER JOIN Students_Addresses ON Addresses.address_id = Students_Addresses.address_id INNER JOIN Students ON Students_Addresses.student_id = Students.student_id
SELECT bio_data AS StudentBio, address_details AS StudentAddress FROM Students JOIN Students_Addresses ON Students.student_id = Students_Addresses.student_id JOIN Addresses ON Students_Addresses.address_id = Addresses.address_id
SELECT a.bio_data, b.date_of_transcript FROM Students a, Transcripts b WHERE a.student_id = b.student_id
SELECT bio_data, date_of_transcript FROM Students S CROSS JOIN Transcripts T ON S.student_id = T.student_id
SELECT behaviour_monitoring_details, COUNT(student_id) AS num_students FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(student_id) = (SELECT MAX(count) FROM (SELECT COUNT(student_id) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) AS subquery)
SELECT behaviour_monitoring_details, COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) as count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) temp)
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) AND behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3))
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT B.student_id FROM Behaviour_Monitoring B WHERE B.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM (SELECT behaviour_monitoring_details, COUNT(*) AS cnt FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) AS T WHERE T.cnt = 3 OR T.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)))
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring B WHERE B.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1) GROUP BY B.student_id HAVING COUNT(B.behaviour_monitoring_details) = (SELECT COUNT(*) FROM Behaviour_Monitoring WHERE student_id = B.student_id))
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring B WHERE B.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT S.bio_data, E.event_date FROM Students S, Student_Events E WHERE S.student_id = E.student_id
SELECT S.bio_data, E.event_date FROM Students S, Student_Events E WHERE S.student_id = E.student_id
WITH EventCounts AS (SELECT event_type_code, COUNT(student_id) AS num_students FROM Student_Events GROUP BY event_type_code) SELECT EC.num_students, EC.event_type_code, ET.event_type_description FROM EventCounts EC JOIN Ref_Event_Types ET ON EC.event_type_code = ET.event_type_code WHERE EC.num_students = (SELECT MAX(num_students) FROM EventCounts)
WITH EventCounts AS (SELECT event_type_code, COUNT(student_id) AS count FROM Student_Events GROUP BY event_type_code) SELECT E.event_type_code, E.event_type_description, EC.count FROM EventCounts EC JOIN Ref_Event_Types E ON EC.event_type_code = E.event_type_code WHERE EC.count = (SELECT MAX(count) FROM EventCounts)
SELECT achievement_details, achievement_type_description FROM Achievements A LEFT JOIN Ref_Achievement_Type R ON A.achievement_type_code = R.achievement_type_code
SELECT ach.achievement_details, ref.achievement_type_description FROM Achievements ach, Ref_Achievement_Type ref WHERE ach.achievement_type_code = ref.achievement_type_code
SELECT COUNT(DISTINCT teacher_id) FROM Classes WHERE student_id IN (SELECT student_id FROM Students WHERE student_id NOT IN (SELECT student_id FROM Achievements))
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE NOT EXISTS (SELECT 1 FROM Achievements WHERE T2.student_id = Achievements.student_id)
SELECT t.date_of_transcript, t.transcript_details FROM Transcripts t
SELECT t.date_of_transcript, t.transcript_details FROM Transcripts t
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements WHERE achievement_type_code IS NOT NULL
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements WHERE achievement_type_code IS NOT NULL
SELECT datetime_detention_start AS 'Start Time', datetime_detention_end AS 'End Time' FROM Detention
SELECT datetime_detention_start AS 'Start Time', datetime_detention_end AS 'End Time' FROM Detention
SELECT S.bio_data FROM Students S WHERE S.student_details LIKE '%Suite%'
SELECT S.bio_data FROM Students S WHERE S.student_details LIKE '%Suite%'
SELECT * FROM Teachers, Students, Classes WHERE Teachers.teacher_id = Classes.teacher_id AND Students.student_id = Classes.student_id
SELECT T.teacher_details, S.student_details FROM Classes C JOIN Teachers T ON C.teacher_id = T.teacher_id JOIN Students S ON C.student_id = S.student_id
WITH TeacherCourseCounts AS (SELECT teacher_id, COUNT(class_id) AS num_courses FROM Classes GROUP BY teacher_id) SELECT teacher_id, num_courses FROM TeacherCourseCounts WHERE num_courses = (SELECT MAX(num_courses) FROM TeacherCourseCounts)
WITH CourseCounts AS (SELECT teacher_id, COUNT(class_id) AS num_courses FROM Classes GROUP BY teacher_id) SELECT teacher_id, num_courses FROM CourseCounts WHERE num_courses = (SELECT MAX(num_courses) FROM CourseCounts)
sql placeholder
SELECT student_id, COUNT(class_id) FROM Classes GROUP BY student_id HAVING COUNT(class_id) = (SELECT MAX(course_count) FROM (SELECT student_id, COUNT(class_id) AS course_count FROM Classes GROUP BY student_id) AS subquery)
sql placeholder
sql placeholder
SELECT D.detention_type_code, R.detention_type_description FROM Detention D JOIN Ref_Detention_Type R ON D.detention_type_code = R.detention_type_code GROUP BY D.detention_type_code, R.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT detention_type_code, detention_type_description FROM Ref_Detention_Type WHERE detention_type_code = (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT bio_data, other_details FROM Students, Student_Loans WHERE Students.student_id = Student_Loans.student_id AND Student_Loans.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans) GROUP BY student_id)
SELECT date_of_loan FROM Student_Loans ORDER BY date_of_loan LIMIT 1
SELECT date_of_loan FROM Student_Loans GROUP BY date_of_loan ORDER BY date_of_loan ASC LIMIT 1
SELECT S.bio_data FROM Students S WHERE EXISTS (SELECT 1 FROM Student_Loans SL WHERE S.student_id = SL.student_id AND SL.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans))
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC LIMIT 1)
SELECT date_of_transcript FROM Transcripts WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans))
SELECT T.date_of_transcript FROM Transcripts T JOIN Student_Loans S ON T.student_id = S.student_id ORDER BY S.amount_of_loan DESC LIMIT 1
SELECT teacher_details FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript LIMIT 1))
SELECT T.* FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id JOIN Transcripts TR ON C.student_id = TR.student_id WHERE TR.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT s.student_id, IFNULL(SUM(sl.amount_of_loan), 0) AS total_loan FROM Students s LEFT JOIN Student_Loans sl ON s.student_id = sl.student_id GROUP BY s.student_id
SELECT s.student_id, AggregateLoanAmount.total_loan FROM Students s JOIN (SELECT student_id, SUM(amount_of_loan) AS total_loan FROM Student_Loans GROUP BY student_id) AS AggregateLoanAmount ON s.student_id = AggregateLoanAmount.student_id
sql placeholder
SELECT s.student_id, s.bio_data, IFNULL(c.num_courses, 0) AS num_courses FROM Students s LEFT JOIN (SELECT student_id, COUNT(*) AS num_courses FROM Classes GROUP BY student_id) c ON s.student_id = c.student_id
SELECT COUNT(DISTINCT student_id) AS total_students FROM Detention
SELECT COUNT(DISTINCT Students.student_id) FROM Students, Detention WHERE Students.student_id = Detention.student_id
SELECT R.address_type_code, R.address_type_description FROM Ref_Address_Types R JOIN (SELECT address_type_code FROM Students_Addresses GROUP BY address_type_code HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Students_Addresses GROUP BY address_type_code) AS Counts)) AS MostCommon ON R.address_type_code = MostCommon.address_type_code
WITH CountedTypes AS (SELECT address_type_code, COUNT(*) AS cnt FROM Students_Addresses GROUP BY address_type_code) SELECT Ref_Address_Types.address_type_code, address_type_description FROM Ref_Address_Types JOIN CountedTypes ON Ref_Address_Types.address_type_code = CountedTypes.address_type_code WHERE cnt = (SELECT MAX(cnt) FROM CountedTypes)
SELECT bio_data FROM Students AS S WHERE EXISTS (SELECT * FROM Student_Events AS SE WHERE SE.student_id = S.student_id) AND NOT EXISTS (SELECT * FROM Student_Loans AS SL WHERE SL.student_id = S.student_id)
SELECT bio_data FROM Students WHERE EXISTS (SELECT student_id FROM Student_Events WHERE student_id = Students.student_id) AND NOT EXISTS (SELECT student_id FROM Student_Loans WHERE student_id = Students.student_id)
SELECT date_from, date_to FROM Students_Addresses WHERE student_id IN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(transcript_id) = 2)
SELECT date_from, date_to FROM Students_Addresses WHERE student_id IN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(transcript_id) = 2)
SELECT datetime_detention_start FROM Detention WHERE datetime_detention_start IS NOT NULL
SELECT datetime_detention_start AS StartDate FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name, Address FROM Client WHERE Name IS NOT NULL AND Address IS NOT NULL
SELECT Name, Address FROM Client WHERE Name IS NOT NULL AND Address IS NOT NULL
SELECT `Title`, `ISBN`, `SalePrice` FROM `Book`
SELECT B.Title, B.ISBN, B.SalePrice FROM Book B
SELECT COUNT(1) FROM Book
SELECT COUNT(1) FROM Book
SELECT COUNT(DISTINCT idAuthor) AS UniqueAuthors FROM Author
SELECT COUNT(Author.idAuthor) FROM Author
SELECT COUNT(IdClient) AS NumberOfClients FROM Client
SELECT COUNT(IdClient) AS NumberOfClients FROM Client
SELECT Name, Address FROM Client ORDER BY LOWER(Name) ASC
SELECT Name, Address FROM Client ORDER BY Name ASC, Address ASC
SELECT b.Title, a.Name FROM Book b, Author a, Author_Book ab WHERE b.ISBN = ab.ISBN AND ab.Author = a.idAuthor
SELECT b.Title, a.Name FROM Book b, Author_Book ab, Author a WHERE b.ISBN = ab.ISBN AND ab.Author = a.idAuthor
SELECT IdOrder, Name FROM Orders, Client WHERE Orders.IdClient = Client.IdClient
SELECT IdOrder, Name FROM Orders, Client WHERE Orders.IdClient = Client.IdClient
SELECT Name, (SELECT COUNT(*) FROM Author_Book WHERE Author = Author.idAuthor) AS BookCount FROM Author
SELECT Name, (SELECT COUNT(*) FROM Author_Book WHERE Author = idAuthor) AS NumberOfBooks FROM Author
SELECT B.ISBN, COUNT(O.ISBN) AS NumberOfOrders FROM Book AS B LEFT OUTER JOIN Books_Order AS O ON B.ISBN = O.ISBN GROUP BY B.ISBN
SELECT b.ISBN, COUNT(o.ISBN) FROM Book b LEFT JOIN Books_Order o ON b.ISBN = o.ISBN GROUP BY b.ISBN
SELECT b.ISBN, SUM(o.amount) total_amount FROM Book b, Books_Order o WHERE b.ISBN = o.ISBN GROUP BY b.ISBN
SELECT B.ISBN, COALESCE(SUM(BO.amount), 0) AS TotalAmount FROM Book B LEFT JOIN Books_Order BO ON B.ISBN = BO.ISBN GROUP BY B.ISBN
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order GROUP BY ISBN HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Books_Order GROUP BY ISBN) AS Sub))
SELECT B.Title FROM Book B WHERE B.ISBN = (SELECT BO.ISBN FROM Books_Order BO GROUP BY BO.ISBN ORDER BY SUM(BO.amount) DESC LIMIT 1)
SELECT Title, PurchasePrice FROM Book WHERE ISBN = (SELECT ISBN FROM Books_Order GROUP BY ISBN ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Title, PurchasePrice FROM Book WHERE ISBN = (SELECT ISBN FROM Books_Order GROUP BY ISBN ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Book.Title FROM Book LEFT JOIN Books_Order ON Book.ISBN = Books_Order.ISBN WHERE Books_Order.ISBN IS NOT NULL
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order)
SELECT Name FROM Client WHERE EXISTS (SELECT * FROM Orders WHERE Orders.IdClient = Client.IdClient)
SELECT Name FROM Client WHERE EXISTS (SELECT 1 FROM Orders WHERE Orders.IdClient = Client.IdClient)
SELECT Name, COUNT(IdOrder) AS Orders FROM Client LEFT JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Name
SELECT Name, COUNT(IdOrder) AS Orders FROM Client LEFT OUTER JOIN Orders ON Client.IdClient = Orders.IdClient GROUP BY Name
SELECT C.Name FROM Client C, Orders O WHERE C.IdClient = O.IdClient GROUP BY C.IdClient HAVING COUNT(O.IdOrder) = (SELECT MAX(OrderCount) FROM (SELECT COUNT(IdOrder) AS OrderCount FROM Orders GROUP BY IdClient) AS SubQuery)
SELECT C.Name FROM Client C, Orders O WHERE C.IdClient = O.IdClient GROUP BY C.IdClient, C.Name HAVING COUNT(O.IdOrder) = (SELECT MAX(Total) FROM (SELECT COUNT(IdOrder) AS Total FROM Orders GROUP BY IdClient) AS SubQuery)
SELECT Client.Name, AggregateTotal FROM Client JOIN (SELECT IdClient, SUM(amount) AS AggregateTotal FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient) AS OrderTotals ON Client.IdClient = OrderTotals.IdClient
SELECT Client.Name, TotalAmount FROM Client JOIN (SELECT IdClient, SUM(amount) AS TotalAmount FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient) AS SubQuery ON Client.IdClient = SubQuery.IdClient
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient ORDER BY SUM(Books_Order.amount) DESC LIMIT 1)
sql placeholder
SELECT B.Title FROM Book B WHERE B.ISBN NOT IN (SELECT O.ISBN FROM Books_Order O)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Client.Name FROM Client WHERE Client.IdClient NOT IN (SELECT DISTINCT IdClient FROM Orders)
SELECT C.Name FROM Client C WHERE C.IdClient NOT IN (SELECT O.IdClient FROM Orders O)
SELECT MAX(Book.SalePrice) AS MaximumSalePrice, MIN(Book.SalePrice) AS MinimumSalePrice FROM Book
SELECT MAX(B.SalePrice) AS HighestPrice, MIN(B.SalePrice) AS LowestPrice FROM Book B
SELECT AVG(PurchasePrice) AS Purchase_Price_Average, AVG(SalePrice) AS Sale_Price_Average FROM Book
SELECT AVG(PurchasePrice) AS Purchase_Price_Avg, AVG(SalePrice) AS Sale_Price_Avg FROM Book
SELECT MAX(Book.SalePrice - Book.PurchasePrice) FROM Book
SELECT MAX(Book.SalePrice - Book.PurchasePrice) AS MaxPriceDifference FROM Book
SELECT B.Title FROM Book AS B WHERE B.SalePrice > (SELECT AVG(SalePrice) FROM Book AS B2)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book AS B)
SELECT Title FROM Book AS B WHERE B.SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book AS B)
SELECT Title FROM Book B WHERE EXISTS (SELECT 1 FROM Book WHERE PurchasePrice > B.PurchasePrice) = FALSE
SELECT B.Title FROM Book B WHERE B.PurchasePrice = (SELECT MAX(B2.PurchasePrice) FROM Book B2)
SELECT AVG(SalePrice) FROM (SELECT SalePrice FROM Book JOIN Author_Book ON Book.ISBN = Author_Book.ISBN JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'George Orwell') AS Prices
SELECT AVG(SalePrice) AS AverageSalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book WHERE Author IN (SELECT idAuthor FROM Author WHERE Name = 'George Orwell'))
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato')
SELECT SalePrice FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato')
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book AS B INNER JOIN Author_Book AS AB ON B.ISBN = AB.ISBN INNER JOIN Author AS A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato') AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name = 'Plato') AND SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT Name FROM Author WHERE idAuthor IN (SELECT Author FROM Author_Book WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice'))
SELECT A.Name FROM Author A JOIN Author_Book AB ON A.idAuthor = AB.Author JOIN Book B ON AB.ISBN = B.ISBN WHERE B.Title LIKE 'Pride and Prejudice'
SELECT Title FROM Book WHERE EXISTS (SELECT 1 FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%' AND Author_Book.ISBN = Book.ISBN)
SELECT Title FROM Book WHERE EXISTS (SELECT 1 FROM Author_Book JOIN Author ON Author_Book.Author = Author.idAuthor WHERE Author.Name LIKE '%Plato%' AND Author_Book.ISBN = Book.ISBN)
SELECT COUNT(DISTINCT Books_Order.IdOrder) FROM Books_Order LEFT JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT COUNT(Books_Order.amount) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title LIKE 'Pride and Prejudice'
SELECT DISTINCT o1.IdOrder FROM Orders o1, Books_Order bo1, Book b1 WHERE o1.IdOrder = bo1.IdOrder AND bo1.ISBN = b1.ISBN AND b1.Title = 'Pride and Prejudice' AND EXISTS (SELECT 1 FROM Books_Order bo2 JOIN Book b2 ON bo2.ISBN = b2.ISBN WHERE bo2.IdOrder = o1.IdOrder AND b2.Title = 'The Little Prince')
SELECT IdOrder FROM Orders WHERE EXISTS (SELECT * FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice' AND Books_Order.IdOrder = Orders.IdOrder) AND EXISTS (SELECT * FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'The Little Prince' AND Books_Order.IdOrder = Orders.IdOrder)
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'Peter Doe')) INTERSECT SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'James Smith'))
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT O.IdOrder FROM Orders O INNER JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe') INTERSECT SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT O.IdOrder FROM Orders O INNER JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith')
SELECT B.Title FROM Book B WHERE B.ISBN IN (SELECT BO.ISBN FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe') AND B.ISBN NOT IN (SELECT BO.ISBN FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith')
SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND Title NOT IN (SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'James Smith'))))
SELECT c.Name FROM Client c, Orders o, Books_Order bo, Book b WHERE c.IdClient = o.IdClient AND o.IdOrder = bo.IdOrder AND bo.ISBN = b.ISBN AND b.Title = 'Pride and Prejudice'
SELECT Name FROM Client WHERE IdClient IN (SELECT IdClient FROM Orders WHERE IdOrder IN (SELECT IdOrder FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice')))
SELECT COUNT(Book_ID) FROM book
SELECT Title FROM book ORDER BY Title COLLATE NOCASE ASC
SELECT book.Title FROM book ORDER BY book.Pages DESC
SELECT b.Type AS BookType, b.Release AS ReleaseDate FROM book b
SELECT Title, MAX(Chapters) AS Max_Chapters, MIN(Chapters) AS Min_Chapters FROM book GROUP BY Title
SELECT Title FROM book WHERE NOT Type = 'Poet'
SELECT AVG(Rating) FROM review AS r
SELECT b.Title, r.Rating FROM book b JOIN review r ON b.Book_ID = r.Book_ID
SELECT R.Rating FROM review R JOIN book B ON R.Book_ID = B.Book_ID WHERE B.Chapters = (SELECT MAX(Chapters) FROM book)
SELECT Rank FROM review WHERE Book_ID IN (SELECT Book_ID FROM book WHERE Pages = (SELECT MIN(Pages) FROM book))
SELECT b.Title FROM book b, review r WHERE b.Book_ID = r.Book_ID AND r.Rank = (SELECT MAX(Rank) FROM review)
SELECT AVG(r.Readers_in_Million) FROM review r, book b WHERE r.Book_ID = b.Book_ID AND b.Type = 'Novel'
SELECT b.Type, COUNT(b.Book_ID) FROM book b GROUP BY b.Type
SELECT Type FROM book GROUP BY Type HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM book GROUP BY Type) sub)
SELECT Type FROM book GROUP BY Type HAVING COUNT(*) >= 3
SELECT Title FROM book JOIN review USING(Book_ID) ORDER BY Rating ASC
SELECT Title, Audio FROM book LEFT JOIN review ON book.Book_ID = review.Book_ID ORDER BY Readers_in_Million DESC
SELECT COUNT(*) FROM book b LEFT JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Book_ID IS NULL
SELECT Type FROM book GROUP BY Type HAVING MAX(Chapters) > 75 AND MIN(Chapters) < 50
SELECT COUNT(DISTINCT Type) FROM book WHERE Type IS NOT NULL
SELECT Type, Title FROM book WHERE NOT EXISTS (SELECT 1 FROM review WHERE review.Book_ID = book.Book_ID)
SELECT COUNT(*) FROM customer WHERE Customer_ID <> ''
SELECT COUNT(*) FROM customer WHERE Customer_ID != ''
SELECT Name FROM customer ORDER BY Level_of_Membership+0 ASC
SELECT c.Name FROM customer AS c ORDER BY c.Level_of_Membership ASC
SELECT Nationality, Card_Credit FROM customer WHERE Nationality IS NOT NULL AND Card_Credit IS NOT NULL
SELECT Nationality, Card_Credit FROM customer WHERE Nationality IS NOT NULL AND Card_Credit IS NOT NULL
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT Name FROM customer WHERE Nationality = 'England' OR Nationality = 'Australia'
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1 AND Card_Credit IS NOT NULL
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1 AND Card_Credit IS NOT NULL
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Card_Credit FROM customer WHERE Level_of_Membership IN (SELECT MAX(Level_of_Membership) FROM customer)
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM customer GROUP BY Nationality) AS counts)
SELECT Nationality FROM customer GROUP BY Nationality HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM customer GROUP BY Nationality) AS SubQuery)
SELECT Nationality FROM customer GROUP BY Nationality HAVING MIN(Card_Credit) < 50 AND MAX(Card_Credit) > 75
SELECT DISTINCT c1.Nationality FROM customer c1 JOIN customer c2 ON c1.Nationality = c2.Nationality WHERE c1.Card_Credit > 50 AND c2.Card_Credit < 75
SELECT c.Name AS CustomerName, co.Dish_Name AS DishName FROM customer c INNER JOIN customer_order co ON c.Customer_ID = co.Customer_ID
SELECT Name, Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID
SELECT Name, Dish_Name FROM customer INNER JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID ORDER BY Quantity DESC
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID ORDER BY customer_order.Quantity DESC
SELECT customer.Name, Total_Quantity FROM customer LEFT JOIN (SELECT Customer_ID, SUM(Quantity) AS Total_Quantity FROM customer_order GROUP BY Customer_ID) co ON customer.Customer_ID = co.Customer_ID
SELECT customer.Name, TotalQuantity FROM customer JOIN (SELECT Customer_ID, SUM(Quantity) AS TotalQuantity FROM customer_order GROUP BY Customer_ID) co ON customer.Customer_ID = co.Customer_ID
SELECT customer.Name, customer.Customer_ID FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Customer_ID HAVING SUM(customer_order.Quantity) > 1
SELECT c.Name FROM customer c INNER JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID HAVING SUM(co.Quantity) > 1
SELECT b.Manager FROM branch b GROUP BY b.Manager
SELECT DISTINCT Manager FROM branch
SELECT c.Name FROM customer c WHERE c.Customer_ID NOT IN (SELECT DISTINCT Customer_ID FROM customer_order)
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order WHERE Customer_ID IS NOT NULL)
SELECT COUNT(1) AS count_of_members FROM member
SELECT Name FROM member ORDER BY Age ASC, Name ASC
SELECT Name, Nationality FROM member
SELECT Name FROM member WHERE NOT (Nationality = 'England')
SELECT Name FROM member WHERE Age >= 19 AND Age <= 20
SELECT Name FROM member AS m WHERE m.Age = (SELECT MAX(Age) FROM member AS sub)
SELECT Nationality, COUNT(Member_ID) FROM member GROUP BY Nationality HAVING COUNT(Member_ID) > 0
WITH NationalityCount AS (SELECT Nationality, COUNT(*) AS Total FROM member GROUP BY Nationality) SELECT Nationality FROM NationalityCount WHERE Total = (SELECT MAX(Total) FROM NationalityCount)
SELECT Nationality FROM (SELECT Nationality, COUNT(Member_ID) AS total FROM member GROUP BY Nationality) AS subquery WHERE total >= 2
SELECT Name, Club_Name FROM member, club_leader, club WHERE member.Member_ID = club_leader.Member_ID AND club_leader.Club_ID = club.Club_ID
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Overall_Ranking > 100
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID WHERE cl.Year_Join < 2018
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID AND c.Club_Name = 'Houston'
SELECT m.Name FROM member m LEFT JOIN club_leader cl ON m.Member_ID = cl.Member_ID WHERE cl.Member_ID IS NULL
SELECT Nationality FROM member GROUP BY Nationality HAVING SUM(CASE WHEN Age > 22 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Age < 19 THEN 1 ELSE 0 END) > 0
SELECT AVG(Age) AS AvgAge FROM member WHERE EXISTS (SELECT 1 FROM club_leader WHERE club_leader.Member_ID = member.Member_ID)
SELECT Club_Name FROM club WHERE LOWER(Club_Name) LIKE '%state%'
SELECT Collection_Subsets.Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_Name <> ''
SELECT * FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT C.Collection_Description FROM Collections C JOIN Collection_Subset_Members M ON C.Collection_ID = M.Collection_ID JOIN Collection_Subsets S ON M.Collection_Subset_ID = S.Collection_Subset_ID WHERE S.Collection_Subset_Name = 'Top collection'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds LEFT JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID
SELECT Document_Subset_Name FROM Document_Subsets WHERE Document_Subset_Name IS NOT NULL
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000' AND Document_Subset_Details IS NOT NULL
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000' AND Document_Subset_Details IS NOT NULL
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects
SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT d.Document_Object_ID FROM Document_Objects d WHERE d.Owner = 'Marlin'
SELECT d.Owner FROM Document_Objects d WHERE d.Description = 'Braeden Collection'
SELECT DISTINCT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT dic.Document_Object_ID FROM Documents_in_Collections dic JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE c.Collection_Description = 'Braeden Collection')
SELECT D.Owner FROM Document_Objects D WHERE D.Document_Object_ID = (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT D2.Owner FROM Document_Objects D1 JOIN Document_Objects D2 ON D1.Parent_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Marlin'
SELECT DISTINCT Description FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Description FROM Document_Objects WHERE Document_Object_ID IN (SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects)
SELECT COUNT(*) FROM Document_Objects WHERE Owner LIKE 'Marlin'
SELECT COUNT(*) FROM Document_Objects WHERE Owner LIKE 'Marlin'
SELECT d.Document_Object_ID FROM Document_Objects d WHERE NOT EXISTS (SELECT NULL FROM Document_Objects p WHERE p.Parent_Document_Object_ID = d.Document_Object_ID)
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects)
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS NumberOfChildren FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING Parent_Document_Object_ID IS NOT NULL
SELECT Collection_Name AS Name FROM Collections
SELECT Collection_Name AS Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT B.Collection_Name FROM Collections A INNER JOIN Collections B ON A.Parent_Collection_ID = B.Collection_ID WHERE A.Collection_Name = 'Nice'
SELECT parent.Collection_Name FROM Collections parent JOIN Collections child ON child.Parent_Collection_ID = parent.Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL AND Parent_Collection_ID != Collection_ID)
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL AND Parent_Collection_ID != Collection_ID)
SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1)
SELECT DISTINCT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1)
SELECT COUNT(*) FROM Collections c1 JOIN Collections c2 ON c1.Collection_ID = c2.Parent_Collection_ID WHERE c2.Collection_Name = 'Best'
SELECT COUNT(Child.Collection_ID) FROM Collections Child WHERE Child.Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT DISTINCT Related_Document_Object_ID FROM Document_Subset_Members INNER JOIN Document_Objects ON Document_Subset_Members.Document_Object_ID = Document_Objects.Document_Object_ID WHERE Document_Objects.Owner = 'Ransom'
SELECT DSM.Related_Document_Object_ID FROM Document_Objects DO, Document_Subset_Members DSM WHERE DO.Document_Object_ID = DSM.Document_Object_ID AND DO.Owner = 'Ransom'
SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, (SELECT COUNT(*) FROM Collection_Subset_Members WHERE Collection_Subset_ID = cs.Collection_Subset_ID) FROM Collection_Subsets cs
SELECT CS.Collection_Subset_ID, CS.Collection_Subset_Name, (SELECT COUNT(*) FROM Collection_Subset_Members WHERE Collection_Subset_ID = CS.Collection_Subset_ID) AS Num_Collections FROM Collection_Subsets CS
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Document_Objects GROUP BY Parent_Document_Object_ID) AS SubQuery)
SELECT d1.Document_Object_ID, IFNULL(COUNT(d2.Parent_Document_Object_ID), 0) AS children_count FROM Document_Objects d1 LEFT JOIN Document_Objects d2 ON d1.Document_Object_ID = d2.Parent_Document_Object_ID GROUP BY d1.Document_Object_ID
SELECT A.Document_Object_ID, A.Related_Count FROM (SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID) A WHERE A.Related_Count = (SELECT MIN(B.Related_Count) FROM (SELECT COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID) B)
WITH CountedDocs AS (SELECT Document_Object_ID, COUNT(*) AS NumberOfDocs FROM Documents_in_Collections GROUP BY Document_Object_ID) SELECT Document_Object_ID FROM CountedDocs WHERE NumberOfDocs = (SELECT MIN(NumberOfDocs) FROM CountedDocs)
SELECT d.Document_Object_ID, COUNT(r.Related_Document_Object_ID) AS Total_Related FROM Document_Objects d LEFT JOIN Document_Subset_Members r ON d.Document_Object_ID = r.Document_Object_ID GROUP BY d.Document_Object_ID HAVING Total_Related BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Total_Related FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING Total_Related > 1 AND Total_Related < 5
SELECT DISTINCT D2.Owner FROM Document_Objects D1 INNER JOIN Document_Subset_Members DSM ON D1.Document_Object_ID = DSM.Document_Object_ID INNER JOIN Document_Objects D2 ON DSM.Related_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Braeden'
SELECT DISTINCT d.Owner FROM Document_Objects d WHERE EXISTS (SELECT 1 FROM Document_Subset_Members m WHERE m.Related_Document_Object_ID = d.Document_Object_ID AND m.Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden'))
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do CROSS JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID CROSS JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID WHERE dsm.Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden')
SELECT a.Document_Subset_ID, a.Document_Subset_Name, COUNT(DISTINCT b.Document_Object_ID) AS Total_Documents FROM Document_Subsets a LEFT JOIN Document_Subset_Members b ON a.Document_Subset_ID = b.Document_Subset_ID GROUP BY a.Document_Subset_ID, a.Document_Subset_Name
SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, COUNT(DISTINCT dic.Document_Object_ID) AS DocumentCount FROM Collection_Subsets cs LEFT JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID LEFT JOIN Collections c ON csm.Collection_ID = c.Collection_ID LEFT JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS DocumentCount FROM Document_Subsets DS INNER JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name HAVING DocumentCount = (SELECT MAX(Count) FROM (SELECT COUNT(DISTINCT Document_Object_ID) AS Count FROM Document_Subset_Members GROUP BY Document_Subset_ID) AS MaxCount)
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS NumberOfDocuments FROM Document_Subsets AS DS JOIN Document_Subset_Members AS DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT DISTINCT DSM.Document_Object_ID FROM Document_Subsets DS JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000'
SELECT document_object_id FROM Document_Subset_Members INNER JOIN Document_Subsets ON Document_Subset_Members.document_subset_id = Document_Subsets.document_subset_id WHERE Document_Subsets.document_subset_name = 'Best for 2000'
SELECT dsub.Document_Subset_Name, dsmem.Document_Object_ID FROM Document_Subsets AS dsub JOIN Document_Subset_Members AS dsmem ON dsub.Document_Subset_ID = dsmem.Document_Subset_ID
SELECT DS.Document_Subset_Name AS Subset_Name, DO.Document_Object_ID AS Document_ID FROM Document_Subsets AS DS JOIN Document_Subset_Members AS DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID JOIN Document_Objects AS DO ON DSM.Document_Object_ID = DO.Document_Object_ID
SELECT Collection_Name FROM Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Documents_in_Collections WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom'))
SELECT Collection_Name FROM Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Documents_in_Collections WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom'))
SELECT COUNT(DISTINCT Collection_ID) AS Collection_Count, Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT d.Document_Object_ID, COUNT(*) FROM Documents_in_Collections d GROUP BY d.Document_Object_ID
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections d, Collections c WHERE d.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Documents_in_Collections.Document_Object_ID) AS NumberOfDocuments FROM Documents_in_Collections INNER JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Document_Object_ID) FROM Documents_in_Collections, Collections WHERE Documents_in_Collections.Collection_ID = Collections.Collection_ID AND Collections.Collection_Name = 'Best'
SELECT C.Collection_Name, C.Collection_ID, COUNT(D.Document_Object_ID) AS NumberOfDocuments FROM Collections AS C LEFT JOIN Documents_in_Collections AS D ON C.Collection_ID = D.Collection_ID GROUP BY C.Collection_ID, C.Collection_Name HAVING COUNT(D.Document_Object_ID) = (SELECT MAX(Counted) FROM (SELECT COUNT(Document_Object_ID) AS Counted FROM Documents_in_Collections GROUP BY Collection_ID) AS SubQuery)
SELECT C.Collection_ID, C.Collection_Name, COUNT(D.Document_Object_ID) AS Document_Count FROM Collections AS C INNER JOIN Documents_in_Collections AS D ON C.Collection_ID = D.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID, C.Collection_Name ORDER BY Document_Count DESC LIMIT 1
SELECT D.Document_Object_ID FROM Document_Objects D WHERE EXISTS (SELECT 1 FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DSM.Document_Object_ID = D.Document_Object_ID AND DS.Document_Subset_Name = 'Best for 2000') AND EXISTS (SELECT 1 FROM Documents_in_Collections DIC JOIN Collections C ON DIC.Collection_ID = C.Collection_ID WHERE DIC.Document_Object_ID = D.Document_Object_ID AND C.Collection_Name = 'Best')
SELECT DISTINCT a.Document_Object_ID FROM (SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000') a JOIN (SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best') b ON a.Document_Object_ID = b.Document_Object_ID
SELECT DISTINCT d.Document_Object_ID FROM Documents_in_Collections d, Collections c WHERE d.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT dm.Document_Object_ID FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000')
SELECT DISTINCT d.Document_Object_ID FROM Documents_in_Collections d, Collections c WHERE d.Collection_ID = c.Collection_ID AND c.Collection_Name = 'Best' AND NOT EXISTS (SELECT 1 FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000' AND dm.Document_Object_ID = d.Document_Object_ID)
SELECT DISTINCT Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections DIC JOIN Collections C ON DIC.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT DISTINCT Document_Object_ID FROM Document_Subset_Members dsm LEFT JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections dic LEFT JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT c2.Collection_Name FROM Collections AS c1 JOIN Collection_Subset_Members AS csm ON c1.Collection_ID = csm.Collection_ID JOIN Collections AS c2 ON csm.Related_Collection_ID = c2.Collection_ID WHERE c1.Collection_Name = 'Best'
SELECT c2.Collection_Name FROM Collections c1 JOIN Collection_Subset_Members csm ON c1.Collection_ID = csm.Collection_ID JOIN Collections c2 ON csm.Related_Collection_ID = c2.Collection_ID WHERE c1.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') GROUP BY Collection_ID
SELECT CS.Collection_Subset_Name FROM Collection_Subsets CS WHERE EXISTS (SELECT 1 FROM Collection_Subset_Members CSM JOIN Collections C ON CSM.Collection_ID = C.Collection_ID WHERE CSM.Collection_Subset_ID = CS.Collection_Subset_ID AND C.Collection_Name = 'Best')
SELECT cs.Collection_Subset_Name FROM Collection_Subsets cs WHERE EXISTS (SELECT 1 FROM Collection_Subset_Members csm JOIN Collections c ON csm.Collection_ID = c.Collection_ID WHERE csm.Collection_Subset_ID = cs.Collection_Subset_ID AND c.Collection_Name = 'Best')
SELECT COUNT(*) AS count FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name ASC
SELECT s.name, s.language FROM songs s
SELECT MAX(voice_sound_quality) AS MaxQuality, MIN(voice_sound_quality) AS MinQuality FROM performance_score
SELECT ps.voice_sound_quality, ps.rhythm_tempo, ps.stage_presence FROM performance_score ps JOIN participants p ON ps.participant_id = p.id WHERE p.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name <> 'Love' AND name IS NOT NULL
SELECT songs.name, songs.original_artist FROM songs WHERE songs.english_translation LIKE 'All the streets of love'
SELECT DISTINCT stage_presence FROM performance_score INNER JOIN songs ON performance_score.songs_id = songs.id AND songs.language = 'English'
SELECT id, name FROM participants WHERE id IN (SELECT participant_id FROM performance_score GROUP BY participant_id HAVING COUNT(DISTINCT songs_id) >= 2)
SELECT p.id, p.name, p.popularity, (SELECT COUNT(*) FROM performance_score WHERE participant_id = p.id) AS songs_count FROM participants p ORDER BY songs_count DESC
SELECT p.id, p.name FROM participants p WHERE p.id IN (SELECT ps.participant_id FROM performance_score ps WHERE ps.voice_sound_quality = 5 OR ps.rhythm_tempo = 5)
SELECT voice_sound_quality FROM performance_score, songs WHERE performance_score.songs_id = songs.id AND songs.name = 'The Balkan Girls' AND songs.language = 'English'
SELECT S.id, S.name FROM songs S JOIN (SELECT songs_id, COUNT(participant_id) AS total_participants FROM performance_score GROUP BY songs_id) AS P ON S.id = P.songs_id WHERE total_participants = (SELECT MAX(total_participants) FROM (SELECT COUNT(participant_id) AS total_participants FROM performance_score GROUP BY songs_id) AS subquery)
SELECT COUNT(*) FROM performance_score WHERE stage_presence NOT BETWEEN 7 AND 9
SELECT COUNT(*) FROM songs s WHERE NOT EXISTS (SELECT 1 FROM performance_score p WHERE p.songs_id = s.id)
SELECT language, AVG(rhythm_tempo) FROM songs LEFT JOIN performance_score ON songs.id = performance_score.songs_id GROUP BY language
SELECT DISTINCT participants.name FROM participants JOIN performance_score ON participants.id = performance_score.participant_id JOIN songs ON songs.id = performance_score.songs_id AND songs.language = 'English'
SELECT P.name, P.popularity FROM participants P WHERE P.id IN (SELECT PS.participant_id FROM performance_score PS JOIN songs S ON PS.songs_id = S.id WHERE S.language = 'Croatian') AND P.id IN (SELECT PS.participant_id FROM performance_score PS JOIN songs S ON PS.songs_id = S.id WHERE S.language = 'English')
SELECT name FROM songs WHERE INSTR(name, 'Is') > 0
SELECT s.original_artist FROM songs s, performance_score p WHERE s.id = p.songs_id AND p.rhythm_tempo > 5 ORDER BY p.voice_sound_quality DESC
SELECT COUNT(*) AS NumberOfCities FROM City
SELECT COUNT(*) AS CityCount FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(*) FROM (SELECT country FROM City GROUP BY country) AS distinct_countries
SELECT COUNT(country) FROM (SELECT DISTINCT country FROM City) AS distinct_countries
SELECT C.city_name, C.city_code, C.state, C.country FROM City C
SELECT DISTINCT city_name, city_code, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name LIKE 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name LIKE 'Baltimore'
SELECT city_name AS CityName FROM City WHERE state = 'PA'
SELECT city_name AS CityName FROM City WHERE state = 'PA'
SELECT COUNT(city_name) FROM City WHERE country LIKE 'Canada'
SELECT COUNT(*) FROM City WHERE country LIKE 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude ASC
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude ASC
SELECT state, COUNT(city_name) FROM City GROUP BY state
SELECT state, COUNT(city_code) FROM City GROUP BY state
SELECT country, COUNT(city_name) AS num_cities FROM City GROUP BY country
SELECT country, COUNT(city_name) AS num_cities FROM City GROUP BY country
SELECT DISTINCT state FROM City GROUP BY state HAVING COUNT(city_name) > 1
SELECT DISTINCT state FROM City WHERE (SELECT COUNT(city_name) FROM City AS C WHERE C.state = City.state) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(city_name) = (SELECT MAX(city_count) FROM (SELECT state, COUNT(city_name) AS city_count FROM City GROUP BY state) AS counts)
WITH StateCounts AS (SELECT state, COUNT(*) AS city_count FROM City GROUP BY state) SELECT state FROM StateCounts WHERE city_count = (SELECT MAX(city_count) FROM StateCounts)
SELECT country FROM City GROUP BY country HAVING COUNT(city_name) = (SELECT MIN(city_count) FROM (SELECT COUNT(city_name) AS city_count FROM City GROUP BY country) AS subquery)
SELECT country FROM City GROUP BY country HAVING COUNT(city_name) = (SELECT MIN(city_count) FROM (SELECT country, COUNT(city_name) AS city_count FROM City GROUP BY country) AS sub)
SELECT Fname, LName FROM Student s JOIN City c ON s.city_code = c.city_code WHERE c.state = 'MD'
SELECT Student.Fname || ' ' || Student.LName AS FullName FROM Student LEFT JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT COUNT(DISTINCT Student.StuID) FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(1) FROM Student s JOIN City c ON s.city_code = c.city_code WHERE c.country = 'China'
SELECT Fname AS FirstName, Major AS MajorField FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT Fname AS FirstName, Major AS FieldOfStudy FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT country AS CountryName, COUNT(Student.StuID) AS TotalStudents FROM Student, City WHERE Student.city_code = City.city_code GROUP BY CountryName
SELECT country, COUNT(DISTINCT Student.StuID) FROM Student LEFT JOIN City ON Student.city_code = City.city_code GROUP BY country
SELECT City.city_name, COUNT(*) FROM City, Student WHERE City.city_code = Student.city_code GROUP BY City.city_name
SELECT c.city_name, COUNT(s.StuID) AS total_students FROM City AS c LEFT JOIN Student AS s ON c.city_code = s.city_code GROUP BY c.city_name
WITH StudentCounts AS (SELECT state, COUNT(*) AS total FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state) SELECT state FROM StudentCounts ORDER BY total DESC LIMIT 1
SELECT state FROM City, Student WHERE City.city_code = Student.city_code GROUP BY state HAVING COUNT(*) = (SELECT MAX(student_count) FROM (SELECT COUNT(*) AS student_count FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state) AS counts)
SELECT country FROM City, Student WHERE City.city_code = Student.city_code GROUP BY country HAVING COUNT(Student.StuID) = (SELECT MIN(count) FROM (SELECT COUNT(Student.StuID) as count FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country) AS counts)
SELECT country FROM City, Student WHERE City.city_code = Student.city_code GROUP BY country HAVING COUNT(Student.StuID) = (SELECT MIN(count) FROM (SELECT COUNT(Student.StuID) AS count FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY country) AS counts)
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT city_name FROM City WHERE city_code IN (SELECT city_code FROM Student GROUP BY city_code HAVING COUNT(*) >= 3)
SELECT C.state FROM City AS C, Student AS S WHERE C.city_code = S.city_code GROUP BY C.state HAVING COUNT(*) > 5
SELECT C.state FROM City C, Student S WHERE C.city_code = S.city_code GROUP BY C.state HAVING COUNT(*) > 5
SELECT Student.StuID FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country NOT IN ('USA')
SELECT Student.StuID FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country NOT IN ('USA')
SELECT Student.StuID FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'F' AND City.state = 'PA'
SELECT StuID FROM Student s, City c WHERE s.city_code = c.city_code AND s.Sex = 'female' AND c.state = 'PA'
SELECT s.StuID FROM Student s, City c WHERE s.city_code = c.city_code AND s.Sex = 'Male' AND c.country NOT IN ('USA')
SELECT DISTINCT StuID FROM Student s, City c WHERE s.city_code = c.city_code AND s.Sex = 'male' AND c.country <> 'USA'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') UNION SELECT distance FROM Direct_distance WHERE (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT d.distance FROM Direct_distance d WHERE (d.city1_code = 'BAL' AND d.city2_code = 'CHI') OR (d.city1_code = 'CHI' AND d.city2_code = 'BAL')
SELECT distance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark')
SELECT distance FROM Direct_distance WHERE (city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark')) OR (city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city1_code = (SELECT city_code FROM City WHERE city_name = 'Newark'))
SELECT AVG(distance) AS average_distance, MIN(distance) AS minimum_distance, MAX(distance) AS maximum_distance FROM Direct_distance
SELECT AVG(distance) as Average, MIN(distance) as Minimum, MAX(distance) as Maximum FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT AVG(D.distance) FROM Direct_distance D)
SELECT city2_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance <= 999
SELECT DISTINCT C.city_code FROM City C, Direct_distance D WHERE (C.city_code = D.city1_code OR C.city_code = D.city2_code) AND D.distance < 1000
SELECT SUM(D.distance) FROM Direct_distance D WHERE D.city1_code = 'BAL' OR D.city2_code = 'BAL'
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT AVG(D.distance) FROM Direct_distance D INNER JOIN City C ON D.city1_code = C.city_code AND C.city_name = 'Boston'
SELECT AVG(D.distance) FROM Direct_distance D, City C WHERE (D.city1_code = C.city_code AND C.city_name = 'Boston') OR (D.city2_code = C.city_code AND C.city_name = 'Boston')
SELECT city_name FROM City WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') AND distance = (SELECT MIN(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago')))
SELECT city_name FROM City WHERE city_code IN (SELECT city2_code FROM Direct_distance JOIN City ON City.city_code = Direct_distance.city1_code WHERE city_name = 'Chicago' ORDER BY distance LIMIT 1)
SELECT city_name FROM City WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city_name FROM City WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY distance DESC LIMIT 1)
SELECT city_code, SUM(distance) AS total_distance FROM City, Direct_distance WHERE City.city_code = Direct_distance.city1_code GROUP BY city_code
SELECT city_code, SUM(distance) FROM (SELECT city1_code AS city_code, distance FROM Direct_distance UNION SELECT city2_code AS city_code, distance FROM Direct_distance) AS distances GROUP BY city_code
SELECT C.city_name, AVG(D.distance) AS avg_distance FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT city_name, AVG(distance) AS average_distance FROM (SELECT city_name, distance FROM City JOIN Direct_distance ON city_code = city1_code UNION ALL SELECT city_name, distance FROM City JOIN Direct_distance ON city_code = city2_code) AS subquery GROUP BY city_name
SELECT distance FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city2_code IN (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim')
SELECT distance FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city2_code IN (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim')
SELECT Fname, LName FROM Student WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith')))
SELECT Fname, LName FROM Student WHERE city_code = (SELECT city2_code FROM Direct_distance D INNER JOIN (SELECT MAX(distance) AS MaxDistance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith')) AS MaxD ON D.distance = MaxD.MaxDistance)
SELECT DISTINCT state FROM City JOIN Student ON City.city_code = Student.city_code WHERE Student.Fname = 'Linda'
SELECT DISTINCT state FROM City JOIN Student ON City.city_code = Student.city_code WHERE Student.Fname = 'Linda'
SELECT Sailors.sid, Sailors.name, Sailors.rating, Sailors.age FROM Sailors WHERE Sailors.age > 30
SELECT Sailors.* FROM Sailors WHERE Sailors.age > 30
SELECT name AS SailorName, age AS SailorAge FROM Sailors WHERE age < 30
SELECT name AS SailorName, age AS SailorAge FROM Sailors WHERE age < 30
SELECT name FROM Boats WHERE bid IN (SELECT bid FROM Reserves WHERE sid = 1)
SELECT DISTINCT(bid) FROM Reserves WHERE sid = 1
SELECT S.name FROM Sailors S WHERE EXISTS (SELECT NULL FROM Reserves R WHERE R.sid = S.sid AND R.bid = 102)
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Reserves.sid = Sailors.sid AND bid = 102)
SELECT DISTINCT Boats.bid FROM Boats WHERE Boats.bid IN (SELECT Reserves.bid FROM Reserves)
SELECT bid FROM Boats WHERE bid IN (SELECT DISTINCT bid FROM Reserves)
SELECT Sailors.name FROM Sailors WHERE Sailors.name LIKE '%e%'
SELECT Sailors.name FROM Sailors WHERE Sailors.name LIKE '%e%'
SELECT sid FROM Sailors WHERE age = (SELECT age FROM Sailors ORDER BY age DESC LIMIT 1)
SELECT S.sid FROM Sailors S WHERE S.age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT S.name FROM Sailors S WHERE S.age > (SELECT MAX(S2.age) FROM Sailors S2 WHERE S2.rating > 7 AND S2.sid != S.sid)
SELECT DISTINCT name FROM Sailors AS S1 WHERE S1.age > (SELECT AVG(age) FROM Sailors AS S2 WHERE S2.rating > 7)
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid
SELECT DISTINCT S.sid, S.name FROM Sailors S INNER JOIN Reserves R ON S.sid = R.sid
SELECT s.sid, s.name FROM Sailors s, Reserves r WHERE s.sid = r.sid GROUP BY s.sid, s.name HAVING COUNT(DISTINCT r.bid) > 1
SELECT name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves R GROUP BY R.sid HAVING COUNT(DISTINCT R.bid) >= 2)
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' OR b.color = 'blue'
SELECT s.sid FROM Sailors s WHERE EXISTS (SELECT 1 FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE r.sid = s.sid AND b.color IN ('red', 'blue'))
SELECT name, sid FROM Sailors WHERE sid IN (SELECT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color IN ('red', 'blue'))
SELECT sid, name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE color = 'red' OR color = 'blue'))
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red') INTERSECT SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE b.color = 'blue')
SELECT sid FROM Sailors s WHERE EXISTS (SELECT * FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE b.color = 'red' AND r.sid = s.sid) AND EXISTS (SELECT * FROM Reserves r JOIN Boats b ON r.bid = b.bid WHERE b.color = 'blue' AND r.sid = s.sid)
WITH RedBoats AS (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'red'), BlueBoats AS (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'blue') SELECT S.sid, S.name FROM Sailors S WHERE S.sid IN (SELECT sid FROM RedBoats) AND S.sid IN (SELECT sid FROM BlueBoats)
SELECT S.sid, S.name FROM Sailors S WHERE S.sid IN (SELECT R.sid FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' UNION SELECT R.sid FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE B.color = 'blue')
SELECT sid FROM Sailors AS S WHERE NOT EXISTS (SELECT * FROM Reserves AS R WHERE R.sid = S.sid)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT S.name, S.sid FROM Sailors S WHERE NOT EXISTS (SELECT 1 FROM Reserves R WHERE R.sid = S.sid)
SELECT Sailors.name, Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors AS S WHERE NOT EXISTS (SELECT * FROM Reserves AS R WHERE R.sid = S.sid)
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Reserves.sid = Sailors.sid AND bid = 103)
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves WHERE Reserves.sid = Sailors.sid AND bid = 103)
SELECT s.name FROM Sailors s WHERE s.rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis')
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(S2.rating) FROM Sailors S2 WHERE S2.name = 'Luis') AND S.name <> 'Luis'
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(rating) FROM Sailors WHERE name = 'Luis' GROUP BY name)
SELECT Sailors.name FROM Sailors WHERE Sailors.rating > (SELECT MAX(Sailors.rating) FROM Sailors WHERE Sailors.name = 'Luis')
SELECT sid, name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves) AND rating > 2
SELECT s.sid, s.name FROM Sailors s WHERE s.rating >= 3 AND EXISTS (SELECT 1 FROM Reserves r WHERE r.sid = s.sid)
SELECT name, age FROM Sailors AS S WHERE S.age = (SELECT MAX(age) FROM Sailors AS S2)
SELECT name, age FROM Sailors AS S WHERE S.age = (SELECT MAX(age) FROM Sailors AS S2)
SELECT COUNT(DISTINCT sid) FROM Sailors
SELECT COUNT(DISTINCT Sailors.sid) FROM Sailors
SELECT AVG(age) FROM Sailors WHERE rating = '7'
SELECT AVG(age) AS Average_Age FROM Sailors WHERE rating = 7
SELECT COUNT(DISTINCT sid) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(DISTINCT sid) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating) average_rating, MAX(age) max_age FROM Sailors
SELECT AVG(rating), MAX(age) FROM Sailors
SELECT name, COUNT(Reserves.bid) AS reservation_count FROM Boats LEFT OUTER JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY name
SELECT B.name AS BoatName, COUNT(R.bid) AS NumberOfReservations FROM Boats B LEFT JOIN Reserves R ON B.bid = R.bid GROUP BY B.name, B.bid
SELECT bid, COUNT(*) AS num_reservations FROM Reserves WHERE bid > 50 GROUP BY bid
SELECT bid, COUNT(sid) FROM Reserves WHERE bid IN (SELECT bid FROM Boats WHERE bid > 50) GROUP BY bid
SELECT name, COUNT(Reserves.bid) AS num_reservations FROM Boats LEFT JOIN Reserves ON Boats.bid = Reserves.bid GROUP BY Boats.bid HAVING COUNT(Reserves.bid) > 1
SELECT bid, COUNT(bid) AS TotalReservations FROM Reserves GROUP BY bid HAVING TotalReservations > 1
SELECT B.bid, COUNT(*) AS reservation_count FROM Boats B LEFT JOIN (Reserves R INNER JOIN Sailors S ON R.sid = S.sid AND S.sid > 1) ON B.bid = R.bid GROUP BY B.bid
SELECT B.name, COUNT(R.bid) FROM Boats B LEFT JOIN Reserves R ON B.bid = R.bid LEFT JOIN Sailors S ON R.sid = S.sid WHERE S.sid > 1 GROUP BY B.name
SELECT Sailors.rating, AVG(Sailors.age) AS Average_Age FROM Sailors INNER JOIN Reserves ON Sailors.sid = Reserves.sid INNER JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.color = 'red' GROUP BY Sailors.rating
SELECT Sailors.rating, AVG(Sailors.age) AS AvgAge FROM Sailors, Reserves, Boats WHERE Sailors.sid = Reserves.sid AND Reserves.bid = Boats.bid AND Boats.color = 'red' GROUP BY Sailors.rating
SELECT name, rating, age FROM Sailors ORDER BY rating ASC, age ASC
SELECT Sailors.name, Sailors.rating, Sailors.age FROM Sailors ORDER BY Sailors.rating ASC, Sailors.age ASC
SELECT COUNT(*) FROM Boats AS total_number_of_boats
SELECT COUNT(1) FROM Boats
SELECT COUNT(*) AS NumberOfRedBoats FROM Boats WHERE color = 'red'
SELECT COUNT(bid) AS red_boat_count FROM Boats WHERE color = 'red'
SELECT B.name FROM Boats B WHERE B.bid IN (SELECT R.bid FROM Reserves R INNER JOIN Sailors S ON R.sid = S.sid WHERE S.age BETWEEN 20 AND 30)
SELECT B.name FROM Boats B JOIN (SELECT R.bid FROM Reserves R JOIN Sailors S ON R.sid = S.sid WHERE S.age BETWEEN 20 AND 30) AS Filtered ON B.bid = Filtered.bid
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(rating) FROM Sailors, Reserves, Boats WHERE Sailors.sid = Reserves.sid AND Reserves.bid = Boats.bid AND Boats.color = 'red')
SELECT S.name FROM Sailors S WHERE NOT EXISTS (SELECT 1 FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' AND S2.rating >= S.rating)
SELECT rating FROM Sailors ORDER BY rating DESC LIMIT 1
SELECT rating FROM Sailors ORDER BY rating DESC LIMIT 1
SELECT name FROM Sailors WHERE sid IN (SELECT Reserves.sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Boats.name = 'Melon')
SELECT name FROM Sailors WHERE EXISTS (SELECT 1 FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE Reserves.sid = Sailors.sid AND Boats.name = 'Melon')
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Model FROM headphone WHERE Price IN (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price IN (SELECT MAX(Price) FROM headphone)
SELECT DISTINCT Model FROM headphone ORDER BY Model COLLATE NOCASE
SELECT Model FROM headphone WHERE Model IS NOT NULL GROUP BY Model ORDER BY Model ASC
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) as cnt FROM headphone GROUP BY Class) tmp)
SELECT Class FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID GROUP BY Class ORDER BY SUM(Quantity) DESC LIMIT 1
SELECT Class FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID HAVING COUNT(*) > 2)
SELECT Class FROM headphone h WHERE NOT EXISTS (SELECT NULL FROM stock s WHERE s.Headphone_ID = h.Headphone_ID GROUP BY s.Headphone_ID HAVING SUM(s.Quantity) > 2)
SELECT h.Class, COUNT(h.Headphone_ID) FROM headphone h WHERE h.Price > 200 GROUP BY h.Class
SELECT Class, COUNT(*) AS NumberOfHeadphones FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(*) FROM (SELECT DISTINCT Earpads FROM headphone WHERE Earpads != '') AS non_empty_earpads
SELECT COUNT(*) FROM (SELECT Earpads FROM headphone GROUP BY Earpads)
SELECT H.Earpads FROM headphone H JOIN stock S ON H.Headphone_ID = S.Headphone_ID GROUP BY H.Earpads ORDER BY SUM(S.Quantity) DESC LIMIT 2
SELECT Earpads, COUNT(Headphone_ID) AS Total_Headphones FROM headphone GROUP BY Earpads ORDER BY Total_Headphones DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Construction, AVG(Price) AS Average_Price FROM headphone GROUP BY Construction
SELECT Construction, ROUND(AVG(Price), 2) AS Avg_Price FROM headphone GROUP BY Construction
SELECT Class FROM (SELECT Class, COUNT(DISTINCT Earpads) AS EarpadTypes FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class) AS SubQuery WHERE EarpadTypes = 2
SELECT Class FROM (SELECT Class, COUNT(DISTINCT Earpads) AS EarpadTypes FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class) AS SubQuery WHERE EarpadTypes = 2
SELECT DISTINCT Earpads FROM headphone WHERE NOT Construction = 'plastic'
SELECT Earpads FROM headphone WHERE Construction NOT LIKE '%plastic%'
SELECT Model FROM headphone WHERE Price < (SELECT AVG(h.Price) FROM headphone h)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(h.Price) FROM headphone h)
SELECT store.Name FROM store ORDER BY store.Date_Opened ASC
SELECT store.Name FROM store ORDER BY store.Date_Opened ASC
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana' AND Parking IS NOT NULL
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana' AND Parking IS NOT NULL
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(Store_ID), Neighborhood FROM store GROUP BY Neighborhood
SELECT COUNT(Store_ID) AS NumberOfStores, Neighborhood FROM store GROUP BY Neighborhood
SELECT S.Name, SUM(ST.Quantity) AS Total_Headphones FROM store S LEFT JOIN stock ST ON S.Store_ID = ST.Store_ID GROUP BY S.Store_ID HAVING SUM(ST.Quantity) = (SELECT MAX(Total) FROM (SELECT SUM(Quantity) AS Total FROM stock GROUP BY Store_ID) Temp)
SELECT store.Name, AggregateQuantity FROM store JOIN (SELECT Store_ID, SUM(Quantity) AS AggregateQuantity FROM stock GROUP BY Store_ID) AS StockInfo ON store.Store_ID = StockInfo.Store_ID
SELECT s.Name FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock st WHERE st.Quantity > 0)
SELECT s.Name FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT Model FROM headphone WHERE NOT EXISTS (SELECT 1 FROM stock WHERE stock.Headphone_ID = headphone.Headphone_ID AND stock.Quantity > 0)
SELECT h.Model FROM headphone h WHERE h.Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT Model FROM headphone H WHERE EXISTS (SELECT 1 FROM stock S WHERE S.Headphone_ID = H.Headphone_ID GROUP BY S.Headphone_ID HAVING SUM(S.Quantity) = (SELECT MAX(Total) FROM (SELECT SUM(Quantity) AS Total FROM stock GROUP BY Headphone_ID) AS Sub))
SELECT TOTAL(stock.Quantity) FROM stock, store WHERE stock.Store_ID = store.Store_ID AND store.Name = 'Woodman'
SELECT TOTAL(stock.Quantity) FROM stock, store WHERE stock.Store_ID = store.Store_ID AND store.Name = 'Woodman'
SELECT Neighborhood FROM store EXCEPT SELECT Neighborhood FROM store JOIN stock ON store.Store_ID = stock.Store_ID WHERE stock.Quantity > 0
SELECT DISTINCT s.Neighborhood FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT COUNT(author_id) FROM Author
SELECT COUNT(author_id) FROM Author
SELECT COUNT(DISTINCT paper_id) FROM Paper
SELECT COUNT(DISTINCT paper_id) FROM Paper
SELECT COUNT(affiliation_id) AS AffiliationCount FROM Affiliation
SELECT COUNT(DISTINCT Affiliation.affiliation_id) FROM Affiliation
SELECT COUNT(*) FROM Paper p WHERE p.venue = 'NAACL' AND p.year = 2000
SELECT COUNT(DISTINCT paper_id) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University')) AND year = 2009
SELECT COUNT(*) FROM (SELECT Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year = 2009) AS temp
SELECT Affiliation.name AS Name, Affiliation.address AS Address FROM Affiliation
SELECT Affiliation.name, Affiliation.address FROM Affiliation WHERE address <> ''
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT venue FROM Paper ORDER BY Paper.year
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Harvard University'
SELECT title, paper_id FROM Paper WHERE EXISTS (SELECT 1 FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Author_list.paper_id = Paper.paper_id AND Affiliation.name = 'Harvard University')
SELECT title, paper_id FROM Paper p WHERE p.paper_id IN (SELECT al.paper_id FROM Author_list al JOIN Author a ON al.author_id = a.author_id WHERE a.name = 'Mckeown')
SELECT paper_id, title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id IN (SELECT author_id FROM Author WHERE name = 'Mckeown'))
SELECT P.title, P.paper_id FROM Paper P INNER JOIN (SELECT paper_id FROM Author_list WHERE affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Stanford University')) AS S ON P.paper_id = S.paper_id INNER JOIN (SELECT paper_id FROM Author_list WHERE affiliation_id IN (SELECT affiliation_id FROM Affiliation WHERE name = 'Columbia University')) AS C ON P.paper_id = C.paper_id
SELECT P.title, P.paper_id FROM Paper P INNER JOIN Author_list A ON P.paper_id = A.paper_id INNER JOIN Affiliation AF ON A.affiliation_id = AF.affiliation_id WHERE AF.name IN ('Stanford', 'Columbia University') GROUP BY P.paper_id HAVING COUNT(DISTINCT AF.name) = 2
SELECT P.title, P.paper_id FROM Paper P JOIN (SELECT AL.paper_id FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY AL.paper_id HAVING COUNT(DISTINCT A.name) = 2) AS CoAuthored ON P.paper_id = CoAuthored.paper_id
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown, Kathleen' OR A.name = 'Rambow, Owen' GROUP BY P.paper_id HAVING COUNT(DISTINCT A.author_id) = 2
SELECT P.title, P.paper_id FROM Paper P WHERE EXISTS (SELECT * FROM Author_list A JOIN Author B ON A.author_id = B.author_id WHERE B.name = 'Mckeown' AND A.paper_id = P.paper_id) AND NOT EXISTS (SELECT * FROM Author_list C JOIN Author D ON C.author_id = D.author_id WHERE D.name = 'Rambow' AND C.paper_id = P.paper_id)
SELECT title, paper_id FROM Paper WHERE EXISTS (SELECT * FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Mckeown' AND paper_id = Paper.paper_id) AND NOT EXISTS (SELECT * FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Rambow' AND paper_id = Paper.paper_id)
SELECT P.title, P.paper_id FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND (A.name = 'Mckeown, Kathleen' OR A.name = 'Rambow, Owen')
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT name, COUNT(paper_id) AS num_papers FROM Author LEFT JOIN Author_list ON Author.author_id = Author_list.author_id GROUP BY name ORDER BY num_papers DESC
SELECT A.name, COUNT(DISTINCT P.paper_id) AS NumOfPapers FROM Author A LEFT JOIN Author_list AL ON A.author_id = AL.author_id LEFT JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.author_id ORDER BY NumOfPapers DESC
SELECT A.name, COUNT(AL.paper_id) AS PaperCount FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY A.name ORDER BY PaperCount ASC
SELECT DISTINCT Affiliation.name FROM Affiliation LEFT JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id GROUP BY Affiliation.name ORDER BY COUNT(Author_list.paper_id) DESC
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) > 50)
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) > 50)
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(*) = 1)
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(*) = 1)
SELECT venue, year FROM Paper GROUP BY venue, year HAVING COUNT(paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(paper_id) AS count FROM Paper GROUP BY venue, year) AS counts)
SELECT venue, year FROM Paper GROUP BY venue, year HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Paper GROUP BY venue, year) AS counts)
SELECT venue FROM Paper GROUP BY venue HAVING COUNT(paper_id) = (SELECT MIN(count) FROM (SELECT COUNT(paper_id) AS count FROM Paper GROUP BY venue) AS counts)
SELECT venue FROM (SELECT venue, COUNT(*) AS num_papers FROM Paper GROUP BY venue) AS venue_counts WHERE num_papers = (SELECT MIN(num_papers) FROM (SELECT COUNT(*) AS num_papers FROM Paper GROUP BY venue) AS counts)
SELECT COUNT(1) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(paper_id) FROM Citation c WHERE c.cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027' AND cited_paper_id IS NOT NULL
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT cited_paper_id, COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY cited_paper_id HAVING COUNT(cited_paper_id) = (SELECT MAX(citation_count) FROM (SELECT COUNT(cited_paper_id) AS citation_count FROM Citation GROUP BY cited_paper_id) AS subquery)
SELECT cited_paper_id AS MostCitedPaperID, MAX(citation_count) AS MaxCitations FROM (SELECT cited_paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY cited_paper_id) AS CitationCounts
SELECT P.title FROM Paper P WHERE EXISTS (SELECT 1 FROM Citation C WHERE C.paper_id = P.paper_id GROUP BY C.paper_id HAVING COUNT(C.cited_paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(*) count FROM Citation GROUP BY paper_id) AS sub))
SELECT P.title FROM Paper P WHERE P.paper_id = (SELECT C.paper_id FROM Citation C GROUP BY C.paper_id ORDER BY COUNT(*) DESC LIMIT 1)
sql placeholder
sql placeholder
SELECT COUNT(*) FROM Citation C, Paper P, Author_list AL, Author A WHERE C.paper_id = P.paper_id AND P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT C.cited_paper_id) FROM Citation C, Paper P, Author_list AL, Author A WHERE C.paper_id = P.paper_id AND P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT C.cited_paper_id) AS TotalCitations FROM Author A, Author_list AL, Citation C WHERE A.author_id = AL.author_id AND AL.paper_id = C.paper_id AND A.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT C.cited_paper_id) FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id INNER JOIN Citation C ON AL.paper_id = C.paper_id WHERE A.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(C.cited_paper_id) AS citation_count FROM Author A, Author_list AL, Citation C WHERE A.author_id = AL.author_id AND AL.paper_id = C.cited_paper_id GROUP BY A.author_id HAVING citation_count = (SELECT MAX(citation_count) FROM (SELECT COUNT(C.cited_paper_id) AS citation_count FROM Author_list AL JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY AL.author_id) AS subquery)
SELECT A.name, citation_count FROM Author AS A JOIN (SELECT AL.author_id, COUNT(C.cited_paper_id) AS citation_count FROM Author_list AS AL JOIN Citation AS C ON AL.paper_id = C.cited_paper_id GROUP BY AL.author_id HAVING COUNT(C.cited_paper_id) = (SELECT MAX(citation_count) FROM (SELECT COUNT(C.cited_paper_id) AS citation_count FROM Author_list AS AL JOIN Citation AS C ON AL.paper_id = C.cited_paper_id GROUP BY AL.author_id) AS SubQuery)) AS MaxCitations ON A.author_id = MaxCitations.author_id
SELECT venue, year FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name LIKE '%Mckeown, Kathleen%'))
SELECT venue, year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name LIKE 'Mckeown, Kathleen'
SELECT venue, year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University' GROUP BY venue, year
SELECT venue, year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University' GROUP BY venue, year
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name HAVING COUNT(P.paper_id) = (SELECT MAX(paper_count) FROM (SELECT COUNT(P.paper_id) AS paper_count FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id WHERE P.year = 2009 GROUP BY AL.author_id) AS T)
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.author_id HAVING COUNT(P.paper_id) = (SELECT MAX(num_papers) FROM (SELECT COUNT(P.paper_id) AS num_papers FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY AL.author_id) T)
SELECT name FROM (SELECT A.name, COUNT(P.paper_id) AS cnt FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name) AS SubQuery ORDER BY cnt DESC LIMIT 3
SELECT name FROM (SELECT Affiliation.name, COUNT(Paper.paper_id) AS paper_count FROM Affiliation JOIN Author_list ON Affiliation.affiliation_id = Author_list.affiliation_id JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE Paper.year = 2009 GROUP BY Affiliation.name ORDER BY paper_count DESC) AS subquery LIMIT 3
SELECT COUNT(paper_id) FROM Paper p WHERE p.year <= 2009 AND EXISTS (SELECT 1 FROM Author_list al JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE al.paper_id = p.paper_id AND a.name = 'Columbia University')
SELECT COUNT(DISTINCT p.paper_id) FROM Paper p JOIN Author_list al ON p.paper_id = al.paper_id JOIN Affiliation a ON al.affiliation_id = a.affiliation_id WHERE a.name = 'Columbia University' AND p.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Stanford University' AND Paper.year >= 2000 AND Paper.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper, Author_list, Affiliation WHERE Paper.paper_id = Author_list.paper_id AND Author_list.affiliation_id = Affiliation.affiliation_id AND Affiliation.name = 'Stanford University' AND Paper.year > 1999 AND Paper.year < 2010
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list GROUP BY paper_id HAVING COUNT(author_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(author_id) AS cnt FROM Author_list GROUP BY paper_id) T))
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list GROUP BY paper_id HAVING COUNT(author_id) = (SELECT MAX(count) FROM (SELECT COUNT(author_id) AS count FROM Author_list GROUP BY paper_id) AS counts))
SELECT COUNT(DISTINCT AL2.author_id) FROM Author_list AL1, Author_list AL2 WHERE AL1.paper_id = AL2.paper_id AND AL1.author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen') AND AL2.author_id != AL1.author_id
SELECT COUNT(DISTINCT T2.author_id) FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T1.name = 'Mckeown, Kathleen' AND T2.author_id != T1.author_id
SELECT name FROM Author WHERE author_id = (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = (SELECT MAX(count) FROM (SELECT COUNT(paper_id) AS count FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) GROUP BY author_id)))
WITH CoAuthors AS (SELECT AL.author_id FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE AL.paper_id IN (SELECT AL2.paper_id FROM Author_list AL2 JOIN Author A2 ON AL2.author_id = A2.author_id WHERE A2.name = 'Mckeown, Kathleen')) SELECT A.name FROM Author A JOIN CoAuthors C ON A.author_id = C.author_id GROUP BY A.author_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT Paper.paper_id FROM Paper WHERE Paper.title LIKE '%translation%'
SELECT Paper.paper_id FROM Paper WHERE Paper.title LIKE '%translation%'
SELECT paper_id, title FROM Paper WHERE NOT EXISTS (SELECT 1 FROM Citation WHERE cited_paper_id = Paper.paper_id)
SELECT DISTINCT p.paper_id, p.title FROM Paper p LEFT JOIN Citation c ON p.paper_id = c.cited_paper_id WHERE c.cited_paper_id IS NULL
SELECT A.name FROM (SELECT AF.name, COUNT(AL.paper_id) AS total_papers FROM Affiliation AF JOIN Author_list AL ON AF.affiliation_id = AL.affiliation_id WHERE AF.address LIKE '%China%' GROUP BY AF.name ORDER BY total_papers DESC LIMIT 1) A
SELECT A.name FROM Affiliation A WHERE A.affiliation_id = (SELECT AL.affiliation_id FROM Author_list AL JOIN Affiliation AF ON AL.affiliation_id = AF.affiliation_id WHERE AF.address LIKE '%China%' GROUP BY AL.affiliation_id ORDER BY COUNT(AL.paper_id) DESC LIMIT 1)
SELECT venue, year, COUNT(*) AS count_of_papers FROM Paper GROUP BY venue, year ORDER BY count_of_papers
SELECT venue, year, COUNT(paper_id) AS paper_total FROM Paper GROUP BY venue, year ORDER BY year, venue
SELECT A.name, COUNT(DISTINCT P.paper_id) AS total_papers FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id, A.name
SELECT A.name AS Affiliation, COUNT(DISTINCT P.paper_id) AS Papers_Published FROM Affiliation A LEFT OUTER JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id LEFT OUTER JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id, A.name
SELECT title FROM Paper WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(cited_paper_id) > 50)
SELECT title FROM Paper WHERE EXISTS (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(cited_paper_id) > 50 AND Paper.paper_id = Citation.cited_paper_id)
SELECT COUNT(DISTINCT A.author_id) FROM Author A WHERE NOT EXISTS (SELECT NULL FROM Author_list AL JOIN Citation C ON AL.paper_id = C.cited_paper_id WHERE A.author_id = AL.author_id GROUP BY C.cited_paper_id HAVING COUNT(*) > 50)
SELECT COUNT(*) FROM (SELECT author_id FROM Author EXCEPT SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50)) AS Result
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'NAACL' AND year = 2009 UNION SELECT paper_id FROM Paper WHERE venue = 'ACL' AND year = 2009))
SELECT name FROM Author WHERE author_id IN (SELECT AL.author_id FROM Author_list AL, Paper P WHERE AL.paper_id = P.paper_id AND P.venue = 'NAACL' AND P.year = 2009) INTERSECT SELECT name FROM Author WHERE author_id IN (SELECT AL.author_id FROM Author_list AL, Paper P WHERE AL.paper_id = P.paper_id AND P.venue = 'ACL' AND P.year = 2009)
SELECT A.name FROM Author A WHERE NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND AL.author_id = A.author_id)
SELECT DISTINCT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list, Paper WHERE Author_list.paper_id = Paper.paper_id AND Paper.venue = 'ACL')
SELECT COUNT(1) FROM conference
SELECT COUNT(*) AS Total_Number_of_Conferences FROM conference
SELECT DISTINCT Conference_Name FROM conference WHERE Conference_Name IS NOT NULL
SELECT Conference_Name FROM conference GROUP BY Conference_Name HAVING COUNT(*) >= 1
SELECT conference.Conference_Name, conference.Year, conference.Location FROM conference
SELECT `Conference_Name`, `Year`, `Location` FROM `conference`
SELECT c.Conference_Name, COUNT(cp.Conference_ID) AS Num_Times_Participated FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name
SELECT Conference_Name, COUNT(*) AS occurrences FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT COUNT(Conference_ID), Year FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year HAVING COUNT(*) = (SELECT MIN(c) FROM (SELECT COUNT(*) AS c FROM conference GROUP BY Year) AS counts)
SELECT Year FROM conference GROUP BY Year HAVING COUNT(*) = (SELECT MIN(c) FROM (SELECT COUNT(*) AS c FROM conference GROUP BY Year) t)
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT i.Institution_Name, i.Location, i.Founded FROM institution i
SELECT Institution_Name AS Name, Location AS Location, Founded AS 'Founding Year' FROM institution
SELECT COUNT(*) FROM institution WHERE Founded > 1849 AND Founded < 1901
SELECT COUNT(Institution_ID) AS Count FROM institution WHERE Founded > 1849 AND Founded < 1901
SELECT i.Institution_Name, i.Location FROM institution i WHERE i.Founded = (SELECT MAX(Founded) FROM institution)
SELECT i.Institution_Name, i.Location FROM institution i WHERE i.Founded = (SELECT MAX(Founded) FROM institution)
SELECT I.Institution_Name, COUNT(S.staff_ID) AS StaffTotal FROM institution I LEFT OUTER JOIN staff S ON I.Institution_ID = S.Institution_ID WHERE I.Founded > 1800 GROUP BY I.Institution_Name
SELECT I.Institution_ID, COUNT(S.staff_ID) AS Staff_Count, GROUP_CONCAT(S.name) AS Staff_Names FROM institution I JOIN staff S ON I.Institution_ID = S.Institution_ID WHERE I.Founded > 1800 GROUP BY I.Institution_ID
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff)
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff)
SELECT s.name FROM staff AS s WHERE s.Age > (SELECT AVG(s.Age) FROM staff AS s)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff WHERE Age > 0)
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT MAX(staff.Age) AS MaximumAge, MIN(staff.Age) AS MinimumAge FROM staff
SELECT Conference_Name FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation WHERE staff_ID IN (SELECT staff_ID FROM staff WHERE Nationality = 'Canada'))
SELECT Conference_Name FROM conference WHERE Conference_ID IN (SELECT Conference_ID FROM conference_participation WHERE staff_ID IN (SELECT staff_ID FROM staff WHERE Nationality = 'Canada'))
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker') INTERSECT SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT DISTINCT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role IN ('speaker', 'sponsor') GROUP BY staff_ID HAVING COUNT(DISTINCT role) = 2)
WITH ACL_Participants AS (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')), Naccl_Participants AS (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'Naccl')) SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM ACL_Participants INTERSECT SELECT staff_ID FROM Naccl_Participants)
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')) AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'NACCL'))
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation cp INNER JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2003 OR c.Year = 2004)
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Year IN (2003, 2004)))
SELECT c.Conference_Name AS Name, c.Year AS Year, COUNT(cp.staff_ID) AS Participant_Count FROM conference c LEFT JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name, c.Year
SELECT Conference_ID, Conference_Name, Year, (SELECT COUNT(*) FROM conference_participation cp WHERE cp.Conference_ID = conference.Conference_ID) AS Participants FROM conference
SELECT Conference_Name FROM conference c JOIN (SELECT Conference_ID, COUNT(*) as total FROM conference_participation GROUP BY Conference_ID ORDER BY total DESC LIMIT 2) cp ON c.Conference_ID = cp.Conference_ID
SELECT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name ORDER BY COUNT(DISTINCT cp.staff_ID) DESC LIMIT 2
SELECT s.name, s.Nationality FROM staff s WHERE NOT EXISTS (SELECT NULL FROM conference_participation cp INNER JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL' AND s.staff_ID = cp.staff_ID)
SELECT DISTINCT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Conference_Name = 'ACL')
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills LIMIT 1)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills LIMIT 1)
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT AVG(age) FROM PilotSkills) ORDER BY age ASC
SELECT P.pilot_name FROM PilotSkills P WHERE P.age < (SELECT AVG(age) FROM PilotSkills) ORDER BY P.age ASC
SELECT PilotSkills.* FROM PilotSkills WHERE age < 30
SELECT pilot_name, plane_name, age FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age BETWEEN 1 AND 34
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT Hangar.location FROM Hangar WHERE Hangar.plane_name = 'F-14 Fighter'
SELECT H.location FROM Hangar H WHERE H.plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar WHERE plane_name IS NOT NULL
SELECT COUNT(DISTINCT location) AS NumberOfLocations FROM Hangar
SELECT p.plane_name FROM PilotSkills p WHERE p.pilot_name = 'Jones' AND p.age = 32
SELECT H.plane_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name AND P.pilot_name = 'Jones' AND P.age = 32
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40 GROUP BY pilot_name
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40 AND pilot_name IS NOT NULL
SELECT COUNT(DISTINCT Hangar.plane_name) FROM Hangar, PilotSkills WHERE Hangar.plane_name = PilotSkills.plane_name AND PilotSkills.age < 35 AND Hangar.plane_name = 'B-52 Bomber'
SELECT COUNT(*) FROM (SELECT h.plane_name FROM Hangar h JOIN PilotSkills p ON h.plane_name = p.plane_name WHERE p.age < 35 AND h.plane_name = 'B-52') AS subquery
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') AND plane_name = 'Piper Cub'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT H.plane_name FROM Hangar H, PilotSkills P WHERE H.plane_name = P.plane_name GROUP BY H.plane_name HAVING COUNT(P.pilot_name) = (SELECT MAX(COUNT) FROM (SELECT COUNT(P.pilot_name) AS COUNT FROM PilotSkills P GROUP BY P.plane_name) AS T)
WITH PlaneFrequency AS (SELECT plane_name, COUNT(*) AS frequency FROM PilotSkills GROUP BY plane_name) SELECT plane_name FROM PlaneFrequency WHERE frequency = (SELECT MAX(frequency) FROM PlaneFrequency)
SELECT H.plane_name FROM Hangar H LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name ORDER BY COUNT(P.pilot_name) ASC LIMIT 1
WITH PlaneUsage AS (SELECT plane_name, COUNT(*) AS usage_count FROM PilotSkills GROUP BY plane_name) SELECT plane_name FROM PlaneUsage WHERE usage_count = (SELECT MIN(usage_count) FROM PlaneUsage)
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills LEFT JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills LEFT JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Smith' AND age = 41 AND plane_name IN (SELECT plane_name FROM Hangar)
SELECT plane_name FROM Hangar WHERE EXISTS (SELECT 1 FROM PilotSkills WHERE Hangar.plane_name = PilotSkills.plane_name AND pilot_name = 'Smith' AND age = 41)
SELECT COUNT(plane_name) FROM (SELECT DISTINCT plane_name FROM PilotSkills) AS unique_planes
SELECT COUNT(*) FROM (SELECT DISTINCT plane_name FROM PilotSkills) AS unique_planes
SELECT COUNT(DISTINCT H.plane_name) FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Smith'
SELECT COUNT(DISTINCT H.plane_name) FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Smith'
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40 AND plane_name IN (SELECT plane_name FROM Hangar)
SELECT COUNT(DISTINCT h.plane_name) FROM Hangar h INNER JOIN PilotSkills ps ON h.plane_name = ps.plane_name WHERE ps.age > 40
SELECT pilot_name FROM PilotSkills WHERE age > 29 AND age < 41 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE (age BETWEEN 30 AND 40) ORDER BY age ASC
SELECT PilotSkills.pilot_name FROM PilotSkills ORDER BY PilotSkills.age DESC
SELECT PilotSkills.pilot_name FROM PilotSkills ORDER BY PilotSkills.age DESC
SELECT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar WHERE plane_name IN (SELECT plane_name FROM Hangar ORDER BY plane_name)
SELECT DISTINCT H.plane_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name ORDER BY H.plane_name ASC
SELECT DISTINCT plane_name FROM Hangar ORDER BY 1
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT DISTINCT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT DISTINCT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
WITH PiperCubPilots AS (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub'), B52BomberPilots AS (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber') SELECT pilot_name FROM PiperCubPilots WHERE pilot_name NOT IN (SELECT pilot_name FROM B52BomberPilots)
SELECT DISTINCT p.pilot_name FROM PilotSkills p WHERE p.plane_name = 'Piper Cub' AND NOT EXISTS (SELECT 1 FROM PilotSkills q WHERE q.plane_name = 'B-52 Bomber' AND q.pilot_name = p.pilot_name)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE pilot_name IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub') INTERSECT SELECT pilot_name FROM PilotSkills WHERE pilot_name IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT AVG(age) AS average_age, MIN(age) AS minimum_age FROM PilotSkills
SELECT AVG(PilotSkills.age) AS Average_Age, MIN(PilotSkills.age) AS Minimum_Age FROM PilotSkills
WITH AustinPilots AS (SELECT pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'), BostonPilots AS (SELECT pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Boston') SELECT pilot_name FROM AustinPilots INTERSECT SELECT pilot_name FROM BostonPilots
SELECT P.pilot_name FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name WHERE H.location IN ('Austin', 'Boston') GROUP BY P.pilot_name HAVING COUNT(DISTINCT H.location) = 2
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION ALL SELECT pilot_name FROM PilotSkills WHERE plane_name = 'F-14 Fighter'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' UNION ALL SELECT pilot_name FROM PilotSkills WHERE plane_name = 'F-14 Fighter'
SELECT H.plane_name, AVG(P.age) FROM Hangar H LEFT OUTER JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name
SELECT ps.plane_name, AVG(ps.age) FROM PilotSkills ps GROUP BY ps.plane_name
SELECT COUNT(plane_name) AS number_of_planes, location AS plane_type FROM Hangar GROUP BY location
SELECT plane_name, COUNT(plane_name) FROM Hangar GROUP BY plane_name
SELECT a.plane_name, b.pilot_name FROM Hangar a, PilotSkills b WHERE a.plane_name = b.plane_name AND b.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = a.plane_name) ORDER BY a.plane_name
SELECT H.plane_name, P.pilot_name FROM Hangar H LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.age = (SELECT MAX(age) FROM PilotSkills PS WHERE PS.plane_name = H.plane_name) ORDER BY H.plane_name
SELECT plane_name, pilot_name FROM (SELECT plane_name, pilot_name, RANK() OVER (PARTITION BY plane_name ORDER BY age DESC) rank FROM PilotSkills) WHERE rank = 1
SELECT plane_name, pilot_name FROM PilotSkills WHERE age IN (SELECT MIN(age) FROM PilotSkills GROUP BY plane_name) AND plane_name IN (SELECT plane_name FROM Hangar)
SELECT p.pilot_name, MAX(p.age) AS max_age FROM PilotSkills p GROUP BY p.pilot_name
SELECT DISTINCT pilot_name, MAX(age) AS MaxAge FROM PilotSkills GROUP BY pilot_name
SELECT H.location, COUNT(P.pilot_name) AS PilotCount, AVG(P.age) AS AvgAge FROM Hangar H, PilotSkills P WHERE H.plane_name = P.plane_name GROUP BY H.location
SELECT location, COUNT(DISTINCT pilot_name), AVG(age) FROM Hangar INNER JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name GROUP BY location
SELECT COUNT(pilot_name), plane_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35) GROUP BY plane_name
SELECT p.plane_name, COUNT(DISTINCT p.pilot_name) FROM PilotSkills p WHERE (SELECT AVG(age) FROM PilotSkills ps WHERE ps.plane_name = p.plane_name) < 35 GROUP BY p.plane_name
SELECT location FROM Hangar WHERE plane_name IN (SELECT plane_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills))
SELECT H.location FROM Hangar H WHERE EXISTS (SELECT 1 FROM PilotSkills P WHERE P.plane_name = H.plane_name AND P.age = (SELECT MIN(age) FROM PilotSkills))
SELECT pilot_name AS PilotName, age AS PilotAge FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'
SELECT pilot_name AS PilotName, age AS PilotAge FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name ASC
SELECT DISTINCT pilot_name FROM PilotSkills WHERE age > (SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age < (SELECT MAX(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') GROUP BY pilot_name
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT Area_km, Government_website FROM district WHERE Population IN (SELECT MIN(Population) FROM district)
SELECT d.Name, d.Population FROM district d WHERE d.Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(Area_km) AS 'Max Area km', AVG(Area_km) AS 'Avg Area km' FROM district
SELECT SUM(Population) FROM district WHERE Area_km >= (SELECT MIN(Area_km) FROM (SELECT Area_km FROM district ORDER BY Area_km DESC LIMIT 3))
SELECT District_ID, Name, Government_website FROM district ORDER BY Population ASC
SELECT Name FROM district WHERE Government_website LIKE '%.gov'
SELECT d.District_ID, d.Name FROM district AS d WHERE d.Population > 4000 OR d.Area_km > 3000
SELECT s.Name, s.Speach_title FROM spokesman s
SELECT AVG(Points) AS AveragePoints, AVG(Age) AS AverageAge FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40
SELECT Name FROM spokesman AS s WHERE s.Age = (SELECT MAX(Age) FROM spokesman AS s2)
SELECT Name FROM spokesman s WHERE s.Points < (SELECT AVG(Points) FROM spokesman WHERE Points > 0)
SELECT D.Name FROM district D, spokesman_district SD WHERE D.District_ID = SD.District_ID GROUP BY D.Name HAVING COUNT(SD.Spokesman_ID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM spokesman_district GROUP BY District_ID) T)
SELECT DISTINCT s.Name FROM spokesman s, spokesman_district sd WHERE s.Spokesman_ID = sd.Spokesman_ID AND sd.Start_year < 2004
SELECT d.Name AS District, COUNT(sd.Spokesman_ID) AS CountOfSpokesmen FROM district d LEFT OUTER JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID, d.Name
SELECT d.Name FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 1) AND EXISTS (SELECT 1 FROM spokesman_district sd JOIN spokesman s ON sd.Spokesman_ID = s.Spokesman_ID WHERE sd.District_ID = d.District_ID AND s.Rank_position = 2)
SELECT Name FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID HAVING COUNT(DISTINCT sd.Spokesman_ID) > 1
SELECT COUNT(*) FROM (SELECT District_ID FROM district EXCEPT SELECT District_ID FROM spokesman_district) AS subquery
SELECT DISTINCT s.Name FROM spokesman s WHERE s.Spokesman_ID NOT IN (SELECT sd.Spokesman_ID FROM spokesman_district sd)
SELECT (SELECT SUM(Population) FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd WHERE sd.District_ID = d.District_ID)) AS TotalPopulation, (SELECT AVG(Population) FROM district d WHERE EXISTS (SELECT 1 FROM spokesman_district sd WHERE sd.District_ID = d.District_ID)) AS AveragePopulation
SELECT title FROM Sculptures WHERE year IN (SELECT MAX(year) FROM Sculptures)
SELECT S.title FROM Sculptures S WHERE S.year = (SELECT MAX(year) FROM Sculptures)
SELECT title, location FROM Paintings AS p WHERE p.year = (SELECT MIN(year) FROM Paintings AS min_year)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title FROM Sculptures WHERE location LIKE '%226%'
SELECT title FROM Sculptures WHERE location LIKE '%226%'
SELECT title AS PaintingTitle, location AS PaintingLocation FROM Paintings
SELECT title AS PaintingTitle, location AS PaintingLocation FROM Paintings
SELECT title, location FROM Sculptures
SELECT title, location FROM Sculptures
SELECT Paintings.medium FROM Paintings WHERE Paintings.paintingID = 80
SELECT Paintings.medium FROM Paintings WHERE Paintings.paintingID = 80
SELECT Artists.fname, Artists.lname FROM Artists WHERE Artists.birthYear > 1850
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT title, year FROM Sculptures WHERE location NOT LIKE 'gallery 226'
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists JOIN Sculptures ON Artists.artistID = Sculptures.sculptorID WHERE Sculptures.year < 1900
SELECT DISTINCT Artists.fname, Artists.lname FROM Artists, Sculptures WHERE Artists.artistID = Sculptures.sculptorID AND Sculptures.year < 1900
SELECT DISTINCT birthYear FROM Artists WHERE EXISTS (SELECT 1 FROM Sculptures WHERE Sculptures.sculptorID = Artists.artistID AND year > 1920)
SELECT DISTINCT A.birthYear FROM Artists A WHERE A.artistID IN (SELECT S.sculptorID FROM Sculptures S WHERE S.year > 1920)
SELECT A.fname, A.lname FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(B.deathYear - B.birthYear) FROM Artists B)
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT MIN(deathYear - birthYear) FROM Artists WHERE deathYear IS NOT NULL
SELECT MIN(deathYear - birthYear) AS age FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL
SELECT fname, deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT fname, deathYear - birthYear AS age FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(*) FROM Paintings WHERE location LIKE 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE location LIKE '%240%'
SELECT COUNT(*) FROM Paintings p JOIN Artists a ON p.painterID = a.artistID WHERE (a.deathYear - a.birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT COUNT(paintingID) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Artists.artistID ORDER BY (Artists.deathYear - Artists.birthYear) DESC LIMIT 1
SELECT P.title, P.year FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Mary'
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT p.width_mm FROM Paintings p, Artists a WHERE p.painterID = a.artistID AND a.birthYear < 1850
SELECT width_mm FROM Paintings WHERE EXISTS (SELECT 1 FROM Artists WHERE Artists.artistID = Paintings.painterID AND Artists.birthYear < 1850)
SELECT Paintings.location, Paintings.medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo' AND Artists.lname IS NOT NULL
SELECT DISTINCT location, medium FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Pablo'
SELECT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P) AND A.artistID IN (SELECT S.sculptorID FROM Sculptures S)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE painterID IN (SELECT sculptorID FROM Sculptures))
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings GROUP BY painterID HAVING SUM(CASE WHEN medium = 'oil' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN medium = 'lithographic' THEN 1 ELSE 0 END) > 0)
WITH OilArtists AS (SELECT painterID FROM Paintings WHERE medium = 'oil'), LithoArtists AS (SELECT painterID FROM Paintings WHERE medium = 'lithographic') SELECT A.fname, A.lname FROM Artists A JOIN OilArtists O ON A.artistID = O.painterID JOIN LithoArtists L ON A.artistID = L.painterID
SELECT a.birthYear FROM Artists a WHERE EXISTS (SELECT 1 FROM Paintings p WHERE p.painterID = a.artistID AND p.year = 1884 AND p.mediumOn = 'canvas')
SELECT birthYear FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE year = 1884)
SELECT DISTINCT A.fname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' AND P.location LIKE 'gallery 241'
SELECT A.fname FROM Artists A, Paintings P WHERE A.artistID = P.painterID AND P.medium LIKE 'oil' AND P.location = '241'
SELECT medium, COUNT(*) AS total_works FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) AS combined GROUP BY medium
SELECT medium, COUNT(*) AS total_count FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) combined_table GROUP BY medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) AS averageHeight FROM Paintings GROUP BY medium
SELECT location, COUNT(*) AS num_paintings FROM Paintings WHERE year < 1900 GROUP BY location HAVING COUNT(*) > 0
SELECT location, COUNT(paintingID) AS count FROM Paintings WHERE year < 1900 GROUP BY location
SELECT title FROM Paintings WHERE medium = 'oil' AND year > 1910 GROUP BY title
SELECT P.title FROM Paintings P WHERE P.medium = 'oil' AND P.year > 1910
SELECT DISTINCT painterID FROM Paintings WHERE medium = 'oil' AND location LIKE 'gallery 240'
SELECT DISTINCT artistID FROM Artists INNER JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.medium LIKE 'oil' AND Paintings.location LIKE 'gallery 240'
SELECT DISTINCT title FROM Paintings WHERE height_mm > (SELECT height_mm FROM Paintings WHERE medium = 'canvas' ORDER BY height_mm ASC LIMIT 1)
SELECT DISTINCT title FROM Paintings WHERE height_mm > (SELECT height_mm FROM Paintings WHERE medium = 'canvas' ORDER BY height_mm ASC LIMIT 1)
SELECT DISTINCT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240' AND year > 1800)
SELECT DISTINCT P1.paintingID FROM Paintings P1 WHERE P1.year < (SELECT P2.year FROM Paintings P2 WHERE P2.location = 'gallery 240' LIMIT 1)
SELECT paintingID FROM Paintings WHERE year IN (SELECT MIN(year) FROM Paintings)
SELECT paintingID FROM Paintings WHERE year IN (SELECT MIN(year) FROM Paintings)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures WHERE title LIKE '%female%')
SELECT Artists.fname || ' ' || Artists.lname AS full_name FROM Artists, Sculptures WHERE Artists.artistID = Sculptures.sculptorID AND Sculptures.title LIKE '%female%'
SELECT title FROM Paintings GROUP BY title ORDER BY title COLLATE NOCASE
SELECT title FROM (SELECT DISTINCT title FROM Paintings) AS unique_titles ORDER BY title ASC
SELECT DISTINCT title FROM Paintings ORDER BY width_mm ASC, title ASC
SELECT title FROM Paintings GROUP BY title HAVING MIN(height_mm) ORDER BY height_mm ASC
SELECT title FROM Paintings WHERE year >= 1900 AND year <= 1950 UNION ALL SELECT title FROM Sculptures WHERE year >= 1900 AND year <= 1950
SELECT Art.title FROM (SELECT title, year FROM Paintings UNION ALL SELECT title, year FROM Sculptures) AS Art WHERE Art.year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE painterID IN (SELECT artistID FROM Artists WHERE artistID = 222) UNION ALL SELECT title FROM Sculptures WHERE sculptorID IN (SELECT artistID FROM Artists WHERE artistID = 222)
SELECT P.title FROM Paintings P WHERE P.painterID = 222 UNION ALL SELECT S.title FROM Sculptures S WHERE S.sculptorID = 222
SELECT A.artistID FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.year < 1900 GROUP BY A.artistID ORDER BY COUNT(P.paintingID) DESC LIMIT 1
WITH PaintingCounts AS (SELECT painterID, COUNT(*) AS Total FROM Paintings WHERE year < 1900 GROUP BY painterID) SELECT painterID FROM PaintingCounts ORDER BY Total DESC LIMIT 1
SELECT fname FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 0)
SELECT A.fname FROM Artists A, Sculptures S WHERE A.artistID = S.sculptorID GROUP BY A.artistID, A.fname HAVING COUNT(S.sculptureID) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM Sculptures GROUP BY sculptorID) AS MaxCount)
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800;
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800 AND (width_mm IS NOT NULL AND height_mm IS NOT NULL)
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930 GROUP BY location HAVING COUNT(*) > 0
SELECT location FROM Paintings GROUP BY location HAVING MIN(year) < 1885 OR MAX(year) > 1930
SELECT Paintings.paintingID FROM Paintings WHERE Paintings.height_mm > 500 AND Paintings.height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm BETWEEN 501 AND 1999;
SELECT P.location FROM Paintings P WHERE P.medium = 'on panel' OR P.medium = 'on canvas'
SELECT location FROM Paintings WHERE medium LIKE 'on panels' OR medium LIKE 'on canvas'
SELECT DISTINCT location FROM Paintings WHERE year < 1885 UNION ALL SELECT DISTINCT location FROM Paintings WHERE year > 1930
SELECT location FROM Paintings WHERE year < 1885 UNION SELECT location FROM Paintings WHERE year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium LIKE 'oil' AND location LIKE 'gallery 241'
SELECT AVG(height_mm) as 'Average Height', AVG(width_mm) as 'Average Width' FROM Paintings WHERE medium = 'oil' AND location = '241'
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 AND height_mm = (SELECT MAX(height_mm) FROM Paintings WHERE year < 1900)
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 AND height_mm = (SELECT MAX(height_mm) FROM Paintings WHERE year < 1900)
SELECT p.year, MAX(p.height_mm) AS 'Maximum Height', MAX(p.width_mm) AS 'Maximum Width' FROM Paintings p GROUP BY p.year
SELECT year, MAX(height_mm) AS 'Maximum Height', MAX(width_mm) AS 'Maximum Width' FROM Paintings GROUP BY year
SELECT A.lname AS LastName, A.fname AS FirstName, AVG(P.height_mm) AS HeightAverage, AVG(P.width_mm) AS WidthAverage FROM Artists A, Paintings P WHERE A.artistID = P.painterID GROUP BY A.artistID ORDER BY A.lname, A.fname
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID ORDER BY A.lname, A.fname
SELECT fname, COUNT(*) FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT fname, COUNT(paintingID) FROM Artists JOIN Paintings ON artistID = painterID GROUP BY artistID HAVING COUNT(paintingID) >= 2
SELECT A.deathYear FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) <= 3
SELECT A.deathYear FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) < 4
SELECT A.deathYear FROM Artists A WHERE A.artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(*) = (SELECT MIN(num_sculptures) FROM (SELECT COUNT(*) AS num_sculptures FROM Sculptures GROUP BY sculptorID) AS SculptureCounts))
SELECT deathYear FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(*) = (SELECT MIN(count) FROM (SELECT COUNT(*) AS count FROM Sculptures GROUP BY sculptorID) AS counts))
SELECT paintingID, height_mm FROM Paintings WHERE location = 'gallery 240' ORDER BY width_mm DESC, paintingID ASC LIMIT 1
SELECT paintingID, height_mm FROM Paintings WHERE location = '240' ORDER BY width_mm DESC LIMIT 1
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240' AND year > 1000)
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = '240') AND location IN ('240')
SELECT P.paintingID FROM Paintings P WHERE P.height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT P.paintingID FROM Paintings P WHERE P.height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT A.fname, A.lname, COUNT(P.paintingID) AS OilPaintingCount FROM Artists A LEFT JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID, A.fname, A.lname ORDER BY OilPaintingCount DESC LIMIT 3
SELECT A.fname, A.lname FROM Artists A, Paintings P WHERE A.artistID = P.painterID AND P.medium = 'oil' GROUP BY A.artistID, A.fname, A.lname HAVING COUNT(P.paintingID) = (SELECT MAX(PaintCount) FROM (SELECT COUNT(*) AS PaintCount FROM Paintings WHERE medium = 'oil' GROUP BY painterID) Temp)
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY Paintings.year ASC
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year ASC, paintingID ASC
SELECT Paintings.year, Paintings.location, Paintings.title FROM Paintings WHERE Paintings.height_mm > 1000 ORDER BY Paintings.title
SELECT p.year, p.location, p.title FROM Paintings p WHERE p.height_mm > 1000 ORDER BY p.title
SELECT fname, lname FROM Artists WHERE EXISTS (SELECT 1 FROM Paintings WHERE painterID = Artists.artistID) AND NOT EXISTS (SELECT 1 FROM Sculptures WHERE sculptorID = Artists.artistID)
SELECT fname, lname FROM Artists WHERE EXISTS (SELECT 1 FROM Paintings WHERE painterID = Artists.artistID) AND NOT EXISTS (SELECT 1 FROM Sculptures WHERE sculptorID = Artists.artistID)
SELECT DISTINCT location FROM Paintings WHERE year < 1885 AND location NOT IN (SELECT location FROM Paintings WHERE mediumOn = 'canvas') GROUP BY location
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn <> 'canvas'
SELECT COUNT(Race_Name) FROM race WHERE Race_Name IS NOT NULL
SELECT COUNT(Race_Name) FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver FROM race WHERE 'Junior Strous' <> Pole_Position
SELECT Winning_driver FROM race WHERE Pole_Position <> 'Junior Strous'
SELECT Constructor FROM driver WHERE Age IS NOT NULL ORDER BY Age ASC
SELECT DISTINCT Constructor FROM driver WHERE Constructor IS NOT NULL ORDER BY Age
SELECT Entrant FROM driver WHERE Age >= 20 GROUP BY Entrant
SELECT Entrant FROM driver WHERE Age >= 20 GROUP BY Entrant
SELECT MAX(Age) AS MaximumAge, MIN(Age) AS MinimumAge FROM driver
SELECT MAX(driver.Age) AS MaximumAge, MIN(driver.Age) AS MinimumAge FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver GROUP BY Engine HAVING Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) AS EngineCount FROM driver WHERE Age > 30 OR Age < 20
SELECT d.Driver_Name FROM driver AS d ORDER BY d.Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY UPPER(Driver_Name) DESC
SELECT Driver_Name, Race_Name FROM driver INNER JOIN race ON driver.Driver_ID = race.Driver_ID
SELECT a.Driver_Name, b.Race_Name FROM driver a JOIN race b ON a.Driver_ID = b.Driver_ID
SELECT d.Driver_Name, COUNT(r.Driver_ID) FROM driver d LEFT OUTER JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_Name
SELECT D.Driver_Name, COUNT(R.Race_Name) FROM driver D LEFT JOIN race R ON D.Driver_ID = R.Driver_ID GROUP BY D.Driver_ID
SELECT Age FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM race GROUP BY Driver_ID) AS subquery))
SELECT d.Age FROM driver d, (SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1) as MostRaces WHERE d.Driver_ID = MostRaces.Driver_ID
SELECT D.Driver_Name, D.Age FROM driver D INNER JOIN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(Driver_ID) >= 2) R ON D.Driver_ID = R.Driver_ID
SELECT D.Driver_Name, D.Age FROM driver D WHERE EXISTS (SELECT Driver_ID FROM race WHERE race.Driver_ID = D.Driver_ID GROUP BY race.Driver_ID HAVING COUNT(*) >= 2)
SELECT r.Race_Name FROM race r, driver d WHERE r.Driver_ID = d.Driver_ID AND d.Age >= 26
SELECT r.Race_Name FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID AND d.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor NOT LIKE 'Bugatti'
SELECT d.Driver_Name FROM driver d WHERE d.Constructor != 'Bugatti'
SELECT Constructor, COUNT(*) AS DriverCount FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(*) AS DriverCount FROM driver GROUP BY Constructor
SELECT Engine FROM (SELECT Engine, COUNT(*) AS Frequency FROM driver GROUP BY Engine) AS subquery WHERE Frequency = (SELECT MAX(Frequency) FROM (SELECT COUNT(*) AS Frequency FROM driver GROUP BY Engine) AS subquery2)
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM driver GROUP BY Engine) AS SubQuery)
SELECT DISTINCT Engine FROM driver WHERE Engine IN (SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) > 1)
SELECT Engine FROM driver d GROUP BY d.Engine HAVING COUNT(DISTINCT d.Driver_ID) >= 2
SELECT d.Driver_Name FROM driver d WHERE d.Driver_ID NOT IN (SELECT DISTINCT r.Driver_ID FROM race r)
SELECT Driver_Name FROM driver d WHERE d.Driver_ID NOT IN (SELECT r.Driver_ID FROM race r)
SELECT DISTINCT Constructor FROM driver WHERE Constructor IN (SELECT Constructor FROM driver GROUP BY Constructor HAVING MIN(Age) < 20 AND MAX(Age) > 30)
SELECT DISTINCT d1.Constructor FROM driver d1 JOIN driver d2 ON d1.Constructor = d2.Constructor WHERE d1.Age < 20 AND d2.Age > 30
WITH WinningCounts AS (SELECT Winning_team, COUNT(*) AS WinCount FROM race GROUP BY Winning_team) SELECT Winning_team FROM WinningCounts WHERE WinCount > 1
SELECT Winning_team FROM (SELECT Winning_team, COUNT(*) AS TotalWins FROM race GROUP BY Winning_team) AS subquery WHERE TotalWins > 1
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe') INTERSECT SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')
WITH James AS (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe'), Carl AS (SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong') SELECT d.Driver_Name FROM driver d JOIN James j ON d.Driver_ID = j.Driver_ID JOIN Carl c ON d.Driver_ID = c.Driver_ID
SELECT d.Driver_Name FROM driver d WHERE NOT EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT d.Driver_Name FROM driver d WHERE NOT EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT COUNT(*) FROM languages
SELECT COUNT(*) FROM languages
SELECT name FROM languages ORDER BY name
SELECT name AS LanguageName FROM languages ORDER BY LanguageName
SELECT name FROM languages WHERE name LIKE '%ish' OR name LIKE 'ish%' OR name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish' OR name LIKE 'ish%' OR name LIKE '%ish%'
SELECT c.name FROM countries c ORDER BY c.overall_score DESC
SELECT name AS CountryName FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) AS avg_justice_score FROM countries
SELECT AVG(justice_score) AS AverageJusticeScore FROM countries
SELECT MAX(health_score) as MaxHealth, MIN(health_score) as MinHealth FROM countries WHERE name != 'Norway'
SELECT MAX(health_score) AS MaxHealth, MIN(health_score) AS MinHealth FROM countries WHERE name NOT IN (SELECT name FROM countries WHERE name = 'Norway')
SELECT COUNT(DISTINCT id) FROM (SELECT language_id AS id FROM official_languages) AS distinct_languages
SELECT COUNT(DISTINCT L.id) FROM languages L INNER JOIN official_languages OL ON L.id = OL.language_id
SELECT name FROM countries WHERE education_score IS NOT NULL ORDER BY education_score DESC
SELECT name AS CountryName FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT c.name AS Country, l.name AS Language FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT countries.name, languages.name FROM countries INNER JOIN official_languages ON countries.id = official_languages.country_id INNER JOIN languages ON official_languages.language_id = languages.id
SELECT L.name, COUNT(DISTINCT O.country_id) FROM languages L LEFT JOIN official_languages O ON L.id = O.language_id GROUP BY L.name
SELECT name, COUNT(DISTINCT country_id) FROM languages LEFT JOIN official_languages ON languages.id = official_languages.language_id GROUP BY name
SELECT L.name FROM languages L, official_languages OL WHERE L.id = OL.language_id GROUP BY L.id, L.name HAVING COUNT(OL.country_id) = (SELECT MAX(C) FROM (SELECT COUNT(country_id) AS C FROM official_languages GROUP BY language_id) AS sub)
SELECT name FROM (SELECT name, COUNT(OL.language_id) AS lang_count FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY name) AS subquery ORDER BY lang_count DESC LIMIT 1
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.id, L.name HAVING COUNT(*) > 1
SELECT L.name FROM languages L, official_languages OL WHERE L.id = OL.language_id GROUP BY L.id HAVING COUNT(DISTINCT OL.country_id) >= 2
SELECT AVG(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages WHERE language_id IN (SELECT id FROM languages WHERE name = 'English'))
SELECT AVG(overall_score) FROM countries WHERE id IN (SELECT country_id FROM official_languages WHERE language_id IN (SELECT id FROM languages WHERE name = 'English'))
SELECT L.name FROM languages L WHERE L.id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 3)
SELECT L.name FROM languages L WHERE L.id IN (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(DISTINCT country_id) DESC LIMIT 3)
SELECT lang.name FROM languages lang JOIN official_languages ol ON lang.id = ol.language_id JOIN countries c ON ol.country_id = c.id GROUP BY lang.name ORDER BY AVG(c.overall_score) DESC
SELECT languages.name FROM languages INNER JOIN (SELECT language_id, AVG(overall_score) AS avg_score FROM official_languages JOIN countries ON official_languages.country_id = countries.id GROUP BY language_id) AS scores ON languages.id = scores.language_id ORDER BY scores.avg_score DESC
SELECT C.name FROM countries C WHERE EXISTS (SELECT 1 FROM official_languages O WHERE O.country_id = C.id GROUP BY O.country_id HAVING COUNT(O.language_id) = (SELECT MAX(lang_count) FROM (SELECT COUNT(language_id) AS lang_count FROM official_languages GROUP BY country_id) AS subquery))
SELECT name FROM countries WHERE id IN (SELECT country_id FROM official_languages GROUP BY country_id HAVING COUNT(language_id) = (SELECT MAX(cnt) FROM (SELECT COUNT(language_id) AS cnt FROM official_languages GROUP BY country_id) sub))
SELECT L.name FROM languages L WHERE L.id NOT IN (SELECT language_id FROM official_languages)
SELECT languages.name FROM languages WHERE languages.id NOT IN (SELECT official_languages.language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT DISTINCT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT DISTINCT country_id FROM official_languages)
SELECT name FROM languages WHERE id IN (SELECT OL.language_id FROM official_languages OL JOIN countries C ON OL.country_id = C.id GROUP BY OL.language_id HAVING MAX(C.overall_score) > 95 AND MIN(C.overall_score) < 90)
SELECT L.name FROM languages L WHERE L.id IN (SELECT O.language_id FROM official_languages O JOIN countries C ON O.country_id = C.id WHERE C.overall_score > 95 INTERSECT SELECT O.language_id FROM official_languages O JOIN countries C ON O.country_id = C.id WHERE C.overall_score < 90)
SELECT country, town_city FROM Addresses GROUP BY country, town_city
SELECT Addresses.country, Addresses.town_city FROM Addresses
SELECT property_id, county_state_province FROM Properties CROSS JOIN Addresses WHERE Properties.property_address_id = Addresses.address_id
SELECT DISTINCT P.property_id, A.county_state_province FROM Properties P, Addresses A WHERE P.property_address_id = A.address_id
SELECT f.feature_description FROM Features f WHERE f.feature_name = 'rooftop'
SELECT f.feature_description FROM Features f WHERE f.feature_name = 'rooftop'
SELECT F.feature_name, F.feature_description FROM Features F JOIN (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1) AS MostCommon ON F.feature_id = MostCommon.feature_id
SELECT feature_name, feature_description FROM Features WHERE EXISTS (SELECT 1 FROM Property_Features WHERE Features.feature_id = Property_Features.feature_id GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
sql placeholder
SELECT MIN(room_count) AS LowestRoomCount FROM Properties
SELECT COUNT(*) FROM Properties WHERE (parking_lots = 1) OR (garage_yn = 'Y')
SELECT COUNT(*) FROM Properties WHERE (parking_lots = 1) OR (garage_yn = 'Y')
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code IN (SELECT age_category_code FROM Users WHERE other_user_details LIKE '%Mother%')
SELECT RAC.age_category_description FROM Ref_Age_Categories RAC WHERE EXISTS (SELECT 1 FROM Users U WHERE U.age_category_code = RAC.age_category_code AND U.other_user_details LIKE '%Mother%')
SELECT U.first_name FROM Users U WHERE U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) = (SELECT MAX(property_count) FROM (SELECT owner_user_id, COUNT(*) AS property_count FROM Properties GROUP BY owner_user_id) AS Temp))
SELECT U.first_name FROM Users U WHERE U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) = (SELECT MAX(property_count) FROM (SELECT COUNT(*) AS property_count FROM Properties GROUP BY owner_user_id) AS Temp))
WITH GardenProperties AS (SELECT property_id FROM Property_Features JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Features.feature_name = 'garden') SELECT AVG(room_count) FROM Properties WHERE property_id IN (SELECT property_id FROM GardenProperties)
SELECT AVG(total_rooms) FROM (SELECT COUNT(*) AS total_rooms FROM Rooms WHERE property_id IN (SELECT Properties.property_id FROM Properties JOIN Property_Features ON Properties.property_id = Property_Features.property_id JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Features.feature_name = 'garden') GROUP BY property_id) AS room_totals
SELECT DISTINCT town_city FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name LIKE 'swimming pool'
SELECT DISTINCT town_city FROM Addresses WHERE EXISTS (SELECT * FROM Properties INNER JOIN Property_Features ON Properties.property_id = Property_Features.property_id INNER JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Properties.property_address_id = Addresses.address_id AND Features.feature_name = 'swimming pool')
SELECT property_id, vendor_requested_price FROM Properties WHERE vendor_requested_price IN (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT P.property_id, P.vendor_requested_price FROM Properties P WHERE P.vendor_requested_price = (SELECT MIN(vendor_requested_price) FROM Properties)
SELECT AVG(room_count) FROM (SELECT property_id, COUNT(room_number) AS room_count FROM Rooms GROUP BY property_id) AS room_summary
SELECT AVG(room_count) FROM (SELECT COUNT(room_number) AS room_count FROM Rooms GROUP BY property_id) AS room_summary
SELECT COUNT(*) FROM (SELECT DISTINCT room_size FROM Rooms) AS unique_sizes
SELECT COUNT(DISTINCT room_size) AS unique_room_sizes FROM Rooms
SELECT user_id, search_string FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT U.user_id, US.search_seq FROM Users U CROSS JOIN User_Searches US ON U.user_id = US.user_id WHERE (SELECT COUNT(*) FROM User_Searches WHERE user_id = U.user_id) >= 2 GROUP BY U.user_id, US.search_seq
SELECT MAX(search_datetime) AS LatestSearchTime FROM User_Searches
SELECT MAX(search_datetime) AS MostRecentSearch FROM User_Searches
SELECT search_datetime AS Time, search_string AS Content FROM User_Searches ORDER BY Content DESC
SELECT search_string AS SearchString, search_datetime AS SearchTime FROM User_Searches ORDER BY SearchString DESC
SELECT DISTINCT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE NOT EXISTS (SELECT NULL FROM Properties pp WHERE pp.owner_user_id = p.owner_user_id GROUP BY pp.owner_user_id HAVING COUNT(pp.property_id) <= 2)
SELECT DISTINCT A.zip_postcode FROM Addresses A WHERE A.address_id IN (SELECT P.property_address_id FROM Properties P LEFT JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) <= 2) AS Sub ON P.owner_user_id = Sub.owner_user_id WHERE Sub.owner_user_id IS NULL)
SELECT user_id, user_category_description FROM Users JOIN Ref_User_Categories ON Users.user_category_code = Ref_User_Categories.user_category_code WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) = 1)
SELECT U.user_id, U.user_category_code FROM Users U WHERE (SELECT COUNT(*) FROM User_Searches S WHERE S.user_id = U.user_id) = 1
SELECT RAC.age_category_description FROM Ref_Age_Categories RAC JOIN Users U ON RAC.age_category_code = U.age_category_code JOIN User_Searches US ON U.user_id = US.user_id ORDER BY US.search_datetime ASC LIMIT 1
SELECT R.age_category_description FROM Ref_Age_Categories R INNER JOIN Users U ON R.age_category_code = U.age_category_code WHERE U.user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime ASC LIMIT 1)
SELECT U.login_name FROM Users U, Ref_Age_Categories R WHERE U.age_category_code = R.age_category_code AND R.age_category_description = 'senior citizen' ORDER BY U.first_name ASC
SELECT U.login_name FROM Users U, Ref_Age_Categories R WHERE U.age_category_code = R.age_category_code AND R.age_category_description LIKE 'Senior Citizens' ORDER BY U.first_name ASC
SELECT COUNT(search_seq) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = '1'
SELECT COUNT(*) FROM User_Searches WHERE EXISTS (SELECT 1 FROM Users WHERE Users.user_id = User_Searches.user_id AND Users.is_buyer = 1)
SELECT U.date_registered FROM Users U WHERE U.login_name = 'ratione'
SELECT U.date_registered FROM Users U WHERE U.login_name = 'ratione'
SELECT U.first_name, U.middle_name, U.last_name, U.login_name FROM Users U WHERE U.is_seller = 1
SELECT Users.first_name, Users.middle_name, Users.last_name, Users.login_name FROM Users WHERE Users.is_seller = TRUE
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Users U JOIN Addresses A ON U.user_address_id = A.address_id WHERE U.age_category_code = 'SC'
SELECT line_1_number_building, line_2_number_street, town_city FROM Addresses, Users, Ref_Age_Categories WHERE Addresses.address_id = Users.user_address_id AND Users.age_category_code = Ref_Age_Categories.age_category_code AND Ref_Age_Categories.age_category_description = 'Senior'
SELECT COUNT(DISTINCT property_id) FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2
SELECT COUNT(*) FROM (SELECT COUNT(feature_id) AS feature_count, property_id FROM Property_Features GROUP BY property_id HAVING feature_count >= 2) AS property_count
SELECT Properties.property_id, COUNT(Property_Photos.photo_seq) AS photo_count FROM Properties LEFT JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY Properties.property_id
SELECT p.property_id, COUNT(pp.photo_seq) FROM Properties p LEFT JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY p.property_id
SELECT owner_user_id, COUNT(photo_seq) FROM Properties JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT owner_user_id AS user_id, COUNT(*) AS photo_count FROM Properties INNER JOIN Property_Photos ON Properties.property_id = Property_Photos.property_id GROUP BY owner_user_id
SELECT SUM(price_max) AS TotalPrice FROM Properties JOIN Users ON Properties.owner_user_id = Users.user_id WHERE Users.user_category_code IN ('single mother', 'student') GROUP BY Users.user_category_code
SELECT SUM(Properties.price_max) FROM Properties INNER JOIN Users ON Properties.owner_user_id = Users.user_id INNER JOIN Ref_User_Categories ON Users.user_category_code = Ref_User_Categories.user_category_code WHERE Ref_User_Categories.user_category_description IN ('single mother', 'student')
SELECT a.datestamp, b.property_name FROM User_Property_History AS a JOIN Properties AS b ON a.property_id = b.property_id ORDER BY a.datestamp
SELECT a.datestamp, b.property_name FROM User_Property_History AS a JOIN Properties AS b ON a.property_id = b.property_id ORDER BY a.datestamp
SELECT R.property_type_description, R.property_type_code FROM Ref_Property_Types R WHERE EXISTS (SELECT 1 FROM Properties P WHERE P.property_type_code = R.property_type_code GROUP BY P.property_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT property_type_description FROM Ref_Property_Types WHERE property_type_code = (SELECT property_type_code FROM Properties GROUP BY property_type_code ORDER BY COUNT(property_type_code) DESC LIMIT 1)
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code LIKE 'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code LIKE 'Over 60'
SELECT room_size, COUNT(room_size) AS count_of_rooms FROM Rooms GROUP BY room_size ORDER BY count_of_rooms
SELECT room_size, COUNT(*) AS room_count FROM Rooms GROUP BY room_size
SELECT country FROM Addresses WHERE address_id IN (SELECT user_address_id FROM Users WHERE first_name = 'Robbie')
SELECT country FROM Addresses WHERE address_id IN (SELECT user_address_id FROM Users WHERE first_name = 'Robbie')
SELECT first_name, middle_name, last_name FROM Users U WHERE U.user_id IN (SELECT P.owner_user_id FROM Properties P WHERE P.property_address_id = U.user_address_id)
SELECT U.first_name || ' ' || U.middle_name || ' ' || U.last_name AS full_name FROM Users U, Properties P WHERE U.user_id = P.owner_user_id AND U.user_address_id = P.property_address_id
SELECT search_string FROM User_Searches WHERE NOT EXISTS (SELECT 1 FROM Properties WHERE owner_user_id = User_Searches.user_id)
SELECT search_string FROM User_Searches WHERE user_id IN (SELECT user_id FROM Users WHERE user_id NOT IN (SELECT owner_user_id FROM Properties))
SELECT U.last_name, U.user_id FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id GROUP BY U.user_id HAVING COUNT(P.property_id) >= 2 AND NOT EXISTS (SELECT 1 FROM User_Searches S WHERE S.user_id = U.user_id GROUP BY S.user_id HAVING COUNT(*) > 2)
SELECT U.user_id, U.last_name FROM Users U JOIN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) <= 2) S ON U.user_id = S.user_id JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) >= 2) P ON U.user_id = P.owner_user_id
SELECT COUNT(*) FROM bike WHERE weight > 780 GROUP BY id
SELECT product_name, weight FROM bike WHERE price IS NOT NULL ORDER BY price ASC
SELECT `heat`, `name`, `nation` FROM `cyclist`
SELECT MAX(b.weight), MIN(b.weight) FROM bike b
SELECT AVG(bike.price) AS AveragePrice FROM bike WHERE bike.material = 'Carbon CC'
SELECT name, result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT b.id, b.product_name FROM bike b WHERE b.id IN (SELECT cob.bike_id FROM cyclists_own_bikes cob WHERE cob.purchase_year > 2015)
SELECT b.id, b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id GROUP BY b.id, b.product_name HAVING COUNT(cob.cyclist_id) >= 4
SELECT cyclist.id, cyclist.name FROM cyclist INNER JOIN cyclists_own_bikes ON cyclist.id = cyclists_own_bikes.cyclist_id GROUP BY cyclist.id, cyclist.name HAVING COUNT(cyclists_own_bikes.bike_id) = (SELECT MAX(bike_count) FROM (SELECT COUNT(bike_id) AS bike_count FROM cyclists_own_bikes GROUP BY cyclist_id) AS subquery)
SELECT DISTINCT b.product_name FROM bike b INNER JOIN cyclists_own_bikes cob ON b.id = cob.bike_id INNER JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation IN ('Russia', 'Great Britain')
SELECT COUNT(*) FROM (SELECT DISTINCT heat FROM cyclist)
SELECT COUNT(*) FROM cyclist c LEFT JOIN cyclists_own_bikes b ON c.id = b.cyclist_id AND b.purchase_year > 2015 WHERE b.cyclist_id IS NULL
SELECT DISTINCT b.product_name FROM bike b, cyclists_own_bikes cob, cyclist c WHERE b.id = cob.bike_id AND cob.cyclist_id = c.id AND c.result < '4:21.558'
SELECT product_name, price FROM bike WHERE id IN (SELECT bike_id FROM cyclists_own_bikes WHERE cyclist_id IN (SELECT id FROM cyclist WHERE name = 'Bradley Wiggins') INTERSECT SELECT bike_id FROM cyclists_own_bikes WHERE cyclist_id IN (SELECT id FROM cyclist WHERE name = 'Antonio Tauler'))
SELECT c.name, c.nation, c.result FROM cyclist c LEFT JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id LEFT JOIN bike b ON cob.bike_id = b.id WHERE b.product_name = 'racing bike' AND cob.bike_id IS NULL
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT c.id AS cyclist_id, COUNT(b.bike_id) AS bike_count FROM cyclist c LEFT JOIN cyclists_own_bikes b ON c.id = b.cyclist_id GROUP BY c.id ORDER BY c.id
SELECT Flavor FROM goods WHERE Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake') AND Food = 'cake'
SELECT Id, Flavor FROM goods WHERE Food = 'cake' AND Price = (SELECT MAX(Price) FROM goods g WHERE g.Food = 'cake')
SELECT Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' AND Price = (SELECT MIN(Price) FROM goods WHERE Food = 'cookie')
SELECT Id FROM goods WHERE Flavor = 'apple' COLLATE NOCASE
SELECT Id FROM goods WHERE Flavor = 'apple' COLLATE NOCASE
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT Id FROM customers WHERE EXISTS (SELECT * FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE customers.Id = receipts.CustomerId AND goods.Food = 'cake' AND goods.Flavor = 'lemon')
SELECT DISTINCT c.Id FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id AND g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT Food, COUNT(DISTINCT CustomerId) AS Customers FROM goods LEFT JOIN items ON goods.Id = items.Item LEFT JOIN receipts ON items.Receipt = receipts.ReceiptNumber GROUP BY Food
SELECT Food, COUNT(DISTINCT CustomerId) AS NumberOfCustomers FROM goods JOIN items ON goods.Id = items.Item JOIN receipts ON items.Receipt = receipts.ReceiptNumber JOIN customers ON receipts.CustomerId = customers.Id GROUP BY Food
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'bakery' GROUP BY r.CustomerId HAVING COUNT(r.CustomerId) >= 15
SELECT Id FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15)
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) > 10)
SELECT c.LastName FROM customers c, receipts r WHERE c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) > 10
SELECT COUNT(DISTINCT Flavor) AS CakeTypes FROM goods WHERE Food = 'Cake'
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food LIKE '%cake%'
SELECT Flavor FROM goods WHERE Food LIKE 'Croissant'
SELECT Flavor FROM goods WHERE Food = 'croissant' AND Flavor IS NOT NULL
SELECT DISTINCT goods.Flavor, goods.Food FROM goods, items, receipts WHERE goods.Id = items.Item AND items.Receipt = receipts.ReceiptNumber AND receipts.CustomerId = 15
SELECT DISTINCT Flavor FROM goods, items, receipts WHERE goods.Id = items.Item AND items.Receipt = receipts.ReceiptNumber AND receipts.CustomerId = 15
SELECT g.Food, AVG(g.Price) AS AvgPrice, MAX(g.Price) AS MaximumPrice, MIN(g.Price) AS MinimumPrice FROM goods g GROUP BY g.Food
SELECT Food, AVG(Price) as 'Average Price', MIN(Price) as 'Minimum Price', MAX(Price) as 'Maximum Price' FROM goods GROUP BY Food
SELECT Receipt FROM items i INNER JOIN goods g ON i.Item = g.Id WHERE g.Food IN ('Cake', 'Cookie') GROUP BY Receipt HAVING COUNT(DISTINCT g.Food) = 2
SELECT DISTINCT i.Receipt FROM items i, goods g WHERE i.Item = g.Id AND g.Food IN ('cakes', 'cookies') GROUP BY i.Receipt HAVING COUNT(DISTINCT g.Food) = 2
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN customers c ON r.CustomerId = c.Id JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE c.LastName = 'LOGAN' AND g.Food = 'Croissant'
SELECT ReceiptNumber FROM receipts WHERE CustomerId IN (SELECT Id FROM customers WHERE LastName = 'Logan') AND ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Flavor = 'croissant'))
SELECT ReceiptNumber, Date FROM receipts WHERE EXISTS (SELECT * FROM items JOIN goods ON items.Item = goods.Id WHERE receipts.ReceiptNumber = items.Receipt AND goods.Price = (SELECT MAX(Price) FROM goods))
SELECT R.ReceiptNumber, R.Date FROM receipts R JOIN items I ON R.ReceiptNumber = I.Receipt JOIN goods G ON I.Item = G.Id WHERE G.Price = (SELECT MAX(Price) FROM goods) GROUP BY R.ReceiptNumber, R.Date
SELECT G.Flavor, G.Food FROM goods G WHERE G.Id = (SELECT I.Item FROM items I GROUP BY I.Item ORDER BY COUNT(I.Item) ASC LIMIT 1)
SELECT goods.Flavor FROM goods INNER JOIN (SELECT Item, COUNT(*) AS ItemCount FROM items GROUP BY Item) AS ItemCounts ON goods.Id = ItemCounts.Item ORDER BY ItemCounts.ItemCount ASC LIMIT 1
SELECT Food, COUNT(Id) FROM goods GROUP BY Food
SELECT COUNT(*) AS TotalGoods, Food FROM goods GROUP BY Food
SELECT goods.Food, AVG(goods.Price) AS AveragePrice FROM goods GROUP BY goods.Food
SELECT g.Food, AVG(g.Price) AS Average_Price FROM goods g GROUP BY g.Food
SELECT g.Id FROM goods g WHERE g.Flavor = 'Apricot' AND g.Price < 5
SELECT g.Id FROM goods g WHERE g.Flavor = 'Apricot' AND g.Price < 5
SELECT Flavor FROM goods WHERE Food LIKE 'cake' AND Price > 10
SELECT Flavor FROM goods WHERE Food LIKE 'cake' AND Price > 10
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods WHERE Price IS NOT NULL)
SELECT DISTINCT g.Id, g.Price FROM goods g WHERE g.Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id FROM goods WHERE Price < (SELECT MIN(Price) FROM goods WHERE Flavor = 'Tart')
SELECT DISTINCT Id FROM goods g WHERE g.Price < (SELECT Price FROM goods t WHERE t.Flavor = 'Tart' ORDER BY Price LIMIT 1)
SELECT DISTINCT r.ReceiptNumber FROM receipts AS r INNER JOIN items AS i ON r.ReceiptNumber = i.Receipt INNER JOIN goods AS g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT ReceiptNumber FROM receipts, items, goods WHERE receipts.ReceiptNumber = items.Receipt AND items.Item = goods.Id AND goods.Price > 13
SELECT r.Date FROM receipts r WHERE EXISTS (SELECT * FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Price > 15 AND i.Receipt = r.ReceiptNumber)
SELECT r.Date FROM receipts r WHERE EXISTS (SELECT * FROM items i JOIN goods g ON i.Item = g.Id WHERE i.Receipt = r.ReceiptNumber AND g.Price > 15)
SELECT Id FROM goods WHERE Id LIKE '%%APP%%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Flavor, Price FROM goods WHERE Id LIKE '%_70%'
SELECT g.Id, g.Price FROM goods g WHERE g.Id LIKE '%70%'
SELECT LastName FROM customers ORDER BY LastName
SELECT LastName FROM customers ORDER BY LastName
SELECT goods.Id FROM goods ORDER BY goods.Id ASC
SELECT DISTINCT goods.Id FROM goods ORDER BY goods.Id ASC
SELECT DISTINCT R.ReceiptNumber FROM receipts R LEFT JOIN items I ON R.ReceiptNumber = I.Receipt LEFT JOIN goods G ON I.Item = G.Id WHERE (G.Flavor = 'apple' AND G.Food = 'pie') OR R.CustomerId = 12
SELECT r.ReceiptNumber FROM receipts r WHERE r.CustomerId = 12 UNION SELECT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'pie'
SELECT ReceiptNumber, Date FROM receipts WHERE Date = (SELECT MAX(r.Date) FROM receipts r)
SELECT ReceiptNumber, Date FROM receipts WHERE Date IN (SELECT MAX(Date) FROM receipts)
SELECT ReceiptNumber FROM receipts WHERE Date = (SELECT MIN(Date) FROM receipts) OR ReceiptNumber IN (SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Price > 10)
SELECT ReceiptNumber FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10)) OR Date = (SELECT MIN(Date) FROM receipts)
SELECT Id FROM goods WHERE Food = 'Cookie' AND Price BETWEEN 3 AND 7 UNION SELECT Id FROM goods WHERE Food = 'Cake' AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE (Food = 'Cookies' OR Food = 'Cakes') AND Price >= 3.00 AND Price <= 7.00
SELECT FirstName, LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts WHERE Date = (SELECT MIN(Date) FROM receipts))
SELECT c.FirstName, c.LastName FROM customers c INNER JOIN receipts r ON c.Id = r.CustomerId WHERE r.Date = (SELECT MIN(Date) FROM receipts)
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) FROM goods WHERE Flavor LIKE '%blackberry%' OR Flavor LIKE '%blueberry%'
SELECT Price FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT * FROM goods WHERE Flavor = 'cheese' ORDER BY Price LIMIT 1
SELECT Flavor, MAX(Price) HighestPrice, MIN(Price) LowestPrice, AVG(Price) AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor ASC
SELECT Flavor, MAX(Price) AS 'Maximum Price', MIN(Price) AS 'Minimum Price', AVG(Price) AS 'Average Price' FROM goods GROUP BY Flavor ORDER BY Flavor ASC
SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice FROM goods GROUP BY Food ORDER BY Food
SELECT Food, MIN(Price) AS Minimum, MAX(Price) AS Maximum FROM goods GROUP BY Food ORDER BY Food ASC
SELECT Date FROM (SELECT Date, COUNT(*) AS NumReceipts FROM receipts GROUP BY Date) AS ReceiptCounts ORDER BY NumReceipts DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT FirstName, LastName, COUNT(ReceiptNumber) AS NumberOfReceipts FROM customers INNER JOIN receipts ON customers.Id = receipts.CustomerId GROUP BY customers.Id ORDER BY NumberOfReceipts DESC LIMIT 1
SELECT CustomerId, COUNT(*) FROM receipts GROUP BY CustomerId HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM receipts GROUP BY CustomerId) AS SubQuery)
SELECT receipts.Date, COUNT(DISTINCT receipts.CustomerId) AS distinct_customers FROM receipts GROUP BY receipts.Date
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT FirstName, LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts INNER JOIN items ON ReceiptNumber = Receipt INNER JOIN goods ON Item = Id WHERE Flavor = 'apple' AND Food = 'Tart')
SELECT c.FirstName, c.LastName FROM customers c, receipts r, items i, goods g WHERE c.Id = r.CustomerId AND r.ReceiptNumber = i.Receipt AND i.Item = g.Id AND g.Flavor = 'apple' AND g.Food = 'Tarts'
SELECT goods.Id FROM goods WHERE goods.Food = 'Cookies' AND goods.Price < (SELECT MIN(goods.Price) FROM goods WHERE goods.Food = 'Croissant')
SELECT Id FROM goods WHERE Food = 'cookies' AND Price < (SELECT MIN(Price) FROM goods WHERE Food = 'croissant')
SELECT g1.Id FROM goods g1 WHERE g1.Food = 'Cake' AND g1.Price >= (SELECT AVG(g2.Price) FROM goods g2 WHERE g2.Food = 'Tart' GROUP BY g2.Food)
SELECT g.Id FROM goods g WHERE g.Food = 'Cake' AND g.Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Price > (SELECT 2 * AVG(Price) FROM goods)
SELECT Id FROM goods WHERE Price > (SELECT 2 * AVG(Price) FROM goods)
SELECT g.Id, g.Flavor, g.Food FROM goods g ORDER BY g.Price ASC
SELECT goods.Id, goods.Flavor, goods.Food FROM goods ORDER BY goods.Price ASC
SELECT g.Id, g.Flavor FROM goods AS g WHERE g.Food = 'Cakes' ORDER BY g.Flavor ASC
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Flavor DESC
SELECT DISTINCT g.Id FROM goods g WHERE g.Flavor = 'chocolate' AND g.Id NOT IN (SELECT i.Item FROM items i GROUP BY i.Item HAVING COUNT(*) > 10)
SELECT goods.Id FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Flavor = 'chocolate' GROUP BY items.Item HAVING COUNT(items.Item) <= 10
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT DISTINCT Flavor FROM goods WHERE Food = 'Tart')
SELECT DISTINCT g1.Flavor FROM goods g1 LEFT JOIN goods g2 ON g1.Flavor = g2.Flavor AND g2.Food = 'Tart' WHERE g1.Food = 'Cake' AND g2.Flavor IS NULL
SELECT Flavor, Food FROM goods WHERE Id IN (SELECT Item FROM items GROUP BY Item ORDER BY COUNT(*) DESC LIMIT 3)
SELECT G.Food, COUNT(I.Item) AS TotalPurchases FROM goods G JOIN items I ON G.Id = I.Item GROUP BY G.Food ORDER BY TotalPurchases DESC LIMIT 3
SELECT r.CustomerId FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT r.CustomerId FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT CustomerId FROM receipts INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING AVG(Price) > 5
SELECT CustomerId FROM (SELECT r.CustomerId, AVG(g.Price) AS AveragePrice FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId) AS SubQuery WHERE AveragePrice > 5
SELECT receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY receipts.Date HAVING SUM(goods.Price) > 100
SELECT DISTINCT r.Date FROM receipts r, items i, goods g WHERE r.ReceiptNumber = i.Receipt AND i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT COUNT(1) FROM driver
SELECT COUNT(1) FROM driver
SELECT Make, COUNT(*) AS TotalDrivers FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, COUNT(Driver) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) AS Average_Age FROM driver GROUP BY Make ORDER BY Make
SELECT Make, AVG(Age) AS Average_Age FROM driver WHERE Age IS NOT NULL GROUP BY Make
SELECT AVG(Laps) FROM driver WHERE Age < 20 AND Laps > 0
SELECT AVG(Laps) FROM driver d WHERE d.Age < 20 AND d.Laps IS NOT NULL
SELECT t.Manager, t.Sponsor FROM team t ORDER BY t.Car_Owner
SELECT t.Manager, t.Sponsor FROM team t ORDER BY t.Car_Owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'
SELECT t.Make FROM team t WHERE t.Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) AS MaxPoints, MIN(Points) AS MinPoints FROM driver
SELECT MAX(Points) AS Max_Points, MIN(Points) AS Min_Points FROM driver
SELECT COUNT(Driver_ID) AS DriverCount FROM driver WHERE Points < 150
SELECT COUNT(Driver_ID) AS DriverCount FROM driver WHERE Points < 150
SELECT Driver FROM driver ORDER BY CAST(Age AS INTEGER) ASC
SELECT Driver FROM driver ORDER BY Age
SELECT Driver FROM driver ORDER BY Points DESC, Driver
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver, Country FROM driver GROUP BY Driver, Country
SELECT Driver AS DriverName, Country AS DriverCountry FROM driver
SELECT MAX(Points) AS MaxPoints FROM driver INNER JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT MAX(d.Points) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Capital = 'Dublin'
SELECT AVG(driver.Age) FROM driver JOIN country ON driver.Country = country.Country_Id AND country.Official_native_language = 'English'
SELECT AVG(Age) FROM driver d INNER JOIN country c ON d.Country = c.Country WHERE c.Official_native_language = 'English'
SELECT Country FROM driver WHERE Points > 150 GROUP BY Country
SELECT Country FROM driver WHERE Points > 150 GROUP BY Country
SELECT C.Capital FROM country C WHERE EXISTS (SELECT 1 FROM driver D WHERE D.Country = C.Country_Id AND D.Points = (SELECT MAX(Points) FROM driver))
SELECT c.Capital FROM country c WHERE EXISTS (SELECT 1 FROM driver d WHERE d.Country = c.Country_Id AND d.Points = (SELECT MAX(Points) FROM driver))
SELECT Make, COUNT(Driver) FROM driver GROUP BY Make
SELECT d.Make, COUNT(d.Driver_ID) FROM driver d GROUP BY d.Make
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) = (SELECT MAX(DriverCount) FROM (SELECT COUNT(Driver_ID) AS DriverCount FROM driver GROUP BY Make) AS SubQuery)
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) = (SELECT MAX(count) FROM (SELECT COUNT(Driver_ID) AS count FROM driver GROUP BY Make) AS counts)
SELECT Make FROM driver d GROUP BY d.Make HAVING COUNT(DISTINCT d.Driver_ID) >= 3
SELECT D.Make FROM driver D JOIN team_driver TD ON D.Driver_ID = TD.Driver_ID GROUP BY D.Make HAVING COUNT(DISTINCT D.Driver_ID) >= 3
SELECT t.Team FROM team t WHERE NOT EXISTS (SELECT NULL FROM team_driver td WHERE td.Team_ID = t.Team_ID)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
WITH DodgeCountries AS (SELECT Country FROM driver WHERE Make = 'Dodge'), ChevroletCountries AS (SELECT Country FROM driver WHERE Make = 'Chevrolet') SELECT Country FROM DodgeCountries WHERE Country IN (SELECT Country FROM ChevroletCountries)
SELECT DISTINCT Country FROM driver WHERE Make = 'Dodge' OR Make = 'Chevrolet' GROUP BY Country HAVING COUNT(DISTINCT Make) > 1
SELECT SUM(Points) AS Total, AVG(Points) AS Average FROM driver
SELECT SUM(Points) AS Total, AVG(Points) AS Average FROM driver
SELECT DISTINCT c.Country FROM country c WHERE c.Country NOT IN (SELECT Country FROM driver)
SELECT DISTINCT c.Country FROM country c WHERE c.Country NOT IN (SELECT Country FROM driver)
SELECT t.Manager, t.Sponsor FROM team t WHERE EXISTS (SELECT 1 FROM team_driver td WHERE td.Team_ID = t.Team_ID GROUP BY td.Team_ID HAVING COUNT(td.Driver_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Driver_ID) AS cnt FROM team_driver GROUP BY Team_ID) sub))
SELECT t.Manager, t.Sponsor FROM team t WHERE EXISTS (SELECT 1 FROM team_driver td WHERE td.Team_ID = t.Team_ID GROUP BY td.Team_ID HAVING COUNT(td.Driver_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Driver_ID) AS cnt FROM team_driver GROUP BY Team_ID) tmp))
SELECT Manager, Car_Owner FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(*) >= 2)
SELECT Manager, Car_Owner FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) >= 2)
SELECT COUNT(*) FROM (SELECT DISTINCT Institution_ID FROM institution) AS unique_institutions
SELECT COUNT(Institution_ID) AS InstitutionCount FROM institution
SELECT Name FROM institution ORDER BY Name ASC, Institution_ID ASC
SELECT institution.Name FROM institution ORDER BY institution.Name
SELECT institution.Name FROM institution ORDER BY institution.Founded ASC
SELECT institution.Name FROM institution ORDER BY institution.Founded
SELECT City, Province FROM institution
SELECT City, Province FROM institution
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution
SELECT MAX(Enrollment) 'Maximum Enrollment', MIN(Enrollment) 'Minimum Enrollment' FROM institution
SELECT Affiliation FROM institution WHERE City <> 'Vancouver' AND City IS NOT NULL
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT institution.Stadium FROM institution ORDER BY institution.Capacity DESC
SELECT DISTINCT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution WHERE Enrollment IN (SELECT MAX(Enrollment) FROM institution)
SELECT Stadium FROM institution WHERE Enrollment IN (SELECT MAX(Enrollment) FROM institution)
SELECT Name, Nickname FROM institution, Championship WHERE institution.Institution_ID = Championship.Institution_ID
SELECT Name, Nickname FROM institution, Championship WHERE institution.Institution_ID = Championship.Institution_ID
SELECT C.Nickname FROM Championship C, institution I WHERE C.Institution_ID = I.Institution_ID AND I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT C.Nickname FROM Championship C LEFT JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship GROUP BY Institution_ID ORDER BY COUNT(*) DESC)
SELECT institution.Name FROM institution INNER JOIN Championship ON institution.Institution_ID = Championship.Institution_ID ORDER BY Championship.Number_of_Championships DESC
SELECT Name FROM institution i WHERE i.Institution_ID IN (SELECT c.Institution_ID FROM Championship c)
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship WHERE Number_of_Championships >= 1)
SELECT TOTAL(Championship.Number_of_Championships) FROM Championship, institution WHERE Championship.Institution_ID = institution.Institution_ID AND institution.Affiliation = 'public'
SELECT TOTAL(Championship.Number_of_Championships) FROM Championship INNER JOIN institution ON Championship.Institution_ID = institution.Institution_ID WHERE institution.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(*) AS Total FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM institution GROUP BY Affiliation) AS Counts)
SELECT Affiliation FROM institution GROUP BY Affiliation HAVING COUNT(*) = (SELECT MAX(Count) FROM (SELECT COUNT(*) AS Count FROM institution GROUP BY Affiliation) AS Counts)
SELECT Founded AS Year FROM institution GROUP BY Year HAVING COUNT(Institution_ID) > 1
SELECT Founded AS Year, COUNT(*) FROM institution GROUP BY Year HAVING COUNT(*) > 1
SELECT Nickname FROM Championship AS C, institution AS I WHERE C.Institution_ID = I.Institution_ID ORDER BY I.Capacity DESC
SELECT Nickname FROM Championship INNER JOIN institution ON Championship.Institution_ID = institution.Institution_ID ORDER BY institution.Capacity DESC, institution.Name ASC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary') GROUP BY City
SELECT Enrollment FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT DISTINCT Province FROM institution WHERE Province IN (SELECT Province FROM institution WHERE Founded < 1920) INTERSECT SELECT Province FROM institution WHERE Province IN (SELECT Province FROM institution WHERE Founded > 1950)
SELECT COUNT(DISTINCT Province) FROM institution WHERE Province IS NOT NULL
SELECT COUNT(DISTINCT Province) FROM institution WHERE Province IS NOT NULL
SELECT * FROM Warehouses WHERE Code <> ''
SELECT W.Code, W.Location, W.Capacity FROM Warehouses W
SELECT DISTINCT b.Contents FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code AND w.Location = 'New York'
SELECT DISTINCT b.Contents FROM Boxes b JOIN Warehouses w ON b.Warehouse = w.Code AND w.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150.0
SELECT Warehouses.Code, AVG(Boxes.Value) AS AverageBoxValue FROM Warehouses LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT AVG(B.Value) AS AverageBoxValue, W.Code FROM Warehouses W LEFT JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code
SELECT AVG(Value), SUM(Value) FROM Boxes
SELECT AVG(Value), SUM(Value) FROM Boxes
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Max_Value FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) AS 'Average Value', MAX(Value) AS 'Maximum Value' FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents HAVING SUM(Value) = (SELECT MAX(total_sum) FROM (SELECT SUM(Value) AS total_sum FROM Boxes GROUP BY Contents))
SELECT Contents FROM (SELECT Contents, Value, RANK() OVER (ORDER BY Value DESC) AS rank FROM Boxes) WHERE rank = 1
SELECT AVG(Value) FROM Boxes AS Average_Value
SELECT AVG(Value) FROM Boxes AS Average_Value
SELECT DISTINCT Contents FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents
SELECT COUNT(DISTINCT B.Contents) FROM Boxes B
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses WHERE Location != ''
SELECT DISTINCT Location FROM Warehouses WHERE Location != ''
SELECT Code FROM Boxes AS B WHERE EXISTS (SELECT 1 FROM Warehouses AS W WHERE W.Code = B.Warehouse AND W.Location IN ('Chicago', 'New York'))
SELECT b.Code FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Location IN ('Chicago', 'New York')
SELECT SUM(Boxes.Value) FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT SUM(Value) FROM Boxes LEFT JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') AND Contents IN (SELECT DISTINCT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York'))
SELECT DISTINCT Contents FROM Boxes WHERE Contents NOT IN (SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Contents NOT IN (SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT Code FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' UNION SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT Code FROM Warehouses WHERE EXISTS (SELECT 1 FROM Boxes WHERE Warehouse = Warehouses.Code AND (Contents = 'Rocks' OR Contents = 'Scissors'))
SELECT DISTINCT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes GROUP BY Warehouse HAVING SUM(CASE WHEN Contents = 'Rocks' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Contents = 'Scissors' THEN 1 ELSE 0 END) > 0)
SELECT W.Location FROM Warehouses W, Boxes B WHERE W.Code = B.Warehouse AND (B.Contents = 'Rocks' OR B.Contents = 'Scissors') GROUP BY W.Location HAVING COUNT(DISTINCT B.Contents) = 2
SELECT Code AS BoxCode, Contents AS BoxContents FROM Boxes ORDER BY Value
SELECT Boxes.Code, Boxes.Contents FROM Boxes ORDER BY Boxes.Value ASC
SELECT Code, Contents FROM Boxes AS B WHERE B.Value = (SELECT MIN(Value) FROM Boxes AS B2)
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(B.Value) FROM Boxes B)
SELECT DISTINCT Contents FROM Boxes B1 WHERE B1.Value > (SELECT AVG(B2.Value) FROM Boxes B2)
SELECT DISTINCT Contents FROM Boxes B1 WHERE B1.Value > (SELECT AVG(B2.Value) FROM Boxes B2)
SELECT DISTINCT Contents FROM Boxes GROUP BY Contents ORDER BY Contents ASC
SELECT DISTINCT Contents FROM Boxes ORDER BY LOWER(Contents) ASC
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(B.Value) FROM Boxes B WHERE B.Contents = 'Rocks')
SELECT Code FROM Boxes WHERE Value > (SELECT MAX(B.Value) FROM Boxes B WHERE B.Contents = 'Rocks')
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors' AND Value IS NOT NULL)
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors' GROUP BY Contents)
WITH MaxCapacity AS (SELECT MAX(Capacity) AS Capacity FROM Warehouses) SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses, MaxCapacity WHERE Warehouses.Capacity = MaxCapacity.Capacity)
SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Capacity = (SELECT MAX(Capacity) FROM Warehouses))
SELECT Warehouses.Code, AVG(Boxes.Value) AS AverageValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code HAVING AverageValue > 150
SELECT B.Warehouse, AVG(B.Value) AS AverageValue FROM Boxes B GROUP BY B.Warehouse HAVING AVG(B.Value) > 150
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS BoxCount FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS BoxCount FROM Boxes GROUP BY Contents
SELECT Location, SUM(Capacity) AS Total_Capacity, AVG(Capacity) AS Avg_Capacity, MAX(Capacity) AS Max_Capacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS 'Total Capacity', AVG(Capacity) AS 'Average Capacity', MAX(Capacity) AS 'Maximum Capacity' FROM Warehouses GROUP BY Location
SELECT SUM(Warehouses.Capacity) AS TotalCapacity FROM Warehouses
SELECT SUM(Warehouses.Capacity) AS TotalCapacity FROM Warehouses
SELECT Warehouses.Location, MAX(Boxes.Value) FROM Warehouses, Boxes WHERE Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT Warehouses.Location, MAX(Boxes.Value) FROM Warehouses, Boxes WHERE Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Location
SELECT W.Code, COUNT(B.Warehouse) FROM Warehouses W LEFT JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code
SELECT Code, (SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code) AS TotalBoxes FROM Warehouses
SELECT COUNT(*) FROM (SELECT DISTINCT Location FROM Warehouses, Boxes WHERE Warehouses.Code = Boxes.Warehouse AND Boxes.Contents = 'Rocks')
SELECT DISTINCT COUNT(Warehouse) FROM Boxes WHERE Contents = 'Rocks' GROUP BY Warehouse
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT b.Code FROM Boxes b, Warehouses w WHERE b.Warehouse = w.Code AND w.Location = 'Chicago'
SELECT b.Code FROM Boxes AS b JOIN Warehouses AS w ON b.Warehouse = w.Code WHERE w.Location = 'Chicago'
SELECT w.Code, COUNT(b.Code) FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT Code, (SELECT COUNT(*) FROM Boxes WHERE Warehouse = Warehouses.Code) AS BoxCount FROM Warehouses
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) FROM Warehouses LEFT JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT w.Code, COUNT(DISTINCT b.Contents) FROM Warehouses AS w LEFT JOIN Boxes AS b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT Code FROM Warehouses WHERE EXISTS (SELECT 1 FROM Boxes WHERE Warehouse = Code GROUP BY Warehouse HAVING SUM(Value) > (SELECT Capacity FROM Warehouses WHERE Code = Warehouse))
SELECT W.Code FROM Warehouses W JOIN (SELECT Warehouse, COUNT(*) AS BoxCount FROM Boxes GROUP BY Warehouse) AS B ON W.Code = B.Warehouse WHERE B.BoxCount > W.Capacity
SELECT SUM(Value) FROM Boxes AS B WHERE B.Warehouse NOT IN (SELECT W.Code FROM Warehouses AS W WHERE W.Location = 'Chicago')
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location <> 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT COUNT(University_ID) FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT COUNT(*) AS NumberOfUniversities FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT MAX(Enrollment) AS MaxEnrollment, AVG(Enrollment) AS AvgEnrollment, MIN(Enrollment) AS MinEnrollment FROM university
SELECT MAX(Enrollment) AS Max_Enrollment, AVG(Enrollment) AS Avg_Enrollment, MIN(Enrollment) AS Min_Enrollment FROM university
SELECT U.Team_Name FROM university AS U WHERE U.Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT U.Team_Name FROM university U WHERE U.Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university WHERE Home_Conference IS NOT NULL
SELECT Home_Conference, COUNT(*) AS University_Count FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(University_ID) FROM university GROUP BY Home_Conference
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM university GROUP BY State) AS counts)
SELECT State FROM university GROUP BY State HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM university GROUP BY State) AS counts)
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT DISTINCT u.Home_Conference FROM university u WHERE (SELECT AVG(Enrollment) FROM university WHERE Home_Conference = u.Home_Conference) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING SUM(Enrollment) = (SELECT MIN(TotalEnrollment) FROM (SELECT SUM(Enrollment) AS TotalEnrollment FROM university GROUP BY Home_Conference) AS TempTable)
SELECT u.Home_Conference FROM university u GROUP BY u.Home_Conference HAVING SUM(u.Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) AS temp)
SELECT m.Major_Name, m.Major_Code FROM major AS m ORDER BY m.Major_Code
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code ASC
SELECT Major_Name, Rank FROM major m CROSS JOIN major_ranking mr ON m.Major_ID = mr.Major_ID CROSS JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT Major_Name, Rank FROM major, major_ranking, university WHERE major.Major_ID = major_ranking.Major_ID AND major_ranking.University_ID = university.University_ID AND university.University_Name = 'Augustana College'
SELECT DISTINCT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT DISTINCT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT U.University_Name FROM university U WHERE U.University_ID IN (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID HAVING COUNT(*) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) T))
SELECT U.University_Name FROM university U WHERE U.University_ID IN (SELECT University_ID FROM major_ranking WHERE Rank = 1 GROUP BY University_ID HAVING COUNT(*) = (SELECT MAX(CountRank) FROM (SELECT COUNT(*) AS CountRank FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) T))
SELECT u.University_Name FROM university u WHERE u.University_ID NOT IN (SELECT m.University_ID FROM major_ranking m WHERE m.Rank = 1 GROUP BY m.University_ID)
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT U.University_Name FROM university U WHERE EXISTS (SELECT * FROM major_ranking MR JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.University_ID = U.University_ID AND M.Major_Name = 'Accounting') AND EXISTS (SELECT * FROM major_ranking MR JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.University_ID = U.University_ID AND M.Major_Name = 'Urban Education')
WITH Accounting_Universities AS (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting')), Urban_Education_Universities AS (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education')) SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM Accounting_Universities INTERSECT SELECT University_ID FROM Urban_Education_Universities)
SELECT University_Name, Rank FROM university NATURAL JOIN overall_ranking WHERE State = 'Wisconsin'
SELECT name, rank FROM (SELECT University_Name AS name, Rank FROM university JOIN overall_ranking USING (University_ID) WHERE State = 'Wisconsin') AS subquery
SELECT U.University_Name FROM university U, overall_ranking O WHERE U.University_ID = O.University_ID AND O.Research_point = (SELECT MAX(Research_point) FROM overall_ranking)
SELECT U.University_Name FROM university U, overall_ranking O WHERE U.University_ID = O.University_ID AND O.Research_point = (SELECT MAX(Research_point) FROM overall_ranking)
SELECT university.University_Name FROM university, overall_ranking WHERE university.University_ID = overall_ranking.University_ID ORDER BY overall_ranking.Reputation_point ASC
SELECT U.University_Name FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Reputation_point ASC
SELECT U.University_Name FROM university U WHERE U.University_ID IN (SELECT MR.University_ID FROM major_ranking MR JOIN major M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name = 'Accounting' AND MR.Rank >= 3)
SELECT DISTINCT U.University_Name FROM university U, major_ranking MR, major M WHERE U.University_ID = MR.University_ID AND MR.Major_ID = M.Major_ID AND M.Major_Name = 'Accounting' AND MR.Rank >= 3
SELECT SUM(u.Enrollment) FROM university AS u JOIN overall_ranking AS o ON u.University_ID = o.University_ID WHERE o.Rank <= 5
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking r ON u.University_ID = r.University_ID WHERE r.Rank <= 5
SELECT U.University_Name, O.Citation_point FROM university U LEFT JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE O.Reputation_point >= (SELECT MIN(Reputation_point) FROM (SELECT Reputation_point FROM overall_ranking ORDER BY Reputation_point DESC LIMIT 3) AS TempTable)
SELECT U.University_Name, O.Citation_point FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(DISTINCT University_ID) > 2
SELECT u.State FROM university u GROUP BY u.State HAVING COUNT(CASE WHEN u.Enrollment < 3000 THEN 1 ELSE NULL END) > 2
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT m.Title FROM Movies m WHERE m.Rating = 'G'
SELECT m.Title FROM Movies m WHERE m.Rating = 'G'
SELECT Title FROM Movies WHERE EXISTS (SELECT 1 FROM MovieTheaters WHERE MovieTheaters.Movie = Movies.Code AND MovieTheaters.Name = 'Odeon')
SELECT Title FROM Movies WHERE EXISTS (SELECT 1 FROM MovieTheaters WHERE MovieTheaters.Movie = Movies.Code AND MovieTheaters.Name = 'Odeon')
SELECT M.Title, T.Name FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie
SELECT M.Title, T.Name FROM Movies M JOIN MovieTheaters T ON M.Code = T.Movie
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT DISTINCT COUNT(Title) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT DISTINCT COUNT(Title) FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT COUNT(DISTINCT Code) AS TotalTheaters FROM MovieTheaters
SELECT COUNT(DISTINCT Code) AS NumberOfTheaters FROM MovieTheaters
SELECT m.Rating FROM Movies m WHERE m.Title LIKE '%Citizen%'
SELECT m.Rating FROM Movies m WHERE m.Title LIKE '%Citizen%'
SELECT Name FROM MovieTheaters WHERE EXISTS (SELECT 1 FROM Movies WHERE Movies.Code = MovieTheaters.Movie AND Movies.Rating IN ('G', 'PG'))
SELECT MT.Name FROM MovieTheaters MT LEFT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G' OR M.Rating = 'PG'
SELECT M.Title FROM Movies AS M, MovieTheaters AS MT WHERE M.Code = MT.Movie AND MT.Name IN ('Odeon', 'Imperial')
SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon' OR Name = 'Imperial')
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial') GROUP BY M.Title HAVING COUNT(DISTINCT MT.Name) = 2
WITH OdeonMovies AS (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon'), ImperialMovies AS (SELECT Movie FROM MovieTheaters WHERE Name = 'Imperial') SELECT Title FROM Movies WHERE Code IN (SELECT Movie FROM OdeonMovies INTERSECT SELECT Movie FROM ImperialMovies)
SELECT M.Title FROM Movies M LEFT JOIN MovieTheaters MT ON M.Code = MT.Movie AND MT.Name = 'Odeon' WHERE MT.Movie IS NULL
SELECT M.Title FROM Movies M LEFT JOIN MovieTheaters MT ON M.Code = MT.Movie AND MT.Name = 'Odeon' WHERE MT.Movie IS NULL
SELECT Movies.Title FROM Movies ORDER BY Movies.Title ASC
SELECT Movies.Title FROM Movies ORDER BY Movies.Title ASC
SELECT m.Title FROM Movies m ORDER BY m.Rating
SELECT Title FROM Movies ORDER BY Rating, Title
SELECT Name FROM MovieTheaters GROUP BY Name HAVING COUNT(DISTINCT Movie) = (SELECT MAX(MovieCount) FROM (SELECT COUNT(DISTINCT Movie) AS MovieCount FROM MovieTheaters GROUP BY Name) AS SubQuery)
WITH MovieCount AS (SELECT Name, COUNT(Movie) AS TotalMovies FROM MovieTheaters GROUP BY Name) SELECT Name FROM MovieCount WHERE TotalMovies = (SELECT MAX(TotalMovies) FROM MovieCount)
SELECT Title FROM Movies WHERE Code = (SELECT Movie FROM (SELECT Movie, COUNT(*) AS Count FROM MovieTheaters GROUP BY Movie) AS Temp ORDER BY Count DESC LIMIT 1)
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie GROUP BY M.Title ORDER BY COUNT(*) DESC LIMIT 1
SELECT Rating, COUNT(Code) AS Total FROM Movies GROUP BY Rating
SELECT Rating, COUNT(Code) AS MovieCount FROM Movies GROUP BY Rating ORDER BY MovieCount
SELECT COUNT(*) AS NumberOfMovies FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) AS NumberOfMovies FROM Movies WHERE Rating IS NOT NULL
SELECT MT.Name FROM MovieTheaters MT WHERE EXISTS (SELECT 1 FROM Movies M WHERE MT.Movie = M.Code)
SELECT Name FROM MovieTheaters AS MT WHERE EXISTS (SELECT Code FROM Movies AS M WHERE M.Code = MT.Movie)
SELECT Name FROM MovieTheaters WHERE Movie = 'NULL'
SELECT Name FROM MovieTheaters WHERE Movie = ''
SELECT MT.Name FROM MovieTheaters MT INNER JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT Title FROM Movies WHERE Title IS NOT NULL
SELECT m.Title FROM Movies m
SELECT Rating FROM Movies WHERE Rating IS NOT NULL GROUP BY Rating
SELECT Rating FROM Movies WHERE Rating IS NOT NULL GROUP BY Rating
SELECT Code, Title, Rating FROM Movies WHERE Rating = 'unrated'
SELECT Code, Title, Rating FROM Movies WHERE Rating = 'unrated'
SELECT Title FROM Movies WHERE NOT EXISTS (SELECT 1 FROM MovieTheaters WHERE Movie = Movies.Code)
SELECT Title FROM Movies M WHERE NOT EXISTS (SELECT NULL FROM MovieTheaters MT WHERE MT.Movie = M.Code)
SELECT C.Name FROM Client C JOIN Package P ON C.AccountNumber = P.Recipient WHERE P.Weight = (SELECT MAX(Weight) FROM Package)
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Recipient FROM Package WHERE Weight = (SELECT MAX(Weight) FROM Package))
SELECT TOTAL(Package.Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT SUM(P.Weight) FROM Package P CROSS JOIN Client C WHERE P.Sender = C.AccountNumber AND C.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position, Salary FROM Employee WHERE Name LIKE 'Turanga Leela'
SELECT Position, Salary FROM Employee WHERE Name LIKE 'Turanga Leela'
SELECT AVG(Salary) AS AverageSalary FROM Employee WHERE Position LIKE 'intern'
SELECT AVG(Salary) FROM Employee WHERE LOWER(Position) = 'intern'
SELECT DISTINCT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Position = 'Physician'
SELECT Level FROM Has_Clearance h JOIN Employee e ON h.Employee = e.EmployeeID WHERE e.Position LIKE 'physician'
SELECT Package.PackageNumber FROM Package, Client WHERE Package.Sender = Client.AccountNumber AND Client.Name = 'Leo Wong'
SELECT COUNT(DISTINCT Package.PackageNumber) FROM Package, Client WHERE Package.Sender = Client.AccountNumber AND Client.Name = 'Leo Wong'
SELECT DISTINCT PackageNumber FROM Package JOIN Client ON Recipient = AccountNumber WHERE Name = 'Leo Wong'
SELECT PackageNumber FROM Package WHERE Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT Package.* FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT DISTINCT p.PackageNumber FROM Package p LEFT JOIN Client c ON p.Sender = c.AccountNumber OR p.Recipient = c.AccountNumber WHERE c.Name = 'Leo Wong'
SELECT COUNT(*) FROM (SELECT * FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Ogden Wernstrom') AND Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')) AS SubQuery
SELECT COUNT(PackageNumber) AS TotalPackages FROM Package, Client AS Sender, Client AS Recipient WHERE Package.Sender = Sender.AccountNumber AND Package.Recipient = Recipient.AccountNumber AND Sender.Name = 'Ogden Wernstrom' AND Recipient.Name = 'Leo Wong'
SELECT p.Contents FROM Package p, Client c WHERE p.Sender = c.AccountNumber AND c.Name = 'John Zoidfarb'
SELECT Contents FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'John Zoidfarb'
SELECT PackageNumber, MAX(Weight) FROM Package JOIN Client ON Sender = AccountNumber WHERE Name LIKE '%John%' GROUP BY PackageNumber HAVING MAX(Weight) = (SELECT MAX(Weight) FROM Package JOIN Client ON Sender = AccountNumber WHERE Name LIKE '%John%')
SELECT P.PackageNumber, P.Weight FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name LIKE '%John%' ORDER BY P.Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3 OFFSET 0
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC, PackageNumber ASC LIMIT 3
SELECT C.Name, COUNT(P.PackageNumber) AS NumberOfPackages FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.Name ORDER BY NumberOfPackages DESC LIMIT 1
SELECT Name, COUNT(PackageNumber) FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Name HAVING COUNT(PackageNumber) = (SELECT MAX(Count) FROM (SELECT COUNT(PackageNumber) AS Count FROM Package GROUP BY Sender))
SELECT Client.Name, COUNT(Package.Recipient) AS ReceivedPackages FROM Client LEFT JOIN Package ON Client.AccountNumber = Package.Recipient GROUP BY Client.Name ORDER BY ReceivedPackages ASC LIMIT 1
SELECT C.Name FROM Client C, Package P WHERE C.AccountNumber = P.Recipient GROUP BY C.Name, P.Recipient HAVING COUNT(P.Recipient) = (SELECT MIN(CountPackages) FROM (SELECT COUNT(*) AS CountPackages FROM Package GROUP BY Recipient) AS SubQuery)
SELECT C.Name FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber HAVING COUNT(P.PackageNumber) > 1
SELECT C.Name FROM Client C WHERE EXISTS (SELECT 1 FROM Package P WHERE P.Sender = C.AccountNumber GROUP BY P.Sender HAVING COUNT(*) > 1)
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Planet.Name, Planet.Coordinates FROM Planet ORDER BY Planet.Name ASC
SELECT Planet.Name, Planet.Coordinates FROM Planet ORDER BY Planet.Name ASC
SELECT ShipmentID FROM Shipment WHERE Manager IN (SELECT EmployeeID FROM Employee WHERE Name = 'Phillip J. Fry')
SELECT s.ShipmentID FROM Shipment s INNER JOIN Employee e ON s.Manager = e.EmployeeID WHERE e.Name = 'Phillip J Fry'
SELECT Shipment.Date AS ShipmentDate FROM Shipment
SELECT Date FROM Shipment
SELECT Shipment.ShipmentID FROM Shipment LEFT JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment LEFT JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment, Planet, Employee WHERE Shipment.Planet = Planet.PlanetID AND Shipment.Manager = Employee.EmployeeID AND Planet.Name = 'Mars' AND Employee.Name = 'Turanga Leela'
SELECT ShipmentID FROM Shipment AS s JOIN Planet AS p ON s.Planet = p.PlanetID JOIN Employee AS e ON s.Manager = e.EmployeeID WHERE p.Name = 'Mars' AND e.Name = 'Turanga Leela'
SELECT ShipmentID FROM Shipment s, Planet p, Employee e WHERE s.Planet = p.PlanetID AND s.Manager = e.EmployeeID AND (p.Name = 'Mars' OR e.Name = 'Turanga Leela')
SELECT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name LIKE 'Mars' AND Employee.Name LIKE 'Turanga Leela'
SELECT Name, COUNT(ShipmentID) FROM Planet LEFT JOIN Shipment ON PlanetID = Planet GROUP BY Name
SELECT Name, COUNT(ShipmentID) AS Shipments FROM Planet LEFT OUTER JOIN Shipment ON PlanetID = Planet GROUP BY Name
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Planet FROM Shipment GROUP BY Planet HAVING COUNT(ShipmentID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(ShipmentID) AS Cnt FROM Shipment GROUP BY Planet) AS Sub))
SELECT P.Name FROM Planet P WHERE P.PlanetID IN (SELECT S.Planet FROM Shipment S GROUP BY S.Planet HAVING COUNT(S.ShipmentID) = (SELECT MAX(Cnt) FROM (SELECT COUNT(*) AS Cnt FROM Shipment GROUP BY Planet) T))
SELECT Name, COUNT(ShipmentID) FROM Employee, Shipment WHERE Employee.EmployeeID = Shipment.Manager GROUP BY Name
SELECT Name, COUNT(ShipmentID) FROM Employee, Shipment WHERE Employee.EmployeeID = Shipment.Manager GROUP BY Name
SELECT SUM(P.Weight) FROM Package AS P JOIN Shipment AS S ON P.Shipment = S.ShipmentID JOIN Planet AS Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT SUM(P.Weight) AS TotalWeight FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars' GROUP BY Pl.Name
SELECT Planet.Name, SUM(Package.Weight) AS TotalWeight FROM Planet INNER JOIN Shipment ON Planet.PlanetID = Shipment.Planet INNER JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet.Name
SELECT DISTINCT P.Name, SUM(Pa.Weight) OVER (PARTITION BY P.Name) AS TotalWeight FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package Pa ON S.ShipmentID = Pa.Shipment
SELECT P.Name FROM Planet P JOIN (SELECT Planet, SUM(Weight) AS TotalWeight FROM Shipment JOIN Package ON Shipment.ShipmentID = Package.Shipment GROUP BY Planet) AS SubQuery ON P.PlanetID = SubQuery.Planet WHERE SubQuery.TotalWeight > 30
SELECT P.Name FROM Planet P JOIN (SELECT Planet, SUM(Weight) AS TotalWeight FROM Shipment JOIN Package ON ShipmentID = Shipment GROUP BY Planet HAVING TotalWeight > 30) AS SubQuery ON P.PlanetID = SubQuery.Planet
SELECT Package.PackageNumber FROM Package INNER JOIN Shipment ON Package.Shipment = Shipment.ShipmentID INNER JOIN Planet ON Shipment.Planet = Planet.PlanetID INNER JOIN Client ON Package.Sender = Client.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' AND Client.Name = 'Zapp Brannigan'
SELECT COUNT(Package.PackageNumber) FROM Package, Shipment, Client, Planet WHERE Package.Sender = Client.AccountNumber AND Shipment.Planet = Planet.PlanetID AND Package.Shipment = Shipment.ShipmentID AND Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT PackageNumber FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Omicron Persei 8' UNION SELECT PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package p INNER JOIN Shipment s ON p.Shipment = s.ShipmentID INNER JOIN Planet pl ON s.Planet = pl.PlanetID INNER JOIN Client c ON p.Sender = c.AccountNumber WHERE pl.Name = 'Omicron Persei 8' OR c.Name = 'Zapp Brannigan'
SELECT Package.PackageNumber, Package.Weight FROM Package WHERE Package.Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight > 9 AND Weight < 31
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance WHERE Planet IN (SELECT PlanetID FROM Planet WHERE Name = 'Mars'))
SELECT E.Name FROM Employee E WHERE E.EmployeeID IN (SELECT HC.Employee FROM Has_Clearance HC JOIN Planet P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III')
SELECT E.Name FROM Employee E WHERE E.EmployeeID IN (SELECT HC.Employee FROM Has_Clearance HC JOIN Planet P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III')
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Planet FROM Has_Clearance H GROUP BY H.Planet HAVING COUNT(DISTINCT H.Employee) = 1)
SELECT P.Name FROM Planet P WHERE (SELECT COUNT(DISTINCT Employee) FROM Has_Clearance WHERE Planet = P.PlanetID) = 1
SELECT E.Name FROM Employee E WHERE E.Salary > 4999 AND E.Salary < 10001
SELECT Employee.Name FROM Employee WHERE Employee.Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary > 5000 OR Salary > (SELECT AVG(Salary) FROM Employee)
SELECT Name FROM Employee WHERE Salary > 5000 OR Salary > (SELECT AVG(Salary) FROM Employee)
SELECT COUNT(*) FROM Employee WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Has_Clearance.Employee = Employee.EmployeeID AND Planet.Name = 'Mars')
SELECT COUNT(DISTINCT Employee.EmployeeID) FROM Employee LEFT OUTER JOIN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars') AS MarsClearance ON Employee.EmployeeID = MarsClearance.Employee WHERE MarsClearance.Employee IS NULL
SELECT COUNT(*) FROM (SELECT * FROM game) AS AllGames
SELECT COUNT(*) FROM game WHERE Game_ID IS NOT NULL
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE LOWER(Developers) != LOWER('Nintendo')
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers NOT LIKE '%Nintendo%'
SELECT platform.Platform_name AS Name, platform.Market_district AS District FROM platform
SELECT Platform_name, Market_district FROM platform WHERE Platform_name IS NOT NULL
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1 AND Platform_ID IS NOT NULL
SELECT Platform_name, Platform_ID FROM platform WHERE Download_rank = 1 AND Platform_ID IS NOT NULL
SELECT (SELECT MAX(Rank_of_the_year) FROM player) AS MaxRank, (SELECT MIN(Rank_of_the_year) FROM player) AS MinRank
SELECT MAX(player.Rank_of_the_year) AS MaxRank, MIN(player.Rank_of_the_year) AS MinRank FROM player
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(*) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name AS Name FROM player ORDER BY Name ASC
SELECT p.Player_name FROM player AS p ORDER BY p.Player_name
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, Rank_of_the_year FROM player, game_player, game WHERE player.Player_ID = game_player.Player_ID AND game_player.Game_ID = game.Game_ID AND game.Title = 'Super Mario World'
SELECT Player_name, Rank_of_the_year FROM player WHERE Player_ID IN (SELECT Player_ID FROM game_player WHERE Game_ID IN (SELECT Game_ID FROM game WHERE Title = 'Super Mario World'))
SELECT DISTINCT g.Developers FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College = 'Auburn' AND g.Developers IS NOT NULL
SELECT DISTINCT Developers FROM game, game_player, player WHERE game.Game_ID = game_player.Game_ID AND game_player.Player_ID = player.Player_ID AND player.College = 'Auburn'
SELECT AVG(Units_sold_Millions) FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT AVG(Units_sold_Millions) FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE Position = 'Guard'))
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT g.Title, p.Platform_name FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID
SELECT Title FROM game AS g JOIN platform AS p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district = 'Asia' OR p.Market_district = 'USA'
SELECT g.Title FROM game g JOIN platform p ON g.Platform_ID = p.Platform_ID WHERE p.Market_district IN ('Asia', 'USA')
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise, COUNT(Game_ID) AS CountOfGames FROM game GROUP BY Franchise ORDER BY CountOfGames DESC
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(*) = (SELECT MAX(TotalGames) FROM (SELECT COUNT(*) AS TotalGames FROM game GROUP BY Franchise) tmp)
SELECT g.Franchise FROM game g GROUP BY g.Franchise HAVING COUNT(g.Game_ID) = (SELECT MAX(GameCount) FROM (SELECT COUNT(Game_ID) AS GameCount FROM game GROUP BY Franchise) AS SubQuery)
SELECT DISTINCT Franchise FROM game WHERE Franchise IN (SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2)
SELECT Franchise FROM (SELECT Franchise, COUNT(Game_ID) AS NumGames FROM game GROUP BY Franchise) AS subquery WHERE NumGames > 1
SELECT p.Player_name FROM player p WHERE NOT EXISTS (SELECT NULL FROM game_player gp WHERE gp.Player_ID = p.Player_ID)
SELECT p.Player_name FROM player p WHERE NOT EXISTS (SELECT NULL FROM game_player gp WHERE gp.Player_ID = p.Player_ID)
SELECT game.Title FROM game INNER JOIN game_player ON game.Game_ID = game_player.Game_ID INNER JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Oklahoma' INTERSECT SELECT game.Title FROM game INNER JOIN game_player ON game.Game_ID = game_player.Game_ID INNER JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.College = 'Auburn'
SELECT Title FROM game g WHERE EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.College IN ('Oklahoma', 'Auburn'))
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT Title FROM game g WHERE g.Game_ID NOT IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE Position = 'Guard')
SELECT g.Title FROM game g WHERE g.Game_ID NOT IN (SELECT gp.Game_ID FROM game_player gp INNER JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard')
SELECT Name FROM press WHERE Year_Profits_billion IS NOT NULL ORDER BY Year_Profits_billion DESC
SELECT p.Name FROM press p ORDER BY p.Year_Profits_billion DESC
SELECT p.Name FROM press p WHERE p.Year_Profits_billion > 15 OR p.Month_Profits_billion > 1
SELECT p.Name FROM press p WHERE p.Year_Profits_billion > 15 OR p.Month_Profits_billion > 1
SELECT AVG(p.Year_Profits_billion) AS Average_Yearly_Profit, MAX(p.Year_Profits_billion) AS Maximum_Yearly_Profit FROM press p
SELECT Press_ID, Name, AVG(Year_Profits_billion) AS Avg_Profit, MAX(Year_Profits_billion) AS Max_Profit FROM press GROUP BY Press_ID, Name
SELECT Name FROM press p1 WHERE NOT EXISTS (SELECT 1 FROM press p2 WHERE p2.Month_Profits_billion > p1.Month_Profits_billion)
SELECT Name FROM press AS p WHERE p.Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press AS sub_p)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT COUNT(*) FROM author WHERE Age IN (SELECT Age FROM author WHERE Age < 30)
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender HAVING COUNT(*) > 0
SELECT author.Gender, AVG(author.Age) AS Avg_Age FROM author GROUP BY author.Gender
SELECT a.Gender, COUNT(a.Author_ID) FROM author a WHERE a.Age > 30 GROUP BY a.Gender
SELECT Gender, COUNT(Author_ID) AS CountOfAuthors FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book AS b ORDER BY b.Release_date DESC
SELECT Book_Series, COUNT(Book_ID) AS NumberOfBooks FROM book GROUP BY Book_Series
SELECT b.Book_Series, COUNT(b.Book_ID) AS TotalBooks FROM book b GROUP BY b.Book_Series
SELECT Title, Release_date FROM book AS b ORDER BY b.Sale_Amount DESC LIMIT 5
SELECT book.Title, book.Release_date FROM book ORDER BY book.Sale_Amount DESC LIMIT 5
SELECT DISTINCT b.Book_Series FROM book b WHERE (SELECT COUNT(*) FROM book WHERE Book_Series = b.Book_Series AND Sale_Amount > 1000) > 0 AND (SELECT COUNT(*) FROM book WHERE Book_Series = b.Book_Series AND Sale_Amount < 500) > 0
SELECT b.Book_Series FROM book b JOIN (SELECT Book_Series FROM book WHERE Sale_Amount > 1000) AS high ON b.Book_Series = high.Book_Series JOIN (SELECT Book_Series FROM book WHERE Sale_Amount < 500) AS low ON b.Book_Series = low.Book_Series GROUP BY b.Book_Series
SELECT Name FROM author a WHERE (SELECT COUNT(DISTINCT Book_Series) FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series IN ('MM', 'LT')) = 2
SELECT Name FROM author WHERE Author_ID IN (SELECT b.Author_ID FROM book b WHERE b.Book_Series = 'MM') AND Author_ID IN (SELECT b.Author_ID FROM book b WHERE b.Book_Series = 'LT')
SELECT Name, Age FROM author a LEFT OUTER JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Author_ID IS NULL
SELECT a.Name FROM author a LEFT JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Author_ID IS NULL
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book GROUP BY Author_ID HAVING COUNT(*) > 1)
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT B.Title, A.Name, P.Name FROM book B CROSS JOIN author A CROSS JOIN press P WHERE B.Author_ID = A.Author_ID AND B.Press_ID = P.Press_ID ORDER BY B.Sale_Amount DESC LIMIT 3
SELECT book.Title, author.Name, press.Name FROM book CROSS JOIN author ON book.Author_ID = author.Author_ID CROSS JOIN press ON book.Press_ID = press.Press_ID ORDER BY book.Sale_Amount DESC LIMIT 3
SELECT Name, SUM(Sale_Amount) FROM press, book WHERE press.Press_ID = book.Press_ID GROUP BY Name
SELECT Name, Total_Sales FROM (SELECT press.Name AS Name, SUM(book.Sale_Amount) AS Total_Sales FROM press JOIN book ON press.Press_ID = book.Press_ID GROUP BY press.Name) AS SalesSummary
SELECT p.Name AS PublisherName, COUNT(*) AS BooksSold FROM press p, book b WHERE p.Press_ID = b.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Name
SELECT p.Name, COUNT(b.Book_ID) AS HighSellingBooks FROM press p LEFT JOIN book b ON p.Press_ID = b.Press_ID AND b.Sale_Amount > 1000 GROUP BY p.Name
SELECT author.Name FROM author INNER JOIN book ON author.Author_ID = book.Author_ID WHERE book.Sale_Amount = (SELECT MAX(Sale_Amount) FROM book)
SELECT Name FROM author WHERE Author_ID = (SELECT Author_ID FROM book WHERE Sale_Amount = (SELECT MAX(Sale_Amount) FROM book))
SELECT a.Name, a.Gender FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID GROUP BY b.Author_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT a.Name, a.Gender FROM author a, book b WHERE a.Author_ID = b.Author_ID GROUP BY a.Author_ID, a.Name, a.Gender HAVING COUNT(b.Book_ID) = (SELECT MAX(book_count) FROM (SELECT COUNT(b.Book_ID) AS book_count FROM book b GROUP BY b.Author_ID) subquery)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT b.Author_ID FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor')
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT b.Author_ID FROM book b, press p WHERE b.Press_ID = p.Press_ID AND p.Name = 'Accor')
SELECT p.Name, p.Year_Profits_billion FROM press p JOIN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(*) > 2) b ON p.Press_ID = b.Press_ID
SELECT p.Name, p.Year_Profits_billion FROM press p JOIN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(*) > 2) b ON p.Press_ID = b.Press_ID
SELECT COUNT(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors WHERE author_name IS NOT NULL
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(*) AS Total FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4 LIMIT 1
SELECT d.author_name FROM Documents d WHERE d.document_name = 'Travel to Brazil'
SELECT COUNT(document_id) AS NumberOfDocuments FROM Documents WHERE author_name = 'Era Kerluke'
SELECT d.document_name, d.document_description FROM Documents d
SELECT D.document_id, D.document_name FROM Documents AS D JOIN Authors AS A ON D.author_name = A.author_name WHERE A.author_name = 'Bianka Cummings'
SELECT a.author_name, a.other_details FROM Authors a WHERE a.author_name IN (SELECT d.author_name FROM Documents d WHERE d.document_name = 'Travel to China')
SELECT Authors.author_name, COUNT(Documents.document_id) FROM Authors LEFT JOIN Documents ON Authors.author_name = Documents.author_name GROUP BY Authors.author_name
SELECT A.author_name FROM Authors A, Documents D WHERE A.author_name = D.author_name GROUP BY A.author_name HAVING COUNT(D.document_id) = (SELECT MAX(doc_count) FROM (SELECT COUNT(document_id) AS doc_count FROM Documents GROUP BY author_name) T)
SELECT author_name FROM Authors WHERE EXISTS (SELECT 1 FROM Documents WHERE Documents.author_name = Authors.author_name GROUP BY author_name HAVING COUNT(document_id) >= 2)
SELECT COUNT(*) FROM (SELECT DISTINCT process_id FROM Business_Processes) AS UniqueProcesses
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9 AND next_process_id IS NOT NULL
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT B.process_id FROM Business_Processes A JOIN Business_Processes B ON A.next_process_id = B.process_id WHERE A.process_id = 9)
SELECT COUNT(1) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes WHERE process_outcome_code IS NOT NULL
SELECT Process_Outcomes.process_outcome_description FROM Process_Outcomes WHERE Process_Outcomes.process_outcome_code = 'working'
SELECT DISTINCT COUNT(process_status_code) FROM Process_Status
SELECT DISTINCT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(staff_id) AS TotalStaff FROM Staff
SELECT staff_id, staff_details FROM Staff WHERE staff_id IS NOT NULL
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT COUNT(*) FROM (SELECT DISTINCT staff_role_code FROM Ref_Staff_Roles WHERE staff_role_code IS NOT NULL) AS roles_count
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT Ref_Staff_Roles.staff_role_description FROM Ref_Staff_Roles WHERE Ref_Staff_Roles.staff_role_code = 'HR'
SELECT COUNT(*) FROM (SELECT DISTINCT document_id FROM Documents_Processes) AS subquery
SELECT DISTINCT process_id FROM Documents_Processes WHERE document_id IN (SELECT document_id FROM Documents)
SELECT document_id FROM Documents EXCEPT SELECT document_id FROM Documents_Processes
SELECT process_id FROM Business_Processes WHERE process_id NOT IN (SELECT DISTINCT process_id FROM Documents_Processes)
SELECT A.process_outcome_description, B.process_status_description FROM (SELECT * FROM Documents_Processes WHERE document_id = 0) AS C JOIN Process_Outcomes A ON C.process_outcome_code = A.process_outcome_code JOIN Process_Status B ON C.process_status_code = B.process_status_code
SELECT process_name FROM Business_Processes WHERE EXISTS (SELECT 1 FROM Documents_Processes dp JOIN Documents d ON dp.document_id = d.document_id WHERE dp.process_id = Business_Processes.process_id AND d.document_name = 'Travel to Brazil')
SELECT bp.process_id, COUNT(dp.document_id) FROM Business_Processes bp LEFT JOIN Documents_Processes dp ON bp.process_id = dp.process_id GROUP BY bp.process_id
SELECT COUNT(DISTINCT Staff.staff_id) FROM Staff, Staff_in_Processes WHERE Staff.staff_id = Staff_in_Processes.staff_id AND Staff_in_Processes.document_id = 0 AND Staff_in_Processes.process_id = 9
SELECT s.staff_id, COUNT(DISTINCT sp.document_id) AS NumberOfProcesses FROM Staff s LEFT JOIN Staff_in_Processes sp ON s.staff_id = sp.staff_id GROUP BY s.staff_id
SELECT R.staff_role_code, COUNT(P.document_id) AS num_processes FROM Ref_Staff_Roles R LEFT JOIN Staff_in_Processes P ON R.staff_role_code = P.staff_role_code GROUP BY R.staff_role_code
SELECT COUNT(DISTINCT T2.staff_role_description) FROM Staff AS T1 INNER JOIN Staff_in_Processes AS T3 ON T1.staff_id = T3.staff_id INNER JOIN Ref_Staff_Roles AS T2 ON T3.staff_role_code = T2.staff_role_code WHERE T1.staff_id = 3
SELECT COUNT(agency_id) FROM Agencies
SELECT COUNT(1) FROM Agencies
SELECT DISTINCT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies WHERE agency_details IS NOT NULL
SELECT COUNT(client_id) AS NumberOfClients FROM Clients
SELECT COUNT(*) AS NumberOfClients FROM Clients
SELECT Clients.client_id, Clients.client_details FROM Clients
SELECT Clients.client_id, Clients.client_details FROM Clients
SELECT A.agency_id, COUNT(C.client_id) AS num_clients FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id
SELECT A.agency_id, COUNT(C.client_id) AS num_clients FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE EXISTS (SELECT 1 FROM Clients C WHERE C.agency_id = A.agency_id GROUP BY C.agency_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Clients GROUP BY agency_id) AS subquery))
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE A.agency_id = (SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 0)
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE EXISTS (SELECT 1 FROM Clients C WHERE C.agency_id = A.agency_id GROUP BY C.agency_id HAVING COUNT(C.client_id) > 1)
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id HAVING COUNT(C.client_id) >= 2
SELECT A.agency_details FROM Agencies A INNER JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT A.agency_details FROM Agencies A, Clients C WHERE A.agency_id = C.agency_id AND C.client_details LIKE '%Mac%'
SELECT client_details, agency_details FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT Clients.client_details, Agencies.agency_details FROM Clients INNER JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT COUNT(client_id), sic_code FROM Clients GROUP BY sic_code
SELECT COUNT(client_id), sic_code FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad' AND client_id IS NOT NULL
SELECT client_id, client_details FROM Clients WHERE sic_code IN ('Bad')
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients)
SELECT agency_id, agency_details FROM Agencies WHERE EXISTS (SELECT agency_id FROM Clients WHERE Clients.agency_id = Agencies.agency_id)
SELECT DISTINCT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients)
SELECT DISTINCT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients)
SELECT COUNT(DISTINCT invoice_id) FROM Invoices
SELECT COUNT(DISTINCT invoice_id) FROM Invoices
SELECT invoice_id AS ID, invoice_status AS Status, invoice_details AS Details FROM Invoices
SELECT `invoice_id`, `invoice_status`, `invoice_details` FROM `Invoices`
SELECT Clients.client_id, IFNULL(COUNT(Invoices.invoice_id), 0) AS total_invoices FROM Clients LEFT JOIN Invoices ON Clients.client_id = Invoices.client_id GROUP BY Clients.client_id
SELECT COUNT(invoice_id), client_id FROM Invoices GROUP BY client_id
SELECT client_id, client_details FROM Clients WHERE client_id = (SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) = (SELECT MAX(invoice_count) FROM (SELECT client_id, COUNT(*) AS invoice_count FROM Invoices GROUP BY client_id) AS Sub))
SELECT Clients.client_id, Clients.client_details FROM Clients INNER JOIN (SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Invoices GROUP BY client_id) AS sub)) AS MaxInvoices ON Clients.client_id = MaxInvoices.client_id
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) >= 2
SELECT DISTINCT client_id FROM Invoices GROUP BY client_id HAVING COUNT(*) >= 2
SELECT invoice_status, COUNT(invoice_id) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(invoice_id) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(*) = (SELECT MAX(count) FROM (SELECT COUNT(*) AS count FROM Invoices GROUP BY invoice_status) AS subquery)
SELECT invoice_status FROM Invoices GROUP BY invoice_status HAVING COUNT(invoice_status) = (SELECT MAX(count) FROM (SELECT COUNT(invoice_status) AS count FROM Invoices GROUP BY invoice_status) AS counts)
SELECT I.invoice_status, I.invoice_details, C.client_id, C.client_details, A.agency_id, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
SELECT I.invoice_status, I.invoice_details, C.client_id, C.client_details, A.agency_id, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_type, other_details FROM Meetings
SELECT Meetings.meeting_outcome, Meetings.purpose_of_meeting FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings WHERE meeting_outcome IS NOT NULL AND purpose_of_meeting IS NOT NULL
SELECT p.payment_id, p.payment_details FROM Payments p, Invoices i WHERE p.invoice_id = i.invoice_id AND i.invoice_status = 'Working'
SELECT p.payment_id, p.payment_details FROM Payments p, Invoices i WHERE p.invoice_id = i.invoice_id AND i.invoice_status = 'Working'
SELECT i.invoice_id, i.invoice_status FROM Invoices i WHERE i.invoice_id NOT IN (SELECT p.invoice_id FROM Payments p WHERE p.invoice_id IS NOT NULL)
SELECT Invoices.invoice_id, Invoices.invoice_status FROM Invoices WHERE NOT EXISTS (SELECT 1 FROM Payments WHERE Payments.invoice_id = Invoices.invoice_id)
SELECT COUNT(payment_id) FROM Payments
SELECT COUNT(payment_id) FROM Payments
SELECT p.payment_id, p.invoice_id, i.invoice_details FROM Payments AS p JOIN Invoices AS i ON p.invoice_id = i.invoice_id
SELECT * FROM Payments
SELECT invoice_id, invoice_status FROM Invoices GROUP BY invoice_id, invoice_status
SELECT DISTINCT invoice_id AS InvoiceID, invoice_status AS Status FROM Invoices JOIN Payments USING (invoice_id)
SELECT Invoices.invoice_id AS InvoiceID, COUNT(Payments.payment_id) AS NumberOfPayments FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY InvoiceID
SELECT p.invoice_id, COUNT(p.payment_id) AS payment_count FROM Payments p WHERE p.invoice_id IS NOT NULL GROUP BY p.invoice_id
SELECT invoice_id, invoice_status, invoice_details FROM Invoices WHERE invoice_id IN (SELECT invoice_id FROM Payments GROUP BY invoice_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Payments GROUP BY invoice_id) AS subquery))
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I JOIN (SELECT invoice_id FROM Payments GROUP BY invoice_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Payments GROUP BY invoice_id) AS sub)) AS P ON I.invoice_id = P.invoice_id
SELECT COUNT(staff_id) AS NumberOfStaff FROM Staff
SELECT COUNT(*) FROM Staff
SELECT a.agency_id, COUNT(s.staff_id) AS num_staff FROM Agencies a LEFT JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id
SELECT A.agency_id, COUNT(S.staff_id) AS staff_number FROM Agencies A LEFT JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1) AS MaxStaff ON A.agency_id = MaxStaff.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1) S ON A.agency_id = S.agency_id
SELECT COUNT(meeting_id) AS meeting_counts, meeting_outcome FROM Meetings GROUP BY meeting_outcome
SELECT COUNT(meeting_id) AS total_meetings, meeting_outcome FROM Meetings GROUP BY meeting_outcome
SELECT Clients.client_id AS ClientID, COUNT(Meetings.meeting_id) AS MeetingsCount FROM Clients LEFT JOIN Meetings ON Clients.client_id = Meetings.client_id GROUP BY Clients.client_id
SELECT Meetings.client_id, COUNT(*) FROM Meetings GROUP BY Meetings.client_id
SELECT Meetings.client_id, Meetings.meeting_type, COUNT(*) AS TotalMeetings FROM Meetings GROUP BY Meetings.client_id, Meetings.meeting_type
SELECT COUNT(*) AS total_meetings, meeting_type FROM Meetings GROUP BY meeting_type
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings LEFT JOIN Clients ON Meetings.client_id = Clients.client_id
SELECT Meetings.meeting_id, Meetings.meeting_outcome, Meetings.meeting_type, Clients.client_details FROM Meetings LEFT JOIN Clients ON Meetings.client_id = Clients.client_id
SELECT m.meeting_id, COUNT(DISTINCT s.staff_id) FROM Meetings m LEFT JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT meeting_id, COUNT(DISTINCT staff_id) FROM Staff_in_Meetings GROUP BY meeting_id
WITH MeetingCounts AS (SELECT staff_id, COUNT(meeting_id) AS num_meetings FROM Staff_in_Meetings GROUP BY staff_id) SELECT staff_id, num_meetings FROM MeetingCounts WHERE num_meetings = (SELECT MIN(num_meetings) FROM MeetingCounts)
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) = (SELECT MIN(num_meetings) FROM (SELECT staff_id, COUNT(meeting_id) AS num_meetings FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(meeting_id) > 0) AS subquery)
SELECT COUNT(*) FROM (SELECT DISTINCT staff_id FROM Staff_in_Meetings) AS unique_staff
SELECT COUNT(*) FROM (SELECT DISTINCT staff_id FROM Staff_in_Meetings) AS unique_staff
SELECT COUNT(*) FROM (SELECT staff_id FROM Staff EXCEPT SELECT staff_id FROM Staff_in_Meetings) AS NonAttendees
SELECT COUNT(*) FROM Staff s WHERE s.staff_id NOT IN (SELECT sm.staff_id FROM Staff_in_Meetings sm)
SELECT c.client_id, c.client_details FROM Clients c WHERE c.client_id IN (SELECT m.client_id FROM Meetings m UNION ALL SELECT i.client_id FROM Invoices i)
SELECT DISTINCT c.client_id, c.client_details FROM Clients c, Meetings m, Invoices i WHERE c.client_id = m.client_id OR c.client_id = i.client_id
SELECT s.staff_id, s.staff_details FROM Staff s JOIN Staff_in_Meetings sim ON s.staff_id = sim.staff_id WHERE s.staff_details LIKE '%s%' GROUP BY s.staff_id, s.staff_details HAVING COUNT(*) >= 1
SELECT s.staff_id, s.staff_details FROM Staff s JOIN Staff_in_Meetings sim ON s.staff_id = sim.staff_id WHERE s.staff_details LIKE '%s%' GROUP BY s.staff_id HAVING COUNT(sim.meeting_id) >= 1
SELECT client_id, sic_code, agency_id FROM Clients WHERE EXISTS (SELECT 1 FROM Meetings WHERE Meetings.client_id = Clients.client_id GROUP BY Meetings.client_id HAVING COUNT(*) = 1) AND EXISTS (SELECT 1 FROM Invoices WHERE Invoices.client_id = Clients.client_id)
SELECT client_id, sic_code, agency_id FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings GROUP BY client_id HAVING COUNT(*) = 1) AND client_id IN (SELECT client_id FROM Invoices)
SELECT M.start_date_time AS 'Start Time', M.end_date_time AS 'End Time', C.client_details AS 'Client Details', S.staff_details AS 'Staff Details' FROM Meetings M, Clients C, Staff_in_Meetings SM, Staff S WHERE M.client_id = C.client_id AND M.meeting_id = SM.meeting_id AND SM.staff_id = S.staff_id
SELECT start_date_time, end_date_time, client_details, staff_details FROM Meetings INNER JOIN Clients ON Meetings.client_id = Clients.client_id INNER JOIN Staff_in_Meetings ON Meetings.meeting_id = Staff_in_Meetings.meeting_id INNER JOIN Staff ON Staff_in_Meetings.staff_id = Staff.staff_id
