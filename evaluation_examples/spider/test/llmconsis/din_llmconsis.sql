SELECT COUNT(*) FROM club
SELECT COUNT(Club_ID) FROM club
SELECT Name FROM club ORDER BY Name ASC
SELECT Name FROM club ORDER BY Name ASC
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM club WHERE Manufacturer <> 'Nike'
SELECT Name FROM club WHERE Manufacturer <> 'Nike'
SELECT p.Name FROM player p ORDER BY p.Wins_count ASC
SELECT p.Name FROM player p ORDER BY p.Wins_count ASC
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT Name FROM player WHERE Earnings = (SELECT MAX(Earnings) FROM player)
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Wins_count > 2 AND Earnings = (SELECT MAX(Earnings) FROM player WHERE Wins_count > 2)
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT player.Name, club.Name FROM player JOIN club ON player.Club_ID = club.Club_ID
SELECT c.Name FROM club c WHERE EXISTS (SELECT 1 FROM player p WHERE p.Club_ID = c.Club_ID AND p.Wins_count > 2)
SELECT c.Name FROM club c WHERE EXISTS (SELECT p.Club_ID FROM player p WHERE p.Club_ID = c.Club_ID GROUP BY p.Club_ID HAVING MAX(p.Wins_count) > 2)
SELECT p.Name FROM player p JOIN club c ON p.Club_ID = c.Club_ID WHERE c.Manager = 'Sam Allardyce'
SELECT player.Name FROM player JOIN club ON player.Club_ID = club.Club_ID WHERE club.Manager = 'Sam Allardyce'
SELECT c.Name, AVG(p.Earnings) AS avg_earnings FROM club c JOIN player p ON c.Club_ID = p.Club_ID GROUP BY c.Name ORDER BY avg_earnings DESC
SELECT C.Name FROM club C JOIN player P ON C.Club_ID = P.Club_ID GROUP BY C.Name ORDER BY AVG(P.Earnings) DESC
SELECT Manufacturer, COUNT(Club_ID) AS ClubCount FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(Club_ID) AS ClubCount FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT c.Manufacturer FROM club c GROUP BY c.Manufacturer HAVING COUNT(DISTINCT c.Club_ID) > 1
SELECT p.Country FROM player p GROUP BY p.Country HAVING COUNT(p.Player_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Club_ID IS NULL
SELECT c.Name FROM club c LEFT JOIN player p ON c.Club_ID = p.Club_ID WHERE p.Club_ID IS NULL
SELECT DISTINCT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT p.Country FROM player p WHERE EXISTS (SELECT 1 FROM player WHERE Country = p.Country AND Earnings > 1400000) AND EXISTS (SELECT 1 FROM player WHERE Country = p.Country AND Earnings < 1100000)
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C WHERE C.customer_id IN (SELECT O.customer_id FROM Orders O GROUP BY O.customer_id HAVING COUNT(*) > 2) AND C.customer_id IN (SELECT O.customer_id FROM Orders O JOIN Order_Items I ON O.order_id = I.order_id GROUP BY O.customer_id HAVING COUNT(I.order_item_id) >= 3)
WITH OrderCounts AS (SELECT customer_id, COUNT(order_id) AS NumOrders FROM Orders GROUP BY customer_id), ItemCounts AS (SELECT customer_id, COUNT(order_item_id) AS NumItems FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY customer_id) SELECT c.customer_id, c.customer_first_name, c.customer_last_name FROM Customers c JOIN OrderCounts oc ON c.customer_id = oc.customer_id JOIN ItemCounts ic ON c.customer_id = ic.customer_id WHERE oc.NumOrders > 2 AND ic.NumItems >= 3
SELECT o.order_id, o.order_status_code, COUNT(i.product_id) AS NumberOfProducts FROM Orders o JOIN Order_Items i ON o.order_id = i.order_id GROUP BY o.order_id, o.order_status_code
SELECT O.order_id, O.order_status_code, COUNT(OI.product_id) AS product_count FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id, O.order_status_code
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1)
SELECT (SELECT MIN(date_order_placed) FROM Orders) AS EarliestOrderDate, groupedOrders.date_order_placed FROM (SELECT date_order_placed FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY Orders.order_id HAVING COUNT(Order_Items.order_item_id) > 1) AS groupedOrders
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.customer_id IS NULL
SELECT C.customer_first_name, C.customer_middle_initial, C.customer_last_name FROM Customers C LEFT JOIN Orders O ON C.customer_id = O.customer_id WHERE O.order_id IS NULL
SELECT p.product_id, p.product_name, p.product_price, p.product_color FROM Products p WHERE p.product_id NOT IN (SELECT o.product_id FROM Order_Items o GROUP BY o.product_id HAVING COUNT(o.product_id) >= 2)
SELECT product_id, product_name, product_price, product_color FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(order_id) >= 2)
SELECT O.order_id, O.date_order_placed FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING COUNT(OI.product_id) >= 2
SELECT O.order_id, O.date_order_placed FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY O.order_id HAVING COUNT(DISTINCT OI.product_id) >= 2
SELECT product_id, product_name, product_price FROM Products JOIN (SELECT product_id, COUNT(*) as freq FROM Order_Items GROUP BY product_id ORDER BY freq DESC LIMIT 1) as MostFrequent ON Products.product_id = MostFrequent.product_id
SELECT P.product_id, P.product_name, P.product_price FROM Products P WHERE EXISTS (SELECT 1 FROM Order_Items O WHERE O.product_id = P.product_id GROUP BY O.product_id HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM Order_Items GROUP BY product_id))
SELECT Orders.order_id, SUM(Products.product_price) AS total_price FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id ORDER BY SUM(Products.product_price) ASC LIMIT 1
SELECT order_id, total_cost FROM (SELECT Orders.order_id AS order_id, SUM(Products.product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id) AS CostTable ORDER BY total_cost ASC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code, COUNT(customer_id) AS num_customers FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY num_customers DESC LIMIT 1
SELECT C.gender_code, COUNT(P.product_id) AS product_count FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY C.gender_code
SELECT Customers.gender_code, COUNT(DISTINCT Products.product_id) AS total_products FROM Customers INNER JOIN Orders ON Customers.customer_id = Orders.customer_id INNER JOIN Order_Items ON Orders.order_id = Order_Items.order_id INNER JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Customers.gender_code
SELECT C.gender_code, COUNT(O.order_id) AS order_count FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id GROUP BY C.gender_code
SELECT Customers.gender_code, COUNT(Orders.order_id) AS order_count FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY Customers.gender_code
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, p.payment_method_code FROM Customers c JOIN Customer_Payment_Methods p ON c.customer_id = p.customer_id
SELECT c.customer_first_name, c.customer_middle_initial, c.customer_last_name, p.payment_method_code FROM Customers c JOIN Customer_Payment_Methods p ON c.customer_id = p.customer_id
SELECT I.invoice_status_code, I.invoice_date, S.shipment_date FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number
SELECT Invoices.invoice_status_code, Invoices.invoice_date, Shipments.shipment_date FROM Invoices JOIN Shipments ON Invoices.invoice_number = Shipments.invoice_number
SELECT P.product_name, S.shipment_date FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id
SELECT P.product_name, S.shipment_date FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id JOIN Shipments S ON SI.shipment_id = S.shipment_id
SELECT order_item_status_code, shipment_tracking_number FROM Order_Items INNER JOIN Orders ON Order_Items.order_id = Orders.order_id INNER JOIN Shipments ON Orders.order_id = Shipments.order_id INNER JOIN Shipment_Items ON Order_Items.order_item_id = Shipment_Items.order_item_id AND Shipments.shipment_id = Shipment_Items.shipment_id
SELECT OI.order_item_status_code, S.shipment_tracking_number FROM Order_Items OI JOIN Orders O ON OI.order_id = O.order_id JOIN Shipments S ON O.order_id = S.order_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id WHERE SI.shipment_id = S.shipment_id
SELECT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id
SELECT DISTINCT P.product_name, P.product_color FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Shipment_Items SI ON OI.order_item_id = SI.order_item_id
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'female'
SELECT DISTINCT P.product_name, P.product_price, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id JOIN Orders O ON OI.order_id = O.order_id JOIN Customers C ON O.customer_id = C.customer_id WHERE C.gender_code = 'female'
SELECT I.invoice_status_code FROM Invoices I WHERE NOT EXISTS (SELECT 1 FROM Shipments S WHERE S.order_id = I.order_id)
SELECT invoice_status_code FROM Invoices WHERE invoice_number IN (SELECT O.invoice_number FROM Orders O WHERE NOT EXISTS (SELECT 1 FROM Shipments S WHERE S.order_id = O.order_id))
SELECT O.order_id, O.date_order_placed, SUM(P.product_price * OI.product_quantity) AS total_cost FROM Orders O JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id GROUP BY O.order_id, O.date_order_placed
SELECT O.order_id, O.date_order_placed, SUM(I.amount) AS total_paid FROM Orders O JOIN Invoices I ON O.order_id = I.order_id WHERE I.invoice_status_code IN ('Paid', 'Completed') GROUP BY O.order_id, O.date_order_placed
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT DISTINCT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(*) FROM Products P LEFT JOIN Order_Items O ON P.product_id = O.product_id WHERE O.product_id IS NULL
SELECT COUNT(*) FROM Customers C LEFT JOIN Customer_Payment_Methods P ON C.customer_id = P.customer_id WHERE P.customer_id IS NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id WHERE Customer_Payment_Methods.customer_id IS NULL
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT COUNT(*) AS TotalShippedItems FROM Shipment_Items
SELECT COUNT(DISTINCT order_item_id) FROM Shipment_Items JOIN Order_Items ON Shipment_Items.order_item_id = Order_Items.order_item_id
SELECT AVG(product_price) AS AveragePrice FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(P.product_price) AS AveragePrice FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id
SELECT AVG(P.product_price) AS average_price FROM Products P JOIN Order_Items O ON P.product_id = O.product_id
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM (SELECT gender_code, COUNT(*) AS num_orders FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code) AS OrderCounts ORDER BY num_orders ASC LIMIT 1)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT O.date_order_placed FROM Orders O WHERE O.customer_id IN (SELECT C.customer_id FROM Customer_Payment_Methods C GROUP BY C.customer_id HAVING COUNT(C.payment_method_code) >= 2)
WITH StatusFrequency AS (SELECT order_status_code, COUNT(*) AS Frequency FROM Orders GROUP BY order_status_code) SELECT order_status_code FROM StatusFrequency WHERE Frequency = (SELECT MIN(Frequency) FROM StatusFrequency)
SELECT order_status_code, COUNT(*) AS frequency FROM Orders GROUP BY order_status_code ORDER BY frequency ASC LIMIT 1
SELECT product_id, product_description FROM Products WHERE product_id IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) > 3)
SELECT P.product_id, P.product_description FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id GROUP BY P.product_id, P.product_description HAVING COUNT(OI.product_id) > 3
SELECT I.invoice_date, I.invoice_number FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(S.shipment_id) >= 2
SELECT I.invoice_date, I.invoice_number FROM Invoices I JOIN Shipments S ON I.invoice_number = S.invoice_number GROUP BY I.invoice_number HAVING COUNT(S.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director WHERE Age = (SELECT MAX(Age) FROM director)
SELECT COUNT(Channel_ID) FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT director.Name FROM director INNER JOIN program ON director.Director_ID = program.Director_ID GROUP BY director.Director_ID ORDER BY COUNT(program.Program_ID) DESC LIMIT 1
SELECT D.Name, D.Age FROM director D INNER JOIN (SELECT Director_ID FROM program GROUP BY Director_ID ORDER BY COUNT(*) DESC LIMIT 1) AS P ON D.Director_ID = P.Director_ID
SELECT Title FROM program WHERE Start_Year = (SELECT MAX(Start_Year) FROM program)
SELECT Name, Internet FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM program GROUP BY Channel_ID HAVING COUNT(*) > 1)
SELECT c.Name, COUNT(p.Program_ID) AS ProgramCount FROM channel c JOIN program p ON c.Channel_ID = p.Channel_ID GROUP BY c.Channel_ID, c.Name
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program)
SELECT d.Name FROM director d JOIN program p ON d.Director_ID = p.Director_ID WHERE p.Title = 'Dracula'
SELECT c.Name, c.Internet FROM channel c WHERE c.Channel_ID IN (SELECT Channel_ID FROM director_admin GROUP BY Channel_ID HAVING COUNT(Director_ID) = (SELECT MAX(cnt) FROM (SELECT COUNT(Director_ID) AS cnt FROM director_admin GROUP BY Channel_ID) t))
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT c.Name FROM channel c WHERE EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age < 40 AND da.Channel_ID = c.Channel_ID) AND EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.Director_ID = d.Director_ID WHERE d.Age > 60 AND da.Channel_ID = c.Channel_ID)
SELECT c.Channel_ID, c.Name FROM channel c WHERE NOT EXISTS (SELECT 1 FROM director_admin da JOIN director d ON da.director_id = d.director_id WHERE d.name = 'Hank Baskett' AND da.Channel_ID = c.Channel_ID)
SELECT COUNT(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW ASC
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation <> 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio WHERE ERP_kW = (SELECT MAX(ERP_kW) FROM radio)
SELECT AVG(ERP_kW) AS Average_ERP FROM radio
SELECT Affiliation, COUNT(*) AS NumberOfChannels FROM city_channel GROUP BY Affiliation
SELECT Affiliation, COUNT(*) AS Count FROM city_channel GROUP BY Affiliation ORDER BY Count DESC LIMIT 1
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT r.Transmitter, cc.City FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID
SELECT r.Transmitter, cc.Station_name FROM radio r JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID JOIN city_channel cc ON ccr.City_channel_ID = cc.ID ORDER BY r.ERP_kW DESC
SELECT r.Transmitter, COUNT(c.City_channel_ID) AS Channel_Count FROM radio r JOIN city_channel_radio c ON r.Radio_ID = c.Radio_ID GROUP BY r.Transmitter
SELECT DISTINCT r.Transmitter FROM radio r LEFT JOIN city_channel_radio ccr ON r.Radio_ID = ccr.Radio_ID WHERE ccr.Radio_ID IS NULL
SELECT Model FROM vehicle WHERE Power > 6000 AND Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle WHERE Power > 6000)
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT driver.Name FROM driver WHERE driver.Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
WITH VehicleCounts AS (SELECT Driver_ID, COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID) SELECT Driver_ID, vehicle_count FROM VehicleCounts WHERE vehicle_count = (SELECT MAX(vehicle_count) FROM VehicleCounts)
SELECT Driver_ID, COUNT(DISTINCT Vehicle_ID) AS Vehicle_Count FROM vehicle_driver GROUP BY Driver_ID ORDER BY Vehicle_Count DESC LIMIT 1
SELECT MAX(Power) AS MaximumPower, AVG(Power) AS AveragePower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power) AS MaxPower, AVG(Power) AS AvgPower FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(*) = (SELECT MIN(counts) FROM (SELECT COUNT(*) AS counts FROM vehicle_driver GROUP BY Vehicle_ID) AS subquery)
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT vehicle_driver.Driver_ID) FROM vehicle_driver JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT driver.Driver_ID) FROM driver JOIN vehicle_driver ON driver.Driver_ID = vehicle_driver.Driver_ID JOIN vehicle ON vehicle_driver.Vehicle_ID = vehicle.Vehicle_ID WHERE vehicle.Build_Year = 2012
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(DISTINCT Driver_ID) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) AS Average_Top_Speed FROM vehicle
SELECT AVG(Top_Speed) AS Average_Top_Speed FROM vehicle
SELECT DISTINCT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT DISTINCT d.Name FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Power > 5000
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Vehicle_ID IS NULL
SELECT v.Model FROM vehicle v LEFT JOIN vehicle_driver vd ON v.Vehicle_ID = vd.Vehicle_ID WHERE vd.Vehicle_ID IS NULL
SELECT Vehicle_ID, Model FROM vehicle WHERE Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2) OR Builder = 'Ziyang'
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE V.Builder = 'Ziyang' OR V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(Driver_ID) = 2)
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2) OR V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon')
SELECT V.Vehicle_ID, V.Model FROM vehicle V WHERE V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2) OR V.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver JOIN driver D ON vehicle_driver.Driver_ID = D.Driver_ID WHERE D.Name = 'Jeff Gordon')
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(Vehicle_ID) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name ASC
SELECT Name FROM driver ORDER BY Name ASC
SELECT Racing_Series, COUNT(Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Racing_Series
SELECT d.Name, d.Citizenship FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT d.Name, d.Citizenship FROM driver d JOIN vehicle_driver vd ON d.Driver_ID = vd.Driver_ID JOIN vehicle v ON vd.Vehicle_ID = v.Vehicle_ID WHERE v.Model = 'DJ1'
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM Exams
SELECT COUNT(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code ASC
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code <> 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code <> 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(*) AS count FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) AS count FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) AS count FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY count DESC
SELECT Student_Answer_Text, COUNT(*) AS Frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY Frequency DESC
SELECT S.First_Name, A.Date_of_Answer FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID
SELECT S.First_Name, A.Date_of_Answer FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID
SELECT S.Email_Adress, A.Date_of_Answer FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID ORDER BY A.Date_of_Answer DESC
SELECT S.Email_Adress, A.Date_of_Answer FROM Students S JOIN Student_Answers A ON S.Student_ID = A.Student_ID ORDER BY A.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT S.First_Name FROM Students S JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID GROUP BY S.Student_ID HAVING COUNT(SA.Student_ID) >= 2
SELECT S.First_Name FROM Students S INNER JOIN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2) AS Filtered ON S.Student_ID = Filtered.Student_ID
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT V.Valid_Answer_Text FROM Valid_Answers V JOIN Student_Assessments S ON V.Valid_Answer_ID = S.Valid_Answer_ID GROUP BY V.Valid_Answer_Text ORDER BY COUNT(S.Valid_Answer_ID) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender <> 'M'
SELECT Last_Name FROM Students WHERE Gender_MFU <> 'M'
SELECT Gender_MFU, COUNT(Student_ID) AS NumberOfStudents FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(Student_ID) AS number_of_students FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT S.First_Name FROM Students S LEFT JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID WHERE SA.Student_ID IS NULL
SELECT S.First_Name FROM Students S LEFT JOIN Student_Answers SA ON S.Student_ID = SA.Student_ID WHERE SA.Student_ID IS NULL
SELECT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_ID IN (SELECT Student_Answer_ID FROM Student_Answers GROUP BY Student_Answer_ID HAVING SUM(CASE WHEN Comments = 'Normal' THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Comments = 'Absent' THEN 1 ELSE 0 END) > 0)
SELECT Student_Answer_Text FROM Student_Answers WHERE Comments IN ('Normal', 'Absent') GROUP BY Student_Answer_Text HAVING COUNT(DISTINCT Comments) = 2
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(Question_ID) >= 3
SELECT * FROM Students
SELECT * FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(*) FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM Products
SELECT MIN(product_price) AS MinPrice, AVG(product_price) AS AvgPrice, MAX(product_price) AS MaxPrice FROM Products
SELECT AVG(product_price) AS AveragePrice FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) AS AveragePrice FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(product_id) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(product_id) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT P.product_name FROM Products P WHERE P.product_type_code = 'hardware' AND P.product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' AND product_price = (SELECT MAX(product_price) FROM Products WHERE product_type_code = 'Clothes')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price = (SELECT MIN(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT * FROM Products WHERE product_type_code = 'hardware' ORDER BY product_price ASC
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(product_id) AS product_count FROM Products GROUP BY product_type_code
SELECT product_type_code, COUNT(product_id) AS product_count FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS avg_price FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) AS avg_price FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING COUNT(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) DESC LIMIT 1
SELECT P.product_type_code FROM Products P JOIN Order_Items O ON P.product_id = O.product_id GROUP BY P.product_type_code ORDER BY COUNT(P.product_type_code) DESC LIMIT 1
SELECT COUNT(customer_id) FROM Customers
SELECT COUNT(customer_id) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT Customers.customer_address, Customers.customer_phone, Customers.customer_email FROM Customers WHERE Customers.customer_name = 'Jeromy'
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(customer_id) AS num_customers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(*) AS num_customers FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(*) AS num_customers FROM Customers GROUP BY payment_method_code ORDER BY num_customers DESC FETCH FIRST 1 ROW ONLY
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.customer_name FROM Customers C INNER JOIN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1) PM ON C.payment_method_code = PM.payment_method_code
SELECT C.customer_name FROM Customers C WHERE C.payment_method_code IN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT Products.product_id, Products.product_type_code FROM Products ORDER BY Products.product_name ASC
SELECT product_id, product_type_code FROM Products ORDER BY product_name ASC
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(*) FROM Customer_Orders
SELECT o.order_id, o.order_date, o.order_status_code FROM Customer_Orders o JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_name = 'Jeromy'
SELECT o.order_id, o.order_date, o.order_status_code FROM Customer_Orders o JOIN Customers c ON o.customer_id = c.customer_id WHERE c.customer_name = 'Jeromy'
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS order_count FROM Customers C LEFT JOIN Customer_Orders O ON C.customer_id = O.customer_id GROUP BY C.customer_id, C.customer_name
SELECT C.customer_name, C.customer_id, COUNT(O.order_id) AS num_orders FROM Customers C JOIN Customer_Orders O ON C.customer_id = O.customer_id GROUP BY C.customer_id, C.customer_name
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C JOIN (SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1) AS CO ON C.customer_id = CO.customer_id
SELECT C.customer_id, C.customer_name, C.customer_phone, C.customer_email FROM Customers C JOIN (SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1) AS MaxOrders ON C.customer_id = MaxOrders.customer_id
SELECT order_status_code, COUNT(order_id) AS order_count FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(order_id) AS order_count FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers LEFT JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id WHERE Customer_Orders.customer_id IS NULL
SELECT product_name FROM Products LEFT JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Order_Items.product_id IS NULL
SELECT P.product_name FROM Products P LEFT JOIN Order_Items O ON P.product_id = O.product_id WHERE O.product_id IS NULL
SELECT COUNT(Order_Items.order_item_id) AS TotalOrders FROM Products INNER JOIN Order_Items ON Products.product_id = Order_Items.product_id WHERE Products.product_name = 'Monitor'
SELECT SUM(OI.order_quantity) FROM Products P JOIN Order_Items OI ON P.product_id = OI.product_id WHERE P.product_name = 'Monitor'
SELECT COUNT(DISTINCT CO.customer_id) FROM Customer_Orders CO JOIN Order_Items OI ON CO.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id WHERE P.product_name = 'Monitor'
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id JOIN Order_Items ON Customer_Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id WHERE Products.product_name = 'Monitor'
SELECT COUNT(DISTINCT Customers.customer_id) FROM Customers JOIN Customer_Orders ON Customers.customer_id = Customer_Orders.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT DISTINCT C.order_id, C.order_date FROM Customer_Orders C JOIN Order_Items O ON C.order_id = O.order_id WHERE O.order_quantity > 6 OR C.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3)
SELECT T1.order_id, T1.order_date FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_date HAVING SUM(T2.order_quantity) > 6 OR COUNT(DISTINCT T2.product_id) > 3
SELECT COUNT(Building_ID) FROM building
SELECT COUNT(Building_ID) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Name FROM building ORDER BY Number_of_Stories ASC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT building.Address FROM building ORDER BY building.Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year <> 1980
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year <> 1980
SELECT AVG(Population) AS AveragePopulation FROM region
SELECT AVG(Population) AS AveragePopulation FROM region
SELECT Name FROM region ORDER BY Name ASC
SELECT Name FROM region ORDER BY Name ASC
SELECT Capital FROM region WHERE Area > 10000
SELECT Capital FROM region WHERE Area > 10000
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT Capital FROM region WHERE Population = (SELECT MAX(Population) FROM region)
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT building.Name AS BuildingName, region.Name AS RegionName FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT building.Name AS BuildingName, region.Name AS RegionName FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT region.Name FROM region JOIN building ON region.Region_ID = building.Region_ID GROUP BY region.Region_ID, region.Name HAVING COUNT(building.Building_ID) > 1
SELECT R.Name FROM region R JOIN building B ON R.Region_ID = B.Region_ID GROUP BY R.Name HAVING COUNT(B.Building_ID) > 1
SELECT r.Capital FROM region r JOIN (SELECT Region_ID FROM building GROUP BY Region_ID ORDER BY COUNT(*) DESC LIMIT 1) b ON r.Region_ID = b.Region_ID
SELECT R.Capital FROM region R JOIN building B ON R.Region_ID = B.Region_ID GROUP BY R.Region_ID, R.Capital ORDER BY COUNT(*) DESC LIMIT 1
SELECT building.Address, region.Capital FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT building.Address, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT building.Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT b.Name, b.Number_of_Stories FROM building AS b INNER JOIN region AS r ON b.Region_ID = r.Region_ID WHERE r.Name = 'Abruzzo'
SELECT Completed_Year, COUNT(Building_ID) AS NumberOfBuildings FROM building GROUP BY Completed_Year
SELECT Completed_Year, COUNT(Building_ID) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Region_ID IS NULL
SELECT r.Name FROM region r LEFT JOIN building b ON r.Region_ID = b.Region_ID WHERE b.Region_ID IS NULL
SELECT a.Completed_Year FROM building a JOIN building b ON a.Completed_Year = b.Completed_Year WHERE a.Number_of_Stories > 20 AND b.Number_of_Stories < 15
SELECT a.Completed_Year FROM building a JOIN building b ON a.Completed_Year = b.Completed_Year WHERE a.Number_of_Stories > 20 AND b.Number_of_Stories < 15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT building.Name, building.Completed_Year FROM building ORDER BY building.Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details ASC
SELECT COUNT(*) FROM Services
SELECT COUNT(*) FROM Services
SELECT Analytical_Layer_Type_Code, COUNT(*) AS Frequency FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY Frequency DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch'
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch'
SELECT S.Service_Details FROM Services S JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID GROUP BY S.Service_ID HAVING COUNT(CI.Service_ID) > 3
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions GROUP BY Service_ID HAVING COUNT(*) > 3)
SELECT C.Customer_Details FROM Customers C JOIN (SELECT Customer_ID, COUNT(*) as Interaction_Count FROM Customer_Interactions GROUP BY Customer_ID ORDER BY Interaction_Count DESC LIMIT 1) CI ON C.Customer_ID = CI.Customer_ID
SELECT C.* FROM Customers C JOIN (SELECT Customer_ID, COUNT(Service_ID) AS Service_Count FROM Customers_and_Services GROUP BY Customer_ID ORDER BY Service_Count DESC LIMIT 1) AS Sub ON C.Customer_ID = Sub.Customer_ID
SELECT C.Customer_Details FROM Customers C INNER JOIN (SELECT Customer_ID, COUNT(DISTINCT Service_ID) AS NumServices FROM Customers_and_Services GROUP BY Customer_ID ORDER BY NumServices DESC LIMIT 1) AS SubQuery ON C.Customer_ID = SubQuery.Customer_ID
SELECT C.Customer_Details FROM Customers C JOIN (SELECT Customer_ID, COUNT(DISTINCT Service_ID) AS NumServices FROM Customers_and_Services GROUP BY Customer_ID ORDER BY NumServices DESC LIMIT 1) AS Sub ON C.Customer_ID = Sub.Customer_ID
SELECT C.Customer_Details FROM Customers C LEFT JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Customer_ID IS NULL
SELECT C.Customer_Details FROM Customers C LEFT JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Customer_ID IS NULL
SELECT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT DISTINCT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID HAVING COUNT(*) = (SELECT MIN(Count) FROM (SELECT COUNT(*) AS Count FROM Customers_and_Services GROUP BY Service_ID) AS Counts))
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT (SELECT COUNT(DISTINCT Customer_Details) FROM Customers) AS Total_Customers, (SELECT COUNT(DISTINCT Service_Details) FROM Services) AS Total_Services
SELECT * FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Customer_ID, Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT DISTINCT S.Service_Details FROM Services S WHERE EXISTS (SELECT 1 FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch' AND CS.Service_ID = S.Service_ID) OR EXISTS (SELECT 1 FROM Customer_Interactions CI WHERE CI.Status_Code = 'good' AND CI.Service_ID = S.Service_ID)
SELECT DISTINCT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch') OR Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good'))
SELECT DISTINCT S.Service_Details FROM Services S WHERE S.Service_ID IN (SELECT CS.Service_ID FROM Customers_and_Services CS JOIN Customers C ON CS.Customer_ID = C.Customer_ID WHERE C.Customer_Details = 'Hardy Kutch') AND S.Service_ID IN (SELECT CI.Service_ID FROM Customer_Interactions CI WHERE CI.Status_Code = 'bad')
SELECT DISTINCT S.Service_Details FROM Services S INNER JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID INNER JOIN Customers C ON CS.Customer_ID = C.Customer_ID INNER JOIN Customer_Interactions CI ON CI.Service_ID = S.Service_ID WHERE C.Customer_Details = 'Hardy Kutch' AND CI.Status_Code = 'bad'
SELECT DISTINCT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Channels.Channel_Details = '15 ij'
SELECT DISTINCT Services.Service_Details FROM Services INNER JOIN Customer_Interactions ON Services.Service_ID = Customer_Interactions.Service_ID INNER JOIN Channels ON Customer_Interactions.Channel_ID = Channels.Channel_ID WHERE Channels.Channel_Details = '15 ij'
SELECT Customers.* FROM Customers JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT DISTINCT Customers.Customer_Details FROM Customers INNER JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID WHERE Customer_Interactions.Status_Code = 'Stuck' AND Customer_Interactions.Services_and_Channels_Details = 'bad'
SELECT COUNT(DISTINCT Integration_Platform.Integration_Platform_ID) FROM Integration_Platform, Customer_Interactions WHERE Integration_Platform.Customer_Interaction_ID = Customer_Interactions.Customer_Interaction_ID AND Customer_Interactions.Status_Code = 'successful'
SELECT COUNT(Integration_Platform_ID) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT DISTINCT Customers.Customer_Details FROM Customers INNER JOIN Customer_Interactions ON Customers.Customer_ID = Customer_Interactions.Customer_ID INNER JOIN Integration_Platform ON Customer_Interactions.Customer_Interaction_ID = Integration_Platform.Customer_Interaction_ID WHERE Integration_Platform.Status_Code = 'failed'
SELECT C.Customer_Details FROM Customers C JOIN Customer_Interactions CI ON C.Customer_ID = CI.Customer_ID JOIN Integration_Platform IP ON CI.Customer_Interaction_ID = IP.Customer_Interaction_ID WHERE IP.Integration_Platform_Details = 'Fail'
SELECT S.* FROM Services S LEFT JOIN Customer_Interactions CI ON S.Service_ID = CI.Service_ID WHERE CI.Service_ID IS NULL
SELECT Service_Details FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) AS Usage_Count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) AS Usage_Count FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID WHERE CS.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT DISTINCT S.Service_Details FROM Services S JOIN Customers_and_Services CS ON S.Service_ID = CS.Service_ID AND CS.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT COUNT(*) FROM Vehicles
SELECT COUNT(*) FROM Vehicles
SELECT Vehicles.name FROM Vehicles ORDER BY Vehicles.Model_year DESC
SELECT Vehicles.name FROM Vehicles ORDER BY Vehicles.Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT DISTINCT Type_of_powertrain FROM Vehicles WHERE Model_year IN (2014, 2013) GROUP BY Type_of_powertrain HAVING COUNT(DISTINCT Model_year) = 2
SELECT DISTINCT v1.Type_of_powertrain FROM Vehicles v1 JOIN Vehicles v2 ON v1.Type_of_powertrain = v2.Type_of_powertrain WHERE v1.Model_year = 2013 AND v2.Model_year = 2014
SELECT Type_of_powertrain, COUNT(id) AS NumberOfVehicles FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(id) AS NumberOfVehicles FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(id) AS VehicleCount FROM Vehicles GROUP BY Type_of_powertrain ORDER BY VehicleCount DESC LIMIT 1
SELECT Type_of_powertrain, COUNT(Type_of_powertrain) AS Frequency FROM Vehicles GROUP BY Type_of_powertrain ORDER BY Frequency DESC LIMIT 1
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) >= 2
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) AS Avg_Annual_Fuel_Cost FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) >= 2
SELECT name, age, membership_credit FROM Customers
SELECT name, age, membership_credit FROM Customers
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT name, age FROM Customers WHERE membership_credit = (SELECT MAX(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT V.name, SUM(RH.total_hours) AS TotalHours FROM Vehicles V JOIN Renting_history RH ON V.id = RH.vehicles_id GROUP BY V.name
SELECT V.name, SUM(R.total_hours) AS TotalHours FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id GROUP BY V.name
SELECT V.name FROM Vehicles V WHERE V.id NOT IN (SELECT R.vehicles_id FROM Renting_history R)
SELECT V.name FROM Vehicles V WHERE V.id NOT IN (SELECT R.vehicles_id FROM Renting_history R)
SELECT C.name FROM Customers C JOIN Renting_history R ON C.id = R.customer_id GROUP BY C.id HAVING COUNT(R.id) >= 2
SELECT C.name FROM Customers C JOIN Renting_history R ON C.id = R.customer_id GROUP BY C.id HAVING COUNT(R.id) >= 2
SELECT Vehicles.name, Vehicles.Model_year FROM Vehicles JOIN (SELECT vehicles_id FROM Renting_history GROUP BY vehicles_id ORDER BY COUNT(*) DESC LIMIT 1) AS MostRented ON Vehicles.id = MostRented.vehicles_id
SELECT V.name, V.Model_year FROM Vehicles V JOIN (SELECT vehicles_id, COUNT(*) AS count FROM Renting_history GROUP BY vehicles_id ORDER BY count DESC LIMIT 1) R ON V.id = R.vehicles_id
SELECT V.name FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id ORDER BY R.total_hours DESC
SELECT V.name FROM Vehicles V, Renting_history R WHERE V.id = R.vehicles_id GROUP BY V.name ORDER BY SUM(R.total_hours) DESC
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT D.name FROM Discount D JOIN Renting_history R ON D.id = R.discount_id GROUP BY D.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT V.name, V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id WHERE R.total_hours > 30
SELECT DISTINCT V.name, V.Type_of_powertrain FROM Vehicles V JOIN Renting_history R ON V.id = R.vehicles_id WHERE (SELECT SUM(total_hours) FROM Renting_history WHERE vehicles_id = V.id) > 30
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Avg_City_Rate, AVG(Highway_fuel_economy_rate) AS Avg_Highway_Rate FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Average_City_Fuel_Rate, AVG(Highway_fuel_economy_rate) AS Average_Highway_Fuel_Rate FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) AS average_loan_amount FROM Student_Loans
SELECT AVG(amount_of_loan) AS average_loan FROM Student_Loans
SELECT S.bio_data, S.student_id FROM Students S WHERE (SELECT COUNT(*) FROM Classes C WHERE C.student_id = S.student_id) >= 2 AND (SELECT COUNT(*) FROM Detention D WHERE D.student_id = S.student_id) < 2
SELECT S.bio_data, S.student_id FROM Students S WHERE S.student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2) OR S.student_id IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2)
SELECT Teachers.* FROM Teachers WHERE EXISTS (SELECT 1 FROM Classes WHERE teacher_id = Teachers.teacher_id AND class_details LIKE '%data%') AND NOT EXISTS (SELECT 1 FROM Classes WHERE teacher_id = Teachers.teacher_id AND class_details LIKE 'net%')
SELECT T1.teacher_details FROM Teachers T1 WHERE EXISTS (SELECT * FROM Classes T2 WHERE T2.teacher_id = T1.teacher_id AND T2.class_details LIKE '%data%') AND NOT EXISTS (SELECT * FROM Classes T3 WHERE T3.teacher_id = T1.teacher_id AND T3.class_details LIKE 'net%')
SELECT S.bio_data FROM Students S WHERE NOT EXISTS (SELECT 1 FROM Detention D WHERE D.student_id = S.student_id) AND NOT EXISTS (SELECT 1 FROM Student_Loans L WHERE L.student_id = S.student_id)
SELECT bio_data FROM Students WHERE NOT EXISTS (SELECT 1 FROM Detention WHERE student_id = Students.student_id) AND NOT EXISTS (SELECT 1 FROM Student_Loans WHERE student_id = Students.student_id)
SELECT SL.date_of_loan, SL.amount_of_loan FROM Student_Loans SL INNER JOIN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2) A ON SL.student_id = A.student_id
SELECT SL.amount_of_loan, SL.date_of_loan FROM Student_Loans SL INNER JOIN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(achievement_id) >= 2) A ON SL.student_id = A.student_id
SELECT T.teacher_id, T.teacher_details FROM Teachers T JOIN (SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1) AS C ON T.teacher_id = C.teacher_id
SELECT T1.teacher_id, T1.teacher_details FROM Teachers T1 JOIN Classes T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id, T1.teacher_details ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT S.student_details, A.address_type_description FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Ref_Address_Types A ON SA.address_type_code = A.address_type_code
SELECT S.student_details, A.address_type_description FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Ref_Address_Types A ON SA.address_type_code = A.address_type_code
SELECT A.address_details, S.bio_data FROM Addresses A JOIN Students_Addresses SA ON A.address_id = SA.address_id JOIN Students S ON SA.student_id = S.student_id
SELECT S.bio_data, A.address_details FROM Students S JOIN Students_Addresses SA ON S.student_id = SA.student_id JOIN Addresses A ON SA.address_id = A.address_id
SELECT S.bio_data, T.date_of_transcript FROM Students S JOIN Transcripts T ON S.student_id = T.student_id
SELECT S.bio_data, T.date_of_transcript FROM Students S JOIN Transcripts T ON S.student_id = T.student_id
SELECT behaviour_monitoring_details, COUNT(student_id) AS num_students FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(student_id) = (SELECT MAX(count) FROM (SELECT COUNT(student_id) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details) AS subquery)
SELECT behaviour_monitoring_details, COUNT(*) AS frequency FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY frequency DESC LIMIT 1
WITH CommonResult AS (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1), ThreeStudents AS (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id WHERE B.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM CommonResult INTERSECT SELECT behaviour_monitoring_details FROM ThreeStudents)
WITH CommonResult AS (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1), ThreeResult AS (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM CommonResult UNION SELECT behaviour_monitoring_details FROM ThreeResult))
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring GROUP BY student_id HAVING COUNT(DISTINCT behaviour_monitoring_details) = 1 AND MAX(behaviour_monitoring_details) = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT S.bio_data FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id WHERE B.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT S.bio_data, E.event_date FROM Students S JOIN Student_Events E ON S.student_id = E.student_id
SELECT S.bio_data, E.event_date FROM Students S JOIN Student_Events E ON S.student_id = E.student_id
WITH EventCounts AS (SELECT event_type_code, COUNT(student_id) AS num_students FROM Student_Events GROUP BY event_type_code) SELECT EC.num_students, EC.event_type_code, ET.event_type_description FROM EventCounts EC JOIN Ref_Event_Types ET ON EC.event_type_code = ET.event_type_code WHERE EC.num_students = (SELECT MAX(num_students) FROM EventCounts)
SELECT E.event_type_code, E.event_type_description, COUNT(DISTINCT S.student_id) AS student_count FROM Student_Events S JOIN Ref_Event_Types E ON S.event_type_code = E.event_type_code GROUP BY E.event_type_code, E.event_type_description ORDER BY student_count DESC LIMIT 1
SELECT A.achievement_details, R.achievement_type_description FROM Achievements A JOIN Ref_Achievement_Type R ON A.achievement_type_code = R.achievement_type_code
SELECT A.achievement_details, R.achievement_type_description FROM Achievements A JOIN Ref_Achievement_Type R ON A.achievement_type_code = R.achievement_type_code
SELECT COUNT(DISTINCT C.teacher_id) FROM Classes C JOIN Students S ON C.student_id = S.student_id LEFT JOIN Achievements A ON S.student_id = A.student_id WHERE A.student_id IS NULL
SELECT COUNT(DISTINCT T1.teacher_id) FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE NOT EXISTS (SELECT 1 FROM Achievements WHERE T2.student_id = Achievements.student_id)
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T.*, S.* FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id JOIN Students S ON C.student_id = S.student_id
SELECT T.teacher_details, S.student_details FROM Classes C JOIN Teachers T ON C.teacher_id = T.teacher_id JOIN Students S ON C.student_id = S.student_id
SELECT teacher_id, COUNT(class_id) AS num_courses FROM Classes GROUP BY teacher_id ORDER BY num_courses DESC LIMIT 1
SELECT teacher_id, COUNT(class_id) AS num_courses FROM Classes GROUP BY teacher_id ORDER BY num_courses DESC LIMIT 1
WITH CourseCounts AS (SELECT ID AS student_id, COUNT(course_id) AS num_courses FROM takes GROUP BY ID) SELECT student_id, num_courses FROM CourseCounts WHERE num_courses = (SELECT MAX(num_courses) FROM CourseCounts)
SELECT S.student_id, COUNT(C.class_id) AS total_courses FROM Students S JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id ORDER BY total_courses DESC LIMIT 1
SELECT s.student_id, s.student_details FROM Students s INNER JOIN (SELECT student_id FROM Student_Course_Registrations GROUP BY student_id HAVING COUNT(course_id) = 2) AS scr ON s.student_id = scr.student_id
SELECT S.student_id, S.student_details FROM Students S INNER JOIN (SELECT student_id FROM takes GROUP BY student_id HAVING COUNT(*) = 2) T ON S.student_id = T.student_id
SELECT D.detention_type_code, R.detention_type_description FROM Detention D JOIN Ref_Detention_Type R ON D.detention_type_code = R.detention_type_code GROUP BY D.detention_type_code, R.detention_type_description ORDER BY COUNT(*) ASC LIMIT 1
SELECT RDT.detention_type_code, RDT.detention_type_description FROM Ref_Detention_Type RDT WHERE RDT.detention_type_code IN (SELECT D.detention_type_code FROM Detention D GROUP BY D.detention_type_code ORDER BY COUNT(D.detention_type_code) ASC LIMIT 1)
SELECT S.bio_data, SL.other_details FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans)
SELECT S.bio_data, S.student_details FROM Students S WHERE S.student_id IN (SELECT L.student_id FROM Student_Loans L WHERE L.amount_of_loan > (SELECT AVG(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT S.bio_data FROM Students S JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT S.bio_data FROM Students S, Student_Loans SL WHERE S.student_id = SL.student_id AND SL.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT T.date_of_transcript FROM Transcripts T JOIN Student_Loans S ON T.student_id = S.student_id WHERE S.amount_of_loan = (SELECT MAX(amount_of_loan) FROM Student_Loans)
SELECT T.date_of_transcript FROM Transcripts T INNER JOIN (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan DESC LIMIT 1) AS S ON T.student_id = S.student_id
SELECT T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1)
SELECT T.* FROM Teachers T JOIN Classes C ON T.teacher_id = C.teacher_id JOIN Transcripts TR ON C.student_id = TR.student_id WHERE TR.date_of_transcript = (SELECT MIN(date_of_transcript) FROM Transcripts)
SELECT s.student_id, SUM(sl.amount_of_loan) AS total_loan FROM Students s INNER JOIN Student_Loans sl ON s.student_id = sl.student_id GROUP BY s.student_id
SELECT s.student_id, SUM(sl.amount_of_loan) AS total_loan FROM Students s JOIN Student_Loans sl ON s.student_id = sl.student_id GROUP BY s.student_id
SELECT S.student_id, S.bio_data, COUNT(R.course_id) AS course_count FROM Students S JOIN Student_Course_Registrations R ON S.student_id = R.student_id GROUP BY S.student_id, S.bio_data
SELECT S.student_id, S.bio_data, COUNT(C.class_id) AS num_courses FROM Students S LEFT JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id, S.bio_data
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT R.address_type_code, R.address_type_description FROM Ref_Address_Types R JOIN (SELECT address_type_code, COUNT(*) AS cnt FROM Students_Addresses GROUP BY address_type_code ORDER BY cnt DESC LIMIT 1) A ON R.address_type_code = A.address_type_code
SELECT SA.address_type_code, RAT.address_type_description FROM Students_Addresses SA JOIN Ref_Address_Types RAT ON SA.address_type_code = RAT.address_type_code GROUP BY SA.address_type_code, RAT.address_type_description ORDER BY COUNT(*) DESC LIMIT 1
SELECT S.bio_data FROM Students S JOIN Student_Events SE ON S.student_id = SE.student_id LEFT JOIN Student_Loans SL ON S.student_id = SL.student_id WHERE SL.student_id IS NULL
SELECT S.bio_data FROM Students S WHERE EXISTS (SELECT 1 FROM Student_Events SE WHERE SE.student_id = S.student_id) AND NOT EXISTS (SELECT 1 FROM Student_Loans SL WHERE SL.student_id = S.student_id)
SELECT SA.date_from, SA.date_to FROM Students_Addresses SA WHERE SA.student_id IN (SELECT T.student_id FROM Transcripts T GROUP BY T.student_id HAVING COUNT(*) = 2)
SELECT SA.date_from, SA.date_to FROM Students_Addresses SA WHERE SA.student_id IN (SELECT T.student_id FROM Transcripts T GROUP BY T.student_id HAVING COUNT(*) = 2)
SELECT datetime_detention_start FROM Detention
SELECT datetime_detention_start FROM Detention
SELECT Name FROM Author
SELECT Name FROM Author
SELECT Name, Address FROM Client
SELECT Name, Address FROM Client
SELECT Title, ISBN, SalePrice FROM Book
SELECT Title, ISBN, SalePrice FROM Book
SELECT COUNT(*) FROM Book
SELECT COUNT(*) FROM Book
SELECT COUNT(idAuthor) FROM Author
SELECT COUNT(idAuthor) FROM Author
SELECT COUNT(IdClient) FROM Client
SELECT COUNT(IdClient) FROM Client
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT B.Title, A.Name FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor
SELECT B.Title, A.Name FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor
SELECT O.IdOrder, C.Name FROM Orders O JOIN Client C ON O.IdClient = C.IdClient
SELECT O.IdOrder, C.Name FROM Orders O JOIN Client C ON O.IdClient = C.IdClient
SELECT author.Name, COUNT(author_book.ISBN) AS TotalBooks FROM author JOIN author_book ON author.idAuthor = author_book.Author GROUP BY author.Name ORDER BY author.Name
SELECT A.Name, COUNT(B.ISBN) AS BooksWritten FROM Author A LEFT JOIN Author_Book B ON A.idAuthor = B.Author GROUP BY A.Name ORDER BY A.Name ASC
SELECT B.ISBN, COUNT(O.ISBN) AS NumberOfOrders FROM Book B LEFT JOIN Books_Order O ON B.ISBN = O.ISBN GROUP BY B.ISBN
SELECT B.ISBN, COUNT(BO.ISBN) AS order_count FROM Book B LEFT JOIN Books_Order BO ON B.ISBN = BO.ISBN GROUP BY B.ISBN
SELECT Book.ISBN, SUM(Books_Order.amount) AS TotalOrdered FROM Book INNER JOIN Books_Order ON Book.ISBN = Books_Order.ISBN GROUP BY Book.ISBN
SELECT B.ISBN, SUM(BO.amount) AS TotalAmount FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN GROUP BY B.ISBN
SELECT B.Title FROM Book B INNER JOIN (SELECT ISBN, COUNT(*) AS TotalOrders FROM Books_Order GROUP BY ISBN ORDER BY TotalOrders DESC LIMIT 1) AS MostOrdered ON B.ISBN = MostOrdered.ISBN
SELECT B.Title FROM Book B WHERE B.ISBN = (SELECT BO.ISBN FROM Books_Order BO GROUP BY BO.ISBN ORDER BY SUM(BO.amount) DESC LIMIT 1)
SELECT B.Title, B.PurchasePrice FROM Book B INNER JOIN (SELECT ISBN, SUM(amount) AS total_amount FROM Books_Order GROUP BY ISBN ORDER BY total_amount DESC LIMIT 1) AS BO ON B.ISBN = BO.ISBN
SELECT B.Title, B.PurchasePrice FROM Book B JOIN (SELECT ISBN, SUM(amount) AS total_amount FROM Books_Order GROUP BY ISBN ORDER BY total_amount DESC LIMIT 1) AS BO ON B.ISBN = BO.ISBN
SELECT DISTINCT B.Title FROM Book B JOIN Books_Order BO ON B.ISBN = BO.ISBN
SELECT DISTINCT B.Title FROM Book B JOIN Books_Order O ON B.ISBN = O.ISBN
SELECT DISTINCT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient
SELECT DISTINCT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient
SELECT C.Name, COUNT(O.IdOrder) AS NumberOfOrders FROM Client C JOIN Orders O ON C.IdClient = O.IdClient GROUP BY C.Name
SELECT C.Name, COUNT(O.IdOrder) AS OrderCount FROM Client C LEFT JOIN Orders O ON C.IdClient = O.IdClient GROUP BY C.Name
SELECT C.Name FROM Client C JOIN (SELECT IdClient, COUNT(*) AS TotalOrders FROM Orders GROUP BY IdClient) AS O ON C.IdClient = O.IdClient ORDER BY O.TotalOrders DESC LIMIT 1
SELECT C.Name FROM Client C JOIN (SELECT IdClient, COUNT(*) AS TotalOrders FROM Orders GROUP BY IdClient ORDER BY TotalOrders DESC LIMIT 1) AS O ON C.IdClient = O.IdClient
SELECT C.Name, SUM(BO.amount) AS TotalAmount FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY C.Name
SELECT C.Name, SUM(BO.amount) AS TotalBooks FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY C.Name
SELECT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder GROUP BY C.IdClient ORDER BY SUM(BO.amount) DESC LIMIT 1
SELECT C.Name FROM Client C JOIN (SELECT IdClient, SUM(amount) AS TotalAmount FROM Books_Order GROUP BY IdClient ORDER BY TotalAmount DESC LIMIT 1) AS B ON C.IdClient = B.IdClient
SELECT B.Title FROM Book B LEFT JOIN Books_Order O ON B.ISBN = O.ISBN WHERE O.ISBN IS NULL
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT C.Name FROM Client C WHERE NOT EXISTS (SELECT 1 FROM Orders O WHERE O.IdClient = C.IdClient)
SELECT C.Name FROM Client C LEFT JOIN Orders O ON C.IdClient = O.IdClient WHERE O.IdClient IS NULL
SELECT MAX(SalePrice) AS MaxSalePrice, MIN(SalePrice) AS MinSalePrice FROM Book
SELECT MAX(SalePrice) AS MaxPrice, MIN(SalePrice) AS MinPrice FROM Book
SELECT AVG(PurchasePrice) AS AvgPurchasePrice, AVG(SalePrice) AS AvgSalePrice FROM Book
SELECT AVG(PurchasePrice) AS AvgPurchasePrice, AVG(SalePrice) AS AvgSalePrice FROM Book
SELECT MAX(SalePrice - PurchasePrice) AS MaxDifference FROM Book
SELECT MAX(SalePrice - PurchasePrice) AS LargestDifference FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT AVG(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(B.SalePrice) FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell'
SELECT AVG(B.SalePrice) FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell'
SELECT B.SalePrice FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato'
SELECT B.SalePrice FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'George Orwell' ORDER BY B.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT AVG(SalePrice) FROM Book)
SELECT A.Name FROM Author A JOIN Author_Book AB ON A.idAuthor = AB.Author JOIN Book B ON AB.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'
SELECT A.Name FROM Author A JOIN Author_Book AB ON A.idAuthor = AB.Author JOIN Book B ON AB.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name LIKE '%Plato%'
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name LIKE '%Plato%'
SELECT COUNT(DISTINCT Books_Order.IdOrder) FROM Books_Order LEFT JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT SUM(Books_Order.amount) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT o.IdOrder FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY o.IdOrder HAVING COUNT(DISTINCT b.Title) = 2
SELECT o.IdOrder FROM Orders o JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title IN ('Pride and Prejudice', 'The Little Prince') GROUP BY o.IdOrder HAVING COUNT(DISTINCT b.Title) = 2
SELECT B.ISBN FROM Books_Order B JOIN Orders O ON B.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe' INTERSECT SELECT B.ISBN FROM Books_Order B JOIN Orders O ON B.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith'
SELECT B.ISBN FROM Books_Order B JOIN Orders O ON B.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name IN ('Peter Doe', 'James Smith') GROUP BY B.ISBN HAVING COUNT(DISTINCT C.Name) = 2
SELECT B.Title FROM Book B WHERE B.ISBN IN (SELECT BO.ISBN FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'Peter Doe') AND B.ISBN NOT IN (SELECT BO.ISBN FROM Books_Order BO JOIN Orders O ON BO.IdOrder = O.IdOrder JOIN Client C ON O.IdClient = C.IdClient WHERE C.Name = 'James Smith')
WITH PeterDoeBooks AS (SELECT ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'Peter Doe'), JamesSmithBooks AS (SELECT ISBN FROM Books_Order JOIN Orders ON Books_Order.IdOrder = Orders.IdOrder JOIN Client ON Orders.IdClient = Client.IdClient WHERE Client.Name = 'James Smith') SELECT Title FROM Book WHERE ISBN IN (SELECT ISBN FROM PeterDoeBooks) AND ISBN NOT IN (SELECT ISBN FROM JamesSmithBooks)
SELECT DISTINCT c.Name FROM Client c JOIN Orders o ON c.IdClient = o.IdClient JOIN Books_Order bo ON o.IdOrder = bo.IdOrder JOIN Book b ON bo.ISBN = b.ISBN WHERE b.Title = 'Pride and Prejudice'
SELECT DISTINCT C.Name FROM Client C JOIN Orders O ON C.IdClient = O.IdClient JOIN Books_Order BO ON O.IdOrder = BO.IdOrder JOIN Book B ON BO.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'
SELECT COUNT(*) FROM book
SELECT Title FROM book ORDER BY Title ASC
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT Book_ID, Title, MAX(Chapters) AS MaxChapters, MIN(Chapters) AS MinChapters FROM book GROUP BY Book_ID, Title
SELECT Title FROM book WHERE Type != 'Poet'
SELECT AVG(Rating) FROM review
SELECT b.Title, r.Rating FROM book b JOIN review r ON b.Book_ID = r.Book_ID
SELECT R.Rating FROM review R JOIN book B ON R.Book_ID = B.Book_ID WHERE B.Chapters = (SELECT MAX(Chapters) FROM book)
SELECT R.Rank FROM review R JOIN book B ON R.Book_ID = B.Book_ID WHERE B.Pages = (SELECT MIN(Pages) FROM book)
SELECT Title FROM book WHERE Book_ID = (SELECT Book_ID FROM review ORDER BY Rank DESC LIMIT 1)
SELECT AVG(review.Readers_in_Million) AS Average_Readers FROM review JOIN book ON review.Book_ID = book.Book_ID WHERE book.Type = 'Novel'
SELECT Type, COUNT(*) AS NumberOfBooks FROM book GROUP BY Type
SELECT Type, COUNT(*) AS frequency FROM book GROUP BY Type ORDER BY frequency DESC LIMIT 1
SELECT Type FROM book GROUP BY Type HAVING COUNT(Book_ID) >= 3
SELECT b.Title FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Rating ASC
SELECT b.Title, b.Audio FROM book b JOIN review r ON b.Book_ID = r.Book_ID ORDER BY r.Readers_in_Million DESC
SELECT COUNT(*) FROM book b LEFT JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Book_ID IS NULL
SELECT Type FROM book GROUP BY Type HAVING MAX(Chapters) > 75 AND MIN(Chapters) < 50
SELECT COUNT(DISTINCT Type) FROM book
SELECT b.Type, b.Title FROM book b LEFT JOIN review r ON b.Book_ID = r.Book_ID WHERE r.Book_ID IS NULL
SELECT COUNT(*) FROM customer
SELECT COUNT(*) FROM customer
SELECT customer.Name FROM customer ORDER BY customer.Level_of_Membership ASC
SELECT customer.Name FROM customer ORDER BY customer.Level_of_Membership ASC
SELECT Nationality, Card_Credit FROM customer
SELECT Nationality, Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT AVG(Card_Credit) AS AverageCredit FROM customer WHERE Level_of_Membership > 1
SELECT AVG(c.Card_Credit) FROM customer c WHERE c.Level_of_Membership > 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Nationality, COUNT(Customer_ID) AS NumberOfCustomers FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(Customer_ID) AS NumberOfCustomers FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality HAVING MIN(Card_Credit) < 50 AND MAX(Card_Credit) > 75
SELECT Nationality FROM customer WHERE Card_Credit > 50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit < 75
SELECT customer.Name, customer_order.Dish_Name FROM customer JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID
SELECT c.Name, o.Dish_Name FROM customer c JOIN customer_order o ON c.Customer_ID = o.Customer_ID
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT c.Name, co.Dish_Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID ORDER BY co.Quantity DESC
SELECT customer.Name, SUM(customer_order.Quantity) AS Total_Quantity FROM customer INNER JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Name
SELECT customer.Name, SUM(customer_order.Quantity) AS TotalQuantity FROM customer INNER JOIN customer_order ON customer.Customer_ID = customer_order.Customer_ID GROUP BY customer.Name
SELECT c.* FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID HAVING SUM(co.Quantity) > 1
SELECT c.Name FROM customer c JOIN customer_order co ON c.Customer_ID = co.Customer_ID GROUP BY c.Customer_ID HAVING SUM(co.Quantity) > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT c.Name FROM customer c LEFT JOIN customer_order o ON c.Customer_ID = o.Customer_ID WHERE o.Customer_ID IS NULL
SELECT c.Name FROM customer c LEFT JOIN customer_order o ON c.Customer_ID = o.Customer_ID WHERE o.Customer_ID IS NULL
SELECT COUNT(*) FROM member
SELECT Name FROM member ORDER BY Age ASC
SELECT Name, Nationality FROM member
SELECT Name FROM member WHERE Nationality != 'England'
SELECT Name FROM member WHERE Age IN (19, 20)
SELECT Name FROM member WHERE Age = (SELECT MAX(Age) FROM member)
SELECT Nationality, COUNT(Member_ID) AS NumberOfMembers FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Member_ID) >= 2
SELECT m.Name, c.Club_Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Overall_Ranking > 100
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID WHERE cl.Year_Join < 2018
SELECT m.Name FROM member m JOIN club_leader cl ON m.Member_ID = cl.Member_ID JOIN club c ON cl.Club_ID = c.Club_ID WHERE c.Club_Name = 'Houston'
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member GROUP BY Nationality HAVING SUM(CASE WHEN Age > 22 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN Age < 19 THEN 1 ELSE 0 END) > 0
SELECT AVG(member.Age) AS Average_Age FROM member JOIN club_leader ON member.Member_ID = club_leader.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT Collection_Subsets.Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT cs.Collection_Subset_Details FROM Collection_Subsets cs WHERE cs.Collection_Subset_Name = 'Top collection'
SELECT C.Collection_Description FROM Collections C JOIN Collection_Subset_Members M ON C.Collection_ID = M.Collection_ID JOIN Collection_Subsets S ON M.Collection_Subset_ID = S.Collection_Subset_ID WHERE S.Collection_Subset_Name = 'Top collection'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds LEFT JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT DISTINCT do.Owner FROM Document_Objects do JOIN Documents_in_Collections dic ON do.Document_Object_ID = dic.Document_Object_ID JOIN Collections c ON dic.Collection_ID = c.Collection_ID WHERE c.Collection_Description = 'Braeden Collection'
SELECT D2.Owner FROM Document_Objects D1 JOIN Document_Objects D2 ON D1.Parent_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Marlin'
SELECT D2.Owner FROM Document_Objects D1 JOIN Document_Objects D2 ON D1.Parent_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Marlin'
SELECT DISTINCT D1.Description FROM Document_Objects D1 JOIN Document_Objects D2 ON D1.Document_Object_ID = D2.Parent_Document_Object_ID
SELECT DISTINCT D1.Description FROM Document_Objects D1 JOIN Document_Objects D2 ON D1.Document_Object_ID = D2.Parent_Document_Object_ID
SELECT COUNT(Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(Document_Object_ID) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT d1.Document_Object_ID FROM Document_Objects d1 WHERE NOT EXISTS (SELECT 1 FROM Document_Objects d2 WHERE d2.Parent_Document_Object_ID = d1.Document_Object_ID)
SELECT Document_Object_ID FROM Document_Objects d WHERE NOT EXISTS (SELECT 1 FROM Document_Objects WHERE Parent_Document_Object_ID = d.Document_Object_ID)
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS NumberOfChildren FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) AS Child_Count FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT parent.Collection_Name FROM Collections AS child JOIN Collections AS parent ON child.Parent_Collection_ID = parent.Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT parent.Collection_Name FROM Collections AS child JOIN Collections AS parent ON child.Parent_Collection_ID = parent.Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT C.Collection_Name FROM Collections C WHERE NOT EXISTS (SELECT 1 FROM Collections P WHERE P.Parent_Collection_ID = C.Collection_ID)
SELECT Collection_Name FROM Collections C1 WHERE NOT EXISTS (SELECT 1 FROM Collections C2 WHERE C2.Parent_Collection_ID = C1.Collection_ID)
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(Document_Object_ID) > 1
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID HAVING COUNT(Document_Object_ID) > 1
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM Collections AS Parent JOIN Collections AS Child ON Parent.Collection_ID = Child.Parent_Collection_ID WHERE Parent.Collection_Name = 'Best'
SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom')
SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Ransom')
SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, COUNT(csm.Collection_ID) AS Num_Collections FROM Collection_Subsets cs JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name
SELECT CS.Collection_Subset_ID, CS.Collection_Subset_Name, COUNT(CSM.Collection_ID) AS Num_Collections FROM Collection_Subsets CS JOIN Collection_Subset_Members CSM ON CS.Collection_Subset_ID = CSM.Collection_Subset_ID GROUP BY CS.Collection_Subset_ID, CS.Collection_Subset_Name
SELECT Parent_Document_Object_ID AS Document_ID, COUNT(*) AS NumberOfChildren FROM Document_Objects GROUP BY Parent_Document_Object_ID ORDER BY NumberOfChildren DESC LIMIT 1
SELECT d1.Document_Object_ID, COUNT(d2.Parent_Document_Object_ID) AS num_children FROM Document_Objects d1 LEFT JOIN Document_Objects d2 ON d1.Document_Object_ID = d2.Parent_Document_Object_ID GROUP BY d1.Document_Object_ID
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS related_count FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY related_count ASC LIMIT 1
SELECT Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS num_related_documents FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING num_related_documents BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS Related_Count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING COUNT(Related_Document_Object_ID) BETWEEN 2 AND 4
SELECT DISTINCT D2.Owner FROM Document_Objects AS D1 JOIN Document_Subset_Members AS DSM ON D1.Document_Object_ID = DSM.Document_Object_ID JOIN Document_Objects AS D2 ON DSM.Related_Document_Object_ID = D2.Document_Object_ID WHERE D1.Owner = 'Braeden'
SELECT DISTINCT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden')) AND Owner <> 'Braeden'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Objects do JOIN Document_Subset_Members dsm ON do.Document_Object_ID = dsm.Document_Object_ID JOIN Document_Subsets ds ON dsm.Document_Subset_ID = ds.Document_Subset_ID WHERE do.Owner = 'Braeden'
SELECT DISTINCT ds.Document_Subset_Name FROM Document_Subsets ds JOIN Document_Subset_Members dsm ON ds.Document_Subset_ID = dsm.Document_Subset_ID JOIN Document_Objects do ON dsm.Document_Object_ID = do.Document_Object_ID WHERE do.Owner = 'Braeden'
SELECT Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name, COUNT(DISTINCT Document_Subset_Members.Document_Object_ID) AS Num_Documents FROM Document_Subsets INNER JOIN Document_Subset_Members ON Document_Subsets.Document_Subset_ID = Document_Subset_Members.Document_Subset_ID GROUP BY Document_Subsets.Document_Subset_ID, Document_Subsets.Document_Subset_Name
SELECT cs.Collection_Subset_ID, cs.Collection_Subset_Name, COUNT(DISTINCT dic.Document_Object_ID) AS Document_Count FROM Collection_Subsets cs JOIN Collection_Subset_Members csm ON cs.Collection_Subset_ID = csm.Collection_Subset_ID JOIN Collections c ON csm.Collection_ID = c.Collection_ID JOIN Documents_in_Collections dic ON c.Collection_ID = dic.Collection_ID GROUP BY cs.Collection_Subset_ID, cs.Collection_Subset_Name
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS NumberOfDocuments FROM Document_Subsets DS JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT DS.Document_Subset_ID, DS.Document_Subset_Name, COUNT(DISTINCT DSM.Document_Object_ID) AS NumberOfDocuments FROM Document_Subsets AS DS JOIN Document_Subset_Members AS DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID GROUP BY DS.Document_Subset_ID, DS.Document_Subset_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT DSM.Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000'
SELECT DSM.Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000'
SELECT DS.Document_Subset_Name, DSM.Document_Object_ID FROM Document_Subsets DS JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID
SELECT DS.Document_Subset_Name, DO.Document_Object_ID FROM Document_Subsets DS INNER JOIN Document_Subset_Members DSM ON DS.Document_Subset_ID = DSM.Document_Subset_ID INNER JOIN Document_Objects DO ON DSM.Document_Object_ID = DO.Document_Object_ID
SELECT DISTINCT C.Collection_Name FROM Collections C JOIN Documents_in_Collections DC ON C.Collection_ID = DC.Collection_ID JOIN Document_Objects DO ON DC.Document_Object_ID = DO.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT C.Collection_Name FROM Collections C JOIN Documents_in_Collections DC ON C.Collection_ID = DC.Collection_ID JOIN Document_Objects DO ON DC.Document_Object_ID = DO.Document_Object_ID WHERE DO.Owner = 'Ransom'
SELECT Document_Object_ID, COUNT(Collection_ID) AS Collection_Count FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(*) AS NumOfCollections FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT COUNT(DISTINCT doc.Document_Object_ID) FROM Documents_in_Collections AS doc JOIN Collections AS col ON doc.Collection_ID = col.Collection_ID WHERE col.Collection_Name = 'Best'
SELECT COUNT(DISTINCT d.Document_Object_ID) FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT d.Document_Object_ID FROM Documents_in_Collections d INNER JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT COUNT(DISTINCT doc.Document_Object_ID) FROM Documents_in_Collections AS doc JOIN Collections AS col ON doc.Collection_ID = col.Collection_ID WHERE col.Collection_Name = 'Best'
SELECT C.Collection_Name, C.Collection_ID, COUNT(D.Document_Object_ID) AS NumberOfDocuments FROM Collections C JOIN Documents_in_Collections D ON C.Collection_ID = D.Collection_ID GROUP BY C.Collection_ID, C.Collection_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT C.Collection_ID, C.Collection_Name, COUNT(D.Document_Object_ID) AS Document_Count FROM Collections C JOIN Documents_in_Collections D ON C.Collection_ID = D.Collection_ID WHERE C.Collection_Name = 'Best' GROUP BY C.Collection_ID, C.Collection_Name ORDER BY Document_Count DESC LIMIT 1
SELECT DISTINCT D.Document_Object_ID FROM Document_Objects D JOIN Document_Subset_Members DSM ON D.Document_Object_ID = DSM.Document_Object_ID JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID JOIN Documents_in_Collections DIC ON D.Document_Object_ID = DIC.Document_Object_ID JOIN Collections C ON DIC.Collection_ID = C.Collection_ID WHERE DS.Document_Subset_Name = 'Best for 2000' AND C.Collection_Name = 'Best'
SELECT DISTINCT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000')) INTERSECT SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT d.Document_Object_ID FROM Documents_in_Collections d JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT dm.Document_Object_ID FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000')
SELECT d.Document_Object_ID FROM Documents_in_Collections d JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best' AND d.Document_Object_ID NOT IN (SELECT dm.Document_Object_ID FROM Document_Subset_Members dm JOIN Document_Subsets ds ON dm.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000')
SELECT DISTINCT Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID WHERE DS.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT Document_Object_ID FROM Documents_in_Collections DIC JOIN Collections C ON DIC.Collection_ID = C.Collection_ID WHERE C.Collection_Name = 'Best'
SELECT DISTINCT d.Document_Object_ID FROM Document_Subset_Members d JOIN Document_Subsets ds ON d.Document_Subset_ID = ds.Document_Subset_ID WHERE ds.Document_Subset_Name = 'Best for 2000' UNION SELECT DISTINCT d.Document_Object_ID FROM Documents_in_Collections d JOIN Collections c ON d.Collection_ID = c.Collection_ID WHERE c.Collection_Name = 'Best'
SELECT Collection_Name FROM Collections WHERE Collection_ID IN (SELECT Related_Collection_ID FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT c.Collection_Name FROM Collections c JOIN Collection_Subset_Members csm ON c.Collection_ID = csm.Related_Collection_ID JOIN Collections c1 ON csm.Collection_ID = c1.Collection_ID WHERE c1.Collection_Name = 'Best'
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT Related_Collection_ID) FROM Collection_Subset_Members WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT CS.Collection_Subset_Name FROM Collections C JOIN Collection_Subset_Members CSM ON C.Collection_ID = CSM.Collection_ID JOIN Collection_Subsets CS ON CSM.Collection_Subset_ID = CS.Collection_Subset_ID WHERE C.Collection_Name = 'Best'
SELECT Collection_Subset_Name FROM Collection_Subsets WHERE Collection_Subset_ID IN (SELECT Collection_Subset_ID FROM Collection_Subset_Members WHERE Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best'))
SELECT COUNT(id) FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name ASC
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality) AS MaximumVoiceQuality, MIN(voice_sound_quality) AS MinimumVoiceQuality FROM performance_score
SELECT ps.voice_sound_quality, ps.rhythm_tempo, ps.stage_presence FROM performance_score ps JOIN participants p ON ps.participant_id = p.id WHERE p.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name <> 'Love'
SELECT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT performance_score.stage_presence FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'English'
SELECT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id HAVING COUNT(DISTINCT ps.songs_id) >= 2
SELECT p.id, p.name, p.popularity, COUNT(ps.songs_id) AS song_count FROM participants p JOIN performance_score ps ON p.id = ps.participant_id GROUP BY p.id, p.name, p.popularity ORDER BY song_count DESC
SELECT p.id, p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id WHERE ps.voice_sound_quality = 5 OR ps.rhythm_tempo = 5
SELECT voice_sound_quality FROM performance_score INNER JOIN songs ON performance_score.songs_id = songs.id WHERE songs.name = 'The Balkan Girls' AND songs.language = 'English'
SELECT T1.id, T1.name FROM songs AS T1 JOIN performance_score AS T2 ON T1.id = T2.songs_id GROUP BY T1.id, T1.name ORDER BY COUNT(T2.participant_id) DESC LIMIT 1
SELECT COUNT(*) AS total FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT AVG(performance_score.rhythm_tempo) AS AverageRhythm, songs.language FROM performance_score JOIN songs ON performance_score.songs_id = songs.id GROUP BY songs.language
SELECT DISTINCT p.name FROM participants p JOIN performance_score ps ON p.id = ps.participant_id JOIN songs s ON ps.songs_id = s.id WHERE s.language = 'English'
SELECT P.name, P.popularity FROM participants P WHERE P.id IN (SELECT PS.participant_id FROM performance_score PS JOIN songs S ON PS.songs_id = S.id WHERE S.language = 'Croatian') AND P.id IN (SELECT PS.participant_id FROM performance_score PS JOIN songs S ON PS.songs_id = S.id WHERE S.language = 'English')
SELECT name FROM songs WHERE name LIKE '%Is%'
SELECT s.original_artist FROM songs s JOIN performance_score p ON s.id = p.songs_id WHERE p.rhythm_tempo > 5 ORDER BY p.voice_sound_quality DESC
SELECT COUNT(*) FROM City
SELECT COUNT(*) FROM City
SELECT DISTINCT state FROM City
SELECT DISTINCT state FROM City
SELECT COUNT(DISTINCT country) FROM City
SELECT COUNT(DISTINCT country) FROM City
SELECT city_name, city_code, state, country FROM City
SELECT city_code, city_name, state, country FROM City
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT latitude, longitude FROM City WHERE city_name = 'Baltimore'
SELECT city_name FROM City WHERE state = 'PA'
SELECT city_name FROM City WHERE state = 'PA'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT City.city_name FROM City WHERE City.country = 'USA' ORDER BY City.latitude ASC
SELECT City.city_name FROM City WHERE City.country = 'USA' ORDER BY City.latitude ASC
SELECT state, COUNT(*) AS num_cities FROM City GROUP BY state
SELECT state, COUNT(*) AS city_count FROM City GROUP BY state
SELECT country, COUNT(*) AS number_of_cities FROM City GROUP BY country
SELECT country, COUNT(city_code) AS total_cities FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(*) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(*) >= 2
SELECT state, COUNT(city_name) AS city_count FROM City GROUP BY state ORDER BY city_count DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY COUNT(city_name) DESC LIMIT 1
SELECT country FROM (SELECT country, COUNT(city_name) AS city_count FROM City GROUP BY country) AS subquery ORDER BY city_count ASC LIMIT 1
SELECT country FROM (SELECT country, COUNT(*) AS city_count FROM City GROUP BY country) AS subquery ORDER BY city_count ASC LIMIT 1
SELECT Fname, LName FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT CONCAT(Student.Fname, ' ', Student.LName) AS FullName FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT COUNT(DISTINCT Student.StuID) FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(Student.StuID) AS NumberOfStudents FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT City.country, COUNT(Student.StuID) AS NumberOfStudents FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.country
SELECT City.country, COUNT(Student.StuID) AS NumberOfStudents FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY City.country
SELECT City.city_name, COUNT(Student.StuID) AS NumberOfStudents FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY City.city_name
SELECT City.city_name, COUNT(Student.StuID) AS NumberOfStudents FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY City.city_name
SELECT C.state, COUNT(S.StuID) AS num_students FROM City AS C INNER JOIN Student AS S ON C.city_code = S.city_code GROUP BY C.state ORDER BY num_students DESC FETCH FIRST 1 ROW ONLY
SELECT C.state FROM City C INNER JOIN Student S ON C.city_code = S.city_code GROUP BY C.state ORDER BY COUNT(S.StuID) DESC LIMIT 1
SELECT C.country FROM City C INNER JOIN Student S ON C.city_code = S.city_code GROUP BY C.country ORDER BY COUNT(S.StuID) ASC LIMIT 1
SELECT C.country FROM City C INNER JOIN Student S ON C.city_code = S.city_code GROUP BY C.country ORDER BY COUNT(S.StuID) ASC LIMIT 1
SELECT C.city_name FROM City C JOIN Student S ON C.city_code = S.city_code GROUP BY C.city_name HAVING COUNT(S.StuID) >= 3
SELECT C.city_name FROM City C JOIN Student S ON C.city_code = S.city_code GROUP BY C.city_name HAVING COUNT(S.StuID) >= 3
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code GROUP BY C.state HAVING COUNT(S.StuID) > 5
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country <> 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country <> 'USA'
SELECT Student.StuID FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'F' AND City.state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'female' AND state = 'PA'
SELECT Student.StuID FROM Student INNER JOIN City ON Student.city_code = City.city_code WHERE Student.Sex = 'Male' AND City.country != 'USA'
SELECT StuID FROM Student s INNER JOIN City c ON s.city_code = c.city_code WHERE s.Sex = 'male' AND c.country <> 'USA'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT distance FROM Direct_distance WHERE city1_code = 'BAL' AND city2_code = 'CHI'
SELECT d.distance FROM Direct_distance d JOIN City c1 ON d.city1_code = c1.city_code JOIN City c2 ON d.city2_code = c2.city_code WHERE c1.city_name = 'Boston' AND c2.city_name = 'Newark'
SELECT D.distance FROM Direct_distance D JOIN City C1 ON D.city1_code = C1.city_code JOIN City C2 ON D.city2_code = C2.city_code WHERE C1.city_name = 'Boston' AND C2.city_name = 'Newark'
SELECT AVG(distance) AS average_distance, MIN(distance) AS minimum_distance, MAX(distance) AS maximum_distance FROM Direct_distance
SELECT AVG(distance) AS Average_Distance, MIN(distance) AS Minimum_Distance, MAX(distance) AS Maximum_Distance FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT MAX(distance) FROM Direct_distance)
SELECT D1.city1_code, D1.city2_code FROM Direct_distance D1 WHERE D1.distance > (SELECT AVG(D2.distance) FROM Direct_distance D2)
SELECT DISTINCT city1_code FROM Direct_distance WHERE distance > (SELECT AVG(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000
SELECT DISTINCT city_code FROM City WHERE city_code IN (SELECT city1_code FROM Direct_distance WHERE distance < 1000 UNION SELECT city2_code FROM Direct_distance WHERE distance < 1000)
SELECT SUM(distance) AS TotalDistance FROM Direct_distance WHERE 'BAL' IN (city1_code, city2_code)
SELECT SUM(distance) AS total_distance FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT AVG(distance) AS AverageDistance FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(D.distance) AS AverageDistance FROM Direct_distance D JOIN City C1 ON D.city1_code = C1.city_code JOIN City C2 ON D.city2_code = C2.city_code WHERE C1.city_name = 'Boston' OR C2.city_name = 'Boston'
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE distance = (SELECT MIN(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago')))
SELECT C2.city_name FROM City C1 JOIN Direct_distance D ON C1.city_code = D.city1_code JOIN City C2 ON D.city2_code = C2.city_code WHERE C1.city_name = 'Chicago' ORDER BY D.distance ASC LIMIT 1
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY D.distance DESC LIMIT 1
SELECT C.city_name FROM City C JOIN Direct_distance D ON C.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') ORDER BY D.distance DESC LIMIT 1
SELECT C.city_code, SUM(D.distance) AS total_distance FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_code
SELECT city_code, SUM(distance) AS total_distance FROM (SELECT city1_code AS city_code, distance FROM Direct_distance UNION ALL SELECT city2_code AS city_code, distance FROM Direct_distance) AS combined GROUP BY city_code
SELECT C.city_name, AVG(D.distance) AS avg_distance FROM City C JOIN Direct_distance D ON C.city_code = D.city1_code GROUP BY C.city_name
SELECT city_name, AVG(distance) AS average_distance FROM (SELECT city_name, distance FROM City JOIN Direct_distance ON city_code = city1_code UNION ALL SELECT city_name, distance FROM City JOIN Direct_distance ON city_code = city2_code) AS subquery GROUP BY city_name
SELECT D.distance FROM Direct_distance D JOIN Student S1 ON D.city1_code = S1.city_code JOIN Student S2 ON D.city2_code = S2.city_code WHERE S1.Fname = 'Linda' AND S1.LName = 'Smith' AND S2.Fname = 'Tracy' AND S2.LName = 'Kim'
SELECT distance FROM Direct_distance WHERE (city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city2_code = (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim')) OR (city2_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') AND city1_code = (SELECT city_code FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim'))
SELECT S.Fname, S.LName FROM Student S JOIN Direct_distance D ON S.city_code = D.city2_code WHERE D.city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') ORDER BY D.distance DESC LIMIT 1
SELECT S.Fname, S.LName FROM Student S JOIN Direct_distance D ON S.city_code = D.city2_code WHERE D.distance = (SELECT MAX(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith'))
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code WHERE S.Fname = 'Linda'
SELECT C.state FROM City C JOIN Student S ON C.city_code = S.city_code WHERE S.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT * FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT B.name FROM Boats B JOIN Reserves R ON B.bid = R.bid WHERE R.sid = 1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE R.bid = 102
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE R.bid = 102
SELECT DISTINCT b.bid FROM Boats b, Reserves r WHERE b.bid = r.bid
SELECT DISTINCT bid FROM Reserves
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age >= ALL (SELECT age FROM Sailors)
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age > ALL (SELECT age FROM Sailors WHERE rating > 7)
SELECT DISTINCT S1.name FROM Sailors AS S1 WHERE S1.age > ANY (SELECT S2.age FROM Sailors AS S2 WHERE S2.rating > 7)
SELECT DISTINCT s.name, s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid
SELECT DISTINCT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid
SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid, S.name HAVING COUNT(DISTINCT R.bid) > 1
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid GROUP BY S.sid HAVING COUNT(DISTINCT R.bid) >= 2
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT DISTINCT s.sid FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT S.name, S.sid FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue')
SELECT s.sid, s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.color IN ('red', 'blue')
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid AND Boats.color IN ('red', 'blue') GROUP BY sid HAVING COUNT(DISTINCT color) = 2)
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color IN ('red', 'blue') GROUP BY sid HAVING COUNT(DISTINCT color) = 2)
SELECT S.sid, S.name FROM Sailors S WHERE S.sid IN (SELECT R.sid FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red') AND S.sid IN (SELECT R.sid FROM Reserves R JOIN Boats B ON R.bid = B.bid WHERE B.color = 'blue')
SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color IN ('red', 'blue') GROUP BY S.sid, S.name HAVING COUNT(DISTINCT B.color) = 2
SELECT Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT S.sid FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid WHERE R.sid IS NULL
SELECT S.name, S.sid FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid WHERE R.sid IS NULL
SELECT S.name, S.sid FROM Sailors S WHERE S.sid NOT IN (SELECT R.sid FROM Reserves R)
SELECT S.sid FROM Sailors S LEFT JOIN Reserves R ON S.sid = R.sid WHERE R.sid IS NULL
SELECT Sailors.sid FROM Sailors LEFT JOIN Reserves ON Sailors.sid = Reserves.sid WHERE Reserves.sid IS NULL
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE R.bid = 103
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid WHERE R.bid = 103
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis')
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT S2.rating FROM Sailors S2 WHERE S2.name = 'Luis')
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT S2.rating FROM Sailors S2 WHERE S2.name = 'Luis')
SELECT DISTINCT S.sid, S.name FROM Sailors S, Reserves R WHERE S.sid = R.sid AND S.rating > 2
SELECT s.sid, s.name FROM Sailors s WHERE s.rating >= 3 AND EXISTS (SELECT 1 FROM Reserves r WHERE r.sid = s.sid)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT COUNT(*) FROM Sailors
SELECT COUNT(*) FROM Sailors
SELECT AVG(Sailors.age) AS AverageAge FROM Sailors WHERE Sailors.rating = 7
SELECT AVG(Sailors.age) AS AverageAge FROM Sailors WHERE Sailors.rating = 7
SELECT COUNT(sid) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(sid) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating) AS average_rating, MAX(age) AS max_age FROM Sailors
SELECT AVG(rating) AS average_rating, MAX(age) AS max_age FROM Sailors
SELECT B.name, COUNT(R.bid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid GROUP BY B.name
SELECT B.name, COUNT(R.bid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid GROUP BY B.bid, B.name
SELECT B.bid, COUNT(R.sid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid WHERE B.bid > 50 GROUP BY B.bid
SELECT B.bid, COUNT(R.sid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid WHERE B.bid > 50 GROUP BY B.bid
SELECT B.name, COUNT(R.bid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid GROUP BY B.bid HAVING COUNT(R.bid) > 1
SELECT bid, COUNT(*) AS reservation_count FROM Reserves GROUP BY bid HAVING COUNT(*) > 1
SELECT B.bid, COUNT(R.sid) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid JOIN Sailors S ON R.sid = S.sid WHERE S.sid > 1 GROUP BY B.bid
SELECT Boats.name, COUNT(*) AS num_reservations FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid JOIN Sailors ON Reserves.sid = Sailors.sid WHERE Sailors.sid > 1 GROUP BY Boats.bid
SELECT S.rating, AVG(S.age) AS avg_age FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT S.rating, AVG(S.age) AS avg_age FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' GROUP BY S.rating
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT Sailors.name, Sailors.rating, Sailors.age FROM Sailors ORDER BY Sailors.rating ASC, Sailors.age ASC
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats
SELECT COUNT(bid) FROM Boats WHERE color = 'red'
SELECT COUNT(bid) FROM Boats WHERE color = 'red'
SELECT DISTINCT B.name FROM Boats B JOIN Reserves R ON B.bid = R.bid JOIN Sailors S ON R.sid = S.sid WHERE S.age BETWEEN 20 AND 30
SELECT DISTINCT B.name FROM Boats B JOIN Reserves R ON B.bid = R.bid JOIN Sailors S ON R.sid = S.sid WHERE S.age BETWEEN 20 AND 30
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT S1.rating FROM Sailors S1 JOIN Reserves R ON S1.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red')
SELECT S.name FROM Sailors S WHERE S.rating > ALL (SELECT S2.rating FROM Sailors S2 JOIN Reserves R ON S2.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red')
SELECT MAX(rating) FROM Sailors
SELECT MAX(rating) FROM Sailors
SELECT s.name FROM Sailors s JOIN Reserves r ON s.sid = r.sid JOIN Boats b ON r.bid = b.bid WHERE b.name = 'Melon'
SELECT S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.name = 'Melon'
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Sailors.name, Sailors.age FROM Sailors ORDER BY Sailors.rating DESC
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price = (SELECT MAX(Price) FROM headphone)
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT DISTINCT Model FROM headphone ORDER BY Model ASC
SELECT Class, COUNT(*) AS frequency FROM headphone GROUP BY Class ORDER BY frequency DESC LIMIT 1
SELECT Class FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID GROUP BY Class ORDER BY SUM(stock.Quantity) DESC LIMIT 1
SELECT Class FROM headphone H JOIN (SELECT Headphone_ID, SUM(Quantity) AS Total FROM stock GROUP BY Headphone_ID HAVING Total > 2) S ON H.Headphone_ID = S.Headphone_ID
SELECT h.Class FROM headphone h LEFT JOIN stock s ON h.Headphone_ID = s.Headphone_ID GROUP BY h.Class HAVING COALESCE(SUM(s.Quantity), 0) <= 2
SELECT headphone.Class, COUNT(headphone.Headphone_ID) AS Count FROM headphone WHERE headphone.Price > 200 GROUP BY headphone.Class
SELECT Class, COUNT(Headphone_ID) AS Count FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT H.Earpads FROM headphone H JOIN stock S ON H.Headphone_ID = S.Headphone_ID GROUP BY H.Earpads ORDER BY SUM(S.Quantity) DESC LIMIT 2
SELECT Earpads, COUNT(Headphone_ID) AS Num_Headphones FROM headphone GROUP BY Earpads ORDER BY Num_Headphones DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Model, Class, Construction FROM headphone WHERE Price = (SELECT MIN(Price) FROM headphone)
SELECT Construction, AVG(Price) AS Average_Price FROM headphone GROUP BY Construction
SELECT Construction, AVG(Price) AS Average_Price FROM headphone GROUP BY Construction
SELECT DISTINCT h1.Class FROM headphone h1 JOIN headphone h2 ON h1.Class = h2.Class WHERE h1.Earpads = 'Bowls' AND h2.Earpads = 'Comfort Pads'
SELECT Class FROM headphone WHERE Earpads IN ('Bowls', 'Comfort Pads') GROUP BY Class HAVING COUNT(DISTINCT Earpads) = 2
SELECT Earpads FROM headphone EXCEPT SELECT Earpads FROM headphone WHERE Construction = 'plastic'
SELECT Earpads FROM headphone WHERE Construction != 'plastic'
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT AVG(Price) FROM headphone)
SELECT store.Name FROM store ORDER BY store.Date_Opened ASC
SELECT Name FROM store ORDER BY Date_Opened ASC
SELECT store.Name, store.Parking FROM store WHERE store.Neighborhood = 'Tarzana'
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT Neighborhood, COUNT(Store_ID) AS NumberOfStores FROM store GROUP BY Neighborhood
SELECT Neighborhood, COUNT(*) AS StoreCount FROM store GROUP BY Neighborhood
SELECT S.Name, SUM(ST.Quantity) AS Total_Headphones FROM store S JOIN stock ST ON S.Store_ID = ST.Store_ID GROUP BY S.Store_ID ORDER BY Total_Headphones DESC LIMIT 1
SELECT s.Name, SUM(st.Quantity) AS TotalQuantity FROM store s JOIN stock st ON s.Store_ID = st.Store_ID GROUP BY s.Name
SELECT s.Name FROM store s WHERE NOT EXISTS (SELECT 1 FROM stock st WHERE st.Store_ID = s.Store_ID AND st.Quantity > 0)
SELECT s.Name FROM store s WHERE NOT EXISTS (SELECT 1 FROM stock st WHERE st.Store_ID = s.Store_ID AND st.Quantity > 0)
SELECT Model FROM headphone WHERE NOT EXISTS (SELECT 1 FROM stock WHERE stock.Headphone_ID = headphone.Headphone_ID AND stock.Quantity > 0)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT H.Model FROM headphone H JOIN stock S ON H.Headphone_ID = S.Headphone_ID GROUP BY H.Model ORDER BY SUM(S.Quantity) DESC LIMIT 1
SELECT H.Model FROM headphone H JOIN (SELECT Headphone_ID, SUM(Quantity) AS Total FROM stock GROUP BY Headphone_ID ORDER BY Total DESC LIMIT 1) S ON H.Headphone_ID = S.Headphone_ID
SELECT SUM(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT SUM(stock.Quantity) FROM stock JOIN store ON stock.Store_ID = store.Store_ID WHERE store.Name = 'Woodman'
SELECT s.Neighborhood FROM store s WHERE s.Store_ID NOT IN (SELECT st.Store_ID FROM stock st WHERE st.Quantity > 0)
SELECT DISTINCT s.Neighborhood FROM store s WHERE s.Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT COUNT(author_id) FROM Author
SELECT COUNT(*) FROM Author
SELECT COUNT(*) FROM Paper
SELECT COUNT(*) FROM Paper
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(paper_id) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(paper_id) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(DISTINCT P.paper_id) FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE P.year = 2009 AND A.name = 'Columbia University'
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT Paper.venue FROM Paper ORDER BY Paper.year ASC
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Harvard University'
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Harvard University'
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown'
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown'
SELECT P.title, P.paper_id FROM Paper P WHERE P.paper_id IN (SELECT A.paper_id FROM Author_list A JOIN Affiliation AF ON A.affiliation_id = AF.affiliation_id WHERE AF.name = 'Stanford University') AND P.paper_id IN (SELECT A.paper_id FROM Author_list A JOIN Affiliation AF ON A.affiliation_id = AF.affiliation_id WHERE AF.name = 'Columbia University')
WITH StanfordPapers AS (SELECT paper_id FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Stanford'), ColumbiaPapers AS (SELECT paper_id FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University') SELECT Paper.title, Paper.paper_id FROM Paper JOIN StanfordPapers SP ON Paper.paper_id = SP.paper_id JOIN ColumbiaPapers CP ON Paper.paper_id = CP.paper_id
SELECT P.title, P.paper_id FROM Paper P JOIN (SELECT AL.paper_id FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY AL.paper_id HAVING COUNT(DISTINCT A.name) = 2) AS CoAuthored ON P.paper_id = CoAuthored.paper_id
SELECT P.title, P.paper_id FROM Paper P JOIN (SELECT paper_id FROM Author_list WHERE author_id IN (SELECT author_id FROM Author WHERE name IN ('Mckeown, Kathleen', 'Rambow, Owen')) GROUP BY paper_id HAVING COUNT(DISTINCT author_id) = 2) AS CoAuthored ON P.paper_id = CoAuthored.paper_id
SELECT title, paper_id FROM Paper WHERE EXISTS (SELECT 1 FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Mckeown' AND Author_list.paper_id = Paper.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE name = 'Rambow' AND Author_list.paper_id = Paper.paper_id)
SELECT P.title, P.paper_id FROM Paper P WHERE EXISTS (SELECT 1 FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown' AND AL.paper_id = P.paper_id) AND NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Rambow' AND AL.paper_id = P.paper_id)
SELECT P.title, P.paper_id FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT P.paper_id, P.title FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Author A ON AL.author_id = A.author_id WHERE A.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT A.name, COUNT(DISTINCT AL.paper_id) AS num_papers FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.name ORDER BY num_papers DESC
SELECT A.name, COUNT(P.paper_id) AS num_papers FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id JOIN Paper AS P ON AL.paper_id = P.paper_id GROUP BY A.author_id ORDER BY num_papers DESC
SELECT A.name, COUNT(AL.paper_id) AS num_papers FROM Affiliation A LEFT JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY A.affiliation_id ORDER BY num_papers ASC
SELECT A.name FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id GROUP BY A.name ORDER BY COUNT(AL.paper_id) DESC
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) > 50
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) > 50
SELECT A.name FROM Author A WHERE (SELECT COUNT(*) FROM Author_list AL WHERE AL.author_id = A.author_id) = 1
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) = 1
SELECT venue, year, COUNT(*) AS publication_count FROM Paper GROUP BY venue, year ORDER BY publication_count DESC LIMIT 1
SELECT venue, year, COUNT(*) AS publication_count FROM Paper GROUP BY venue, year ORDER BY publication_count DESC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) AS NumberOfCitations FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(DISTINCT paper_id) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(cited_paper_id) AS ReferenceCount FROM Citation WHERE paper_id = 'D12-1027'
SELECT COUNT(*) AS TotalReferences FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT cited_paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY cited_paper_id ORDER BY citation_count DESC LIMIT 1
SELECT cited_paper_id, COUNT(*) AS citation_count FROM Citation GROUP BY cited_paper_id ORDER BY citation_count DESC LIMIT 1
SELECT P.title FROM Paper P JOIN (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(cited_paper_id) DESC LIMIT 1) C ON P.paper_id = C.paper_id
SELECT P.title FROM Paper P JOIN (SELECT paper_id, COUNT(cited_paper_id) AS cnt FROM Citation GROUP BY paper_id ORDER BY cnt DESC LIMIT 1) C ON P.paper_id = C.paper_id
SELECT P.title, COUNT(C.cited_paper_id) AS citation_count FROM Paper P JOIN Citation C ON P.paper_id = C.cited_paper_id GROUP BY P.title ORDER BY citation_count DESC LIMIT 10
SELECT P.title, COUNT(C.cited_paper_id) AS citation_count FROM Paper P JOIN Citation C ON P.paper_id = C.cited_paper_id GROUP BY P.paper_id, P.title ORDER BY citation_count DESC LIMIT 10
SELECT COUNT(cited_paper_id) FROM Citation WHERE paper_id IN (SELECT paper_id FROM Paper WHERE paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')))
SELECT COUNT(*) FROM Citation C INNER JOIN Author_list AL ON C.paper_id = AL.paper_id INNER JOIN Author A ON AL.author_id = A.author_id WHERE A.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM (SELECT DISTINCT C.cited_paper_id FROM Author A INNER JOIN Author_list AL ON A.author_id = AL.author_id INNER JOIN Citation C ON AL.paper_id = C.paper_id WHERE A.name = 'Mckeown, Kathleen') AS cited_papers
SELECT COUNT(DISTINCT C.cited_paper_id) FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Citation C ON AL.paper_id = C.paper_id WHERE A.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(C.cited_paper_id) AS citation_count FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Citation C ON AL.paper_id = C.cited_paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT A.name, citation_count FROM Author AS A JOIN (SELECT AL.author_id, COUNT(C.cited_paper_id) AS citation_count FROM Author_list AS AL JOIN Citation AS C ON AL.paper_id = C.cited_paper_id GROUP BY AL.author_id ORDER BY COUNT(C.cited_paper_id) DESC LIMIT 1) AS SubQuery ON A.author_id = SubQuery.author_id
SELECT DISTINCT P.venue, P.year FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT DISTINCT P.venue, P.year FROM Paper P, Author_list AL, Author A WHERE P.paper_id = AL.paper_id AND AL.author_id = A.author_id AND A.name = 'Mckeown, Kathleen'
SELECT DISTINCT P.venue, P.year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT DISTINCT P.venue, P.year FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University'
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY COUNT(P.paper_id) DESC LIMIT 1
SELECT A.name FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.author_id ORDER BY COUNT(P.paper_id) DESC LIMIT 1
SELECT A.name FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY COUNT(P.paper_id) DESC LIMIT 3
SELECT A.name, COUNT(P.paper_id) AS paper_count FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.year = 2009 GROUP BY A.name ORDER BY paper_count DESC LIMIT 3
SELECT COUNT(DISTINCT Paper.paper_id) AS TotalPapers FROM Paper INNER JOIN Author_list ON Paper.paper_id = Author_list.paper_id INNER JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Columbia University' AND Paper.year <= 2009
SELECT COUNT(DISTINCT P.paper_id) FROM Paper P JOIN Author_list AL ON P.paper_id = AL.paper_id JOIN Affiliation A ON AL.affiliation_id = A.affiliation_id WHERE A.name = 'Columbia University' AND P.year <= 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Stanford University' AND Paper.year BETWEEN 2000 AND 2009
SELECT COUNT(DISTINCT Paper.paper_id) FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.name = 'Stanford University' AND Paper.year BETWEEN 2000 AND 2009
SELECT P.title FROM Paper P JOIN (SELECT paper_id, COUNT(author_id) AS num_authors FROM Author_list GROUP BY paper_id ORDER BY num_authors DESC LIMIT 1) A ON P.paper_id = A.paper_id
SELECT P.title FROM Paper P JOIN (SELECT paper_id FROM Author_list GROUP BY paper_id ORDER BY COUNT(author_id) DESC LIMIT 1) AS A ON P.paper_id = A.paper_id
SELECT COUNT(DISTINCT A2.author_id) FROM Author A1 JOIN Author_list AL1 ON A1.author_id = AL1.author_id JOIN Paper P ON AL1.paper_id = P.paper_id JOIN Author_list AL2 ON P.paper_id = AL2.paper_id JOIN Author A2 ON AL2.author_id = A2.author_id WHERE A1.name = 'Mckeown, Kathleen' AND A2.name != 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT other_authors.author_id) FROM Author_list AS main_author_list JOIN Author_list AS other_authors ON main_author_list.paper_id = other_authors.paper_id JOIN Author ON main_author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown, Kathleen' AND other_authors.author_id != Author.author_id
SELECT A.name, COUNT(*) AS coauthored_papers FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id WHERE AL.paper_id IN (SELECT paper_id FROM Author_list WHERE author_id = (SELECT author_id FROM Author WHERE name = 'Mckeown, Kathleen')) GROUP BY A.name ORDER BY coauthored_papers DESC LIMIT 1
SELECT A.name FROM Author A INNER JOIN (SELECT AL.author_id, COUNT(*) AS PapersWithMckeown FROM Author_list AL WHERE AL.paper_id IN (SELECT AL2.paper_id FROM Author_list AL2 WHERE AL2.author_id = (SELECT A2.author_id FROM Author A2 WHERE A2.name = 'Mckeown, Kathleen')) GROUP BY AL.author_id) AS SubQuery ON A.author_id = SubQuery.author_id ORDER BY SubQuery.PapersWithMckeown DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id, title FROM Paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)
SELECT P.paper_id, P.title FROM Paper P LEFT JOIN Citation C ON P.paper_id = C.cited_paper_id WHERE C.cited_paper_id IS NULL
SELECT A.name FROM Affiliation A WHERE A.affiliation_id = (SELECT affiliation_id FROM (SELECT affiliation_id, COUNT(paper_id) AS paper_count FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE address LIKE '%China%' GROUP BY affiliation_id) AS SubQuery ORDER BY paper_count DESC LIMIT 1)
SELECT name FROM Affiliation WHERE affiliation_id IN (SELECT affiliation_id FROM (SELECT affiliation_id, COUNT(paper_id) AS cnt FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.address LIKE '%China%' GROUP BY affiliation_id) AS T ORDER BY cnt DESC LIMIT 1)
SELECT year, venue, COUNT(*) AS total_papers FROM Paper GROUP BY year, venue
SELECT venue, year, COUNT(paper_id) AS total_papers FROM Paper GROUP BY venue, year
SELECT A.name, COUNT(DISTINCT P.paper_id) AS total_papers FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id, A.name
SELECT A.name, COUNT(DISTINCT P.paper_id) AS published_papers FROM Affiliation A JOIN Author_list AL ON A.affiliation_id = AL.affiliation_id JOIN Paper P ON AL.paper_id = P.paper_id GROUP BY A.affiliation_id, A.name
SELECT P.title FROM Paper P WHERE (SELECT COUNT(*) FROM Citation C WHERE C.paper_id = P.paper_id) > 50
SELECT title FROM Paper WHERE paper_id IN (SELECT cited_paper_id FROM Citation GROUP BY cited_paper_id HAVING COUNT(*) > 50)
SELECT COUNT(DISTINCT A.author_id) FROM Author AS A WHERE A.author_id NOT IN (SELECT AL.author_id FROM Author_list AS AL JOIN Citation AS C ON AL.paper_id = C.cited_paper_id GROUP BY C.cited_paper_id HAVING COUNT(*) > 50)
SELECT COUNT(DISTINCT author_id) FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50))
SELECT A.name FROM Author A, Paper P, Author_list AL WHERE A.author_id = AL.author_id AND AL.paper_id = P.paper_id AND P.year = 2009 AND P.venue IN ('NAACL', 'ACL') GROUP BY A.name HAVING COUNT(DISTINCT P.venue) = 2
SELECT DISTINCT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id JOIN Paper AS P ON AL.paper_id = P.paper_id WHERE P.venue = 'NAACL' AND P.year = 2009 INTERSECT SELECT DISTINCT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id JOIN Paper AS P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND P.year = 2009
SELECT A.name FROM Author A WHERE NOT EXISTS (SELECT 1 FROM Author_list AL JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL' AND AL.author_id = A.author_id)
SELECT A.name FROM Author A WHERE A.author_id NOT IN (SELECT AL.author_id FROM Author_list AL INNER JOIN Paper P ON AL.paper_id = P.paper_id WHERE P.venue = 'ACL')
SELECT COUNT(*) FROM conference
SELECT COUNT(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT c.Conference_Name, COUNT(cp.Conference_ID) AS Participation_Count FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name
SELECT Conference_Name, COUNT(*) AS occurrences FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(Conference_ID) AS Conference_Count FROM conference GROUP BY Year
SELECT Year, COUNT(Conference_ID) AS Total_Conferences FROM conference GROUP BY Year
SELECT Year FROM (SELECT Year, COUNT(*) AS num_conferences FROM conference GROUP BY Year) AS yearly_data ORDER BY num_conferences ASC LIMIT 1
SELECT Year FROM (SELECT Year, COUNT(*) AS num_conferences FROM conference GROUP BY Year) AS yearly_counts ORDER BY num_conferences ASC LIMIT 1
SELECT c.Location FROM conference c GROUP BY c.Location HAVING COUNT(c.Conference_ID) >= 2
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution
SELECT COUNT(Institution_ID) FROM institution WHERE Founded >= 1850 AND Founded <= 1900
SELECT COUNT(*) AS NumberOfInstitutions FROM institution WHERE Founded >= 1850 AND Founded <= 1900
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT Institution_Name, Location FROM institution WHERE Founded = (SELECT MAX(Founded) FROM institution)
SELECT I.Institution_Name, COUNT(S.staff_ID) AS NumberOfStaff FROM institution I LEFT JOIN staff S ON I.Institution_ID = S.Institution_ID WHERE I.Founded > 1800 GROUP BY I.Institution_Name
SELECT I.Institution_ID, COUNT(S.staff_ID) AS Staff_Count, GROUP_CONCAT(S.name) AS Staff_Names FROM institution I JOIN staff S ON I.Institution_ID = S.Institution_ID WHERE I.Founded > 1800 GROUP BY I.Institution_ID
SELECT i.Institution_Name FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE s.Institution_ID IS NULL
SELECT i.Institution_Name FROM institution i LEFT JOIN staff s ON i.Institution_ID = s.Institution_ID WHERE s.Institution_ID IS NULL
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT MAX(staff.Age) AS MaximumAge, MIN(staff.Age) AS MinimumAge FROM staff WHERE staff.Nationality = 'United States'
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge FROM staff
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada'
SELECT DISTINCT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID JOIN staff s ON cp.staff_ID = s.staff_ID WHERE s.Nationality = 'Canada'
SELECT S.name FROM staff S WHERE EXISTS (SELECT 1 FROM conference_participation CP WHERE CP.staff_ID = S.staff_ID AND CP.role = 'speaker') AND EXISTS (SELECT 1 FROM conference_participation CP WHERE CP.staff_ID = S.staff_ID AND CP.role = 'sponsor')
SELECT DISTINCT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role IN ('speaker', 'sponsor') GROUP BY staff_ID HAVING COUNT(DISTINCT role) = 2)
SELECT DISTINCT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation CP JOIN conference C ON CP.Conference_ID = C.Conference_ID WHERE C.Conference_Name IN ('ACL', 'Naccl') GROUP BY staff_ID HAVING COUNT(DISTINCT C.Conference_Name) = 2)
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation CP JOIN conference C ON CP.Conference_ID = C.Conference_ID WHERE C.Conference_Name IN ('ACL', 'NACCL') GROUP BY staff_ID HAVING COUNT(DISTINCT C.Conference_Name) = 2)
SELECT DISTINCT staff.name FROM staff INNER JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID INNER JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year = 2003 OR conference.Year = 2004
SELECT DISTINCT s.name FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year IN (2003, 2004)
SELECT c.Conference_Name, c.Year, COUNT(cp.staff_ID) AS Participants FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name, c.Year
SELECT c.Conference_ID, c.Conference_Name, c.Year, (SELECT COUNT(*) FROM conference_participation WHERE Conference_ID = c.Conference_ID) AS Participant_Count FROM conference c
SELECT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_ID, c.Conference_Name ORDER BY COUNT(cp.staff_ID) DESC LIMIT 2
SELECT c.Conference_Name FROM conference c JOIN conference_participation cp ON c.Conference_ID = cp.Conference_ID GROUP BY c.Conference_Name ORDER BY COUNT(cp.staff_ID) DESC LIMIT 2
SELECT s.name, s.Nationality FROM staff s WHERE s.staff_ID NOT IN (SELECT cp.staff_ID FROM conference_participation cp JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Conference_Name = 'ACL')
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT i.Institution_Name, i.Location FROM institution i WHERE NOT EXISTS (SELECT 1 FROM staff s JOIN conference_participation cp ON s.staff_ID = cp.staff_ID JOIN conference c ON cp.Conference_ID = c.Conference_ID WHERE c.Year = 2004 AND s.Institution_ID = i.Institution_ID)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MAX(age) FROM PilotSkills)
SELECT PS.pilot_name FROM PilotSkills PS WHERE PS.age < (SELECT AVG(PS2.age) FROM PilotSkills PS2) ORDER BY PS.age ASC
SELECT P.pilot_name FROM PilotSkills P WHERE P.age < (SELECT AVG(age) FROM PilotSkills) ORDER BY P.age ASC
SELECT * FROM PilotSkills WHERE age < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar WHERE plane_name IS NOT NULL
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT H.plane_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Jones' AND P.age = 32
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name WHERE PilotSkills.age < 35 AND Hangar.plane_name = 'B-52 Bomber'
SELECT COUNT(*) FROM (SELECT h.plane_name FROM Hangar h JOIN PilotSkills p ON h.plane_name = p.plane_name WHERE p.age < 35 AND h.plane_name = 'B-52') AS subquery
SELECT pilot_name FROM PilotSkills WHERE age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') AND plane_name = 'Piper Cub'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age = (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT H.plane_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name ORDER BY COUNT(P.pilot_name) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT H.plane_name FROM Hangar H LEFT JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.plane_name ORDER BY COUNT(P.pilot_name) ASC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT COUNT(DISTINCT PilotSkills.pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT H.plane_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Smith' AND P.age = 41
SELECT H.plane_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Smith' AND P.age = 41
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT H.plane_name) FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Smith'
SELECT COUNT(DISTINCT H.plane_name) FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.pilot_name = 'Smith'
SELECT COUNT(DISTINCT Hangar.plane_name) FROM Hangar JOIN PilotSkills ON Hangar.plane_name = PilotSkills.plane_name WHERE PilotSkills.age > 40
SELECT COUNT(DISTINCT h.plane_name) FROM Hangar h INNER JOIN PilotSkills ps ON h.plane_name = ps.plane_name WHERE ps.age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age ASC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT Hangar.location FROM Hangar ORDER BY Hangar.plane_name ASC
SELECT location FROM Hangar ORDER BY plane_name ASC
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name IN (SELECT plane_name FROM PilotSkills) ORDER BY plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name ASC
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND pilot_name NOT IN (SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber') GROUP BY pilot_name HAVING COUNT(DISTINCT plane_name) = 2
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'B-52 Bomber') GROUP BY pilot_name HAVING COUNT(DISTINCT plane_name) = 2
SELECT AVG(age) AS average_age, MIN(age) AS minimum_age FROM PilotSkills
SELECT AVG(age) AS Average_Age, MIN(age) AS Minimum_Age FROM PilotSkills
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston')
SELECT P.pilot_name FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name WHERE H.location IN ('Austin', 'Boston') GROUP BY P.pilot_name HAVING COUNT(DISTINCT H.location) = 2
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT H.plane_name, AVG(P.age) AS avg_age FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name GROUP BY H.plane_name
SELECT plane_name, AVG(age) AS average_age FROM PilotSkills GROUP BY plane_name
SELECT location AS plane_type, COUNT(plane_name) AS number_of_planes FROM Hangar GROUP BY location
SELECT plane_name, COUNT(*) AS num_entries FROM Hangar GROUP BY plane_name
SELECT T1.plane_name, T2.pilot_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name WHERE T2.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = T1.plane_name) ORDER BY T1.plane_name
SELECT H.plane_name, P.pilot_name FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = H.plane_name) ORDER BY H.plane_name
SELECT P1.plane_name, P1.pilot_name FROM PilotSkills P1 JOIN (SELECT plane_name, MAX(age) AS max_age FROM PilotSkills GROUP BY plane_name) P2 ON P1.plane_name = P2.plane_name AND P1.age = P2.max_age
SELECT DISTINCT h.plane_name, (SELECT p.pilot_name FROM PilotSkills p WHERE p.plane_name = h.plane_name ORDER BY p.age ASC LIMIT 1) AS pilot_name FROM Hangar h
SELECT pilot_name, MAX(age) AS max_age FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) AS max_age FROM PilotSkills GROUP BY pilot_name
SELECT H.location, COUNT(P.pilot_name) AS num_pilots, AVG(P.age) AS avg_age FROM PilotSkills P JOIN Hangar H ON P.plane_name = H.plane_name GROUP BY H.location
SELECT H.location, COUNT(P.pilot_name) AS num_pilots, AVG(P.age) AS avg_age FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name GROUP BY H.location
SELECT p.plane_name, COUNT(p.pilot_name) FROM PilotSkills p GROUP BY p.plane_name HAVING AVG(p.age) < 35
SELECT p.plane_name, COUNT(*) FROM PilotSkills p WHERE (SELECT AVG(age) FROM PilotSkills WHERE plane_name = p.plane_name) < 35 GROUP BY p.plane_name
SELECT H.location FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.age = (SELECT MIN(P2.age) FROM PilotSkills P2)
SELECT H.location FROM Hangar H JOIN PilotSkills P ON H.plane_name = P.plane_name WHERE P.age = (SELECT MIN(age) FROM PilotSkills)
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'
SELECT PilotSkills.pilot_name, PilotSkills.age FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Austin'
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name ASC
SELECT pilot_name FROM PilotSkills WHERE age > ALL (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(pilot_name) FROM PilotSkills WHERE age > ANY (SELECT age FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district WHERE Area_km = (SELECT MAX(Area_km) FROM district)
SELECT d.Area_km, d.Government_website FROM district d WHERE d.Population = (SELECT MIN(Population) FROM district)
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(Area_km) AS MaxArea, AVG(Area_km) AS AvgArea FROM district
SELECT SUM(Population) FROM district WHERE Area_km >= (SELECT MIN(Area_km) FROM (SELECT Area_km FROM district ORDER BY Area_km DESC LIMIT 3))
SELECT d.District_ID, d.Name, d.Government_website FROM district d ORDER BY d.Population ASC
SELECT Name FROM district WHERE Government_website LIKE '%.gov%'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman
SELECT AVG(Points) AS Average_Points, AVG(Age) AS Average_Age FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40
SELECT Name FROM spokesman WHERE Age = (SELECT MAX(Age) FROM spokesman)
SELECT Name FROM spokesman WHERE Points < (SELECT AVG(Points) FROM spokesman)
SELECT D.Name FROM district D JOIN spokesman_district SD ON D.District_ID = SD.District_ID GROUP BY D.District_ID ORDER BY COUNT(SD.Spokesman_ID) DESC LIMIT 1
SELECT s.Name FROM spokesman s JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Start_year < 2004
SELECT d.Name, COUNT(sd.Spokesman_ID) AS NumberOfSpokesmen FROM district d JOIN spokesman_district sd ON d.District_ID = sd.District_ID GROUP BY d.District_ID, d.Name
SELECT DISTINCT d.Name FROM district d, spokesman_district sd, spokesman s WHERE d.District_ID = sd.District_ID AND sd.Spokesman_ID = s.Spokesman_ID AND s.Rank_position IN (1, 2) GROUP BY d.Name HAVING COUNT(DISTINCT s.Rank_position) = 2
SELECT d.Name FROM district d INNER JOIN (SELECT District_ID FROM spokesman_district GROUP BY District_ID HAVING COUNT(Spokesman_ID) > 1) sd ON d.District_ID = sd.District_ID
SELECT COUNT(*) FROM district AS d LEFT JOIN spokesman_district AS sd ON d.District_ID = sd.District_ID WHERE sd.District_ID IS NULL
SELECT s.Name FROM spokesman s LEFT JOIN spokesman_district sd ON s.Spokesman_ID = sd.Spokesman_ID WHERE sd.Spokesman_ID IS NULL
SELECT SUM(Population) Total, AVG(Population) Average FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title FROM Sculptures WHERE year = (SELECT MAX(year) FROM Sculptures)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title, location FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title, location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures
SELECT title, location FROM Sculptures
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT CONCAT(fname, ' ', lname) AS full_name FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location != 'gallery 226'
SELECT title, year FROM Sculptures WHERE location != 'gallery 226'
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year < 1900
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year < 1900
SELECT DISTINCT A.birthYear FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year > 1920
SELECT DISTINCT A.birthYear FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.year > 1920
SELECT A.fname, A.lname FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(B.deathYear - B.birthYear) FROM Artists B)
SELECT CONCAT(fname, ' ', lname) AS full_name FROM Artists WHERE (deathYear - birthYear) = (SELECT MAX(deathYear - birthYear) FROM Artists)
SELECT (deathYear - birthYear) AS Age FROM Artists ORDER BY Age ASC LIMIT 1
SELECT MIN(deathYear - birthYear) AS shortest_life_span FROM Artists WHERE deathYear IS NOT NULL AND birthYear IS NOT NULL
SELECT A.fname, (A.deathYear - A.birthYear) AS age FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(B.deathYear - B.birthYear) FROM Artists B)
SELECT A.fname, (A.deathYear - A.birthYear) AS age FROM Artists A WHERE (A.deathYear - A.birthYear) = (SELECT MAX(B.deathYear - B.birthYear) FROM Artists B)
SELECT COUNT(paintingID) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE location = '240'
SELECT COUNT(paintingID) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Paintings.painterID ORDER BY (Artists.deathYear - Artists.birthYear) DESC LIMIT 1
SELECT COUNT(paintingID) FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID GROUP BY Artists.artistID ORDER BY (Artists.deathYear - Artists.birthYear) DESC LIMIT 1
SELECT P.title, P.year FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Mary'
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT P.width_mm FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.birthYear < 1850
SELECT width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT P.location, P.medium FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Pablo'
SELECT P.location, P.medium FROM Paintings P JOIN Artists A ON P.painterID = A.artistID WHERE A.fname = 'Pablo'
SELECT fname, lname FROM Artists WHERE EXISTS (SELECT 1 FROM Paintings WHERE painterID = Artists.artistID) AND EXISTS (SELECT 1 FROM Sculptures WHERE sculptorID = Artists.artistID)
SELECT A.fname, A.lname FROM Artists A WHERE EXISTS (SELECT 1 FROM Paintings P WHERE P.painterID = A.artistID) AND EXISTS (SELECT 1 FROM Sculptures S WHERE S.sculptorID = A.artistID)
SELECT A.fname, A.lname FROM Artists A WHERE EXISTS (SELECT 1 FROM Paintings P WHERE P.painterID = A.artistID AND P.medium = 'oil') AND EXISTS (SELECT 1 FROM Paintings P WHERE P.painterID = A.artistID AND P.medium = 'lithographic')
SELECT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT painterID FROM Paintings WHERE medium IN ('oil', 'lithographic') GROUP BY painterID HAVING COUNT(DISTINCT medium) = 2)
SELECT a.birthYear FROM Artists a JOIN Paintings p ON a.artistID = p.painterID WHERE p.year = 1884 AND p.mediumOn = 'canvas'
SELECT A.birthYear FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.year = 1884
SELECT DISTINCT A.fname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' AND P.location = 'gallery 241'
SELECT DISTINCT Artists.fname FROM Artists INNER JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.medium = 'oil' AND Paintings.location = '241'
SELECT medium, SUM(count) AS total FROM (SELECT medium, COUNT(*) AS count FROM Paintings GROUP BY medium UNION ALL SELECT medium, COUNT(*) AS count FROM Sculptures GROUP BY medium) AS totals GROUP BY medium
SELECT medium, COUNT(*) AS count FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) AS combined GROUP BY medium
SELECT medium, AVG(height_mm) AS average_height FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) AS average_height FROM Paintings GROUP BY medium
SELECT location, COUNT(paintingID) AS num_paintings FROM Paintings WHERE year < 1900 GROUP BY location
SELECT location, COUNT(*) AS num_paintings FROM Paintings WHERE year < 1900 GROUP BY location
SELECT title FROM Paintings WHERE year > 1910 AND medium = 'oil'
SELECT title FROM Paintings WHERE medium = 'oil' AND year > 1910
SELECT DISTINCT Artists.artistID FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.medium = 'oil' AND Paintings.location = 'gallery 240'
SELECT DISTINCT Artists.artistID FROM Artists JOIN Paintings ON Artists.artistID = Paintings.painterID WHERE Paintings.medium = 'oil' AND Paintings.location = 'gallery 240'
SELECT DISTINCT P.title FROM Paintings P WHERE P.height_mm > ANY (SELECT height_mm FROM Paintings WHERE medium = 'canvas')
SELECT DISTINCT title FROM Paintings WHERE height_mm > ANY (SELECT height_mm FROM Paintings WHERE medium = 'canvas')
SELECT DISTINCT P.paintingID FROM Paintings P WHERE EXISTS (SELECT 1 FROM Paintings Q WHERE Q.location = 'gallery 240' AND P.year < Q.year)
SELECT DISTINCT P.paintingID FROM Paintings P WHERE EXISTS (SELECT 1 FROM Paintings P2 WHERE P2.location = 'gallery 240' AND P.year < P2.year)
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT paintingID FROM Paintings WHERE year = (SELECT MIN(year) FROM Paintings)
SELECT A.fname, A.lname FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.title LIKE '%female%'
SELECT A.fname, A.lname FROM Artists A JOIN Sculptures S ON A.artistID = S.sculptorID WHERE S.title LIKE '%female%'
SELECT DISTINCT title FROM Paintings ORDER BY title ASC
SELECT DISTINCT title FROM Paintings ORDER BY title ASC
SELECT DISTINCT title FROM Paintings ORDER BY width_mm ASC
SELECT DISTINCT title FROM Paintings ORDER BY height_mm ASC
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE year BETWEEN 1900 AND 1950 UNION SELECT title FROM Sculptures WHERE year BETWEEN 1900 AND 1950
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT title FROM Paintings WHERE painterID = 222 UNION SELECT title FROM Sculptures WHERE sculptorID = 222
SELECT A.artistID FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.year < 1900 GROUP BY A.artistID ORDER BY COUNT(P.paintingID) DESC LIMIT 1
SELECT A.artistID FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.year < 1900 GROUP BY A.artistID ORDER BY COUNT(P.paintingID) DESC LIMIT 1
SELECT A.fname FROM Artists A JOIN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) DESC LIMIT 1) B ON A.artistID = B.sculptorID
SELECT A.fname FROM Artists A INNER JOIN (SELECT sculptorID, COUNT(*) AS NumWorks FROM Sculptures GROUP BY sculptorID ORDER BY NumWorks DESC LIMIT 1) AS MostWorks ON A.artistID = MostWorks.sculptorID
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT DISTINCT location FROM Paintings WHERE medium IN ('on panel', 'on canvas')
SELECT DISTINCT location FROM Paintings WHERE medium IN ('on panels', 'on canvas')
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT P1.location FROM Paintings P1, Paintings P2 WHERE P1.location = P2.location AND P1.year < 1885 AND P2.year > 1930
SELECT AVG(height_mm) AS AverageHeight, AVG(width_mm) AS AverageWidth FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT AVG(height_mm) AS avg_height, AVG(width_mm) AS avg_width FROM Paintings WHERE medium = 'oil' AND location = '241'
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 AND height_mm = (SELECT MAX(height_mm) FROM Paintings WHERE year < 1900)
SELECT paintingID, height_mm FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT A.lname, A.fname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY A.artistID, A.lname, A.fname ORDER BY A.lname, A.fname
SELECT A.fname, A.lname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY A.artistID ORDER BY A.lname, A.fname
SELECT A.fname, COUNT(P.paintingID) AS NumberOfPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT A.fname, COUNT(P.paintingID) AS NumberOfPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT A.deathYear FROM Artists A WHERE (SELECT COUNT(*) FROM Paintings P WHERE P.painterID = A.artistID) <= 3
SELECT A.deathYear FROM Artists A WHERE (SELECT COUNT(*) FROM Paintings P WHERE P.painterID = A.artistID) < 4
SELECT A.deathYear FROM Artists A JOIN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM Sculptures GROUP BY sculptorID)) B ON A.artistID = B.sculptorID
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM Sculptures GROUP BY sculptorID))
SELECT paintingID, height_mm FROM Paintings WHERE location = 'gallery 240' AND width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID, height_mm FROM Paintings WHERE width_mm = (SELECT MAX(width_mm) FROM Paintings WHERE location = '240') AND location = '240'
SELECT paintingID FROM Paintings WHERE year < ALL (SELECT year FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = '240')
SELECT paintingID FROM Paintings WHERE height_mm > ALL (SELECT height_mm FROM Paintings WHERE year > 1900)
SELECT P.paintingID FROM Paintings P WHERE P.height_mm > (SELECT MAX(height_mm) FROM Paintings WHERE year > 1900)
SELECT A.fname, A.lname, COUNT(P.paintingID) AS NumberOfPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY NumberOfPaintings DESC LIMIT 3
SELECT A.fname, A.lname FROM Artists A, Paintings P WHERE A.artistID = P.painterID AND P.medium = 'oil' GROUP BY A.artistID, A.fname, A.lname HAVING COUNT(P.paintingID) = (SELECT MAX(PaintCount) FROM (SELECT COUNT(*) AS PaintCount FROM Paintings WHERE medium = 'oil' GROUP BY painterID) Temp)
SELECT P.paintingID, P.location, P.title FROM Paintings P WHERE P.medium = 'oil' ORDER BY P.year
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT p.year, p.location, p.title FROM Paintings p WHERE p.height_mm > 1000 ORDER BY p.title ASC
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title ASC
SELECT A.fname, A.lname FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P) AND A.artistID NOT IN (SELECT S.sculptorID FROM Sculptures S)
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT DISTINCT P.location FROM Paintings P WHERE P.year < 1885 AND NOT EXISTS (SELECT 1 FROM Paintings P2 WHERE P2.location = P.location AND P2.mediumOn = 'canvas')
SELECT DISTINCT location FROM Paintings WHERE year < 1885 AND NOT mediumOn = 'canvas'
SELECT COUNT(*) FROM race
SELECT COUNT(*) FROM race
SELECT r.Winning_driver, r.Winning_team FROM race r ORDER BY r.Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT DISTINCT Winning_driver FROM race WHERE NOT Pole_Position = 'Junior Strous'
SELECT r.Winning_driver FROM race r WHERE r.Pole_Position != 'Junior Strous'
SELECT Constructor FROM driver ORDER BY Age ASC
SELECT Constructor, MIN(Age) AS MinAge FROM driver GROUP BY Constructor ORDER BY MinAge ASC
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT MAX(Age) AS MaximumAge, MIN(Age) AS MinimumAge FROM driver
SELECT MAX(Age) AS MaxAge, MIN(Age) AS MinAge FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT driver.Driver_Name, race.Race_Name FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID
SELECT driver.Driver_Name, race.Race_Name FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID
SELECT d.Driver_Name, COUNT(r.Driver_ID) AS Races_Participated FROM driver d JOIN race r ON d.Driver_ID = r.Driver_ID GROUP BY d.Driver_Name
SELECT driver.Driver_Name, COUNT(*) AS Races_Participated FROM driver JOIN race ON driver.Driver_ID = race.Driver_ID GROUP BY driver.Driver_ID
SELECT d.Age FROM driver d WHERE d.Driver_ID = (SELECT r.Driver_ID FROM race r GROUP BY r.Driver_ID ORDER BY COUNT(r.Driver_ID) DESC LIMIT 1)
SELECT driver.Age FROM driver JOIN (SELECT Driver_ID, COUNT(*) AS Races_Count FROM race GROUP BY Driver_ID ORDER BY Races_Count DESC LIMIT 1) AS Most_Races ON driver.Driver_ID = Most_Races.Driver_ID
SELECT D.Driver_Name, D.Age FROM driver D WHERE D.Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) >= 2)
SELECT D.Driver_Name, D.Age FROM driver D WHERE D.Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) >= 2)
SELECT DISTINCT r.Race_Name FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID WHERE d.Age >= 26
SELECT DISTINCT r.Race_Name FROM race r JOIN driver d ON r.Driver_ID = d.Driver_ID WHERE d.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor <> 'Bugatti'
SELECT d.Driver_Name FROM driver d WHERE d.Constructor != 'Bugatti'
SELECT Constructor, COUNT(*) AS DriverCount FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(Driver_ID) AS NumberOfDrivers FROM driver GROUP BY Constructor
SELECT Engine, COUNT(*) AS count FROM driver GROUP BY Engine ORDER BY count DESC LIMIT 1
SELECT Engine, COUNT(*) AS Frequency FROM driver GROUP BY Engine ORDER BY Frequency DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(Driver_ID) >= 2
SELECT d.Driver_Name FROM driver d LEFT JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Driver_ID IS NULL
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT DISTINCT d1.Constructor FROM driver d1 JOIN driver d2 ON d1.Constructor = d2.Constructor WHERE d1.Age < 20 AND d2.Age > 30
SELECT d.Constructor FROM driver d WHERE EXISTS (SELECT 1 FROM driver WHERE Constructor = d.Constructor AND Age < 20) AND EXISTS (SELECT 1 FROM driver WHERE Constructor = d.Constructor AND Age > 30)
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(Winning_team) > 1
SELECT Winning_team, COUNT(*) AS Wins FROM race GROUP BY Winning_team HAVING Wins > 1
SELECT d.Driver_Name FROM driver d WHERE EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe') AND EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'Carl Skerlong')
SELECT d.Driver_Name FROM driver d INNER JOIN race r ON d.Driver_ID = r.Driver_ID WHERE r.Pole_Position IN ('James Hinchcliffe', 'Carl Skerlong') GROUP BY d.Driver_Name HAVING COUNT(DISTINCT r.Pole_Position) = 2
SELECT d.Driver_Name FROM driver d WHERE NOT EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT d.Driver_Name FROM driver d WHERE NOT EXISTS (SELECT 1 FROM race r WHERE r.Driver_ID = d.Driver_ID AND r.Pole_Position = 'James Hinchcliffe')
SELECT COUNT(*) FROM languages
SELECT COUNT(*) FROM languages
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages ORDER BY name ASC
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT countries.name FROM countries ORDER BY countries.overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) AS AverageJusticeScore FROM countries
SELECT AVG(justice_score) AS AverageJusticeScore FROM countries
SELECT MAX(health_score) AS max_health, MIN(health_score) AS min_health FROM countries WHERE name <> 'Norway'
SELECT MAX(health_score) AS MaxHealthScore, MIN(health_score) AS MinHealthScore FROM countries WHERE name != 'Norway'
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT COUNT(DISTINCT language_id) FROM official_languages
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT name FROM countries WHERE politics_score = (SELECT MAX(politics_score) FROM countries)
SELECT c.name AS Country, l.name AS Language FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT c.name AS Country, l.name AS Language FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id
SELECT L.name, COUNT(DISTINCT O.country_id) AS num_countries FROM languages L JOIN official_languages O ON L.id = O.language_id GROUP BY L.name
SELECT L.name, COUNT(DISTINCT O.country_id) AS num_countries FROM languages L JOIN official_languages O ON L.id = O.language_id GROUP BY L.name
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY OL.language_id ORDER BY COUNT(OL.country_id) DESC LIMIT 1
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.id HAVING COUNT(DISTINCT OL.country_id) > 1
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.id HAVING COUNT(DISTINCT OL.country_id) >= 2
SELECT AVG(countries.overall_score) FROM countries JOIN official_languages ON countries.id = official_languages.country_id JOIN languages ON official_languages.language_id = languages.id WHERE languages.name = 'English'
SELECT AVG(c.overall_score) FROM countries c JOIN official_languages ol ON c.id = ol.country_id JOIN languages l ON ol.language_id = l.id WHERE l.name = 'English'
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name ORDER BY COUNT(*) DESC LIMIT 3
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id GROUP BY L.name ORDER BY COUNT(DISTINCT OL.country_id) DESC LIMIT 3
SELECT L.name, AVG(C.overall_score) AS avg_score FROM languages L JOIN official_languages OL ON L.id = OL.language_id JOIN countries C ON OL.country_id = C.id GROUP BY L.name ORDER BY avg_score DESC
SELECT L.name FROM languages L JOIN official_languages OL ON L.id = OL.language_id JOIN countries C ON OL.country_id = C.id GROUP BY L.name ORDER BY AVG(C.overall_score) DESC
SELECT C.name FROM countries C JOIN (SELECT country_id, COUNT(language_id) AS lang_count FROM official_languages GROUP BY country_id ORDER BY lang_count DESC LIMIT 1) T ON C.id = T.country_id
SELECT c.name FROM countries c JOIN official_languages ol ON c.id = ol.country_id GROUP BY c.id ORDER BY COUNT(ol.language_id) DESC LIMIT 1
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT L.name FROM languages L LEFT JOIN official_languages O ON L.id = O.language_id WHERE O.language_id IS NULL
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
WITH HighScore AS (SELECT language_id FROM official_languages JOIN countries ON country_id = id WHERE overall_score > 95), LowScore AS (SELECT language_id FROM official_languages JOIN countries ON country_id = id WHERE overall_score < 90) SELECT DISTINCT name FROM languages WHERE id IN (SELECT language_id FROM HighScore INTERSECT SELECT language_id FROM LowScore)
SELECT L.name FROM languages L WHERE L.id IN (SELECT O.language_id FROM official_languages O JOIN countries C ON O.country_id = C.id WHERE C.overall_score > 95 INTERSECT SELECT O.language_id FROM official_languages O JOIN countries C ON O.country_id = C.id WHERE C.overall_score < 90)
SELECT DISTINCT country, town_city FROM Addresses
SELECT country, town_city FROM Addresses
SELECT P.property_id, A.county_state_province FROM Properties P JOIN Addresses A ON P.property_address_id = A.address_id
SELECT P.property_id, A.county_state_province FROM Properties P JOIN Addresses A ON P.property_address_id = A.address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT F.feature_name, F.feature_description FROM Features F WHERE F.feature_id = (SELECT PF.feature_id FROM Property_Features PF GROUP BY PF.feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT F.feature_name, F.feature_description FROM Features F JOIN (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1) AS PF ON F.feature_id = PF.feature_id
SELECT MIN(room_count) FROM Rooms GROUP BY property_id
SELECT MIN(room_count) AS LowestRoomCount FROM Properties
SELECT COUNT(property_id) FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y'
SELECT COUNT(property_id) FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y'
SELECT DISTINCT R.age_category_description FROM Users U JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE U.other_user_details LIKE '%Mother%'
SELECT DISTINCT RAC.age_category_description FROM Users U JOIN Ref_Age_Categories RAC ON U.age_category_code = RAC.age_category_code WHERE U.other_user_details LIKE '%Mother%'
SELECT U.first_name FROM Users U JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1) P ON U.user_id = P.owner_user_id
SELECT U.first_name FROM Users U JOIN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1) P ON U.user_id = P.owner_user_id
SELECT AVG(P.room_count) FROM Properties P JOIN Property_Features PF ON P.property_id = PF.property_id JOIN Features F ON PF.feature_id = F.feature_id WHERE F.feature_name = 'garden'
SELECT AVG(room_count) FROM (SELECT Rooms.property_id, COUNT(*) AS room_count FROM Rooms INNER JOIN Property_Features ON Rooms.property_id = Property_Features.property_id INNER JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Features.feature_name = 'garden' GROUP BY Rooms.property_id) AS garden_property_rooms
SELECT DISTINCT a.town_city FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'swimming pool'
SELECT DISTINCT a.town_city FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id JOIN Property_Features pf ON p.property_id = pf.property_id JOIN Features f ON pf.feature_id = f.feature_id WHERE f.feature_name = 'swimming pool'
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT AVG(room_count) FROM (SELECT COUNT(*) AS room_count FROM Rooms GROUP BY property_id) AS room_counts
SELECT AVG(number_of_rooms) FROM (SELECT COUNT(room_number) AS number_of_rooms FROM Rooms GROUP BY property_id) AS room_data
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT COUNT(DISTINCT room_size) AS unique_room_sizes FROM Rooms
SELECT user_id, search_string FROM User_Searches WHERE user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(search_seq) >= 2)
SELECT U.user_id, array_agg(US.search_seq) AS search_sequences FROM Users U JOIN User_Searches US ON U.user_id = US.user_id GROUP BY U.user_id HAVING COUNT(US.search_seq) >= 2
SELECT search_datetime FROM User_Searches ORDER BY search_datetime DESC LIMIT 1
SELECT MAX(search_datetime) FROM User_Searches
SELECT search_datetime AS Time, search_string AS Content FROM User_Searches ORDER BY Content DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT DISTINCT a.zip_postcode FROM Addresses a JOIN Properties p ON p.property_address_id = a.address_id WHERE p.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2)
SELECT DISTINCT A.zip_postcode FROM Addresses A INNER JOIN Properties P ON A.address_id = P.property_address_id WHERE P.owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) <= 2)
SELECT U.user_id, R.user_category_description FROM Users U JOIN Ref_User_Categories R ON U.user_category_code = R.user_category_code WHERE U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) = 1)
SELECT U.user_id, U.user_category_code FROM Users U JOIN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) = 1) AS S ON U.user_id = S.user_id
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = (SELECT age_category_code FROM Users WHERE user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1))
SELECT R.age_category_description FROM Ref_Age_Categories R JOIN Users U ON R.age_category_code = U.age_category_code WHERE U.user_id = (SELECT user_id FROM User_Searches ORDER BY search_datetime LIMIT 1)
SELECT U.login_name FROM Users U JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'senior citizen' ORDER BY U.first_name
SELECT U.login_name FROM Users U JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior Citizens' ORDER BY U.first_name
SELECT COUNT(*) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = 1
SELECT COUNT(*) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = 1
SELECT Users.date_registered FROM Users WHERE Users.login_name = 'ratione'
SELECT Users.date_registered FROM Users WHERE Users.login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Users U JOIN Addresses A ON U.user_address_id = A.address_id WHERE U.age_category_code = 'SC'
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Addresses A JOIN Users U ON A.address_id = U.user_address_id JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior'
SELECT COUNT(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2) AS subquery
SELECT COUNT(*) FROM (SELECT property_id FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2) AS subquery
SELECT property_id, COUNT(photo_seq) AS photo_count FROM Property_Photos GROUP BY property_id
SELECT property_id, COUNT(*) AS total_photos FROM Property_Photos GROUP BY property_id
SELECT U.user_id, COUNT(P.photo_seq) AS num_photos FROM Users U JOIN Properties PR ON U.user_id = PR.owner_user_id JOIN Property_Photos P ON PR.property_id = P.property_id GROUP BY U.user_id
SELECT u.user_id, COUNT(pp.photo_seq) FROM Users u INNER JOIN Properties p ON u.user_id = p.owner_user_id INNER JOIN Property_Photos pp ON p.property_id = pp.property_id GROUP BY u.user_id
SELECT SUM(price_max) FROM Properties p JOIN Users u ON p.owner_user_id = u.user_id WHERE u.user_category_code IN ('single mother', 'student')
SELECT SUM(P.price_max) FROM Properties P JOIN Users U ON P.owner_user_id = U.user_id JOIN Ref_User_Categories R ON U.user_category_code = R.user_category_code WHERE R.user_category_description = 'single mother' OR R.user_category_description = 'student'
SELECT UPH.datestamp, P.property_name FROM User_Property_History UPH JOIN Properties P ON UPH.property_id = P.property_id ORDER BY UPH.datestamp
SELECT UPH.datestamp, P.property_name FROM User_Property_History UPH JOIN Properties P ON UPH.property_id = P.property_id ORDER BY UPH.datestamp
SELECT T1.property_type_description, T1.property_type_code FROM Ref_Property_Types AS T1 WHERE T1.property_type_code = (SELECT property_type_code FROM Properties GROUP BY property_type_code ORDER BY COUNT(*) DESC LIMIT 1)
SELECT R.property_type_description FROM Ref_Property_Types R WHERE R.property_type_code = (SELECT TOP 1 property_type_code FROM Properties GROUP BY property_type_code ORDER BY COUNT(*) DESC)
SELECT Ref_Age_Categories.age_category_description FROM Ref_Age_Categories WHERE Ref_Age_Categories.age_category_code = 'Over 60'
SELECT Ref_Age_Categories.age_category_description FROM Ref_Age_Categories WHERE Ref_Age_Categories.age_category_code = 'Over 60'
SELECT room_size, COUNT(*) AS count FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(*) AS room_count FROM Rooms GROUP BY room_size
SELECT a.country FROM Users u JOIN Addresses a ON u.user_address_id = a.address_id WHERE u.first_name = 'Robbie'
SELECT A.country FROM Users U JOIN Addresses A ON U.user_address_id = A.address_id WHERE U.first_name = 'Robbie'
SELECT U.first_name, U.middle_name, U.last_name FROM Users U INNER JOIN Properties P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id
SELECT U.first_name, U.middle_name, U.last_name FROM Users U JOIN Properties P ON U.user_id = P.owner_user_id WHERE U.user_address_id = P.property_address_id
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT US.search_string FROM User_Searches AS US LEFT JOIN Properties AS P ON US.user_id = P.owner_user_id WHERE P.owner_user_id IS NULL
SELECT U.last_name, U.user_id FROM Users U WHERE U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) >= 2) AND U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) <= 2)
SELECT U.user_id, U.last_name FROM Users U WHERE U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) <= 2) AND U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) >= 2)
SELECT COUNT(id) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price ASC
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight), MIN(weight) FROM bike
SELECT AVG(bike.price) AS AveragePrice FROM bike WHERE bike.material = 'Carbon CC'
SELECT name, result FROM cyclist WHERE nation <> 'Russia'
SELECT DISTINCT bike.id, bike.product_name FROM bike JOIN cyclists_own_bikes ON bike.id = cyclists_own_bikes.bike_id WHERE cyclists_own_bikes.purchase_year > 2015
SELECT b.id, b.product_name FROM bike b INNER JOIN (SELECT bike_id FROM cyclists_own_bikes GROUP BY bike_id HAVING COUNT(cyclist_id) >= 4) cob ON b.id = cob.bike_id
SELECT c.id, c.name FROM cyclist c JOIN cyclists_own_bikes cob ON c.id = cob.cyclist_id GROUP BY c.id, c.name ORDER BY COUNT(cob.bike_id) DESC LIMIT 1
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.nation IN ('Russia', 'Great Britain')
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(*) FROM cyclist c LEFT JOIN cyclists_own_bikes b ON c.id = b.cyclist_id AND b.purchase_year > 2015 WHERE b.cyclist_id IS NULL
SELECT DISTINCT b.product_name FROM bike b JOIN cyclists_own_bikes cob ON b.id = cob.bike_id JOIN cyclist c ON cob.cyclist_id = c.id WHERE c.result < '4:21.558'
SELECT B.product_name, B.price FROM bike B WHERE B.id IN (SELECT COB.bike_id FROM cyclists_own_bikes COB INNER JOIN cyclist C ON COB.cyclist_id = C.id WHERE C.name IN ('Bradley Wiggins', 'Antonio Tauler') GROUP BY COB.bike_id HAVING COUNT(DISTINCT C.name) = 2)
SELECT c.name, c.nation, c.result FROM cyclist c WHERE NOT EXISTS (SELECT 1 FROM cyclists_own_bikes cob JOIN bike b ON cob.bike_id = b.id WHERE cob.cyclist_id = c.id AND b.product_name = 'racing bike')
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT c.id, COUNT(b.bike_id) AS num_bikes FROM cyclist c LEFT JOIN cyclists_own_bikes b ON c.id = b.cyclist_id GROUP BY c.id ORDER BY c.id
SELECT Flavor, Price FROM goods WHERE Food = 'cake' ORDER BY Price DESC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Price = (SELECT MAX(Price) FROM goods WHERE Food = 'cake') AND Food = 'cake'
SELECT Flavor, Price FROM goods WHERE Food = 'cookie' ORDER BY Price ASC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' ORDER BY Price ASC LIMIT 1
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cake' AND g.Flavor = 'lemon'
SELECT DISTINCT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'lemon' AND g.Food = 'cake'
SELECT G.Food, COUNT(DISTINCT R.CustomerId) AS CustomerCount FROM goods G JOIN items I ON G.Id = I.Item JOIN receipts R ON I.Receipt = R.ReceiptNumber GROUP BY G.Food
SELECT goods.Food, COUNT(DISTINCT customers.Id) AS CustomerCount FROM customers JOIN receipts ON customers.Id = receipts.CustomerId JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY goods.Food
SELECT CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Food = 'bakery' GROUP BY r.CustomerId HAVING COUNT(DISTINCT r.ReceiptNumber) >= 15
SELECT c.Id FROM customers c JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id HAVING COUNT(r.ReceiptNumber) >= 15
SELECT c.LastName FROM customers c WHERE c.Id IN (SELECT r.CustomerId FROM receipts r GROUP BY r.CustomerId HAVING COUNT(r.ReceiptNumber) > 10)
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) > 10)
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'Cake'
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'cake'
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Croissant'
SELECT DISTINCT Flavor FROM goods WHERE Food = 'croissant'
SELECT DISTINCT goods.Flavor, goods.Food FROM goods INNER JOIN items ON goods.Id = items.Item INNER JOIN receipts ON items.Receipt = receipts.ReceiptNumber WHERE receipts.CustomerId = 15
SELECT DISTINCT Flavor FROM goods WHERE Id IN (SELECT Item FROM items WHERE Receipt IN (SELECT ReceiptNumber FROM receipts WHERE CustomerId = 15))
SELECT Food, AVG(Price) AS AveragePrice, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food
SELECT Receipt FROM items i INNER JOIN goods g ON i.Item = g.Id WHERE g.Food IN ('Cake', 'Cookie') GROUP BY Receipt HAVING COUNT(DISTINCT g.Food) = 2
SELECT r.ReceiptNumber FROM receipts r WHERE EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cakes' AND i.Receipt = r.ReceiptNumber) AND EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Food = 'cookies' AND i.Receipt = r.ReceiptNumber)
SELECT r.ReceiptNumber FROM receipts r JOIN customers c ON r.CustomerId = c.Id JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE c.LastName = 'LOGAN' AND g.Food = 'Croissant'
SELECT ReceiptNumber FROM receipts WHERE CustomerId IN (SELECT Id FROM customers WHERE LastName = 'Logan') AND ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Flavor = 'croissant'))
SELECT r.ReceiptNumber, r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price = (SELECT MAX(Price) FROM goods)
SELECT R.ReceiptNumber, R.Date FROM receipts R JOIN items I ON R.ReceiptNumber = I.Receipt JOIN goods G ON I.Item = G.Id WHERE G.Price = (SELECT MAX(Price) FROM goods)
SELECT G.Flavor, G.Food FROM goods G JOIN (SELECT Item, COUNT(*) AS cnt FROM items GROUP BY Item ORDER BY cnt ASC LIMIT 1) I ON G.Id = I.Item
SELECT goods.Flavor FROM goods INNER JOIN (SELECT Item, COUNT(*) AS ItemCount FROM items GROUP BY Item) AS ItemCounts ON goods.Id = ItemCounts.Item ORDER BY ItemCounts.ItemCount ASC LIMIT 1
SELECT Food, COUNT(Id) AS TotalGoods FROM goods GROUP BY Food
SELECT Food, COUNT(Id) AS NumberOfGoods FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS AveragePrice FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT DISTINCT Flavor FROM goods WHERE Food = 'cake' AND Price > 10
SELECT DISTINCT Flavor FROM goods WHERE Food = 'cake' AND Price > 10
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT g1.Id FROM goods g1 WHERE g1.Price < ANY (SELECT g2.Price FROM goods g2 WHERE g2.Flavor = 'Tart')
SELECT DISTINCT Id FROM goods WHERE Price < ANY (SELECT Price FROM goods WHERE Flavor = 'Tart')
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 13
SELECT DISTINCT R.ReceiptNumber FROM receipts R JOIN items I ON R.ReceiptNumber = I.Receipt JOIN goods G ON I.Item = G.Id WHERE G.Price > 13
SELECT receipts.Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Price > 15
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Price > 15
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Flavor, Price FROM goods WHERE Id = '70'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT LastName FROM customers ORDER BY LastName ASC
SELECT Id FROM goods ORDER BY Id ASC
SELECT DISTINCT Id FROM goods ORDER BY Id
SELECT DISTINCT receipts.ReceiptNumber FROM receipts INNER JOIN items ON receipts.ReceiptNumber = items.Receipt INNER JOIN goods ON items.Item = goods.Id WHERE (goods.Flavor = 'apple' AND goods.Food = 'pie') OR receipts.CustomerId = 12
SELECT DISTINCT r.ReceiptNumber FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE (g.Flavor = 'apple' AND g.Food = 'pie') OR r.CustomerId = 12
SELECT r.ReceiptNumber, r.Date FROM receipts r WHERE r.Date = (SELECT MAX(Date) FROM receipts)
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT r.ReceiptNumber FROM receipts r WHERE r.Date = (SELECT MIN(Date) FROM receipts) OR EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE g.Price > 10 AND i.Receipt = r.ReceiptNumber)
SELECT r.ReceiptNumber FROM receipts r WHERE EXISTS (SELECT 1 FROM items i JOIN goods g ON i.Item = g.Id WHERE i.Receipt = r.ReceiptNumber AND g.Price > 10) OR r.Date = (SELECT MIN(Date) FROM receipts)
SELECT Id FROM goods WHERE (Food = 'Cookie' OR Food = 'Cake') AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE (Food = 'Cookies' OR Food = 'Cakes') AND Price BETWEEN 3 AND 7
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId WHERE r.Date = (SELECT MIN(Date) FROM receipts)
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId WHERE r.Date = (SELECT MIN(Date) FROM receipts)
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) AS AveragePrice FROM goods WHERE Flavor = 'blackberry' OR Flavor = 'blueberry'
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT * FROM goods WHERE Flavor = 'cheese' ORDER BY Price ASC LIMIT 1
SELECT Flavor, MAX(Price) AS Highest, MIN(Price) AS Lowest, AVG(Price) AS Average FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, MAX(Price) AS MaximumPrice, MIN(Price) AS MinimumPrice, AVG(Price) AS AveragePrice FROM goods GROUP BY Flavor ORDER BY Flavor ASC
SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice FROM goods GROUP BY Food ORDER BY Food
SELECT Food, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food ORDER BY Food
SELECT Date, COUNT(ReceiptNumber) AS TotalReceipts FROM receipts GROUP BY Date ORDER BY TotalReceipts DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT c.FirstName, c.LastName, COUNT(r.ReceiptNumber) AS TimesShopped FROM customers c INNER JOIN receipts r ON c.Id = r.CustomerId GROUP BY c.Id ORDER BY TimesShopped DESC LIMIT 1
SELECT CustomerId, COUNT(*) AS NumberOfPurchases FROM receipts GROUP BY CustomerId ORDER BY NumberOfPurchases DESC LIMIT 1
SELECT receipts.Date, COUNT(DISTINCT receipts.CustomerId) AS distinct_customers FROM receipts GROUP BY receipts.Date
SELECT Date, COUNT(DISTINCT CustomerId) AS customer_count FROM receipts GROUP BY Date
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tart'
SELECT c.FirstName, c.LastName FROM customers c JOIN receipts r ON c.Id = r.CustomerId JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id WHERE g.Flavor = 'apple' AND g.Food = 'Tarts'
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price < (SELECT MIN(price) FROM goods WHERE Food = 'Croissant')
SELECT g.Id FROM goods g WHERE g.Food = 'cookies' AND g.Price < (SELECT MIN(Price) FROM goods WHERE Food = 'croissant')
SELECT g1.Id FROM goods g1 WHERE g1.Food = 'Cake' AND g1.Price >= (SELECT AVG(g2.Price) FROM goods g2 WHERE g2.Food = 'Tart')
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT AVG(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT Id FROM goods WHERE Price > 2 * (SELECT AVG(Price) FROM goods)
SELECT goods.Id, goods.Flavor, goods.Food FROM goods ORDER BY goods.Price ASC
SELECT goods.Id, goods.Flavor, goods.Food FROM goods ORDER BY goods.Price ASC
SELECT g.Id, g.Flavor FROM goods AS g WHERE g.Food = 'Cakes' ORDER BY g.Flavor ASC
SELECT g.Id, g.Flavor FROM goods g WHERE g.Food = 'cake' ORDER BY g.Flavor
SELECT g.Id FROM goods g WHERE g.Flavor = 'chocolate' AND g.Id NOT IN (SELECT i.Item FROM items i GROUP BY i.Item HAVING COUNT(i.Item) > 10)
SELECT Id FROM goods WHERE Flavor = 'chocolate' AND Id IN (SELECT Item FROM items GROUP BY Item HAVING COUNT(*) <= 10)
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT DISTINCT Flavor FROM goods WHERE Food = 'Tart')
SELECT G.Flavor, G.Food, COUNT(*) AS Popularity FROM goods G JOIN items I ON G.Id = I.Item GROUP BY G.Id ORDER BY Popularity DESC LIMIT 3
SELECT G.Food, COUNT(*) AS TotalPurchases FROM goods G JOIN items I ON G.Id = I.Item GROUP BY G.Food ORDER BY TotalPurchases DESC LIMIT 3
SELECT r.CustomerId FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT r.CustomerId FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING SUM(g.Price) > 150
SELECT r.CustomerId FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5
SELECT r.CustomerId FROM receipts r INNER JOIN items i ON r.ReceiptNumber = i.Receipt INNER JOIN goods g ON i.Item = g.Id GROUP BY r.CustomerId HAVING AVG(g.Price) > 5
SELECT R.Date FROM receipts AS R JOIN items AS I ON R.ReceiptNumber = I.Receipt JOIN goods AS G ON I.Item = G.Id GROUP BY R.Date HAVING SUM(G.Price) > 100
SELECT r.Date FROM receipts r JOIN items i ON r.ReceiptNumber = i.Receipt JOIN goods g ON i.Item = g.Id GROUP BY r.Date HAVING SUM(g.Price) > 100
SELECT COUNT(Driver_ID) FROM driver
SELECT COUNT(Driver_ID) FROM driver
SELECT Make, COUNT(Driver_ID) AS NumberOfDrivers FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, COUNT(Driver_ID) AS DriverCount FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) AS Average_Age FROM driver GROUP BY Make
SELECT Make, AVG(Age) AS Average_Age FROM driver GROUP BY Make
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner
SELECT t.Manager, t.Sponsor FROM team AS t ORDER BY t.Car_Owner ASC
SELECT Make FROM team GROUP BY Make HAVING COUNT(Team_ID) > 1
SELECT t.Make FROM team t GROUP BY t.Make HAVING COUNT(t.Team_ID) > 1
SELECT DISTINCT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT MAX(Points) AS MaxPoints, MIN(Points) AS MinPoints FROM driver
SELECT MAX(Points) AS HighestPoints, MIN(Points) AS LowestPoints FROM driver
SELECT COUNT(Driver_ID) FROM driver WHERE Points < 150
SELECT COUNT(Driver_ID) FROM driver WHERE Points < 150
SELECT Driver FROM driver ORDER BY Age ASC
SELECT Driver FROM driver ORDER BY Age ASC
SELECT driver.Driver FROM driver ORDER BY driver.Points DESC
SELECT Driver, Points FROM driver ORDER BY Points DESC
SELECT Driver, Country FROM driver
SELECT Driver, Country FROM driver
SELECT MAX(driver.Points) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT MAX(driver.Points) FROM driver JOIN country ON driver.Country = country.Country_Id WHERE country.Capital = 'Dublin'
SELECT AVG(d.Age) FROM driver d JOIN country c ON d.Country = c.Country_Id WHERE c.Official_native_language = 'English'
SELECT AVG(Age) FROM driver d INNER JOIN country c ON d.Country = c.Country WHERE c.Official_native_language = 'English'
SELECT DISTINCT Country FROM driver WHERE Points > 150
SELECT DISTINCT Country FROM driver WHERE Points > 150
SELECT C.Capital FROM country C JOIN driver D ON C.Country_Id = D.Country WHERE D.Points = (SELECT MAX(Points) FROM driver)
SELECT c.Capital FROM country c JOIN driver d ON c.Country_Id = d.Country WHERE d.Points = (SELECT MAX(Points) FROM driver)
SELECT Make, COUNT(Driver_ID) AS DriverCount FROM driver GROUP BY Make
SELECT Make, COUNT(*) AS DriverCount FROM driver GROUP BY Make
SELECT Make FROM (SELECT Make, COUNT(Driver_ID) AS DriverCount FROM driver GROUP BY Make ORDER BY DriverCount DESC LIMIT 1) AS MostDrivers
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(Driver_ID) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(DISTINCT Driver_ID) >= 3
SELECT D.Make FROM driver D JOIN team_driver TD ON D.Driver_ID = TD.Driver_ID GROUP BY D.Make HAVING COUNT(DISTINCT D.Driver_ID) >= 3
SELECT t.Team FROM team t LEFT JOIN team_driver td ON t.Team_ID = td.Team_ID WHERE td.Team_ID IS NULL
SELECT T.Team FROM team T LEFT JOIN team_driver TD ON T.Team_ID = TD.Team_ID WHERE TD.Team_ID IS NULL
SELECT Country FROM driver WHERE Make IN ('Dodge', 'Chevrolet') GROUP BY Country HAVING COUNT(DISTINCT Make) = 2
SELECT DISTINCT d.Country FROM driver d WHERE d.Make IN ('Dodge', 'Chevrolet') GROUP BY d.Country HAVING COUNT(DISTINCT d.Make) = 2
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT c.Country FROM country c LEFT JOIN driver d ON c.Country = d.Country WHERE d.Country IS NULL
SELECT Country FROM country WHERE NOT EXISTS (SELECT 1 FROM driver WHERE driver.Country = country.Country)
SELECT Manager, Sponsor FROM team WHERE Team_ID = (SELECT Team_ID FROM team_driver GROUP BY Team_ID ORDER BY COUNT(Driver_ID) DESC LIMIT 1)
SELECT t.Manager, t.Sponsor FROM team t JOIN (SELECT Team_ID FROM team_driver GROUP BY Team_ID ORDER BY COUNT(Driver_ID) DESC LIMIT 1) td ON t.Team_ID = td.Team_ID
SELECT Manager, Car_Owner FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(Driver_ID) >= 2)
SELECT Manager, Car_Owner FROM team t JOIN (SELECT Team_ID FROM team_driver GROUP BY Team_ID HAVING COUNT(*) > 1) td ON t.Team_ID = td.Team_ID
SELECT COUNT(Institution_ID) FROM institution
SELECT COUNT(Institution_ID) FROM institution
SELECT Name FROM institution ORDER BY Name ASC
SELECT Name FROM institution ORDER BY Name ASC
SELECT institution.Name FROM institution ORDER BY institution.Founded ASC
SELECT institution.Name FROM institution ORDER BY institution.Founded ASC
SELECT City, Province FROM institution
SELECT City, Province FROM institution
SELECT MAX(Enrollment) AS MaxEnrollment, MIN(Enrollment) AS MinEnrollment FROM institution
SELECT MAX(Enrollment) AS MaximumEnrollment, MIN(Enrollment) AS MinimumEnrollment FROM institution
SELECT DISTINCT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT DISTINCT Affiliation FROM institution WHERE City <> 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT Stadium FROM institution WHERE Enrollment = (SELECT MAX(Enrollment) FROM institution)
SELECT institution.Name, Championship.Nickname FROM institution JOIN Championship ON institution.Institution_ID = Championship.Institution_ID
SELECT i.Name, c.Nickname FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID
SELECT C.Nickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT C.Nickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID WHERE I.Enrollment = (SELECT MIN(Enrollment) FROM institution)
SELECT inst.Name FROM institution inst INNER JOIN Championship champ ON inst.Institution_ID = champ.Institution_ID GROUP BY inst.Name ORDER BY COUNT(champ.Number_of_Championships) DESC
SELECT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID ORDER BY c.Number_of_Championships DESC
SELECT DISTINCT i.Name FROM institution i JOIN Championship c ON i.Institution_ID = c.Institution_ID
SELECT Name FROM institution WHERE Institution_ID IN (SELECT Institution_ID FROM Championship WHERE Number_of_Championships >= 1)
SELECT SUM(c.Number_of_Championships) AS Total_Championships FROM Championship c INNER JOIN institution i ON c.Institution_ID = i.Institution_ID WHERE i.Affiliation = 'public'
SELECT SUM(Number_of_Championships) FROM Championship JOIN institution ON Championship.Institution_ID = institution.Institution_ID WHERE institution.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Institution_ID) AS NumberOfInstitutions FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Affiliation) AS Frequency FROM institution GROUP BY Affiliation ORDER BY Frequency DESC LIMIT 1
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT i.Founded FROM institution i GROUP BY i.Founded HAVING COUNT(i.Institution_ID) > 1
SELECT Founded AS Year, COUNT(Institution_ID) AS Count FROM institution GROUP BY Founded HAVING COUNT(Institution_ID) > 1
SELECT C.Nickname FROM Championship C JOIN institution I ON C.Institution_ID = I.Institution_ID ORDER BY I.Capacity DESC
SELECT c.Nickname FROM Championship c JOIN institution i ON c.Institution_ID = i.Institution_ID ORDER BY i.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT DISTINCT i1.Province FROM institution i1 JOIN institution i2 ON i1.Province = i2.Province WHERE i1.Founded < 1920 AND i2.Founded > 1950
SELECT DISTINCT i1.Province FROM institution i1 JOIN institution i2 ON i1.Province = i2.Province WHERE i1.Founded < 1920 AND i2.Founded > 1950
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT B.Contents FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'New York'
SELECT DISTINCT B.Contents FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Warehouses.Code, AVG(Boxes.Value) AS AvgValue FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code, AVG(Boxes.Value) AS AverageValue FROM Boxes INNER JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Warehouses.Code
SELECT AVG(Value) AS AverageValue, SUM(Value) AS TotalValue FROM Boxes
SELECT AVG(Value) AS AverageValue, SUM(Value) AS TotalValue FROM Boxes
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT AVG(Capacity) AS AverageCapacity, SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT Contents, AVG(Value) AS AverageValue, MAX(Value) AS MaxValue FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Maximum_Value FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1
SELECT Contents FROM Boxes WHERE Value = (SELECT MAX(Value) FROM Boxes)
SELECT AVG(Value) AS AverageValue FROM Boxes
SELECT AVG(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location IN ('Chicago', 'New York')
SELECT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location IN ('Chicago', 'New York')
SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago') INTERSECT SELECT Contents FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Location = 'New York')
SELECT DISTINCT B.Contents FROM Boxes B WHERE B.Contents NOT IN (SELECT DISTINCT B2.Contents FROM Boxes B2 INNER JOIN Warehouses W ON B2.Warehouse = W.Code WHERE W.Location = 'New York')
SELECT DISTINCT Contents FROM Boxes B WHERE NOT EXISTS (SELECT 1 FROM Boxes B2 JOIN Warehouses W ON B2.Warehouse = W.Code WHERE W.Location = 'New York' AND B2.Contents = B.Contents)
SELECT W.Location FROM Warehouses W WHERE EXISTS (SELECT 1 FROM Boxes B WHERE B.Contents = 'Rocks' AND B.Warehouse = W.Code) AND NOT EXISTS (SELECT 1 FROM Boxes B WHERE B.Contents = 'Scissors' AND B.Warehouse = W.Code)
SELECT W.Location FROM Warehouses W WHERE EXISTS (SELECT 1 FROM Boxes B WHERE B.Contents = 'Rocks' AND B.Warehouse = W.Code) AND NOT EXISTS (SELECT 1 FROM Boxes B WHERE B.Contents = 'Scissors' AND B.Warehouse = W.Code)
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT DISTINCT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents IN ('Rocks', 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents IN ('Rocks', 'Scissors') GROUP BY Warehouse HAVING COUNT(DISTINCT Contents) = 2)
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks' INTERSECT SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Code, Contents FROM Boxes ORDER BY Value ASC
SELECT Code, Contents FROM Boxes ORDER BY Value ASC
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT MIN(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents ASC
SELECT Code FROM Boxes WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Rocks')
SELECT Code FROM Boxes WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Rocks')
SELECT B.Code, B.Contents FROM Boxes B WHERE B.Value > ALL (SELECT B2.Value FROM Boxes B2 WHERE B2.Contents = 'Scissors')
SELECT Code, Contents FROM Boxes WHERE Value > ALL (SELECT Value FROM Boxes WHERE Contents = 'Scissors')
SELECT SUM(Value) FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Capacity = (SELECT MAX(Capacity) FROM Warehouses))
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Capacity = (SELECT MAX(Capacity) FROM Warehouses)
SELECT W.Code, AVG(B.Value) FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code HAVING AVG(B.Value) > 150
SELECT B.Warehouse, AVG(B.Value) AS AverageValue FROM Boxes B GROUP BY B.Warehouse HAVING AVG(B.Value) > 150
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) AS TotalValue, COUNT(Code) AS NumberOfBoxes FROM Boxes GROUP BY Contents
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS TotalCapacity, AVG(Capacity) AS AverageCapacity, MAX(Capacity) AS MaxCapacity FROM Warehouses GROUP BY Location
SELECT SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT SUM(Capacity) AS TotalCapacity FROM Warehouses
SELECT W.Location, MAX(B.Value) AS MaxValue FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code GROUP BY W.Location
SELECT W.Location, MAX(B.Value) AS MaxValue FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Location
SELECT W.Code, COUNT(B.Code) AS NumberOfBoxes FROM Warehouses W LEFT JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code
SELECT W.Code, COUNT(B.Code) AS BoxCount FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code
SELECT COUNT(DISTINCT W.Location) FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse WHERE B.Contents = 'Rocks'
SELECT COUNT(DISTINCT Warehouse) FROM Boxes WHERE Contents = 'Rocks'
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT B.Code, W.Location FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'
SELECT B.Code FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location = 'Chicago'
SELECT Warehouses.Code, COUNT(Boxes.Code) AS NumberOfBoxes FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT w.Code AS WarehouseCode, COUNT(b.Code) AS TotalBoxes FROM Warehouses w LEFT JOIN Boxes b ON w.Code = b.Warehouse GROUP BY w.Code
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) AS DistinctContents FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) AS TypesOfContents FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT W.Code FROM Warehouses W JOIN (SELECT Warehouse, SUM(Value) AS TotalValue FROM Boxes GROUP BY Warehouse) AS B ON W.Code = B.Warehouse WHERE B.TotalValue > W.Capacity
SELECT W.Code FROM Warehouses W WHERE (SELECT COUNT(*) FROM Boxes B WHERE B.Warehouse = W.Code) > W.Capacity
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT SUM(B.Value) FROM Boxes B JOIN Warehouses W ON B.Warehouse = W.Code WHERE W.Location <> 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT University_Name, City, State FROM university ORDER BY University_Name ASC
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT COUNT(*) AS NumberOfUniversities FROM university WHERE State = 'Illinois' OR State = 'Ohio'
SELECT MAX(Enrollment) AS Maximum, AVG(Enrollment) AS Average, MIN(Enrollment) AS Minimum FROM university
SELECT MAX(Enrollment) AS Maximum, AVG(Enrollment) AS Average, MIN(Enrollment) AS Minimum FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT Team_Name FROM university WHERE Enrollment > (SELECT AVG(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(University_ID) AS Num_Universities FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(University_ID) AS University_Count FROM university GROUP BY Home_Conference
SELECT State, COUNT(*) AS UniversityCount FROM university GROUP BY State ORDER BY UniversityCount DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING AVG(Enrollment) > 2000
SELECT u.Home_Conference FROM university u GROUP BY u.Home_Conference HAVING AVG(u.Enrollment) > 2000
SELECT Home_Conference FROM (SELECT Home_Conference, SUM(Enrollment) AS TotalEnrollment FROM university GROUP BY Home_Conference) AS ConferenceEnrollment ORDER BY TotalEnrollment ASC LIMIT 1
SELECT u.Home_Conference FROM university u GROUP BY u.Home_Conference HAVING SUM(u.Enrollment) = (SELECT MIN(total_enrollment) FROM (SELECT SUM(Enrollment) AS total_enrollment FROM university GROUP BY Home_Conference) AS temp)
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT m.Major_Name, mr.Rank FROM major m JOIN major_ranking mr ON m.Major_ID = mr.Major_ID JOIN university u ON mr.University_ID = u.University_ID WHERE u.University_Name = 'Augustana College'
SELECT major.Major_Name, major_ranking.Rank FROM major JOIN major_ranking ON major.Major_ID = major_ranking.Major_ID JOIN university ON major_ranking.University_ID = university.University_ID WHERE university.University_Name = 'Augustana College'
SELECT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT U.University_Name, U.City, U.State FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE MR.Rank = 1 AND M.Major_Name = 'Accounting'
SELECT U.University_Name FROM university U INNER JOIN (SELECT University_ID, COUNT(*) AS Rank1Count FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) MR ON U.University_ID = MR.University_ID ORDER BY MR.Rank1Count DESC LIMIT 1
SELECT U.University_Name FROM university U INNER JOIN (SELECT University_ID, COUNT(*) AS CountRank FROM major_ranking WHERE Rank = 1 GROUP BY University_ID) MR ON U.University_ID = MR.University_ID ORDER BY MR.CountRank DESC LIMIT 1
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT U.University_Name FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name IN ('Accounting', 'Urban Education') GROUP BY U.University_Name HAVING COUNT(DISTINCT M.Major_Name) = 2
SELECT u.University_Name FROM university u JOIN major_ranking mr ON u.University_ID = mr.University_ID JOIN major m ON mr.Major_ID = m.Major_ID WHERE m.Major_Name IN ('Accounting', 'Urban Education') GROUP BY u.University_ID HAVING COUNT(DISTINCT m.Major_Name) = 2
SELECT U.University_Name, O.Rank FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE U.State = 'Wisconsin'
SELECT U.University_Name, O.Rank FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE U.State = 'Wisconsin'
SELECT U.University_Name FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Research_point DESC LIMIT 1
SELECT U.University_Name FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Research_point DESC LIMIT 1
SELECT U.University_Name FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Reputation_point ASC
SELECT U.University_Name FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Reputation_point ASC
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting') AND Rank >= 3)
SELECT DISTINCT U.University_Name FROM university U, major_ranking MR, major M WHERE U.University_ID = MR.University_ID AND MR.Major_ID = M.Major_ID AND M.Major_Name = 'Accounting' AND MR.Rank >= 3
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking o ON u.University_ID = o.University_ID WHERE o.Rank <= 5
SELECT SUM(u.Enrollment) FROM university u JOIN overall_ranking r ON u.University_ID = r.University_ID WHERE r.Rank <= 5
SELECT U.University_Name, O.Citation_point FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID WHERE O.Reputation_point >= (SELECT min(Reputation_point) FROM (SELECT Reputation_point FROM overall_ranking ORDER BY Reputation_point DESC LIMIT 3) AS Sub)
SELECT U.University_Name, O.Citation_point FROM university U JOIN overall_ranking O ON U.University_ID = O.University_ID ORDER BY O.Reputation_point DESC LIMIT 3
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
SELECT COUNT(Code) FROM Movies WHERE Rating = 'G'
SELECT COUNT(Code) FROM Movies WHERE Rating = 'G'
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Title) FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters)
SELECT COUNT(*) FROM (SELECT DISTINCT Title FROM Movies INNER JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie) AS UniqueMovies
SELECT COUNT(DISTINCT Code) FROM MovieTheaters
SELECT COUNT(DISTINCT Code) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating IN ('G', 'PG')
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating IN ('G', 'PG')
SELECT DISTINCT Title FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie WHERE MovieTheaters.Name IN ('Odeon', 'Imperial')
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial')
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial') GROUP BY M.Title HAVING COUNT(DISTINCT MT.Name) = 2
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Name IN ('Odeon', 'Imperial') GROUP BY M.Title HAVING COUNT(DISTINCT MT.Name) = 2
SELECT M.Title FROM Movies M WHERE M.Code NOT IN (SELECT MT.Movie FROM MovieTheaters MT WHERE MT.Name = 'Odeon')
SELECT M.Title FROM Movies M WHERE M.Code NOT IN (SELECT MT.Movie FROM MovieTheaters MT WHERE MT.Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Title FROM Movies ORDER BY Title ASC
SELECT Movies.Title FROM Movies ORDER BY Movies.Rating DESC
SELECT Title FROM Movies ORDER BY Rating
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(DISTINCT Movie) DESC LIMIT 1
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(Movie) DESC LIMIT 1
SELECT M.Title FROM Movies M JOIN (SELECT Movie, COUNT(*) AS cnt FROM MovieTheaters GROUP BY Movie ORDER BY cnt DESC LIMIT 1) T ON M.Code = T.Movie
SELECT M.Title FROM Movies M JOIN MovieTheaters MT ON M.Code = MT.Movie GROUP BY M.Title ORDER BY COUNT(*) DESC LIMIT 1
SELECT Rating, COUNT(Code) AS NumberOfMovies FROM Movies GROUP BY Rating
SELECT Rating, COUNT(Code) AS MovieCount FROM Movies GROUP BY Rating
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT DISTINCT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code
SELECT DISTINCT MT.Name FROM MovieTheaters MT INNER JOIN Movies M ON MT.Movie = M.Code
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters JOIN Movies ON MovieTheaters.Movie = Movies.Code WHERE Movies.Rating = 'G'
SELECT MT.Name FROM MovieTheaters MT JOIN Movies M ON MT.Movie = M.Code WHERE M.Rating = 'G'
SELECT Title FROM Movies
SELECT Title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating = 'unrated'
SELECT * FROM Movies WHERE Rating = 'unrated'
SELECT M.Title FROM Movies M LEFT JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Movie IS NULL
SELECT M.Title FROM Movies M LEFT JOIN MovieTheaters MT ON M.Code = MT.Movie WHERE MT.Movie IS NULL
SELECT C.Name FROM Client C JOIN Package P ON C.AccountNumber = P.Recipient WHERE P.Weight = (SELECT MAX(Weight) FROM Package)
SELECT Client.Name FROM Client, Package WHERE Client.AccountNumber = Package.Recipient AND Package.Weight = (SELECT MAX(Weight) FROM Package)
SELECT SUM(P.Weight) FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT SUM(P.Weight) FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT AVG(Salary) FROM Employee WHERE Position = 'intern'
SELECT AVG(Salary) AS AverageSalary FROM Employee WHERE Position = 'intern'
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'Physician'
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'physician'
SELECT PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT P.PackageNumber FROM Package P JOIN Client C ON P.Recipient = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT P.PackageNumber FROM Package P JOIN Client C ON P.Recipient = C.AccountNumber WHERE C.Name = 'Leo Wong'
SELECT * FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT DISTINCT PackageNumber FROM Package WHERE Sender IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong') OR Recipient IN (SELECT AccountNumber FROM Client WHERE Name = 'Leo Wong')
SELECT COUNT(*) FROM Package JOIN Client AS C1 ON Package.Sender = C1.AccountNumber JOIN Client AS C2 ON Package.Recipient = C2.AccountNumber WHERE C1.Name = 'Ogden Wernstrom' AND C2.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client AS C1 ON Package.Sender = C1.AccountNumber JOIN Client AS C2 ON Package.Recipient = C2.AccountNumber WHERE C1.Name = 'Ogden Wernstrom' AND C2.Name = 'Leo Wong'
SELECT P.Contents FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'John Zoidfarb'
SELECT P.Contents FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name = 'John Zoidfarb'
SELECT P.PackageNumber, P.Weight FROM Package P INNER JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name LIKE '%John%' ORDER BY P.Weight DESC LIMIT 1
SELECT P.PackageNumber, P.Weight FROM Package P JOIN Client C ON P.Sender = C.AccountNumber WHERE C.Name LIKE '%John%' ORDER BY P.Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT P.PackageNumber, P.Weight FROM Package P ORDER BY P.Weight ASC LIMIT 3
SELECT C.Name, COUNT(P.PackageNumber) AS NumberOfPackages FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.Name ORDER BY NumberOfPackages DESC LIMIT 1
SELECT C.Name, COUNT(P.PackageNumber) AS TotalPackages FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.Name ORDER BY TotalPackages DESC LIMIT 1
SELECT C.Name, COUNT(P.Recipient) AS NumPackages FROM Client C JOIN Package P ON C.AccountNumber = P.Recipient GROUP BY C.Name ORDER BY NumPackages ASC LIMIT 1
SELECT Client.Name, COUNT(Package.Recipient) AS NumPackages FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber GROUP BY Package.Recipient ORDER BY NumPackages ASC LIMIT 1
SELECT C.Name FROM Client C JOIN Package P ON C.AccountNumber = P.Sender GROUP BY C.AccountNumber HAVING COUNT(P.PackageNumber) > 1
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Sender FROM Package GROUP BY Sender HAVING COUNT(*) > 1)
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT Name, Coordinates FROM Planet ORDER BY Name ASC
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry'
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J Fry'
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT s.ShipmentID FROM Shipment s INNER JOIN Planet p ON s.Planet = p.PlanetID INNER JOIN Employee e ON s.Manager = e.EmployeeID WHERE p.Name = 'Mars' AND e.Name = 'Turanga Leela'
SELECT Shipment.ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name = 'Mars' AND Employee.Name = 'Turanga Leela'
SELECT s.ShipmentID FROM Shipment s INNER JOIN Planet p ON s.Planet = p.PlanetID INNER JOIN Employee e ON s.Manager = e.EmployeeID WHERE p.Name = 'Mars' OR e.Name = 'Turanga Leela'
SELECT s.ShipmentID FROM Shipment s INNER JOIN Planet p ON s.Planet = p.PlanetID INNER JOIN Employee e ON s.Manager = e.EmployeeID WHERE p.Name = 'Mars' AND e.Name = 'Turanga Leela'
SELECT P.Name, COUNT(S.ShipmentID) AS TotalShipments FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.Name
SELECT P.Name, COUNT(S.ShipmentID) AS NumberOfShipments FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.Name
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT P.Name FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT E.Name, COUNT(S.ShipmentID) AS NumberOfShipments FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.Name
SELECT E.Name, COUNT(S.ShipmentID) AS NumberOfShipments FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.Name
SELECT SUM(P.Weight) FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT SUM(P.Weight) AS TotalWeight FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID WHERE Pl.Name = 'Mars'
SELECT P.Name, SUM(PK.Weight) AS TotalWeight FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package PK ON S.ShipmentID = PK.Shipment GROUP BY P.Name
SELECT P.Name, SUM(Pa.Weight) AS TotalWeight FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package Pa ON S.ShipmentID = Pa.Shipment GROUP BY P.Name
SELECT P.Name FROM Planet P WHERE P.PlanetID IN (SELECT S.Planet FROM Shipment S INNER JOIN Package K ON S.ShipmentID = K.Shipment GROUP BY S.Planet HAVING SUM(K.Weight) > 30)
SELECT P.Name FROM Planet P WHERE P.PlanetID IN (SELECT S.Planet FROM Shipment S INNER JOIN Package Pa ON S.ShipmentID = Pa.Shipment GROUP BY S.Planet HAVING SUM(Pa.Weight) > 30)
SELECT P.PackageNumber FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID JOIN Client C ON P.Sender = C.AccountNumber WHERE Pl.Name = 'Omicron Persei 8' AND C.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Client ON Package.Sender = Client.AccountNumber JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT P.PackageNumber FROM Package P JOIN Shipment S ON P.Shipment = S.ShipmentID JOIN Planet Pl ON S.Planet = Pl.PlanetID JOIN Client C ON P.Sender = C.AccountNumber WHERE Pl.Name = 'Omicron Persei 8' OR C.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Client ON Package.Sender = Client.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' OR Client.Name = 'Zapp Brannigan'
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT E.Name FROM Employee E WHERE NOT EXISTS (SELECT 1 FROM Has_Clearance H JOIN Planet P ON H.Planet = P.PlanetID WHERE P.Name = 'Mars' AND H.Employee = E.EmployeeID)
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT E.Name FROM Employee E JOIN Has_Clearance HC ON E.EmployeeID = HC.Employee JOIN Planet P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III'
SELECT E.Name FROM Employee E JOIN Has_Clearance HC ON E.EmployeeID = HC.Employee JOIN Planet P ON HC.Planet = P.PlanetID WHERE P.Name = 'Omega III'
SELECT P.Name FROM Planet P WHERE P.PlanetID IN (SELECT Planet FROM Has_Clearance GROUP BY Planet HAVING COUNT(Employee) = 1)
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Planet FROM Has_Clearance GROUP BY Planet HAVING COUNT(DISTINCT Employee) = 1)
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT E.Name FROM Employee E WHERE E.Salary > 5000 OR E.Salary > (SELECT AVG(Salary) FROM Employee)
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee) OR Salary > 5000
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT COUNT(Game_ID) FROM game
SELECT COUNT(*) FROM game
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers <> 'Nintendo'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers <> 'Nintendo'
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform
SELECT platform.Platform_ID, platform.Platform_name FROM platform WHERE platform.Download_rank = 1
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year) AS MaxRank, MIN(Rank_of_the_year) AS MinRank FROM player
SELECT MAX(player.Rank_of_the_year) AS MaxRank, MIN(player.Rank_of_the_year) AS MinRank FROM player
SELECT COUNT(Player_ID) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(Player_ID) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name ASC
SELECT Player_name FROM player ORDER BY Player_name ASC
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
SELECT Franchise, COUNT(Game_ID) AS GameCount FROM game GROUP BY Franchise
SELECT Franchise, COUNT(Game_ID) AS GameCount FROM game GROUP BY Franchise
SELECT Franchise FROM (SELECT Franchise, COUNT(*) AS TotalGames FROM game GROUP BY Franchise) AS FranchiseCounts ORDER BY TotalGames DESC LIMIT 1
SELECT Franchise, COUNT(Game_ID) AS NumberOfGames FROM game GROUP BY Franchise ORDER BY NumberOfGames DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) > 1
SELECT p.Player_name FROM player p LEFT JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Player_ID IS NULL
SELECT p.Player_name FROM player p LEFT JOIN game_player gp ON p.Player_ID = gp.Player_ID WHERE gp.Player_ID IS NULL
SELECT G.Title FROM game G WHERE EXISTS (SELECT 1 FROM game_player GP JOIN player P ON GP.Player_ID = P.Player_ID WHERE P.College = 'Oklahoma' AND GP.Game_ID = G.Game_ID) AND EXISTS (SELECT 1 FROM game_player GP JOIN player P ON GP.Player_ID = P.Player_ID WHERE P.College = 'Auburn' AND GP.Game_ID = G.Game_ID)
SELECT DISTINCT g.Title FROM game g JOIN game_player gp ON g.Game_ID = gp.Game_ID JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.College IN ('Oklahoma', 'Auburn')
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT g.Title FROM game g WHERE NOT EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE p.Position = 'Guard' AND gp.Game_ID = g.Game_ID)
SELECT g.Title FROM game g WHERE NOT EXISTS (SELECT 1 FROM game_player gp JOIN player p ON gp.Player_ID = p.Player_ID WHERE gp.Game_ID = g.Game_ID AND p.Position = 'Guard')
SELECT p.Name FROM press p ORDER BY p.Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT AVG(Year_Profits_billion) AS Average_Profit, MAX(Year_Profits_billion) AS Maximum_Profit FROM press
SELECT p.Press_ID, p.Name, AVG(p.Year_Profits_billion) AS Average_Profit, MAX(p.Year_Profits_billion) AS Maximum_Profit FROM press p GROUP BY p.Press_ID, p.Name
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT MAX(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT MIN(Month_Profits_billion) FROM press)
SELECT COUNT(Author_ID) FROM author WHERE Age < 30
SELECT COUNT(Author_ID) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender
SELECT Gender, AVG(Age) AS Average_Age FROM author GROUP BY Gender
SELECT Gender, COUNT(Author_ID) AS Num_Authors FROM author WHERE Age > 30 GROUP BY Gender
SELECT Gender, COUNT(Author_ID) AS AuthorsCount FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(Book_ID) AS NumberOfBooks FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(Book_ID) AS NumberOfBooks FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT b.Book_Series FROM book b GROUP BY b.Book_Series HAVING MAX(b.Sale_Amount) > 1000 AND MIN(b.Sale_Amount) < 500
SELECT Book_Series FROM (SELECT Book_Series, MAX(Sale_Amount) AS MaxSale, MIN(Sale_Amount) AS MinSale FROM book GROUP BY Book_Series) AS Stats WHERE MaxSale > 1000 AND MinSale < 500
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'MM') AND EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'LT')
SELECT a.Name FROM author a WHERE EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'MM') AND EXISTS (SELECT 1 FROM book b WHERE b.Author_ID = a.Author_ID AND b.Book_Series = 'LT')
SELECT a.Name, a.Age FROM author a WHERE a.Author_ID NOT IN (SELECT b.Author_ID FROM book b)
SELECT a.Name FROM author a LEFT JOIN book b ON a.Author_ID = b.Author_ID WHERE b.Author_ID IS NULL
SELECT A.Name FROM author A JOIN book B ON A.Author_ID = B.Author_ID GROUP BY A.Author_ID HAVING COUNT(B.Book_ID) > 1
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID HAVING COUNT(b.Book_ID) > 1
SELECT B.Title, A.Name AS Author_Name, P.Name AS Publisher_Name FROM book B JOIN author A ON B.Author_ID = A.Author_ID JOIN press P ON B.Press_ID = P.Press_ID ORDER BY B.Sale_Amount DESC LIMIT 3
SELECT B.Title, A.Name, P.Name FROM book B JOIN author A ON B.Author_ID = A.Author_ID JOIN press P ON B.Press_ID = P.Press_ID ORDER BY B.Sale_Amount DESC LIMIT 3
SELECT P.Name, SUM(B.Sale_Amount) AS Total_Sales FROM press P JOIN book B ON P.Press_ID = B.Press_ID GROUP BY P.Name
SELECT P.Name, SUM(B.Sale_Amount) AS Total_Sales FROM press P JOIN book B ON P.Press_ID = B.Press_ID GROUP BY P.Name
SELECT P.Name, COUNT(B.Book_ID) AS NumberOfBooks FROM press P JOIN book B ON P.Press_ID = B.Press_ID WHERE B.Sale_Amount > 1000 GROUP BY P.Name
SELECT p.Name, COUNT(b.Book_ID) AS NumberOfBooks FROM press p JOIN book b ON p.Press_ID = b.Press_ID WHERE b.Sale_Amount > 1000 GROUP BY p.Name
SELECT Name FROM author WHERE Author_ID = (SELECT Author_ID FROM book WHERE Sale_Amount = (SELECT MAX(Sale_Amount) FROM book))
SELECT a.Name FROM author a JOIN book b ON a.Author_ID = b.Author_ID ORDER BY b.Sale_Amount DESC LIMIT 1
SELECT author.Name, author.Gender FROM author INNER JOIN (SELECT Author_ID FROM book GROUP BY Author_ID ORDER BY COUNT(Book_ID) DESC LIMIT 1) AS MostBooks ON author.Author_ID = MostBooks.Author_ID
SELECT a.Name, a.Gender FROM author a JOIN book b ON a.Author_ID = b.Author_ID GROUP BY a.Author_ID, a.Name, a.Gender ORDER BY COUNT(b.Book_ID) DESC LIMIT 1
SELECT a.Name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor' AND b.Author_ID = a.Author_ID)
SELECT a.Name FROM author a WHERE NOT EXISTS (SELECT 1 FROM book b JOIN press p ON b.Press_ID = p.Press_ID WHERE p.Name = 'Accor' AND b.Author_ID = a.Author_ID)
SELECT p.Name, p.Year_Profits_billion FROM press p JOIN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(*) > 2) b ON p.Press_ID = b.Press_ID
SELECT p.Name, p.Year_Profits_billion FROM press p JOIN (SELECT Press_ID FROM book GROUP BY Press_ID HAVING COUNT(*) > 2) b ON p.Press_ID = b.Press_ID
SELECT COUNT(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(document_id) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil'
SELECT COUNT(document_id) AS NumberOfDocuments FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings'
SELECT a.author_name, a.other_details FROM Authors a JOIN Documents d ON a.author_name = d.author_name WHERE d.document_name = 'Travel to China'
SELECT a.author_name, COUNT(d.document_id) FROM Authors a LEFT JOIN Documents d ON a.author_name = d.author_name GROUP BY a.author_name
SELECT A.author_name FROM Authors A JOIN Documents D ON A.author_name = D.author_name GROUP BY A.author_name ORDER BY COUNT(D.document_id) DESC LIMIT 1
SELECT A.author_name FROM Authors A JOIN Documents D ON A.author_name = D.author_name GROUP BY A.author_name HAVING COUNT(D.document_id) >= 2
SELECT COUNT(process_id) FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9)
SELECT COUNT(*) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working'
SELECT COUNT(DISTINCT process_status_code) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(staff_id) FROM Staff
SELECT staff_id, staff_details FROM Staff
SELECT * FROM Staff WHERE staff_id = 100
SELECT COUNT(DISTINCT staff_role_code) FROM Ref_Staff_Roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT COUNT(DISTINCT document_id) FROM Documents_Processes
SELECT DISTINCT dp.process_id FROM Documents_Processes dp JOIN Documents d ON dp.document_id = d.document_id
SELECT D.document_id FROM Documents D LEFT JOIN Documents_Processes DP ON D.document_id = DP.document_id WHERE DP.document_id IS NULL
SELECT BP.process_id FROM Business_Processes BP LEFT JOIN Documents_Processes DP ON BP.process_id = DP.process_id WHERE DP.document_id IS NULL
SELECT po.process_outcome_description, ps.process_status_description FROM Documents_Processes dp JOIN Process_Outcomes po ON dp.process_outcome_code = po.process_outcome_code JOIN Process_Status ps ON dp.process_status_code = ps.process_status_code WHERE dp.document_id = 0
SELECT bp.process_name FROM Business_Processes bp JOIN Documents_Processes dp ON bp.process_id = dp.process_id JOIN Documents d ON dp.document_id = d.document_id WHERE d.document_name = 'Travel to Brazil'
SELECT bp.process_id, COUNT(dp.document_id) AS document_count FROM Business_Processes bp JOIN Documents_Processes dp ON bp.process_id = dp.process_id GROUP BY bp.process_id
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Processes WHERE document_id = 0 AND process_id = 9
SELECT s.staff_id, COUNT(DISTINCT sp.document_id) AS process_count FROM Staff s LEFT JOIN Staff_in_Processes sp ON s.staff_id = sp.staff_id GROUP BY s.staff_id
SELECT R.staff_role_code, COUNT(P.document_id) AS num_processes FROM Ref_Staff_Roles R LEFT JOIN Staff_in_Processes P ON R.staff_role_code = P.staff_role_code GROUP BY R.staff_role_code
SELECT COUNT(DISTINCT T2.staff_role_description) FROM Staff_in_Processes AS T1 JOIN Ref_Staff_Roles AS T2 ON T1.staff_role_code = T2.staff_role_code WHERE T1.staff_id = 3
SELECT COUNT(*) FROM Agencies
SELECT COUNT(*) FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT COUNT(client_id) AS NumberOfClients FROM Clients
SELECT COUNT(*) FROM Clients
SELECT client_id, client_details FROM Clients
SELECT client_id, client_details FROM Clients
SELECT A.agency_id, COUNT(C.client_id) AS num_clients FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id
SELECT A.agency_id, COUNT(C.client_id) AS num_clients FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id, A.agency_details ORDER BY COUNT(C.client_id) DESC LIMIT 1
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN (SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1) B ON A.agency_id = B.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id, A.agency_details HAVING COUNT(DISTINCT C.client_id) >= 2
SELECT agency_id, agency_details FROM Agencies WHERE agency_id IN (SELECT agency_id FROM Clients GROUP BY agency_id HAVING COUNT(*) >= 2)
SELECT A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details = 'Mac'
SELECT A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id WHERE C.client_details LIKE '%Mac%'
SELECT Clients.*, Agencies.* FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT c.client_details, a.agency_details FROM Clients c JOIN Agencies a ON c.agency_id = a.agency_id
SELECT sic_code, COUNT(client_id) AS num_clients FROM Clients GROUP BY sic_code
SELECT sic_code, COUNT(client_id) AS client_count FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT DISTINCT A.agency_id, A.agency_details FROM Agencies A, Clients C WHERE A.agency_id = C.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A WHERE EXISTS (SELECT 1 FROM Clients C WHERE C.agency_id = A.agency_id)
SELECT A.agency_id FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id WHERE C.agency_id IS NULL
SELECT A.agency_id FROM Agencies A LEFT JOIN Clients C ON A.agency_id = C.agency_id WHERE C.agency_id IS NULL
SELECT COUNT(*) FROM Invoices
SELECT COUNT(*) FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT c.client_id, COUNT(i.invoice_id) AS num_invoices FROM Clients c LEFT JOIN Invoices i ON c.client_id = i.client_id GROUP BY c.client_id
SELECT client_id, COUNT(invoice_id) AS invoice_count FROM Invoices GROUP BY client_id
SELECT T1.client_id, T1.client_details FROM Clients AS T1 JOIN (SELECT client_id, COUNT(*) AS num_invoices FROM Invoices GROUP BY client_id ORDER BY num_invoices DESC LIMIT 1) AS T2 ON T1.client_id = T2.client_id
SELECT C.client_id, C.client_details FROM Clients C JOIN (SELECT client_id FROM Invoices GROUP BY client_id ORDER BY COUNT(*) DESC LIMIT 1) AS I ON C.client_id = I.client_id
SELECT I.client_id FROM Invoices I GROUP BY I.client_id HAVING COUNT(I.invoice_id) >= 2
SELECT client_id FROM Invoices GROUP BY client_id HAVING COUNT(invoice_id) >= 2
SELECT invoice_status, COUNT(invoice_id) AS num_invoices FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(invoice_id) AS total_invoices FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT I.invoice_status, I.invoice_details, C.client_id, C.client_details, A.agency_id, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
SELECT I.invoice_status, I.invoice_details, C.client_id, C.client_details, A.agency_id, A.agency_details FROM Invoices I JOIN Clients C ON I.client_id = C.client_id JOIN Agencies A ON C.agency_id = A.agency_id
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_type, other_details FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT DISTINCT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT Payments.payment_id, Payments.payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working'
SELECT Payments.payment_id, Payments.payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working'
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT COUNT(*) FROM Payments
SELECT COUNT(*) FROM Payments
SELECT Payments.payment_id, Payments.invoice_id, Invoices.invoice_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT DISTINCT invoice_id, invoice_status FROM Invoices
SELECT DISTINCT Invoices.invoice_id, Invoices.invoice_status FROM Invoices JOIN Payments ON Invoices.invoice_id = Payments.invoice_id
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS payment_count FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
SELECT invoice_id, COUNT(payment_id) AS payment_count FROM Payments GROUP BY invoice_id
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 WHERE T1.invoice_id = (SELECT T2.invoice_id FROM Payments AS T2 GROUP BY T2.invoice_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT I.invoice_id, I.invoice_status, I.invoice_details FROM Invoices I JOIN (SELECT invoice_id FROM Payments GROUP BY invoice_id HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) AS cnt FROM Payments GROUP BY invoice_id) AS sub)) AS P ON I.invoice_id = P.invoice_id
SELECT COUNT(staff_id) FROM Staff
SELECT COUNT(*) FROM Staff
SELECT a.agency_id, COUNT(s.staff_id) AS num_staff FROM Agencies a LEFT JOIN Staff s ON a.agency_id = s.agency_id GROUP BY a.agency_id
SELECT A.agency_id, COUNT(S.staff_id) AS num_staff FROM Agencies A LEFT JOIN Staff S ON A.agency_id = S.agency_id GROUP BY A.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1) AS MaxStaff ON A.agency_id = MaxStaff.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1) S ON A.agency_id = S.agency_id
SELECT meeting_outcome, COUNT(meeting_id) AS num_meetings FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(meeting_id) AS total_meetings FROM Meetings GROUP BY meeting_outcome
SELECT Clients.client_id, COUNT(Meetings.meeting_id) AS num_meetings FROM Clients JOIN Meetings ON Clients.client_id = Meetings.client_id GROUP BY Clients.client_id
SELECT client_id, COUNT(*) AS meeting_count FROM Meetings GROUP BY client_id
SELECT M.client_id, M.meeting_type, COUNT(*) AS meeting_count FROM Meetings AS M GROUP BY M.client_id, M.meeting_type
SELECT meeting_type, COUNT(meeting_id) AS total_meetings FROM Meetings GROUP BY meeting_type
SELECT M.meeting_id, M.meeting_outcome, M.meeting_type, C.client_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id
SELECT M.meeting_id, M.meeting_outcome, M.meeting_type, C.client_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id
SELECT m.meeting_id, COUNT(DISTINCT s.staff_id) AS staff_count FROM Meetings m JOIN Staff_in_Meetings s ON m.meeting_id = s.meeting_id GROUP BY m.meeting_id
SELECT meeting_id, COUNT(*) AS staff_count FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id, num_meetings FROM (SELECT staff_id, COUNT(meeting_id) AS num_meetings FROM Staff_in_Meetings GROUP BY staff_id) AS subquery WHERE num_meetings = (SELECT MIN(num_meetings) FROM (SELECT staff_id, COUNT(meeting_id) AS num_meetings FROM Staff_in_Meetings GROUP BY staff_id) AS subquery2)
SELECT S.staff_id FROM Staff_in_Meetings S GROUP BY S.staff_id HAVING COUNT(S.meeting_id) > 0 ORDER BY COUNT(S.meeting_id) ASC LIMIT 1
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(*) FROM Staff LEFT JOIN Staff_in_Meetings ON Staff.staff_id = Staff_in_Meetings.staff_id WHERE Staff_in_Meetings.staff_id IS NULL
SELECT COUNT(DISTINCT s.staff_id) FROM Staff s LEFT JOIN Staff_in_Meetings sm ON s.staff_id = sm.staff_id WHERE sm.staff_id IS NULL
SELECT DISTINCT c.client_id, c.client_details FROM Clients c WHERE EXISTS (SELECT 1 FROM Meetings m WHERE m.client_id = c.client_id) OR EXISTS (SELECT 1 FROM Invoices i WHERE i.client_id = c.client_id)
SELECT DISTINCT c.client_id, c.client_details FROM Clients c WHERE EXISTS (SELECT 1 FROM Meetings m WHERE m.client_id = c.client_id) OR EXISTS (SELECT 1 FROM Invoices i WHERE i.client_id = c.client_id)
SELECT s.staff_id, s.staff_details FROM Staff s WHERE s.staff_details LIKE '%s%' AND s.staff_id IN (SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(*) >= 1)
SELECT s.staff_id, s.staff_details FROM Staff s WHERE s.staff_details LIKE '%s%' AND s.staff_id IN (SELECT DISTINCT staff_id FROM Staff_in_Meetings)
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE C.client_id IN (SELECT client_id FROM Meetings GROUP BY client_id HAVING COUNT(*) = 1) AND C.client_id IN (SELECT client_id FROM Invoices)
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE (SELECT COUNT(*) FROM Meetings M WHERE M.client_id = C.client_id) = 1 AND EXISTS (SELECT 1 FROM Invoices I WHERE I.client_id = C.client_id)
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id JOIN Staff S ON SM.staff_id = S.staff_id
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id JOIN Staff S ON SM.staff_id = S.staff_id
