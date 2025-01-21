SELECT COUNT(*) FROM club
SELECT COUNT(*) FROM club
SELECT Name FROM club ORDER BY Name
SELECT Name FROM club ORDER BY Name
SELECT Manager, Captain FROM club
SELECT Manager, Captain FROM club
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM club WHERE Manufacturer != 'Nike'
SELECT Name FROM player ORDER BY Wins_count
SELECT Name FROM player ORDER BY Wins_count
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT Name FROM player ORDER BY Earnings DESC LIMIT 1
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT DISTINCT Country FROM player WHERE Earnings > 1200000
SELECT Country FROM player WHERE Wins_count > 2 ORDER BY Earnings DESC LIMIT 1
SELECT Country FROM player WHERE Wins_count > 2 AND Earnings = (SELECT MAX(Earnings) FROM player WHERE Wins_count > 2)
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT T1.Name, T2.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT DISTINCT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Wins_count > 2
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Manager = 'Sam Allardyce'
SELECT T1.Name FROM player AS T1 JOIN club AS T2 ON T1.Club_ID = T2.Club_ID WHERE T2.Manager = 'Sam Allardyce'
SELECT T1.Name FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Name ORDER BY AVG(T2.Earnings) DESC
SELECT T1.Name, AVG(T2.Earnings) AS avg_earnings FROM club AS T1 JOIN player AS T2 ON T1.Club_ID = T2.Club_ID GROUP BY T1.Name ORDER BY avg_earnings DESC
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer, COUNT(*) FROM club GROUP BY Manufacturer
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer ORDER BY COUNT(*) DESC LIMIT 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(*) > 1
SELECT Manufacturer FROM club GROUP BY Manufacturer HAVING COUNT(Club_ID) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(*) > 1
SELECT Country FROM player GROUP BY Country HAVING COUNT(Player_ID) > 1
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Name FROM club WHERE Club_ID NOT IN (SELECT Club_ID FROM player)
SELECT Country FROM player WHERE Earnings > 1400000 OR Earnings < 1100000
SELECT Country FROM player WHERE Earnings > 1400000 INTERSECT SELECT Country FROM player WHERE Earnings < 1100000
SELECT COUNT(DISTINCT Country) FROM player
SELECT COUNT(DISTINCT Country) FROM player
SELECT Earnings FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT SUM(Earnings) FROM player WHERE Country IN ('Australia', 'Zimbabwe')
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C WHERE C.customer_id IN (SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(order_id) > 2) AND C.customer_id IN (SELECT O.customer_id FROM Orders O JOIN Order_Items I ON O.order_id = I.order_id GROUP BY O.customer_id HAVING COUNT(I.order_item_id) >= 3)
SELECT C.customer_id, C.customer_first_name, C.customer_last_name FROM Customers C WHERE C.customer_id IN (SELECT O.customer_id FROM Orders O GROUP BY O.customer_id HAVING COUNT(O.order_id) > 2) AND C.customer_id IN (SELECT OI.customer_id FROM Order_Items OI JOIN Orders O ON OI.order_id = O.order_id GROUP BY O.customer_id HAVING SUM(OI.quantity) >= 3)
SELECT T1.order_id, T1.order_status_code, COUNT(T2.product_id) AS product_count FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id, T1.order_status_code
SELECT COUNT(T1.product_id), T2.order_status_code, T2.order_id FROM Orders AS T2 JOIN Order_Items AS T1 ON T2.order_id = T1.order_id GROUP BY T2.order_id
SELECT date_order_placed FROM Orders WHERE date_order_placed = (SELECT MIN(date_order_placed) FROM Orders) OR order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(order_item_id) > 1)
SELECT date_order_placed FROM Orders WHERE order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING count(*) > 1) OR date_order_placed = (SELECT min(date_order_placed) FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT customer_first_name, customer_middle_initial, customer_last_name FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Orders)
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 WHERE T1.product_id NOT IN (SELECT product_id FROM Order_Items GROUP BY product_id HAVING COUNT(*) >= 2)
SELECT T1.product_id, T1.product_name, T1.product_price, T1.product_color FROM Products AS T1 LEFT JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.order_id) < 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.product_id) >= 2
SELECT T1.order_id, T1.date_order_placed FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id GROUP BY T1.order_id HAVING COUNT(T2.product_id) >= 2
SELECT T2.product_id, T2.product_name, T2.product_price FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.product_id, T1.product_name, T1.product_price FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id, T1.product_name, T1.product_price ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_id, SUM(product_price) AS total_price FROM Order_Items JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY order_id ORDER BY total_price ASC LIMIT 1
SELECT order_id, MIN(total_cost) FROM (SELECT order_id, SUM(product_price) AS total_cost FROM Orders JOIN Order_Items ON Orders.order_id = Order_Items.order_id JOIN Products ON Order_Items.product_id = Products.product_id GROUP BY Orders.order_id) AS CostTable
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customer_Payment_Methods GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT C.gender_code, COUNT(OI.product_id) FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id GROUP BY C.gender_code
SELECT gender_code, COUNT(product_id) FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id JOIN Order_Items ON Orders.order_id = Order_Items.order_id GROUP BY gender_code
SELECT COUNT(T1.order_id), T2.gender_code FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.gender_code
SELECT COUNT(T1.order_id), T2.gender_code FROM Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id GROUP BY T2.gender_code
SELECT T1.customer_first_name, T1.customer_middle_initial, T1.customer_last_name, T2.payment_method_code FROM Customers AS T1 JOIN Customer_Payment_Methods AS T2 ON T1.customer_id = T2.customer_id
SELECT customer_first_name, customer_middle_initial, customer_last_name, payment_method_code FROM Customers JOIN Customer_Payment_Methods ON Customers.customer_id = Customer_Payment_Methods.customer_id
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.invoice_status_code, T1.invoice_date, T2.shipment_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number
SELECT T1.product_name, T4.shipment_date FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id = T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id = T4.shipment_id
SELECT T1.product_name, T4.shipment_date FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id = T3.order_item_id JOIN Shipments AS T4 ON T3.shipment_id = T4.shipment_id
SELECT T1.order_item_status_code, T4.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T4 ON T2.shipment_id = T4.shipment_id
SELECT T1.order_item_status_code, T4.shipment_tracking_number FROM Order_Items AS T1 JOIN Shipment_Items AS T2 ON T1.order_item_id = T2.order_item_id JOIN Shipments AS T4 ON T2.shipment_id = T4.shipment_id
SELECT DISTINCT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id = T3.order_item_id
SELECT DISTINCT T1.product_name, T1.product_color FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Shipment_Items AS T3 ON T2.order_item_id = T3.order_item_id
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'female'
SELECT DISTINCT T1.product_name, T1.product_price, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id JOIN Orders AS T3 ON T2.order_id = T3.order_id JOIN Customers AS T4 ON T3.customer_id = T4.customer_id WHERE T4.gender_code = 'female'
SELECT invoice_status_code FROM Invoices WHERE order_id NOT IN (SELECT order_id FROM Shipments)
SELECT invoice_status_code FROM Invoices WHERE invoice_number NOT IN (SELECT invoice_number FROM Shipments)
SELECT T1.order_id, T1.date_order_placed, SUM(T3.product_price * T2.quantity) AS total_cost FROM Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id GROUP BY T1.order_id, T1.date_order_placed
SELECT Orders.order_id, Orders.date_order_placed, SUM(Invoices.amount) FROM Orders JOIN Invoices ON Orders.order_id = Invoices.order_id GROUP BY Orders.order_id
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT COUNT(DISTINCT customer_id) FROM Orders
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT order_item_status_code) FROM Order_Items
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT COUNT(DISTINCT payment_method_code) FROM Customer_Payment_Methods
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT login_name, login_password FROM Customers WHERE phone_number LIKE '+12%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_size FROM Products WHERE product_name LIKE '%Dell%'
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products);
SELECT product_price, product_size FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT DISTINCT product_id FROM Order_Items)
SELECT COUNT(*) FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Payment_Methods)
SELECT order_status_code, date_order_placed FROM Orders
SELECT order_status_code, date_order_placed FROM Orders
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'USA'
SELECT address_line_1, town_city, county FROM Customers WHERE country = 'United States'
SELECT DISTINCT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT DISTINCT C.customer_first_name, P.product_name FROM Customers C JOIN Orders O ON C.customer_id = O.customer_id JOIN Order_Items OI ON O.order_id = OI.order_id JOIN Products P ON OI.product_id = P.product_id
SELECT COUNT(*) FROM Shipment_Items
SELECT COUNT(DISTINCT order_item_id) FROM Shipment_Items
SELECT AVG(product_price) FROM Products
SELECT AVG(product_price) FROM Products
SELECT AVG(T1.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id
SELECT AVG(T1.product_price) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT email_address, town_city, county FROM Customers WHERE gender_code = (SELECT gender_code FROM Customers JOIN Orders ON Customers.customer_id = Orders.customer_id GROUP BY gender_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT date_order_placed FROM Orders WHERE customer_id IN (SELECT customer_id FROM Customer_Payment_Methods GROUP BY customer_id HAVING COUNT(payment_method_code) >= 2)
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT order_status_code FROM Orders GROUP BY order_status_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T2.product_id HAVING count(*) > 3
SELECT T1.product_id, T1.product_description FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_id HAVING COUNT(T2.product_id) > 3
SELECT T1.invoice_date, T1.invoice_number FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT T1.invoice_number, T1.invoice_date FROM Invoices AS T1 JOIN Shipments AS T2 ON T1.invoice_number = T2.invoice_number GROUP BY T1.invoice_number HAVING COUNT(T2.shipment_id) >= 2
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT shipment_tracking_number, shipment_date FROM Shipments
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT MAX(product_price) FROM Products)
SELECT product_color, product_description, product_size FROM Products WHERE product_price < (SELECT max(product_price) FROM Products)
SELECT Name FROM director WHERE Age > (SELECT AVG(Age) FROM director)
SELECT Name FROM director ORDER BY Age DESC LIMIT 1
SELECT COUNT(*) FROM channel WHERE Internet LIKE '%bbc%'
SELECT COUNT(DISTINCT Digital_terrestrial_channel) FROM channel
SELECT Title FROM program ORDER BY Start_Year DESC
SELECT T1.Name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Name, T1.Age FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID GROUP BY T1.Director_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Title FROM program ORDER BY Start_Year DESC LIMIT 1
SELECT T1.Name, T1.Internet FROM channel AS T1 JOIN program AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T1.Channel_ID HAVING COUNT(*) > 1
SELECT T2.Name, COUNT(T1.Program_ID) FROM program AS T1 JOIN channel AS T2 ON T1.Channel_ID = T2.Channel_ID GROUP BY T2.Name
SELECT COUNT(*) FROM channel WHERE Channel_ID NOT IN (SELECT DISTINCT Channel_ID FROM program)
SELECT T1.name FROM director AS T1 JOIN program AS T2 ON T1.Director_ID = T2.Director_ID WHERE T2.Title = 'Dracula'
SELECT Name, Internet FROM channel WHERE Channel_ID = (SELECT Channel_ID FROM director_admin GROUP BY Channel_ID ORDER BY COUNT(Director_ID) DESC LIMIT 1)
SELECT Name FROM director WHERE Age BETWEEN 30 AND 60
SELECT Name FROM channel WHERE Channel_ID IN (SELECT Channel_ID FROM director_admin JOIN director ON director_admin.Director_ID = director.Director_ID WHERE Age < 40) AND Channel_ID IN (SELECT Channel_ID FROM director_admin JOIN director ON director_admin.Director_ID = director.Director_ID WHERE Age > 60)
SELECT Channel_ID, Name FROM channel WHERE Channel_ID NOT IN (SELECT Channel_ID FROM program JOIN director ON program.Director_ID = director.Director_ID WHERE director.Name = 'Hank Baskett')
SELECT COUNT(*) FROM radio
SELECT Transmitter FROM radio ORDER BY ERP_kW
SELECT tv_show_name, Original_Airdate FROM tv_show
SELECT Station_name FROM city_channel WHERE Affiliation != 'ABC'
SELECT Transmitter FROM radio WHERE ERP_kW > 150 OR ERP_kW < 30
SELECT Transmitter FROM radio ORDER BY ERP_kW DESC LIMIT 1
SELECT AVG(ERP_kW) FROM radio
SELECT Affiliation, COUNT(ID) FROM city_channel GROUP BY Affiliation
SELECT Affiliation FROM city_channel GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Affiliation FROM city_channel GROUP BY Affiliation HAVING COUNT(*) > 3
SELECT City, Station_name FROM city_channel ORDER BY Station_name ASC
SELECT T1.Transmitter, T2.City FROM radio AS T1 JOIN city_channel_radio AS T3 ON T1.Radio_ID = T3.Radio_ID JOIN city_channel AS T2 ON T3.City_channel_ID = T2.ID
SELECT T1.Transmitter, T2.Station_name FROM radio AS T1 JOIN city_channel_radio AS T3 ON T1.Radio_ID = T3.Radio_ID JOIN city_channel AS T2 ON T3.City_channel_ID = T2.ID ORDER BY T1.ERP_kW DESC
SELECT T1.Transmitter, COUNT(DISTINCT T2.City_channel_ID) FROM radio AS T1 JOIN city_channel_radio AS T2 ON T1.Radio_ID = T2.Radio_ID GROUP BY T1.Transmitter
SELECT DISTINCT Transmitter FROM radio WHERE Radio_ID NOT IN (SELECT Radio_ID FROM city_channel_radio)
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Model FROM vehicle WHERE Power > 6000 ORDER BY Top_Speed DESC LIMIT 1
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Name FROM driver WHERE Citizenship = 'United States'
SELECT Driver_ID, COUNT(Vehicle_ID) AS Vehicle_Count FROM vehicle_driver GROUP BY Driver_ID ORDER BY Vehicle_Count DESC LIMIT 1
SELECT Driver_ID, COUNT(Vehicle_ID) AS vehicle_count FROM vehicle_driver GROUP BY Driver_ID ORDER BY vehicle_count DESC LIMIT 1
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT MAX(Power), AVG(Power) FROM vehicle WHERE Builder = 'Zhuzhou'
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(*) = (SELECT MIN(counts) FROM (SELECT COUNT(*) AS counts FROM vehicle_driver GROUP BY Vehicle_ID) AS subquery)
SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Top_Speed, Power FROM vehicle WHERE Build_Year = 1996
SELECT Build_Year, Model, Builder FROM vehicle
SELECT Build_Year, Model, Builder FROM vehicle
SELECT COUNT(DISTINCT T1.Driver_ID) FROM vehicle_driver AS T1 JOIN vehicle AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID WHERE T2.Build_Year = 2012
SELECT COUNT(DISTINCT T1.Driver_ID) FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Build_Year = 2012
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT COUNT(*) FROM driver WHERE Racing_Series = 'NASCAR'
SELECT AVG(Top_Speed) FROM vehicle
SELECT AVG(Top_Speed) FROM vehicle
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT DISTINCT T1.Name FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Power > 5000
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model FROM vehicle WHERE Total_Production > 100 OR Top_Speed > 150
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model, Build_Year FROM vehicle WHERE Model LIKE '%DJ%'
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT Model FROM vehicle WHERE Vehicle_ID NOT IN (SELECT Vehicle_ID FROM vehicle_driver)
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 LEFT JOIN vehicle_driver AS T2 ON T1.Vehicle_ID = T2.Vehicle_ID GROUP BY T1.Vehicle_ID HAVING COUNT(T2.Driver_ID) = 2 OR T1.Builder = 'Ziyang'
SELECT Vehicle_ID, Model FROM vehicle WHERE Builder = 'Ziyang' OR Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) = 2)
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 WHERE T1.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2 UNION SELECT Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon')
SELECT T1.Vehicle_ID, T1.Model FROM vehicle AS T1 WHERE T1.Vehicle_ID IN (SELECT Vehicle_ID FROM vehicle_driver GROUP BY Vehicle_ID HAVING COUNT(DISTINCT Driver_ID) > 2 UNION SELECT Vehicle_ID FROM vehicle_driver JOIN driver ON vehicle_driver.Driver_ID = driver.Driver_ID WHERE driver.Name = 'Jeff Gordon')
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT COUNT(*) FROM vehicle WHERE Top_Speed = (SELECT MAX(Top_Speed) FROM vehicle)
SELECT Name FROM driver ORDER BY Name
SELECT Name FROM driver ORDER BY Name
SELECT Racing_Series, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Racing_Series
SELECT Racing_Series, COUNT(Driver_ID) FROM driver GROUP BY Racing_Series
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT T1.Name, T1.Citizenship FROM driver AS T1 JOIN vehicle_driver AS T2 ON T1.Driver_ID = T2.Driver_ID JOIN vehicle AS T3 ON T2.Vehicle_ID = T3.Vehicle_ID WHERE T3.Model = 'DJ1'
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM vehicle_driver)
SELECT COUNT(*) FROM Exams
SELECT COUNT(*) FROM Exams
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT DISTINCT Subject_Code FROM Exams ORDER BY Subject_Code
SELECT Exam_Name, Exam_Date FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date, Exam_Name FROM Exams WHERE Subject_Code != 'Database'
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Exam_Date FROM Exams WHERE Subject_Code LIKE '%data%' ORDER BY Exam_Date DESC
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT Type_of_Question_Code, COUNT(*) FROM Questions GROUP BY Type_of_Question_Code
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT DISTINCT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal'
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT COUNT(DISTINCT Comments) FROM Student_Answers
SELECT Student_Answer_Text, COUNT(*) FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY COUNT(*) DESC
SELECT Student_Answer_Text, COUNT(*) AS frequency FROM Student_Answers GROUP BY Student_Answer_Text ORDER BY frequency DESC
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.First_Name, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT T1.Email_Adress, T2.Date_of_Answer FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID ORDER BY T2.Date_of_Answer DESC
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT Assessment FROM Student_Assessments GROUP BY Assessment ORDER BY COUNT(*) ASC LIMIT 1
SELECT First_Name FROM Students WHERE Student_ID IN (SELECT Student_ID FROM Student_Answers GROUP BY Student_ID HAVING COUNT(*) >= 2)
SELECT T1.First_Name FROM Students AS T1 JOIN Student_Answers AS T2 ON T1.Student_ID = T2.Student_ID GROUP BY T1.Student_ID HAVING COUNT(T2.Student_Answer_ID) >= 2
SELECT Valid_Answer_Text FROM Valid_Answers GROUP BY Valid_Answer_Text ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Valid_Answer_Text FROM Valid_Answers AS T1 JOIN Student_Assessments AS T2 ON T1.Valid_Answer_ID = T2.Valid_Answer_ID GROUP BY T1.Valid_Answer_Text ORDER BY count(*) DESC LIMIT 1
SELECT Last_Name FROM Students WHERE Gender_MFU != 'M'
SELECT Last_Name FROM Students WHERE Gender <> 'M'
SELECT Gender_MFU, COUNT(*) FROM Students GROUP BY Gender_MFU
SELECT Gender_MFU, COUNT(Student_ID) FROM Students GROUP BY Gender_MFU
SELECT Last_Name FROM Students WHERE Gender IN ('F', 'M')
SELECT Last_Name FROM Students WHERE Gender_MFU IN ('F', 'M')
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT DISTINCT Student_ID FROM Student_Answers)
SELECT First_Name FROM Students WHERE Student_ID NOT IN (SELECT Student_ID FROM Student_Answers)
SELECT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_ID IN (SELECT Student_Answer_ID FROM Student_Answers WHERE Comments = 'Normal' INTERSECT SELECT Student_Answer_ID FROM Student_Answers WHERE Comments = 'Absent')
SELECT Student_Answer_Text FROM Student_Answers WHERE Student_Answer_Text IN (SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Normal') AND Student_Answer_Text IN (SELECT Student_Answer_Text FROM Student_Answers WHERE Comments = 'Absent')
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING COUNT(*) >= 3
SELECT Type_of_Question_Code FROM Questions GROUP BY Type_of_Question_Code HAVING count(*) >= 3
SELECT * FROM student
SELECT * FROM Students
SELECT COUNT(*) FROM Addresses
SELECT COUNT(DISTINCT address_id) FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT address_id, address_details FROM Addresses
SELECT COUNT(*) FROM Products
SELECT COUNT(*) FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_id, product_type_code, product_name FROM Products
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT product_price FROM Products WHERE product_name = 'Monitor'
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products
SELECT MIN(product_price), AVG(product_price), MAX(product_price) FROM Products
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT AVG(product_price) FROM Products WHERE product_type_code = 'Clothes'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'hardware'
SELECT COUNT(*) FROM Products WHERE product_type_code = 'Hardware'
SELECT product_name FROM Products WHERE product_price > (SELECT avg(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT avg(product_price) FROM Products)
SELECT product_name FROM Products WHERE product_price > (SELECT AVG(product_price) FROM Products WHERE product_type_code = 'hardware') AND product_type_code = 'hardware'
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' AND product_price > (SELECT avg(product_price) FROM Products WHERE product_type_code = 'Hardware')
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_name FROM Products WHERE product_type_code = 'Clothes' ORDER BY product_price DESC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_id, product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC LIMIT 1
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products ORDER BY product_price DESC
SELECT product_name FROM Products WHERE product_type_code = 'hardware' ORDER BY product_price
SELECT product_name FROM Products WHERE product_type_code = 'Hardware' ORDER BY product_price ASC
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, COUNT(product_id) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code, AVG(product_price) FROM Products GROUP BY product_type_code
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(*) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code HAVING count(product_id) >= 2
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.product_type_code FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id GROUP BY T1.product_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers
SELECT COUNT(*) FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_id, customer_name FROM Customers
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT customer_address, customer_phone, customer_email FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, COUNT(customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code, COUNT(customer_id) FROM Customers GROUP BY payment_method_code
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT customer_name FROM Customers WHERE payment_method_code IN (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT customer_name FROM Customers WHERE payment_method_code = (SELECT payment_method_code FROM Customers GROUP BY payment_method_code ORDER BY COUNT(*) ASC LIMIT 1)
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT payment_method_code, customer_number FROM Customers WHERE customer_name = 'Jeromy'
SELECT DISTINCT payment_method_code FROM Customers
SELECT DISTINCT payment_method_code FROM Customers
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_id, product_type_code FROM Products ORDER BY product_name
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(product_id) ASC LIMIT 1
SELECT product_type_code FROM Products GROUP BY product_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Customer_Orders
SELECT COUNT(DISTINCT order_id) FROM Customer_Orders
SELECT T1.order_id, T1.order_date, T1.order_status_code FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_name = 'Jeromy'
SELECT T1.order_id, T1.order_date, T1.order_status_code FROM Customer_Orders AS T1 JOIN Customers AS T2 ON T1.customer_id = T2.customer_id WHERE T2.customer_name = 'Jeromy'
SELECT T1.customer_name, T1.customer_id, COUNT(T2.order_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id, T1.customer_name
SELECT T1.customer_name, T1.customer_id, COUNT(T2.order_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id, T1.customer_name
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email FROM Customers AS T1 WHERE T1.customer_id = (SELECT customer_id FROM Customer_Orders GROUP BY customer_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.customer_id, T1.customer_name, T1.customer_phone, T1.customer_email FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id GROUP BY T1.customer_id ORDER BY COUNT(T2.order_id) DESC LIMIT 1
SELECT order_status_code, COUNT(*) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code, COUNT(*) FROM Customer_Orders GROUP BY order_status_code
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT order_status_code FROM Customer_Orders GROUP BY order_status_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT COUNT(*) FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT product_name FROM Products WHERE product_id NOT IN (SELECT product_id FROM Order_Items)
SELECT SUM(T2.order_quantity) FROM Products AS T1 JOIN Order_Items AS T2 ON T1.product_id = T2.product_id WHERE T1.product_name = 'Monitor'
SELECT SUM(T1.order_quantity) FROM Order_Items AS T1 JOIN Products AS T2 ON T1.product_id = T2.product_id WHERE T2.product_name = 'Monitor'
SELECT COUNT(DISTINCT T1.customer_id) FROM Customer_Orders AS T1 JOIN Order_Items AS T2 ON T1.order_id = T2.order_id JOIN Products AS T3 ON T2.product_id = T3.product_id WHERE T3.product_name = 'Monitor'
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id JOIN Order_Items AS T3 ON T2.order_id = T3.order_id JOIN Products AS T4 ON T3.product_id = T4.product_id WHERE T4.product_name = 'Monitor'
SELECT COUNT(DISTINCT customer_id) FROM Customer_Orders
SELECT COUNT(DISTINCT T1.customer_id) FROM Customers AS T1 JOIN Customer_Orders AS T2 ON T1.customer_id = T2.customer_id
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT customer_id FROM Customers WHERE customer_id NOT IN (SELECT customer_id FROM Customer_Orders)
SELECT order_date, order_id FROM Customer_Orders WHERE order_id IN (SELECT order_id FROM Order_Items WHERE order_quantity > 6 UNION SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(*) > 3)
SELECT T1.order_id, T1.order_date FROM Customer_Orders AS T1 WHERE T1.order_id IN (SELECT order_id FROM Order_Items WHERE order_quantity > 6) OR T1.order_id IN (SELECT order_id FROM Order_Items GROUP BY order_id HAVING COUNT(DISTINCT product_id) > 3)
SELECT COUNT(*) FROM building
SELECT COUNT(*) FROM building
SELECT Name FROM building ORDER BY Number_of_Stories
SELECT Name FROM building ORDER BY Number_of_Stories
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT Address FROM building ORDER BY Completed_Year DESC
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT MAX(Number_of_Stories) FROM building WHERE Completed_Year != 1980
SELECT AVG(Population) FROM region
SELECT AVG(Population) FROM region
SELECT Name FROM region ORDER BY Name
SELECT Name FROM region ORDER BY Name
SELECT Capital FROM region WHERE Area > 10000
SELECT Capital FROM region WHERE Area > 10000
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Capital FROM region ORDER BY Population DESC LIMIT 1
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT Name FROM region ORDER BY Area DESC LIMIT 5
SELECT building.Name, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT building.Name, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT Name FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID HAVING COUNT(*) > 1)
SELECT T1.Name FROM region AS T1 JOIN building AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Name HAVING COUNT(*) > 1
SELECT Capital FROM region WHERE Region_ID IN (SELECT Region_ID FROM building GROUP BY Region_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID GROUP BY T1.Region_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Address, T2.Capital FROM building AS T1 JOIN region AS T2 ON T1.Region_ID = T2.Region_ID
SELECT building.Address, region.Name FROM building JOIN region ON building.Region_ID = region.Region_ID
SELECT Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT building.Name, building.Number_of_Stories FROM building JOIN region ON building.Region_ID = region.Region_ID WHERE region.Name = 'Abruzzo'
SELECT Completed_Year, COUNT(Building_ID) FROM building GROUP BY Completed_Year
SELECT Completed_Year, COUNT(Building_ID) FROM building GROUP BY Completed_Year
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY COUNT(*) DESC LIMIT 1
SELECT Completed_Year FROM building GROUP BY Completed_Year ORDER BY count(*) DESC LIMIT 1
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Name FROM region WHERE Region_ID NOT IN (SELECT Region_ID FROM building)
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT Completed_Year FROM building WHERE Number_of_Stories > 20 INTERSECT SELECT Completed_Year FROM building WHERE Number_of_Stories < 15
SELECT DISTINCT Address FROM building
SELECT DISTINCT Address FROM building
SELECT Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Name, Completed_Year FROM building ORDER BY Number_of_Stories DESC
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT Channel_Details FROM Channels ORDER BY Channel_Details
SELECT COUNT(*) FROM Services
SELECT COUNT(*) FROM Services
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT Analytical_Layer_Type_Code FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.Service_Details FROM Customers AS T1 JOIN Customers_and_Services AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Services AS T3 ON T2.Service_ID = T3.Service_ID WHERE T1.Customer_Details = 'Hardy Kutch'
SELECT T2.Service_Details FROM Customers AS T1 JOIN Customers_and_Services AS T3 ON T1.Customer_ID = T3.Customer_ID JOIN Services AS T2 ON T3.Service_ID = T2.Service_ID WHERE T1.Customer_Details = 'Hardy Kutch'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID GROUP BY T1.Service_ID HAVING COUNT(T2.Service_ID) > 3
SELECT T2.Service_Details FROM Customers_and_Services AS T1 JOIN Services AS T2 ON T1.Service_ID = T2.Service_ID GROUP BY T1.Service_ID HAVING COUNT(*) > 3
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customer_Interactions GROUP BY Customer_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT * FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(Service_ID) DESC LIMIT 1)
SELECT Customer_Details FROM Customers WHERE Customer_ID = (SELECT Customer_ID FROM Customers_and_Services GROUP BY Customer_ID ORDER BY COUNT(DISTINCT Service_ID) DESC LIMIT 1)
SELECT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID GROUP BY C.Customer_ID ORDER BY COUNT(DISTINCT CS.Service_ID) DESC LIMIT 1
SELECT Customer_Details FROM Customers WHERE Customer_ID NOT IN (SELECT Customer_ID FROM Customers_and_Services)
SELECT Customer_Details FROM Customers LEFT JOIN Customers_and_Services ON Customers.Customer_ID = Customers_and_Services.Customer_ID WHERE Customers_and_Services.Customer_ID IS NULL
SELECT Customer_Details FROM Customers WHERE Customer_ID IN (SELECT Customer_ID FROM Customers_and_Services WHERE Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1))
SELECT DISTINCT C.Customer_Details FROM Customers C JOIN Customers_and_Services CS ON C.Customer_ID = CS.Customer_ID WHERE CS.Service_ID = (SELECT Service_ID FROM Customers_and_Services GROUP BY Service_ID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT COUNT(DISTINCT Customers_and_Services_Details) FROM Customers_and_Services
SELECT (SELECT COUNT(*) FROM Customers WHERE Customer_Details IS NOT NULL) + (SELECT COUNT(*) FROM Services WHERE Service_Details IS NOT NULL) AS Total_Details
SELECT Customer_Details FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT * FROM Customers WHERE Customer_Details LIKE '%Kutch%'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch') UNION SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'good')
SELECT DISTINCT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID JOIN Customers AS T3 ON T2.Customer_ID = T3.Customer_ID JOIN Customer_Interactions AS T4 ON T3.Customer_ID = T4.Customer_ID WHERE T3.Customer_Details = 'Hardy Kutch' OR T4.Status_Code = 'good'
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customers_and_Services WHERE Customer_ID IN (SELECT Customer_ID FROM Customers WHERE Customer_Details = 'Hardy Kutch')) AND Service_ID IN (SELECT Service_ID FROM Customer_Interactions WHERE Status_Code = 'bad')
SELECT Service_Details FROM Services WHERE Service_ID IN (SELECT Service_ID FROM Customer_Interactions JOIN Customers ON Customer_Interactions.Customer_ID = Customers.Customer_ID WHERE Customer_Details = 'Hardy Kutch' AND Status_Code = 'bad')
SELECT T1.Service_Details FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID JOIN Channels AS T3 ON T2.Channel_ID = T3.Channel_ID WHERE T3.Channel_Details = '15 ij'
SELECT T1.* FROM Services AS T1 JOIN Customer_Interactions AS T2 ON T1.Service_ID = T2.Service_ID JOIN Channels AS T3 ON T2.Channel_ID = T3.Channel_ID WHERE T3.Channel_Details = '15 ij'
SELECT T1.* FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Status_Code = 'Stuck' AND T2.Services_and_Channels_Details = 'bad'
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID = T2.Customer_ID WHERE T2.Status_Code = 'Stuck' AND T2.Services_and_Channels_Details = 'bad'
SELECT COUNT(*) FROM Integration_Platform JOIN Customer_Interactions ON Integration_Platform.Customer_Interaction_ID = Customer_Interactions.Customer_Interaction_ID WHERE Customer_Interactions.Status_Code = 'successful'
SELECT COUNT(*) FROM Integration_Platform WHERE Integration_Platform_Details LIKE '%Success%'
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Integration_Platform AS T3 ON T2.Customer_Interaction_ID = T3.Customer_Interaction_ID WHERE T3.Status_Code = 'failed'
SELECT T1.Customer_Details FROM Customers AS T1 JOIN Customer_Interactions AS T2 ON T1.Customer_ID = T2.Customer_ID JOIN Integration_Platform AS T3 ON T2.Customer_Interaction_ID = T3.Customer_Interaction_ID WHERE T3.Integration_Platform_Details = 'Fail'
SELECT * FROM Services WHERE Service_ID NOT IN (SELECT Service_ID FROM Customers_and_Services)
SELECT Services.Service_Details FROM Services LEFT JOIN Customers_and_Services ON Services.Service_ID = Customers_and_Services.Service_ID WHERE Customers_and_Services.Service_ID IS NULL
SELECT Analytical_Layer_Type_Code, COUNT(*) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT Analytical_Layer_Type_Code, COUNT(Analytical_ID) FROM Analytical_Layer GROUP BY Analytical_Layer_Type_Code
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT T1.Service_Details FROM Services AS T1 JOIN Customers_and_Services AS T2 ON T1.Service_ID = T2.Service_ID WHERE T2.Customers_and_Services_Details LIKE '%unsatisfied%'
SELECT COUNT(*) FROM Vehicles
SELECT COUNT(*) FROM Vehicles
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT name FROM Vehicles ORDER BY Model_year DESC
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT DISTINCT Type_of_powertrain FROM Vehicles
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT name, Type_of_powertrain, Annual_fuel_cost FROM Vehicles WHERE Model_year IN (2013, 2014)
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014 INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013
SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2013 INTERSECT SELECT Type_of_powertrain FROM Vehicles WHERE Model_year = 2014
SELECT Type_of_powertrain, COUNT(id) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, COUNT(id) FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(id) DESC LIMIT 1
SELECT Type_of_powertrain FROM Vehicles GROUP BY Type_of_powertrain ORDER BY COUNT(*) DESC LIMIT 1
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT MIN(Annual_fuel_cost), MAX(Annual_fuel_cost), AVG(Annual_fuel_cost) FROM Vehicles
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT name, Model_year FROM Vehicles WHERE City_fuel_economy_rate <= Highway_fuel_economy_rate
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(id) >= 2
SELECT Type_of_powertrain, AVG(Annual_fuel_cost) FROM Vehicles GROUP BY Type_of_powertrain HAVING COUNT(*) > 1
SELECT name, age, membership_credit FROM Customers
SELECT name, age, membership_credit FROM Customers
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT name, age FROM Customers ORDER BY membership_credit DESC LIMIT 1
SELECT avg(age) FROM Customers WHERE membership_credit > (SELECT avg(membership_credit) FROM Customers)
SELECT AVG(age) FROM Customers WHERE membership_credit > (SELECT AVG(membership_credit) FROM Customers)
SELECT * FROM Discount
SELECT * FROM Discount
SELECT T1.name, SUM(T2.total_hours) FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.name
SELECT T1.name, SUM(T2.total_hours) FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.name
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT name FROM Vehicles WHERE id NOT IN (SELECT vehicles_id FROM Renting_history)
SELECT name FROM Customers WHERE id IN (SELECT customer_id FROM Renting_history GROUP BY customer_id HAVING COUNT(*) >= 2)
SELECT T1.name FROM Customers AS T1 JOIN Renting_history AS T2 ON T1.id = T2.customer_id GROUP BY T1.id HAVING COUNT(*) >= 2
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN (SELECT vehicles_id, COUNT(*) AS num_rentals FROM Renting_history GROUP BY vehicles_id ORDER BY num_rentals DESC LIMIT 1) AS T2 ON T1.id = T2.vehicles_id
SELECT T1.name, T1.Model_year FROM Vehicles AS T1 JOIN (SELECT vehicles_id, COUNT(*) AS rental_count FROM Renting_history GROUP BY vehicles_id ORDER BY rental_count DESC LIMIT 1) AS T2 ON T1.id = T2.vehicles_id
SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id ORDER BY T2.total_hours DESC
SELECT T1.name FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id ORDER BY T2.total_hours DESC
SELECT T1.name FROM Discount AS T1 JOIN Renting_history AS T2 ON T1.id = T2.discount_id GROUP BY T1.id ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM Discount WHERE id = (SELECT discount_id FROM Renting_history GROUP BY discount_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.name, T1.Type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id WHERE T2.total_hours > 30
SELECT T1.name, T1.Type_of_powertrain FROM Vehicles AS T1 JOIN Renting_history AS T2 ON T1.id = T2.vehicles_id GROUP BY T1.id HAVING SUM(T2.total_hours) > 30
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Avg_City_Rate, AVG(Highway_fuel_economy_rate) AS Avg_Highway_Rate FROM Vehicles GROUP BY Type_of_powertrain
SELECT Type_of_powertrain, AVG(City_fuel_economy_rate) AS Avg_City_Fuel, AVG(Highway_fuel_economy_rate) AS Avg_Highway_Fuel FROM Vehicles GROUP BY Type_of_powertrain
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT AVG(amount_of_loan) FROM Student_Loans
SELECT S.bio_data, S.student_id FROM Students S WHERE S.student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2) AND S.student_id IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2)
SELECT bio_data, student_id FROM Students WHERE student_id IN (SELECT student_id FROM Classes GROUP BY student_id HAVING COUNT(*) >= 2) OR student_id IN (SELECT student_id FROM Detention GROUP BY student_id HAVING COUNT(*) < 2)
SELECT * FROM Teachers WHERE teacher_id IN (SELECT teacher_id FROM Classes WHERE class_details LIKE '%data%') AND teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT T2.teacher_details FROM Teachers AS T2 JOIN Classes AS T1 ON T2.teacher_id = T1.teacher_id WHERE T1.class_details LIKE '%data%' AND T1.teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE class_details LIKE 'net%')
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention UNION SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id NOT IN (SELECT student_id FROM Detention) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT amount_of_loan, date_of_loan FROM Student_Loans WHERE student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT amount_of_loan, date_of_loan FROM Student_Loans WHERE student_id IN (SELECT student_id FROM Achievements GROUP BY student_id HAVING COUNT(*) >= 2)
SELECT T1.teacher_id, T1.teacher_details FROM Teachers AS T1 JOIN (SELECT teacher_id FROM Classes GROUP BY teacher_id ORDER BY COUNT(*) DESC LIMIT 1) AS T2 ON T1.teacher_id = T2.teacher_id
SELECT T1.teacher_id, T1.teacher_details FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id GROUP BY T1.teacher_id ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT detention_summary FROM Detention
SELECT DISTINCT detention_summary FROM Detention
SELECT T1.student_details, T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Ref_Address_Types AS T3 ON T2.address_type_code = T3.address_type_code
SELECT T1.student_details, T3.address_type_description FROM Students AS T1 JOIN Students_Addresses AS T2 ON T1.student_id = T2.student_id JOIN Ref_Address_Types AS T3 ON T2.address_type_code = T3.address_type_code
SELECT T1.address_details, T2.bio_data FROM Addresses AS T1 JOIN Students_Addresses AS T3 ON T1.address_id = T3.address_id JOIN Students AS T2 ON T3.student_id = T2.student_id
SELECT T1.address_details, T2.bio_data FROM Addresses AS T1 JOIN Students_Addresses AS T3 ON T1.address_id = T3.address_id JOIN Students AS T2 ON T3.student_id = T2.student_id
SELECT T1.bio_data, T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id
SELECT T1.bio_data, T2.date_of_transcript FROM Students AS T1 JOIN Transcripts AS T2 ON T1.student_id = T2.student_id
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1
SELECT behaviour_monitoring_details, COUNT(*) AS count FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY count DESC LIMIT 1
SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id WHERE B.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3 OR behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT S.bio_data, S.student_details FROM Students S JOIN Behaviour_Monitoring B ON S.student_id = B.student_id WHERE B.behaviour_monitoring_details IN (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details HAVING COUNT(*) = 3) AND B.behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1)
SELECT S.bio_data FROM Students S WHERE NOT EXISTS (SELECT 1 FROM Behaviour_Monitoring B WHERE B.student_id = S.student_id AND B.behaviour_monitoring_details <> (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Behaviour_Monitoring WHERE behaviour_monitoring_details = (SELECT behaviour_monitoring_details FROM Behaviour_Monitoring GROUP BY behaviour_monitoring_details ORDER BY COUNT(*) DESC LIMIT 1))
SELECT T1.bio_data, T2.event_date FROM Students AS T1 JOIN Student_Events AS T2 ON T1.student_id = T2.student_id
SELECT Students.bio_data, Student_Events.event_date FROM Students JOIN Student_Events ON Students.student_id = Student_Events.student_id
SELECT COUNT(SE.student_id) AS num_students, SE.event_type_code, RET.event_type_description FROM Student_Events AS SE JOIN Ref_Event_Types AS RET ON SE.event_type_code = RET.event_type_code GROUP BY SE.event_type_code ORDER BY num_students DESC LIMIT 1
SELECT T2.event_type_code, T3.event_type_description, COUNT(DISTINCT T1.student_id) AS num_students FROM Student_Events AS T1 JOIN Ref_Event_Types AS T2 ON T1.event_type_code = T2.event_type_code JOIN Ref_Event_Types AS T3 ON T1.event_type_code = T3.event_type_code GROUP BY T2.event_type_code, T3.event_type_description ORDER BY num_students DESC LIMIT 1
SELECT T1.achievement_details, T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code = T2.achievement_type_code
SELECT T1.achievement_details, T2.achievement_type_description FROM Achievements AS T1 JOIN Ref_Achievement_Type AS T2 ON T1.achievement_type_code = T2.achievement_type_code
SELECT COUNT(DISTINCT T1.teacher_id) FROM Classes AS T1 LEFT JOIN Achievements AS T2 ON T1.student_id = T2.student_id WHERE T2.achievement_id IS NULL
SELECT COUNT(DISTINCT teacher_id) FROM Classes WHERE student_id IN (SELECT student_id FROM Students WHERE student_id NOT IN (SELECT student_id FROM Achievements))
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT date_of_transcript, transcript_details FROM Transcripts
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT achievement_type_code, achievement_details, date_achievement FROM Achievements
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT datetime_detention_start, datetime_detention_end FROM Detention
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT bio_data FROM Students WHERE student_details LIKE '%Suite%'
SELECT T1.teacher_details, T2.student_details FROM Teachers AS T1 JOIN Classes AS T3 ON T1.teacher_id = T3.teacher_id JOIN Students AS T2 ON T3.student_id = T2.student_id
SELECT T2.teacher_details, T3.student_details FROM Classes AS T1 JOIN Teachers AS T2 ON T1.teacher_id = T2.teacher_id JOIN Students AS T3 ON T1.student_id = T3.student_id
SELECT MAX(course_count), teacher_id FROM (SELECT teacher_id, COUNT(*) AS course_count FROM Classes GROUP BY teacher_id) AS course_counts
SELECT T1.teacher_id, COUNT(T1.class_id) FROM Classes AS T1 GROUP BY T1.teacher_id ORDER BY COUNT(T1.class_id) DESC LIMIT 1
SELECT ID, COUNT(course_id) AS num_courses FROM takes GROUP BY ID ORDER BY num_courses DESC LIMIT 1
SELECT student_id, COUNT(*) AS num_courses FROM Classes GROUP BY student_id ORDER BY num_courses DESC LIMIT 1
SELECT T1.student_id, T1.student_details FROM Students AS T1 JOIN Student_Course_Registrations AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id HAVING COUNT(DISTINCT T2.course_id) = 2
SELECT S.student_id, S.student_details FROM Students S WHERE S.student_id IN (SELECT student_id FROM Student_Course_Registrations GROUP BY student_id HAVING COUNT(course_id) = 2)
SELECT T2.detention_type_code, T2.detention_type_description FROM Detention AS T1 JOIN Ref_Detention_Type AS T2 ON T1.detention_type_code = T2.detention_type_code GROUP BY T1.detention_type_code ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.detention_type_code, T1.detention_type_description FROM Ref_Detention_Type AS T1 JOIN (SELECT detention_type_code FROM Detention GROUP BY detention_type_code ORDER BY COUNT(*) ASC LIMIT 1) AS T2 ON T1.detention_type_code = T2.detention_type_code
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan > (SELECT avg(amount_of_loan) FROM Student_Loans))
SELECT bio_data, student_details FROM Students WHERE student_id IN (SELECT student_id FROM Student_Loans WHERE amount_of_loan > (SELECT avg(amount_of_loan) FROM Student_Loans))
SELECT MIN(date_of_loan) FROM Student_Loans
SELECT MIN(date_of_loan) FROM Student_Loans;
SELECT T1.bio_data FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id WHERE T2.amount_of_loan = (SELECT MIN(amount_of_loan) FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan ASC LIMIT 1)
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan DESC LIMIT 1)
SELECT date_of_transcript FROM Transcripts WHERE student_id = (SELECT student_id FROM Student_Loans ORDER BY amount_of_loan DESC LIMIT 1)
SELECT T1.* FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.student_id = (SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1)
SELECT T1.* FROM Teachers AS T1 JOIN Classes AS T2 ON T1.teacher_id = T2.teacher_id WHERE T2.student_id IN (SELECT student_id FROM Transcripts ORDER BY date_of_transcript ASC LIMIT 1)
SELECT student_id, SUM(amount_of_loan) FROM Student_Loans GROUP BY student_id
SELECT T1.student_id, SUM(T2.amount_of_loan) FROM Students AS T1 JOIN Student_Loans AS T2 ON T1.student_id = T2.student_id GROUP BY T1.student_id
SELECT S.student_id, S.bio_data, COUNT(C.class_id) AS course_count FROM Students S JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id, S.bio_data
SELECT S.student_id, S.bio_data, COUNT(C.class_id) FROM Students S LEFT JOIN Classes C ON S.student_id = C.student_id GROUP BY S.student_id, S.bio_data
SELECT COUNT(DISTINCT student_id) FROM Detention
SELECT COUNT(DISTINCT T1.student_id) FROM Students AS T1 JOIN Detention AS T2 ON T1.student_id = T2.student_id
SELECT T1.address_type_code, T1.address_type_description FROM Ref_Address_Types AS T1 JOIN Students_Addresses AS T2 ON T1.address_type_code = T2.address_type_code GROUP BY T2.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.address_type_code, T2.address_type_description FROM Students_Addresses AS T1 JOIN Ref_Address_Types AS T2 ON T1.address_type_code = T2.address_type_code GROUP BY T1.address_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT bio_data FROM Students WHERE student_id IN (SELECT student_id FROM Student_Events) AND student_id NOT IN (SELECT student_id FROM Student_Loans)
SELECT date_from, date_to FROM Students_Addresses WHERE student_id IN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(transcript_id) = 2)
SELECT date_from, date_to FROM Students_Addresses WHERE student_id IN (SELECT student_id FROM Transcripts GROUP BY student_id HAVING COUNT(*) = 2)
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
SELECT COUNT(DISTINCT idAuthor) FROM Author
SELECT COUNT(*) FROM Author
SELECT COUNT(*) FROM Client
SELECT COUNT(*) FROM Client
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT Name, Address FROM Client ORDER BY Name ASC
SELECT T1.Title, T2.Name FROM Book AS T1 JOIN Author_Book AS T3 ON T1.ISBN = T3.ISBN JOIN Author AS T2 ON T3.Author = T2.idAuthor
SELECT T1.Title, T2.Name FROM Book AS T1 JOIN Author_Book AS T3 ON T1.ISBN = T3.ISBN JOIN Author AS T2 ON T3.Author = T2.idAuthor
SELECT T1.IdOrder, T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient = T2.IdClient
SELECT T1.IdOrder, T2.Name FROM Orders AS T1 JOIN Client AS T2 ON T1.IdClient = T2.IdClient
SELECT A.Name, COUNT(AB.ISBN) FROM Author A JOIN Author_Book AB ON A.idAuthor = AB.Author GROUP BY A.Name
SELECT A.Name, COUNT(AB.ISBN) FROM Author A JOIN Author_Book AB ON A.idAuthor = AB.Author GROUP BY A.Name
SELECT T1.ISBN, COUNT(T2.IdOrder) FROM Book AS T1 LEFT JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN
SELECT T1.ISBN, SUM(T2.amount) FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN
SELECT T1.ISBN, SUM(T2.amount) AS total_amount FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN
SELECT T1.ISBN, SUM(T2.amount) FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.ISBN
SELECT T1.Title FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN GROUP BY T1.Title ORDER BY COUNT(T2.ISBN) DESC LIMIT 1
SELECT Title FROM Book WHERE ISBN = (SELECT ISBN FROM Books_Order GROUP BY ISBN ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.Title, T1.PurchasePrice FROM Book AS T1 JOIN (SELECT ISBN, SUM(amount) AS total_amount FROM Books_Order GROUP BY ISBN ORDER BY total_amount DESC LIMIT 1) AS T2 ON T1.ISBN = T2.ISBN
SELECT T1.Title, T1.PurchasePrice FROM Book AS T1 JOIN (SELECT ISBN, SUM(amount) AS total_amount FROM Books_Order GROUP BY ISBN ORDER BY total_amount DESC LIMIT 1) AS T2 ON T1.ISBN = T2.ISBN
SELECT DISTINCT T1.Title FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN
SELECT DISTINCT Title FROM Book JOIN Books_Order ON Book.ISBN = Books_Order.ISBN
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient
SELECT T1.Name, COUNT(T2.IdOrder) FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.Name
SELECT T1.Name, COUNT(T2.IdOrder) FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.Name
SELECT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders GROUP BY IdClient ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.Name, SUM(T2.amount) FROM Client AS T1 JOIN Orders AS T3 ON T1.IdClient = T3.IdClient JOIN Books_Order AS T2 ON T3.IdOrder = T2.IdOrder GROUP BY T1.Name
SELECT T1.Name, SUM(T2.amount) FROM Client AS T1 JOIN Orders AS T3 ON T1.IdClient = T3.IdClient JOIN Books_Order AS T2 ON T3.IdOrder = T2.IdOrder GROUP BY T1.Name
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Orders JOIN Books_Order ON Orders.IdOrder = Books_Order.IdOrder GROUP BY IdClient ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Name FROM Client WHERE IdClient = (SELECT IdClient FROM Books_Order GROUP BY IdClient ORDER BY SUM(amount) DESC LIMIT 1)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Title FROM Book WHERE ISBN NOT IN (SELECT ISBN FROM Books_Order)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT Name FROM Client WHERE IdClient NOT IN (SELECT IdClient FROM Orders)
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT MAX(SalePrice), MIN(SalePrice) FROM Book
SELECT AVG(PurchasePrice), AVG(SalePrice) FROM Book
SELECT AVG(PurchasePrice), AVG(SalePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT MAX(SalePrice - PurchasePrice) FROM Book
SELECT Title FROM Book WHERE SalePrice > (SELECT avg(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice > (SELECT avg(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT min(SalePrice) FROM Book)
SELECT Title FROM Book WHERE SalePrice = (SELECT MIN(SalePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT max(PurchasePrice) FROM Book)
SELECT Title FROM Book WHERE PurchasePrice = (SELECT MAX(PurchasePrice) FROM Book)
SELECT AVG(T1.SalePrice) FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'George Orwell'
SELECT AVG(T1.SalePrice) FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'George Orwell'
SELECT T1.SalePrice FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'Plato'
SELECT T1.SalePrice FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'Plato'
SELECT T1.Title FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'George Orwell' ORDER BY T1.SalePrice ASC LIMIT 1
SELECT T1.Title FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name = 'George Orwell' ORDER BY T1.SalePrice ASC LIMIT 1
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT avg(SalePrice) FROM Book)
SELECT B.Title FROM Book B JOIN Author_Book AB ON B.ISBN = AB.ISBN JOIN Author A ON AB.Author = A.idAuthor WHERE A.Name = 'Plato' AND B.SalePrice < (SELECT avg(SalePrice) FROM Book)
SELECT T1.Name FROM Author AS T1 JOIN Author_Book AS T2 ON T1.idAuthor = T2.Author JOIN Book AS T3 ON T2.ISBN = T3.ISBN WHERE T3.Title = 'Pride and Prejudice'
SELECT A.Name FROM Author AS A JOIN Author_Book AS AB ON A.idAuthor = AB.Author JOIN Book AS B ON AB.ISBN = B.ISBN WHERE B.Title = 'Pride and Prejudice'
SELECT T1.Title FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name LIKE '%Plato%'
SELECT T1.Title FROM Book AS T1 JOIN Author_Book AS T2 ON T1.ISBN = T2.ISBN JOIN Author AS T3 ON T2.Author = T3.idAuthor WHERE T3.Name LIKE '%Plato%'
SELECT COUNT(*) FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Book.Title = 'Pride and Prejudice'
SELECT SUM(T1.amount) FROM Books_Order AS T1 JOIN Book AS T2 ON T1.ISBN = T2.ISBN WHERE T2.Title = 'Pride and Prejudice'
SELECT IdOrder FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'Pride and Prejudice') INTERSECT SELECT IdOrder FROM Books_Order WHERE ISBN IN (SELECT ISBN FROM Book WHERE Title = 'The Little Prince')
SELECT IdOrder FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Title = 'Pride and Prejudice' INTERSECT SELECT IdOrder FROM Books_Order JOIN Book ON Books_Order.ISBN = Book.ISBN WHERE Title = 'The Little Prince'
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'Peter Doe')) INTERSECT SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'James Smith'))
SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'Peter Doe')) INTERSECT SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient IN (SELECT IdClient FROM Client WHERE Name = 'James Smith'))
SELECT title FROM Book WHERE ISBN IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'Peter Doe'))) AND ISBN NOT IN (SELECT ISBN FROM Books_Order WHERE IdOrder IN (SELECT IdOrder FROM Orders WHERE IdClient = (SELECT IdClient FROM Client WHERE Name = 'James Smith')))
SELECT T1.Title FROM Book AS T1 JOIN Books_Order AS T2 ON T1.ISBN = T2.ISBN JOIN Orders AS T3 ON T2.IdOrder = T3.IdOrder JOIN Client AS T4 ON T3.IdClient = T4.IdClient WHERE T4.Name = 'Peter Doe' AND T1.ISBN NOT IN (SELECT T5.ISBN FROM Book AS T5 JOIN Books_Order AS T6 ON T5.ISBN = T6.ISBN JOIN Orders AS T7 ON T6.IdOrder = T7.IdOrder JOIN Client AS T8 ON T7.IdClient = T8.IdClient WHERE T8.Name = 'James Smith')
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder JOIN Book AS T4 ON T3.ISBN = T4.ISBN WHERE T4.Title = 'Pride and Prejudice'
SELECT DISTINCT T1.Name FROM Client AS T1 JOIN Orders AS T2 ON T1.IdClient = T2.IdClient JOIN Books_Order AS T3 ON T2.IdOrder = T3.IdOrder JOIN Book AS T4 ON T3.ISBN = T4.ISBN WHERE T4.Title = 'Pride and Prejudice'
SELECT COUNT(*) FROM book
SELECT Title FROM book ORDER BY Title
SELECT Title FROM book ORDER BY Pages DESC
SELECT Type, Release FROM book
SELECT Book_ID, Title, MAX(Chapters) AS Max_Chapters, MIN(Chapters) AS Min_Chapters FROM book GROUP BY Book_ID, Title
SELECT Title FROM book WHERE Type != 'Poet'
SELECT AVG(Rating) FROM review
SELECT T1.Title, T2.Rating FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID
SELECT Rating FROM review WHERE Book_ID IN (SELECT Book_ID FROM book ORDER BY Chapters DESC LIMIT 1)
SELECT Rank FROM review WHERE Book_ID IN (SELECT Book_ID FROM book ORDER BY Pages ASC LIMIT 1)
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Rank DESC LIMIT 1
SELECT AVG(T2.Readers_in_Million) FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID WHERE T1.Type = 'Novel'
SELECT Type, COUNT(*) FROM book GROUP BY Type
SELECT Type FROM book GROUP BY Type ORDER BY count(*) DESC LIMIT 1
SELECT Type FROM book GROUP BY Type HAVING COUNT(Book_ID) >= 3
SELECT T1.Title FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Rating
SELECT T1.Title, T1.Audio FROM book AS T1 JOIN review AS T2 ON T1.Book_ID = T2.Book_ID ORDER BY T2.Readers_in_Million DESC
SELECT COUNT(*) FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT Type FROM book WHERE Type IN (SELECT Type FROM book WHERE Chapters > 75) AND Type IN (SELECT Type FROM book WHERE Chapters < 50) GROUP BY Type
SELECT COUNT(DISTINCT Type) FROM book
SELECT Type, Title FROM book WHERE Book_ID NOT IN (SELECT Book_ID FROM review)
SELECT COUNT(*) FROM customer
SELECT COUNT(*) FROM customer
SELECT Name FROM customer ORDER BY Level_of_Membership
SELECT Name FROM customer ORDER BY Level_of_Membership
SELECT Nationality, Card_Credit FROM customer
SELECT Nationality, Card_Credit FROM customer
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT Name FROM customer WHERE Nationality IN ('England', 'Australia')
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT AVG(Card_Credit) FROM customer WHERE Level_of_Membership > 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Card_Credit FROM customer ORDER BY Level_of_Membership DESC LIMIT 1
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality, COUNT(Customer_ID) FROM customer GROUP BY Nationality
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM customer WHERE Card_Credit < 50 INTERSECT SELECT Nationality FROM customer WHERE Card_Credit > 75
SELECT Nationality FROM customer WHERE Nationality IN (SELECT Nationality FROM customer WHERE Card_Credit > 50) AND Nationality IN (SELECT Nationality FROM customer WHERE Card_Credit < 75)
SELECT T1.Name, T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID
SELECT T1.Name, T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID
SELECT T1.Name, T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID ORDER BY T2.Quantity DESC
SELECT T1.Name, T2.Dish_Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID ORDER BY T2.Quantity DESC
SELECT T1.Name, SUM(T2.Quantity) FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T1.Name
SELECT T2.Name, SUM(T1.Quantity) FROM customer_order AS T1 JOIN customer AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T2.Name
SELECT T1.* FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T2.Customer_ID HAVING SUM(T2.Quantity) > 1
SELECT T1.Name FROM customer AS T1 JOIN customer_order AS T2 ON T1.Customer_ID = T2.Customer_ID GROUP BY T2.Customer_ID HAVING SUM(T2.Quantity) > 1
SELECT DISTINCT Manager FROM branch
SELECT DISTINCT Manager FROM branch
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT Name FROM customer WHERE Customer_ID NOT IN (SELECT Customer_ID FROM customer_order)
SELECT COUNT(*) FROM member
SELECT Name FROM member ORDER BY Age
SELECT Name, Nationality FROM member
SELECT Name FROM member WHERE Nationality != 'England'
SELECT Name FROM member WHERE Age IN (19, 20)
SELECT Name FROM member ORDER BY Age DESC LIMIT 1
SELECT Nationality, COUNT(Member_ID) FROM member GROUP BY Nationality
SELECT Nationality FROM member GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1
SELECT Nationality FROM member GROUP BY Nationality HAVING COUNT(Member_ID) >= 2
SELECT T1.Name, T3.Club_Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID JOIN club AS T3 ON T2.Club_ID = T3.Club_ID
SELECT DISTINCT T2.Name FROM club AS T1 JOIN club_leader AS T3 ON T1.Club_ID = T3.Club_ID JOIN member AS T2 ON T3.Member_ID = T2.Member_ID WHERE T1.Overall_Ranking > 100
SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID WHERE T2.Year_Join < 2018
SELECT T1.Name FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID JOIN club AS T3 ON T2.Club_ID = T3.Club_ID WHERE T3.Club_Name = 'Houston'
SELECT Name FROM member WHERE Member_ID NOT IN (SELECT Member_ID FROM club_leader)
SELECT Nationality FROM member WHERE Age > 22 INTERSECT SELECT Nationality FROM member WHERE Age < 19
SELECT AVG(T1.Age) FROM member AS T1 JOIN club_leader AS T2 ON T1.Member_ID = T2.Member_ID
SELECT Club_Name FROM club WHERE Club_Name LIKE '%state%'
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Name FROM Collection_Subsets
SELECT Collection_Subset_Details FROM Collection_Subsets WHERE Collection_Subset_Name = 'Top collection'
SELECT T1.Collection_Description FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID JOIN Collection_Subsets AS T3 ON T2.Collection_Subset_ID = T3.Collection_Subset_ID WHERE T3.Collection_Subset_Name = 'Top collection'
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Name FROM Document_Subsets
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Subset_Details FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Objects
SELECT Document_Object_ID FROM Document_Objects
SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Owner FROM Document_Objects WHERE Description = 'Braeden Collection'
SELECT DISTINCT T1.Owner FROM Document_Objects AS T1 JOIN Documents_in_Collections AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID WHERE T3.Collection_Description = 'Braeden Collection'
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Owner = 'Marlin')
SELECT DISTINCT Description FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL
SELECT DISTINCT Description FROM Document_Objects WHERE Document_Object_ID IN (SELECT Parent_Document_Object_ID FROM Document_Objects)
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT COUNT(*) FROM Document_Objects WHERE Owner = 'Marlin'
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Document_Object_ID FROM Document_Objects WHERE Document_Object_ID NOT IN (SELECT Parent_Document_Object_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL)
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID
SELECT Parent_Document_Object_ID, COUNT(Document_Object_ID) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Collection_Name FROM Collections
SELECT Collection_Name FROM Collections
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT Collection_Description FROM Collections WHERE Collection_Name = 'Best'
SELECT parent.Collection_Name FROM Collections AS child JOIN Collections AS parent ON child.Parent_Collection_ID = parent.Collection_ID WHERE child.Collection_Name = 'Nice'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Collections AS T2 ON T1.Collection_ID = T2.Parent_Collection_ID WHERE T2.Collection_Name = 'Nice'
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Collection_Name FROM Collections WHERE Collection_ID NOT IN (SELECT Parent_Collection_ID FROM Collections WHERE Parent_Collection_ID IS NOT NULL)
SELECT Parent_Document_Object_ID AS Document_ID FROM Document_Objects WHERE Parent_Document_Object_ID IS NOT NULL GROUP BY Parent_Document_Object_ID HAVING COUNT(Document_Object_ID) > 1
SELECT Parent_Document_Object_ID FROM Document_Objects GROUP BY Parent_Document_Object_ID HAVING COUNT(*) > 1
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(*) FROM Collections WHERE Parent_Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT DISTINCT T2.Related_Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID WHERE T1.Owner = 'Ransom'
SELECT T1.Related_Document_Object_ID FROM Document_Subset_Members AS T1 JOIN Document_Objects AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID WHERE T2.Owner = 'Ransom'
SELECT T1.Collection_Subset_ID, T1.Collection_Subset_Name, COUNT(T2.Collection_ID) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID, T1.Collection_Subset_Name
SELECT T1.Collection_Subset_ID, T1.Collection_Subset_Name, COUNT(T2.Collection_ID) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID GROUP BY T1.Collection_Subset_ID, T1.Collection_Subset_Name
SELECT Parent_Document_Object_ID, COUNT(*) AS NumberOfChildren FROM Document_Objects GROUP BY Parent_Document_Object_ID ORDER BY NumberOfChildren DESC LIMIT 1
SELECT Parent_Document_Object_ID, COUNT(*) FROM Document_Objects GROUP BY Parent_Document_Object_ID
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS related_count FROM Document_Subset_Members GROUP BY Document_Object_ID ORDER BY related_count ASC LIMIT 1
SELECT Document_Object_ID FROM Documents_in_Collections GROUP BY Document_Object_ID ORDER BY COUNT(*) ASC LIMIT 1
SELECT T1.Document_Object_ID, COUNT(T2.Document_Object_ID) AS Related_Documents_Count FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID GROUP BY T1.Document_Object_ID HAVING COUNT(T2.Document_Object_ID) BETWEEN 2 AND 4
SELECT Document_Object_ID, COUNT(Related_Document_Object_ID) AS related_count FROM Document_Subset_Members GROUP BY Document_Object_ID HAVING related_count BETWEEN 2 AND 4
SELECT DISTINCT T2.Owner FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Related_Document_Object_ID WHERE T1.Owner = 'Braeden'
SELECT DISTINCT Owner FROM Document_Objects WHERE Document_Object_ID IN (SELECT Related_Document_Object_ID FROM Document_Subset_Members WHERE Document_Object_ID IN (SELECT Document_Object_ID FROM Document_Objects WHERE Owner = 'Braeden'))
SELECT DISTINCT T1.Document_Subset_Name FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID = T3.Document_Object_ID WHERE T3.Owner = 'Braeden'
SELECT DISTINCT T2.Document_Subset_Name FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T3 ON T1.Document_Object_ID = T3.Document_Object_ID JOIN Document_Subsets AS T2 ON T3.Document_Subset_ID = T2.Document_Subset_ID WHERE T1.Owner = 'Braeden'
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name, COUNT(DISTINCT T2.Document_Object_ID) FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID, T1.Document_Subset_Name
SELECT T1.Collection_Subset_ID, T1.Collection_Subset_Name, COUNT(DISTINCT T3.Document_Object_ID) FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID JOIN Documents_in_Collections AS T3 ON T2.Collection_ID = T3.Collection_ID GROUP BY T1.Collection_Subset_ID, T1.Collection_Subset_Name
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name, COUNT(DISTINCT T2.Document_Object_ID) AS num_documents FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID, T1.Document_Subset_Name ORDER BY num_documents DESC LIMIT 1
SELECT T1.Document_Subset_ID, T1.Document_Subset_Name, COUNT(T2.Document_Object_ID) AS doc_count FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID GROUP BY T1.Document_Subset_ID ORDER BY doc_count DESC LIMIT 1
SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000'
SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best for 2000'
SELECT T1.Document_Subset_Name, T2.Document_Object_ID FROM Document_Subsets AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Subset_ID = T2.Document_Subset_ID
SELECT T2.Document_Subset_Name, T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T3 ON T1.Document_Object_ID = T3.Document_Object_ID JOIN Document_Subsets AS T2 ON T3.Document_Subset_ID = T2.Document_Subset_ID
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID = T3.Document_Object_ID WHERE T3.Owner = 'Ransom'
SELECT T1.Collection_Name FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID JOIN Document_Objects AS T3 ON T2.Document_Object_ID = T3.Document_Object_ID WHERE T3.Owner = 'Ransom'
SELECT Document_Object_ID, COUNT(Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT Document_Object_ID, COUNT(DISTINCT Collection_ID) FROM Documents_in_Collections GROUP BY Document_Object_ID
SELECT COUNT(Document_Object_ID) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT COUNT(Document_Object_ID) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT COUNT(Document_Object_ID) FROM Documents_in_Collections JOIN Collections ON Documents_in_Collections.Collection_ID = Collections.Collection_ID WHERE Collections.Collection_Name = 'Best'
SELECT T1.Collection_Name, T1.Collection_ID, COUNT(T2.Document_Object_ID) AS NumberOfDocuments FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID GROUP BY T1.Collection_ID, T1.Collection_Name ORDER BY NumberOfDocuments DESC LIMIT 1
SELECT T1.Collection_ID, T1.Collection_Name, COUNT(T2.Document_Object_ID) AS doc_count FROM Collections AS T1 JOIN Documents_in_Collections AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best' GROUP BY T1.Collection_ID ORDER BY doc_count DESC LIMIT 1
SELECT DISTINCT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID = T3.Document_Subset_ID JOIN Documents_in_Collections AS T4 ON T1.Document_Object_ID = T4.Document_Object_ID JOIN Collections AS T5 ON T4.Collection_ID = T5.Collection_ID WHERE T3.Document_Subset_Name = 'Best for 2000' AND T5.Collection_Name = 'Best'
SELECT DISTINCT DSM.Document_Object_ID FROM Document_Subset_Members DSM JOIN Document_Subsets DS ON DSM.Document_Subset_ID = DS.Document_Subset_ID JOIN Documents_in_Collections DIC ON DSM.Document_Object_ID = DIC.Document_Object_ID JOIN Collections C ON DIC.Collection_ID = C.Collection_ID WHERE DS.Document_Subset_Name = 'Best for 2000' AND C.Collection_Name = 'Best'
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members JOIN Document_Subsets ON Document_Subset_Members.Document_Subset_ID = Document_Subsets.Document_Subset_ID WHERE Document_Subsets.Document_Subset_Name = 'Best' AND Document_Subsets.Document_Subset_Details = '2000')
SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best') AND Document_Object_ID NOT IN (SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000'))
SELECT Document_Object_ID FROM Document_Subset_Members WHERE Document_Subset_ID IN (SELECT Document_Subset_ID FROM Document_Subsets WHERE Document_Subset_Name = 'Best for 2000') UNION SELECT Document_Object_ID FROM Documents_in_Collections WHERE Collection_ID IN (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT DISTINCT T1.Document_Object_ID FROM Document_Objects AS T1 JOIN Document_Subset_Members AS T2 ON T1.Document_Object_ID = T2.Document_Object_ID JOIN Document_Subsets AS T3 ON T2.Document_Subset_ID = T3.Document_Subset_ID JOIN Documents_in_Collections AS T4 ON T1.Document_Object_ID = T4.Document_Object_ID JOIN Collections AS T5 ON T4.Collection_ID = T5.Collection_ID WHERE T3.Document_Subset_Name = 'Best for 2000' OR T5.Collection_Name = 'Best'
SELECT T2.Collection_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T3 ON T1.Collection_ID = T3.Collection_ID JOIN Collections AS T2 ON T3.Related_Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best'
SELECT DISTINCT C2.Collection_Name FROM Collections AS C1 JOIN Collection_Subset_Members AS CSM ON C1.Collection_ID = CSM.Collection_ID JOIN Collections AS C2 ON CSM.Related_Collection_ID = C2.Collection_ID WHERE C1.Collection_Name = 'Best'
SELECT COUNT(*) FROM Collections AS C1 JOIN Collection_Subset_Members AS CSM ON C1.Collection_ID = CSM.Collection_ID WHERE CSM.Related_Collection_ID = (SELECT Collection_ID FROM Collections WHERE Collection_Name = 'Best')
SELECT COUNT(DISTINCT T2.Related_Collection_ID) FROM Collections AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_ID = T2.Collection_ID WHERE T1.Collection_Name = 'Best'
SELECT T1.Collection_Subset_Name FROM Collection_Subsets AS T1 JOIN Collection_Subset_Members AS T2 ON T1.Collection_Subset_ID = T2.Collection_Subset_ID JOIN Collections AS T3 ON T2.Collection_ID = T3.Collection_ID WHERE T3.Collection_Name = 'Best'
SELECT T2.Collection_Subset_Name FROM Collections AS T1 JOIN Collection_Subset_Members AS T3 ON T1.Collection_ID = T3.Collection_ID JOIN Collection_Subsets AS T2 ON T3.Collection_Subset_ID = T2.Collection_Subset_ID WHERE T1.Collection_Name = 'Best'
SELECT COUNT(*) FROM songs WHERE name LIKE '%Love%'
SELECT name FROM songs ORDER BY name
SELECT name, language FROM songs
SELECT MAX(voice_sound_quality), MIN(voice_sound_quality) FROM performance_score
SELECT voice_sound_quality, rhythm_tempo, stage_presence FROM performance_score JOIN participants ON performance_score.participant_id = participants.id WHERE participants.name = 'Freeway'
SELECT id, language, original_artist FROM songs WHERE name != 'Love'
SELECT name, original_artist FROM songs WHERE english_translation = 'All the streets of love'
SELECT DISTINCT T1.stage_presence FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id WHERE T2.language = 'English'
SELECT T1.id, T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id = T2.participant_id GROUP BY T1.id HAVING COUNT(DISTINCT T2.songs_id) >= 2
SELECT T1.id, T1.name, T1.popularity FROM participants AS T1 JOIN performance_score AS T2 ON T1.id = T2.participant_id GROUP BY T1.id ORDER BY COUNT(T2.songs_id) DESC
SELECT T1.id, T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id = T2.participant_id WHERE T2.voice_sound_quality = 5 OR T2.rhythm_tempo = 5
SELECT voice_sound_quality FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.name = 'The Balkan Girls' AND songs.language = 'English'
SELECT T1.id, T1.name FROM songs AS T1 JOIN (SELECT songs_id, COUNT(participant_id) AS participant_count FROM performance_score GROUP BY songs_id) AS T2 ON T1.id = T2.songs_id ORDER BY T2.participant_count DESC LIMIT 1
SELECT COUNT(*) FROM performance_score WHERE stage_presence < 7 OR stage_presence > 9
SELECT COUNT(*) FROM songs WHERE id NOT IN (SELECT songs_id FROM performance_score)
SELECT AVG(T1.rhythm_tempo), T2.language FROM performance_score AS T1 JOIN songs AS T2 ON T1.songs_id = T2.id GROUP BY T2.language
SELECT DISTINCT T1.name FROM participants AS T1 JOIN performance_score AS T2 ON T1.id = T2.participant_id JOIN songs AS T3 ON T2.songs_id = T3.id WHERE T3.language = 'English'
SELECT name, popularity FROM participants WHERE id IN (SELECT participant_id FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'Croatian' INTERSECT SELECT participant_id FROM performance_score JOIN songs ON performance_score.songs_id = songs.id WHERE songs.language = 'English')
SELECT name FROM songs WHERE name LIKE '%Is%'
SELECT T1.original_artist FROM songs AS T1 JOIN performance_score AS T2 ON T1.id = T2.songs_id WHERE T2.rhythm_tempo > 5 ORDER BY T2.voice_sound_quality DESC
SELECT COUNT(*) FROM City
SELECT COUNT(*) FROM City
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
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT COUNT(*) FROM City WHERE country = 'Canada'
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT city_name FROM City WHERE country = 'USA' ORDER BY latitude
SELECT state, COUNT(city_code) FROM City GROUP BY state
SELECT state, COUNT(city_name) FROM City GROUP BY state
SELECT country, COUNT(city_code) FROM City GROUP BY country
SELECT country, COUNT(*) FROM City GROUP BY country
SELECT state FROM City GROUP BY state HAVING COUNT(city_name) >= 2
SELECT state FROM City GROUP BY state HAVING COUNT(city_name) >= 2
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT state FROM City GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT country FROM City GROUP BY country ORDER BY COUNT(*) ASC LIMIT 1
SELECT Fname, LName FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT Fname, LName FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.state = 'MD'
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country = 'China'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT Fname, Major FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.city_name = 'Baltimore'
SELECT country, COUNT(*) FROM Student JOIN City ON Student.city_code = City.city_code GROUP BY country
SELECT COUNT(T1.StuID), T2.country FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.country
SELECT City.city_name, COUNT(Student.StuID) FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY City.city_name
SELECT T2.city_name, COUNT(*) FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code GROUP BY T2.city_name
SELECT T1.state FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.state ORDER BY count(T2.StuID) DESC LIMIT 1
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.country ORDER BY COUNT(T2.StuID) ASC LIMIT 1
SELECT T1.country FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.country ORDER BY COUNT(T2.StuID) ASC LIMIT 1
SELECT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_name HAVING COUNT(*) >= 3
SELECT T1.city_name FROM City AS T1 JOIN Student AS T2 ON T1.city_code = T2.city_code GROUP BY T1.city_name HAVING COUNT(T2.StuID) >= 3
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state HAVING COUNT(*) > 5
SELECT state FROM City JOIN Student ON City.city_code = Student.city_code GROUP BY state HAVING COUNT(Student.StuID) > 5
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE City.country != 'USA'
SELECT T1.StuID FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Sex = 'F' AND T2.state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'female' AND state = 'PA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'Male' AND country != 'USA'
SELECT StuID FROM Student JOIN City ON Student.city_code = City.city_code WHERE Sex = 'male' AND country != 'USA'
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') OR (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT distance FROM Direct_distance WHERE (city1_code = 'BAL' AND city2_code = 'CHI') OR (city1_code = 'CHI' AND city2_code = 'BAL')
SELECT distance FROM Direct_distance JOIN City AS C1 ON Direct_distance.city1_code = C1.city_code JOIN City AS C2 ON Direct_distance.city2_code = C2.city_code WHERE C1.city_name = 'Boston' AND C2.city_name = 'Newark'
SELECT distance FROM Direct_distance WHERE (city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Newark')) OR (city1_code = (SELECT city_code FROM City WHERE city_name = 'Newark') AND city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston'))
SELECT AVG(distance), MIN(distance), MAX(distance) FROM Direct_distance
SELECT AVG(distance), MIN(distance), MAX(distance) FROM Direct_distance
SELECT city1_code, city2_code FROM Direct_distance ORDER BY distance DESC LIMIT 1
SELECT city1_code, city2_code FROM Direct_distance WHERE distance = (SELECT max(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance > (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code FROM Direct_distance WHERE distance > (SELECT avg(distance) FROM Direct_distance) UNION SELECT city2_code FROM Direct_distance WHERE distance > (SELECT avg(distance) FROM Direct_distance)
SELECT city1_code, city2_code FROM Direct_distance WHERE distance < 1000
SELECT DISTINCT city_code FROM City WHERE city_code IN (SELECT city1_code FROM Direct_distance WHERE distance < 1000) OR city_code IN (SELECT city2_code FROM Direct_distance WHERE distance < 1000)
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT SUM(distance) FROM Direct_distance WHERE city1_code = 'BAL' OR city2_code = 'BAL'
SELECT AVG(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code = (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT AVG(distance) FROM Direct_distance WHERE city1_code IN (SELECT city_code FROM City WHERE city_name = 'Boston') OR city2_code IN (SELECT city_code FROM City WHERE city_name = 'Boston')
SELECT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY T2.distance ASC LIMIT 1
SELECT T1.city_name FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city2_code WHERE T2.city1_code = (SELECT city_code FROM City WHERE city_name = 'Chicago') ORDER BY T2.distance ASC LIMIT 1
SELECT city_name FROM City WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE distance = (SELECT max(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston')))
SELECT city_name FROM City WHERE city_code IN (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston') AND distance = (SELECT max(distance) FROM Direct_distance WHERE city1_code = (SELECT city_code FROM City WHERE city_name = 'Boston')))
SELECT T1.city_code, SUM(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code GROUP BY T1.city_code
SELECT city_code, SUM(distance) FROM (SELECT city1_code AS city_code, distance FROM Direct_distance UNION ALL SELECT city2_code AS city_code, distance FROM Direct_distance) AS combined GROUP BY city_code
SELECT T1.city_name, AVG(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code GROUP BY T1.city_name
SELECT T1.city_name, AVG(T2.distance) FROM City AS T1 JOIN Direct_distance AS T2 ON T1.city_code = T2.city1_code GROUP BY T1.city_name
SELECT T4.distance FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code JOIN Direct_distance AS T3 ON T2.city_code = T3.city1_code JOIN Direct_distance AS T4 ON T2.city_code = T4.city2_code WHERE (T1.Fname = 'Linda' AND T1.LName = 'Smith') AND (T1.Fname = 'Tracy' AND T1.LName = 'Kim')
SELECT T3.distance FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code JOIN Direct_distance AS T3 ON T2.city_code = T3.city1_code OR T2.city_code = T3.city2_code WHERE (T1.Fname = 'Linda' AND T1.LName = 'Smith') AND EXISTS (SELECT 1 FROM Student WHERE Fname = 'Tracy' AND LName = 'Kim' AND city_code = T3.city2_code) OR (T1.Fname = 'Tracy' AND T1.LName = 'Kim') AND EXISTS (SELECT 1 FROM Student WHERE Fname = 'Linda' AND LName = 'Smith' AND city_code = T3.city1_code)
SELECT T1.Fname, T1.LName FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code JOIN Direct_distance AS T3 ON T2.city_code = T3.city1_code WHERE T1.Fname = 'Linda' AND T1.LName = 'Smith' ORDER BY T3.distance DESC LIMIT 1
SELECT Fname, LName FROM Student WHERE city_code = (SELECT city2_code FROM Direct_distance WHERE city1_code = (SELECT city_code FROM Student WHERE Fname = 'Linda' AND LName = 'Smith') ORDER BY distance DESC LIMIT 1)
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT T2.state FROM Student AS T1 JOIN City AS T2 ON T1.city_code = T2.city_code WHERE T1.Fname = 'Linda'
SELECT * FROM Sailors WHERE age > 30
SELECT * FROM Sailors WHERE age > 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT name, age FROM Sailors WHERE age < 30
SELECT Boats.* FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid WHERE Reserves.sid = 1
SELECT DISTINCT bid FROM Reserves WHERE sid = 1
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 102
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 102
SELECT DISTINCT bid FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid
SELECT DISTINCT bid FROM Boats JOIN Reserves ON Boats.bid = Reserves.bid
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT name FROM Sailors WHERE name LIKE '%e%'
SELECT sid FROM Sailors WHERE age = (SELECT max(age) FROM Sailors)
SELECT sid FROM Sailors WHERE age > (SELECT MIN(age) FROM Sailors)
SELECT DISTINCT name FROM Sailors WHERE age > (SELECT max(age) FROM Sailors WHERE rating > 7)
SELECT DISTINCT S1.name FROM Sailors AS S1, Sailors AS S2 WHERE S1.age > S2.age AND S2.rating > 7
SELECT DISTINCT T1.name, T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid
SELECT DISTINCT T1.sid, T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid
SELECT T1.sid, T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid GROUP BY T1.sid HAVING COUNT(DISTINCT T2.bid) > 1
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid GROUP BY T1.sid HAVING COUNT(DISTINCT T2.bid) >= 2
SELECT DISTINCT T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color = 'red' OR T3.color = 'blue'
SELECT DISTINCT T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color = 'red' OR T3.color = 'blue'
SELECT DISTINCT T1.name, T1.sid FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color IN ('red', 'blue')
SELECT DISTINCT T1.sid, T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color = 'red' OR T3.color = 'blue'
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'red') AND sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'blue')
SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'red') INTERSECT SELECT sid FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'blue')
SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red' INTERSECT SELECT S.sid, S.name FROM Sailors S JOIN Reserves R ON S.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'blue'
SELECT Sailors.sid, Sailors.name FROM Sailors WHERE sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'red') AND sid IN (SELECT sid FROM Reserves JOIN Boats ON Reserves.bid = Boats.bid WHERE color = 'blue')
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT name, sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid, name FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT sid FROM Sailors WHERE sid NOT IN (SELECT sid FROM Reserves)
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 103
SELECT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T2.bid = 103
SELECT DISTINCT s1.name FROM Sailors s1 WHERE s1.rating > (SELECT MAX(s2.rating) FROM Sailors s2 WHERE s2.name = 'Luis');
SELECT name FROM Sailors WHERE rating > (SELECT max(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > (SELECT max(rating) FROM Sailors WHERE name = 'Luis')
SELECT name FROM Sailors WHERE rating > ALL (SELECT rating FROM Sailors WHERE name = 'Luis')
SELECT DISTINCT T1.sid, T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T1.rating > 2
SELECT DISTINCT T1.sid, T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid WHERE T1.rating >= 3
SELECT name, age FROM Sailors ORDER BY age DESC LIMIT 1
SELECT name, age FROM Sailors WHERE age = (SELECT MAX(age) FROM Sailors)
SELECT COUNT(*) FROM Sailors
SELECT COUNT(*) FROM Sailors
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT AVG(age) FROM Sailors WHERE rating = 7
SELECT COUNT(*) FROM Sailors WHERE name LIKE 'D%'
SELECT COUNT(sid) FROM Sailors WHERE name LIKE 'D%'
SELECT AVG(rating), MAX(age) FROM Sailors
SELECT AVG(rating), MAX(age) FROM Sailors
SELECT B.name, COUNT(*) AS reservation_count FROM Boats B JOIN Reserves R ON B.bid = R.bid GROUP BY B.name
SELECT B.name, COUNT(R.bid) FROM Boats B JOIN Reserves R ON B.bid = R.bid GROUP BY B.name
SELECT T1.bid, COUNT(*) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid = T2.bid WHERE T1.bid > 50 GROUP BY T1.bid
SELECT T1.bid, COUNT(*) FROM Reserves AS T1 JOIN Boats AS T2 ON T1.bid = T2.bid WHERE T2.bid > 50 GROUP BY T1.bid
SELECT T1.bid, COUNT(T1.sid) FROM Reserves AS T1 GROUP BY T1.bid HAVING COUNT(T1.sid) > 1
SELECT bid, COUNT(*) FROM Reserves GROUP BY bid HAVING COUNT(*) > 1
SELECT T1.bid, COUNT(*) FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid = T2.sid WHERE T2.sid > 1 GROUP BY T1.bid
SELECT T1.bid, COUNT(*) FROM Reserves AS T1 JOIN Sailors AS T2 ON T1.sid = T2.sid WHERE T2.sid > 1 GROUP BY T1.bid
SELECT T1.rating, AVG(T1.age) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color = 'red' GROUP BY T1.rating
SELECT T1.rating, AVG(T1.age) FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.color = 'red' GROUP BY T1.rating
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT name, rating, age FROM Sailors ORDER BY rating, age
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT COUNT(*) FROM Boats WHERE color = 'red'
SELECT DISTINCT T1.name FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid = T2.bid JOIN Sailors AS T3 ON T2.sid = T3.sid WHERE T3.age BETWEEN 20 AND 30
SELECT DISTINCT T1.name FROM Boats AS T1 JOIN Reserves AS T2 ON T1.bid = T2.bid JOIN Sailors AS T3 ON T2.sid = T3.sid WHERE T3.age BETWEEN 20 AND 30
SELECT name FROM Sailors WHERE rating > (SELECT MAX(S1.rating) FROM Sailors AS S1 JOIN Reserves AS R ON S1.sid = R.sid JOIN Boats AS B ON R.bid = B.bid WHERE B.color = 'Red')
SELECT S.name FROM Sailors S WHERE S.rating > (SELECT MAX(S1.rating) FROM Sailors S1 JOIN Reserves R ON S1.sid = R.sid JOIN Boats B ON R.bid = B.bid WHERE B.color = 'red')
SELECT MAX(rating) FROM Sailors
SELECT MAX(rating) FROM Sailors
SELECT DISTINCT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.name = 'Melon'
SELECT DISTINCT T1.name FROM Sailors AS T1 JOIN Reserves AS T2 ON T1.sid = T2.sid JOIN Boats AS T3 ON T2.bid = T3.bid WHERE T3.name = 'Melon'
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT name, age FROM Sailors ORDER BY rating DESC
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT Model FROM headphone ORDER BY Price DESC LIMIT 1
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT DISTINCT Model FROM headphone ORDER BY Model
SELECT Class FROM headphone GROUP BY Class ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.Class FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Class ORDER BY SUM(T2.Quantity) DESC LIMIT 1
SELECT T1.Class FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Class HAVING sum(T2.Quantity) > 2
SELECT Class FROM headphone GROUP BY Class HAVING COUNT(Headphone_ID) <= 2
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT Class, COUNT(*) FROM headphone WHERE Price > 200 GROUP BY Class
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT COUNT(DISTINCT Earpads) FROM headphone
SELECT Earpads, SUM(Quantity) AS TotalQuantity FROM headphone JOIN stock ON headphone.Headphone_ID = stock.Headphone_ID GROUP BY Earpads ORDER BY TotalQuantity DESC LIMIT 2
SELECT Earpads, COUNT(Headphone_ID) FROM headphone GROUP BY Earpads ORDER BY COUNT(Headphone_ID) DESC LIMIT 2
SELECT Model, Class, Construction FROM headphone ORDER BY Price LIMIT 1
SELECT Model, Class, Construction FROM headphone ORDER BY Price ASC LIMIT 1
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT Construction, AVG(Price) FROM headphone GROUP BY Construction
SELECT Class FROM headphone WHERE Earpads = 'Bowls' INTERSECT SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads'
SELECT Class FROM headphone WHERE Earpads = 'Bowls' INTERSECT SELECT Class FROM headphone WHERE Earpads = 'Comfort Pads'
SELECT Earpads FROM headphone WHERE Earpads NOT IN (SELECT Earpads FROM headphone WHERE Construction = 'plastic')
SELECT Earpads FROM headphone WHERE Construction != 'plastic'
SELECT Model FROM headphone WHERE Price < (SELECT avg(Price) FROM headphone)
SELECT Model FROM headphone WHERE Price < (SELECT avg(Price) FROM headphone)
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name FROM store ORDER BY Date_Opened
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT Name, Parking FROM store WHERE Neighborhood = 'Tarzana'
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT COUNT(DISTINCT Neighborhood) FROM store
SELECT Neighborhood, COUNT(Store_ID) FROM store GROUP BY Neighborhood
SELECT Neighborhood, COUNT(*) FROM store GROUP BY Neighborhood
SELECT T1.Name, SUM(T2.Quantity) FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID GROUP BY T1.Store_ID ORDER BY SUM(T2.Quantity) DESC LIMIT 1
SELECT T1.Name, SUM(T2.Quantity) FROM store AS T1 JOIN stock AS T2 ON T1.Store_ID = T2.Store_ID GROUP BY T1.Name
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT Name FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT Model FROM headphone WHERE Headphone_ID NOT IN (SELECT Headphone_ID FROM stock)
SELECT T1.Model FROM headphone AS T1 JOIN stock AS T2 ON T1.Headphone_ID = T2.Headphone_ID GROUP BY T1.Model ORDER BY SUM(T2.Quantity) DESC LIMIT 1
SELECT Model FROM headphone WHERE Headphone_ID IN (SELECT Headphone_ID FROM stock GROUP BY Headphone_ID ORDER BY SUM(Quantity) DESC LIMIT 1)
SELECT SUM(T1.Quantity) FROM stock AS T1 JOIN store AS T2 ON T1.Store_ID = T2.Store_ID WHERE T2.Name = 'Woodman'
SELECT SUM(T1.Quantity) FROM stock AS T1 JOIN store AS T2 ON T1.Store_ID = T2.Store_ID WHERE T2.Name = 'Woodman'
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT Neighborhood FROM store WHERE Store_ID NOT IN (SELECT Store_ID FROM stock WHERE Quantity > 0)
SELECT COUNT(*) FROM Author
SELECT COUNT(*) FROM Author
SELECT COUNT(*) FROM Paper
SELECT COUNT(*) FROM Paper
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Affiliation
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(*) FROM Paper WHERE venue = 'NAACL' AND year = 2000
SELECT COUNT(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T1.year = 2009 AND T3.name = 'Columbia University'
SELECT COUNT(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University' AND T1.year = 2009
SELECT name, address FROM Affiliation
SELECT name, address FROM Affiliation
SELECT venue, year FROM Paper ORDER BY year
SELECT DISTINCT venue FROM Paper ORDER BY year
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Harvard University'
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Harvard University'
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown'
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown'
SELECT T1.paper_id, T1.title FROM Paper AS T1 WHERE T1.paper_id IN (SELECT T2.paper_id FROM Author_list AS T2 JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name IN ('Stanford University', 'Columbia University') GROUP BY T2.paper_id HAVING COUNT(DISTINCT T3.name) = 2)
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Stanford' INTERSECT SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University'
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY T1.paper_id, T1.title HAVING COUNT(DISTINCT T3.name) = 2
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name IN ('Mckeown, Kathleen', 'Rambow, Owen') GROUP BY T1.paper_id, T1.title HAVING COUNT(DISTINCT T3.name) = 2
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown' AND Paper.paper_id NOT IN (SELECT paper_id FROM Author_list JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Rambow')
SELECT Paper.title, Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Mckeown' AND Paper.paper_id NOT IN (SELECT Paper.paper_id FROM Paper JOIN Author_list ON Paper.paper_id = Author_list.paper_id JOIN Author ON Author_list.author_id = Author.author_id WHERE Author.name = 'Rambow')
SELECT T1.paper_id, T1.title FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name IN ('Mckeown, Kathleen', 'Rambow, Owen')
SELECT T1.title, T1.paper_id FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen' OR T3.name = 'Rambow, Owen'
SELECT T1.name, COUNT(T2.paper_id) AS num_papers FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id GROUP BY T1.name ORDER BY num_papers DESC
SELECT T1.author_id, COUNT(T2.paper_id) AS num_papers FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.author_id ORDER BY num_papers
SELECT T1.name, COUNT(T2.paper_id) AS num_papers FROM Affiliation AS T1 LEFT JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.name ORDER BY num_papers ASC
SELECT T1.name, COUNT(T2.paper_id) FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.name ORDER BY COUNT(T2.paper_id) DESC
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id GROUP BY T1.author_id HAVING COUNT(*) > 50
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id GROUP BY T1.author_id HAVING COUNT(T2.paper_id) > 50
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list GROUP BY author_id HAVING COUNT(paper_id) = 1)
SELECT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id GROUP BY A.author_id HAVING COUNT(AL.paper_id) = 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue, year FROM Paper GROUP BY venue, year ORDER BY COUNT(*) DESC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT venue FROM Paper GROUP BY venue ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'A00-1002'
SELECT COUNT(*) FROM Citation WHERE paper_id = 'D12-1027'
SELECT COUNT(*) FROM Citation WHERE cited_paper_id = 'D12-1027'
SELECT T1.paper_id, COUNT(T2.cited_paper_id) AS num_citations FROM Paper AS T1 LEFT JOIN Citation AS T2 ON T1.paper_id = T2.cited_paper_id GROUP BY T1.paper_id ORDER BY num_citations DESC LIMIT 1
SELECT cited_paper_id, COUNT(*) AS num_citations FROM Citation GROUP BY cited_paper_id ORDER BY num_citations DESC LIMIT 1
SELECT title FROM Paper WHERE paper_id = (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT title FROM Paper WHERE paper_id = (SELECT paper_id FROM Citation GROUP BY paper_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.title, COUNT(*) AS citation_count FROM Paper AS T1 JOIN Citation AS T2 ON T1.paper_id = T2.cited_paper_id GROUP BY T1.title ORDER BY citation_count DESC LIMIT 10
SELECT T1.title, COUNT(*) AS citation_count FROM Paper AS T1 JOIN Citation AS T2 ON T1.paper_id = T2.cited_paper_id GROUP BY T1.paper_id ORDER BY citation_count DESC LIMIT 10
SELECT COUNT(*) FROM Citation AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Citation AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT COUNT(T4.paper_id) FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Citation AS T4 ON T2.paper_id = T4.paper_id WHERE T1.name = 'Mckeown, Kathleen'
SELECT COUNT(*) FROM Author JOIN Author_list ON Author.author_id = Author_list.author_id JOIN Citation ON Author_list.paper_id = Citation.paper_id WHERE Author.name = 'Mckeown, Kathleen'
SELECT A.name, COUNT(*) AS citation_count FROM Author A JOIN Author_list AL ON A.author_id = AL.author_id JOIN Citation C ON AL.paper_id = C.paper_id GROUP BY A.author_id ORDER BY citation_count DESC LIMIT 1
SELECT T1.name, COUNT(*) AS citation_count FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Citation AS T3 ON T2.paper_id = T3.paper_id GROUP BY T1.author_id ORDER BY citation_count DESC LIMIT 1
SELECT T1.venue, T1.year FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT T1.venue, T1.year FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Author AS T3 ON T2.author_id = T3.author_id WHERE T3.name = 'Mckeown, Kathleen'
SELECT DISTINCT T1.venue, T1.year FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University'
SELECT DISTINCT T1.venue, T1.year FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University'
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY count(T3.paper_id) DESC LIMIT 1
SELECT T1.name FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY count(T3.paper_id) DESC LIMIT 1
SELECT T1.name FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.name ORDER BY COUNT(T3.paper_id) DESC LIMIT 3
SELECT T1.name, COUNT(T2.paper_id) AS paper_count FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.year = 2009 GROUP BY T1.affiliation_id ORDER BY paper_count DESC LIMIT 3
SELECT COUNT(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University' AND T1.year <= 2009
SELECT COUNT(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Columbia University' AND T1.year <= 2009
SELECT COUNT(T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Stanford University' AND T1.year BETWEEN 2000 AND 2009
SELECT COUNT(DISTINCT T1.paper_id) FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id WHERE T3.name = 'Stanford University' AND T1.year BETWEEN 2000 AND 2009
SELECT T2.title FROM Author_list AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id GROUP BY T1.paper_id ORDER BY COUNT(T1.author_id) DESC LIMIT 1
SELECT T2.title FROM (SELECT paper_id, COUNT(author_id) AS author_count FROM Author_list GROUP BY paper_id) AS T1 JOIN Paper AS T2 ON T1.paper_id = T2.paper_id ORDER BY T1.author_count DESC LIMIT 1
SELECT COUNT(DISTINCT T2.author_id) - 1 FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id WHERE T1.name = 'Mckeown, Kathleen'
SELECT COUNT(DISTINCT T2.author_id) FROM Author AS T1 JOIN Author_list AS T2 ON T1.author_id = T2.author_id JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T1.name = 'Mckeown, Kathleen' AND T2.author_id != T1.author_id
SELECT A.name FROM Author AS A JOIN Author_list AS AL ON A.author_id = AL.author_id WHERE AL.paper_id IN (SELECT AL2.paper_id FROM Author_list AS AL2 JOIN Author AS A2 ON AL2.author_id = A2.author_id WHERE A2.name = 'Mckeown, Kathleen') AND A.name != 'Mckeown, Kathleen' GROUP BY A.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT A2.name FROM Author AS A1 JOIN Author_list AS AL1 ON A1.author_id = AL1.author_id JOIN Paper AS P ON AL1.paper_id = P.paper_id JOIN Author_list AS AL2 ON P.paper_id = AL2.paper_id JOIN Author AS A2 ON AL2.author_id = A2.author_id WHERE A1.name = 'Mckeown, Kathleen' AND A2.name != 'Mckeown, Kathleen' GROUP BY A2.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id FROM Paper WHERE title LIKE '%translation%'
SELECT paper_id, title FROM Paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)
SELECT paper_id, title FROM Paper WHERE paper_id NOT IN (SELECT cited_paper_id FROM Citation)
SELECT name FROM Affiliation WHERE affiliation_id IN (SELECT affiliation_id FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.address LIKE '%China%' GROUP BY affiliation_id ORDER BY COUNT(paper_id) DESC LIMIT 1)
SELECT name FROM Affiliation WHERE affiliation_id IN (SELECT affiliation_id FROM Author_list JOIN Affiliation ON Author_list.affiliation_id = Affiliation.affiliation_id WHERE Affiliation.address LIKE '%China%' GROUP BY affiliation_id ORDER BY COUNT(paper_id) DESC LIMIT 1)
SELECT year, venue, COUNT(paper_id) FROM Paper GROUP BY year, venue
SELECT venue, year, COUNT(*) FROM Paper GROUP BY venue, year
SELECT COUNT(T1.paper_id), T3.name FROM Paper AS T1 JOIN Author_list AS T2 ON T1.paper_id = T2.paper_id JOIN Affiliation AS T3 ON T2.affiliation_id = T3.affiliation_id GROUP BY T3.name
SELECT T1.name, COUNT(T2.paper_id) AS papers_published FROM Affiliation AS T1 JOIN Author_list AS T2 ON T1.affiliation_id = T2.affiliation_id GROUP BY T1.name
SELECT T1.title FROM Paper AS T1 JOIN Citation AS T2 ON T1.paper_id = T2.cited_paper_id GROUP BY T1.paper_id HAVING COUNT(*) > 50
SELECT T1.title FROM Paper AS T1 JOIN Citation AS T2 ON T1.paper_id = T2.cited_paper_id GROUP BY T2.cited_paper_id HAVING COUNT(*) > 50
SELECT COUNT(DISTINCT A.author_id) FROM Author AS A WHERE A.author_id NOT IN (SELECT AL.author_id FROM Author_list AS AL JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50) AS C ON AL.paper_id = C.paper_id)
SELECT COUNT(DISTINCT A.author_id) FROM Author AS A WHERE A.author_id NOT IN (SELECT AL.author_id FROM Author_list AS AL JOIN (SELECT paper_id FROM Citation GROUP BY paper_id HAVING COUNT(*) > 50) AS C ON AL.paper_id = C.paper_id)
SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'NAACL' AND year = 2009)) INTERSECT SELECT name FROM Author WHERE author_id IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL' AND year = 2009))
SELECT name FROM Author WHERE author_id IN (SELECT T2.author_id FROM Author_list AS T2 JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.venue = 'NAACL' AND T3.year = 2009) AND author_id IN (SELECT T2.author_id FROM Author_list AS T2 JOIN Paper AS T3 ON T2.paper_id = T3.paper_id WHERE T3.venue = 'ACL' AND T3.year = 2009)
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list JOIN Paper ON Author_list.paper_id = Paper.paper_id WHERE venue = 'ACL')
SELECT name FROM Author WHERE author_id NOT IN (SELECT author_id FROM Author_list WHERE paper_id IN (SELECT paper_id FROM Paper WHERE venue = 'ACL'))
SELECT COUNT(*) FROM conference
SELECT COUNT(*) FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT DISTINCT Conference_Name FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, Year, Location FROM conference
SELECT Conference_Name, COUNT(*) FROM conference JOIN conference_participation ON conference.Conference_ID = conference_participation.Conference_ID GROUP BY Conference_Name
SELECT Conference_Name, COUNT(DISTINCT Year) FROM conference GROUP BY Conference_Name
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year, COUNT(*) FROM conference GROUP BY Year
SELECT Year FROM conference GROUP BY Year ORDER BY COUNT(*) ASC LIMIT 1
SELECT Year FROM conference GROUP BY Year ORDER BY count(*) ASC LIMIT 1
SELECT Location FROM conference GROUP BY Location HAVING count(*) > 1
SELECT Location FROM conference GROUP BY Location HAVING COUNT(Conference_ID) >= 2
SELECT Institution_Name, Location, Founded FROM institution
SELECT Institution_Name, Location, Founded FROM institution
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT COUNT(*) FROM institution WHERE Founded BETWEEN 1850 AND 1900
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1
SELECT Institution_Name, Location FROM institution ORDER BY Founded DESC LIMIT 1
SELECT Institution_Name, COUNT(staff_ID) FROM institution JOIN staff ON institution.Institution_ID = staff.Institution_ID WHERE Founded > 1800 GROUP BY Institution_Name
SELECT T1.Institution_ID, COUNT(T2.staff_ID), GROUP_CONCAT(T2.name) FROM institution AS T1 JOIN staff AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T1.Founded > 1800 GROUP BY T1.Institution_ID
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT Institution_Name FROM institution WHERE Institution_ID NOT IN (SELECT Institution_ID FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT name FROM staff WHERE Age > (SELECT AVG(Age) FROM staff)
SELECT MAX(Age), MIN(Age) FROM staff WHERE Nationality = 'United States'
SELECT MAX(Age), MIN(Age) FROM staff
SELECT DISTINCT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.Nationality = 'Canada'
SELECT DISTINCT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID JOIN staff AS T3 ON T2.staff_ID = T3.staff_ID WHERE T3.Nationality = 'Canada'
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker') AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'speaker') AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE role = 'sponsor')
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')) AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'Naccl'))
SELECT name FROM staff WHERE staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL')) AND staff_ID IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'NACCL'))
SELECT DISTINCT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID = T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID = T3.Conference_ID WHERE T3.Year = 2003 OR T3.Year = 2004
SELECT DISTINCT T1.name FROM staff AS T1 JOIN conference_participation AS T2 ON T1.staff_ID = T2.staff_ID JOIN conference AS T3 ON T2.Conference_ID = T3.Conference_ID WHERE T3.Year = 2003 OR T3.Year = 2004
SELECT T1.Conference_Name, T1.Year, COUNT(T2.Conference_ID) FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID, T1.Conference_Name, T1.Year
SELECT T1.Conference_ID, T1.Conference_Name, T1.Year, COUNT(T2.Conference_ID) AS participants FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID, T1.Conference_Name, T1.Year
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(*) DESC LIMIT 2
SELECT T1.Conference_Name FROM conference AS T1 JOIN conference_participation AS T2 ON T1.Conference_ID = T2.Conference_ID GROUP BY T1.Conference_ID ORDER BY COUNT(T2.staff_ID) DESC LIMIT 2
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT name, Nationality FROM staff WHERE staff_ID NOT IN (SELECT staff_ID FROM conference_participation WHERE Conference_ID IN (SELECT Conference_ID FROM conference WHERE Conference_Name = 'ACL'))
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year = 2004)
SELECT Institution_Name, Location FROM institution WHERE Institution_ID NOT IN (SELECT DISTINCT Institution_ID FROM staff JOIN conference_participation ON staff.staff_ID = conference_participation.staff_ID JOIN conference ON conference_participation.Conference_ID = conference.Conference_ID WHERE conference.Year = 2004)
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills ORDER BY age DESC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT avg(age) FROM PilotSkills) ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age < (SELECT avg(age) FROM PilotSkills) ORDER BY age ASC
SELECT * FROM PilotSkills WHERE age < 30
SELECT * FROM PilotSkills WHERE age < 30
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' AND age < 35
SELECT pilot_name FROM PilotSkills WHERE age < 35 AND plane_name = 'Piper Cub'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT location FROM Hangar WHERE plane_name = 'F-14 Fighter'
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT COUNT(DISTINCT location) FROM Hangar
SELECT plane_name FROM PilotSkills WHERE pilot_name = 'Jones' AND age = 32
SELECT T1.plane_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name WHERE T2.pilot_name = 'Jones' AND T2.age = 32
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM PilotSkills WHERE age > 40
SELECT COUNT(*) FROM Hangar WHERE plane_name = 'B-52 Bomber' AND plane_name IN (SELECT plane_name FROM PilotSkills WHERE age < 35)
SELECT COUNT(*) FROM Hangar AS H JOIN PilotSkills AS P ON H.plane_name = P.plane_name WHERE H.plane_name = 'B-52' AND P.age < 35
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' ORDER BY age ASC LIMIT 1
SELECT T1.plane_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT plane_name FROM PilotSkills GROUP BY plane_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.plane_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name ORDER BY COUNT(T2.plane_name) ASC LIMIT 1
SELECT T1.plane_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name ORDER BY COUNT(*) ASC LIMIT 1
SELECT COUNT(DISTINCT pilot_name) FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE Hangar.location = 'Chicago'
SELECT COUNT(DISTINCT T1.pilot_name) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Chicago'
SELECT T1.plane_name FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.pilot_name = 'Smith' AND T1.age = 41
SELECT T1.plane_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name WHERE T2.pilot_name = 'Smith' AND T2.age = 41
SELECT COUNT(DISTINCT T1.plane_name) FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills
SELECT COUNT(DISTINCT T1.plane_name) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T1.pilot_name = 'Smith'
SELECT COUNT(*) FROM Hangar WHERE location = 'Smith'
SELECT COUNT(DISTINCT T1.plane_name) FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name WHERE T2.age > 40
SELECT COUNT(DISTINCT plane_name) FROM PilotSkills WHERE age > 40
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age
SELECT pilot_name FROM PilotSkills WHERE age BETWEEN 30 AND 40 ORDER BY age
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT pilot_name FROM PilotSkills ORDER BY age DESC
SELECT location FROM Hangar ORDER BY plane_name
SELECT location FROM Hangar ORDER BY plane_name
SELECT DISTINCT T1.plane_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name ORDER BY T1.plane_name
SELECT DISTINCT plane_name FROM Hangar ORDER BY plane_name
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT COUNT(*) FROM PilotSkills WHERE age > 40 OR age < 30
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name, age FROM PilotSkills WHERE (plane_name = 'Piper Cub' AND age > 35) OR (plane_name = 'F-14 Fighter' AND age < 30)
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' EXCEPT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name = 'B-52 Bomber'
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT AVG(age), MIN(age) FROM PilotSkills
SELECT pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE location = 'Austin' INTERSECT SELECT pilot_name FROM PilotSkills JOIN Hangar ON PilotSkills.plane_name = Hangar.plane_name WHERE location = 'Boston'
SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Austin') INTERSECT SELECT pilot_name FROM PilotSkills WHERE plane_name IN (SELECT plane_name FROM Hangar WHERE location = 'Boston')
SELECT pilot_name FROM PilotSkills WHERE plane_name IN ('Piper Cub', 'F-14 Fighter')
SELECT DISTINCT pilot_name FROM PilotSkills WHERE plane_name = 'Piper Cub' OR plane_name = 'F-14 Fighter'
SELECT T1.plane_name, AVG(T2.age) FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name
SELECT plane_name, AVG(age) FROM PilotSkills GROUP BY plane_name
SELECT plane_name, COUNT(*) FROM Hangar GROUP BY plane_name
SELECT plane_name, COUNT(*) FROM Hangar GROUP BY plane_name
SELECT T1.plane_name, T1.pilot_name FROM PilotSkills AS T1 WHERE T1.age = (SELECT MAX(T2.age) FROM PilotSkills AS T2 WHERE T2.plane_name = T1.plane_name) ORDER BY T1.plane_name
SELECT T1.plane_name, T2.pilot_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name WHERE T2.age = (SELECT MAX(age) FROM PilotSkills WHERE plane_name = T1.plane_name) ORDER BY T1.plane_name
SELECT T1.pilot_name, T1.plane_name FROM PilotSkills AS T1 WHERE T1.age = (SELECT MAX(T2.age) FROM PilotSkills AS T2 WHERE T2.plane_name = T1.plane_name) GROUP BY T1.plane_name
SELECT T1.plane_name, T2.pilot_name FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name WHERE T2.age IN (SELECT max(age) FROM PilotSkills GROUP BY plane_name)
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT pilot_name, MAX(age) FROM PilotSkills GROUP BY pilot_name
SELECT T2.location, COUNT(T1.pilot_name), AVG(T1.age) FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name GROUP BY T2.location
SELECT T1.location, COUNT(T2.pilot_name), AVG(T2.age) FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.location
SELECT plane_name, COUNT(pilot_name) FROM PilotSkills GROUP BY plane_name HAVING AVG(age) < 35
SELECT T1.plane_name, COUNT(T2.pilot_name) FROM Hangar AS T1 JOIN PilotSkills AS T2 ON T1.plane_name = T2.plane_name GROUP BY T1.plane_name HAVING AVG(T2.age) < 35
SELECT location FROM Hangar WHERE plane_name IN (SELECT plane_name FROM PilotSkills WHERE age = (SELECT min(age) FROM PilotSkills))
SELECT location FROM Hangar WHERE plane_name IN (SELECT plane_name FROM PilotSkills WHERE age = (SELECT min(age) FROM PilotSkills))
SELECT T1.pilot_name, T1.age FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Austin'
SELECT T1.pilot_name, T1.age FROM PilotSkills AS T1 JOIN Hangar AS T2 ON T1.plane_name = T2.plane_name WHERE T2.location = 'Austin'
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT min(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT pilot_name FROM PilotSkills WHERE age > (SELECT max(age) FROM PilotSkills WHERE plane_name = 'Piper Cub') ORDER BY pilot_name
SELECT COUNT(*) FROM PilotSkills WHERE age < ALL (SELECT age FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT COUNT(*) FROM PilotSkills WHERE age < (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'F-14 Fighter')
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT DISTINCT plane_name FROM Hangar WHERE plane_name LIKE '%Bomber%'
SELECT COUNT(*) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT COUNT(*) FROM PilotSkills WHERE age > (SELECT MIN(age) FROM PilotSkills WHERE plane_name = 'Piper Cub')
SELECT Name FROM district ORDER BY Area_km DESC LIMIT 1
SELECT Area_km, Government_website FROM district ORDER BY Population ASC LIMIT 1
SELECT Name, Population FROM district WHERE Area_km > (SELECT AVG(Area_km) FROM district)
SELECT MAX(Area_km), AVG(Area_km) FROM district
SELECT SUM(Population) FROM district WHERE Area_km IN (SELECT Area_km FROM district ORDER BY Area_km DESC LIMIT 3)
SELECT District_ID, Name, Government_website FROM district ORDER BY Population
SELECT Name FROM district WHERE Government_website LIKE '%.gov%'
SELECT District_ID, Name FROM district WHERE Population > 4000 OR Area_km > 3000
SELECT Name, Speach_title FROM spokesman
SELECT AVG(Points), AVG(Age) FROM spokesman WHERE Rank_position = 1
SELECT Name, Points FROM spokesman WHERE Age < 40
SELECT Name FROM spokesman ORDER BY Age DESC LIMIT 1
SELECT Name FROM spokesman WHERE Points < (SELECT avg(Points) FROM spokesman)
SELECT T1.Name FROM district AS T1 JOIN spokesman_district AS T2 ON T1.District_ID = T2.District_ID GROUP BY T1.Name ORDER BY COUNT(*) DESC LIMIT 1
SELECT DISTINCT T1.Name FROM spokesman AS T1 JOIN spokesman_district AS T2 ON T1.Spokesman_ID = T2.Spokesman_ID WHERE T2.Start_year < 2004
SELECT D.Name, COUNT(S.Spokesman_ID) AS NumberOfSpokesmen FROM district D JOIN spokesman_district S ON D.District_ID = S.District_ID GROUP BY D.District_ID, D.Name
SELECT Name FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district WHERE Spokesman_ID IN (SELECT Spokesman_ID FROM spokesman WHERE Rank_position = 1)) AND District_ID IN (SELECT District_ID FROM spokesman_district WHERE Spokesman_ID IN (SELECT Spokesman_ID FROM spokesman WHERE Rank_position = 2))
SELECT Name FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district GROUP BY District_ID HAVING COUNT(Spokesman_ID) > 1)
SELECT COUNT(*) FROM district WHERE District_ID NOT IN (SELECT District_ID FROM spokesman_district)
SELECT Name FROM spokesman WHERE Spokesman_ID NOT IN (SELECT Spokesman_ID FROM spokesman_district)
SELECT SUM(Population), AVG(Population) FROM district WHERE District_ID IN (SELECT District_ID FROM spokesman_district)
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1
SELECT title FROM Sculptures ORDER BY year DESC LIMIT 1
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1
SELECT title, location FROM Paintings ORDER BY year ASC LIMIT 1
SELECT title FROM Sculptures WHERE location = 'gallery 226'
SELECT title FROM Sculptures WHERE location = '226'
SELECT title, location FROM Paintings
SELECT title, location FROM Paintings
SELECT title, location FROM Sculptures
SELECT title, location FROM Sculptures
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT medium FROM Paintings WHERE paintingID = 80
SELECT fname, lname FROM Artists WHERE birthYear > 1850
SELECT fname || ' ' || lname AS full_name FROM Artists WHERE birthYear > 1850
SELECT title, year FROM Sculptures WHERE location != '226'
SELECT title, year FROM Sculptures WHERE location != '226'
SELECT DISTINCT T1.fname, T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year < 1900
SELECT DISTINCT T1.fname, T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year < 1900
SELECT DISTINCT T1.birthYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year > 1920
SELECT DISTINCT T1.birthYear FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.year > 1920
SELECT fname, lname FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1
SELECT fname, lname FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1
SELECT MIN(deathYear - birthYear) FROM Artists WHERE deathYear IS NOT NULL
SELECT MIN(deathYear - birthYear) FROM Artists WHERE deathYear IS NOT NULL
SELECT fname, (deathYear - birthYear) AS age FROM Artists ORDER BY age DESC LIMIT 1
SELECT fname, (deathYear - birthYear) AS age FROM Artists ORDER BY age DESC LIMIT 1
SELECT COUNT(*) FROM Paintings WHERE location = 'gallery 240'
SELECT COUNT(*) FROM Paintings WHERE location = '240'
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT COUNT(*) FROM Paintings WHERE painterID = (SELECT artistID FROM Artists ORDER BY (deathYear - birthYear) DESC LIMIT 1)
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT Paintings.title, Paintings.year FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.fname = 'Mary'
SELECT width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT width_mm FROM Paintings JOIN Artists ON Paintings.painterID = Artists.artistID WHERE Artists.birthYear < 1850
SELECT T1.location, T1.medium FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.fname = 'Pablo'
SELECT T1.location, T1.medium FROM Paintings AS T1 JOIN Artists AS T2 ON T1.painterID = T2.artistID WHERE T2.fname = 'Pablo'
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID JOIN Sculptures s ON a.artistID = s.sculptorID
SELECT DISTINCT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID JOIN Sculptures S ON A.artistID = S.sculptorID
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil') AND artistID IN (SELECT painterID FROM Paintings WHERE medium = 'lithographic')
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings WHERE medium = 'oil') AND artistID IN (SELECT painterID FROM Paintings WHERE medium = 'lithographic')
SELECT T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.year = 1884 AND T2.mediumOn = 'canvas'
SELECT T1.birthYear FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.year = 1884
SELECT DISTINCT T1.fname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' AND T2.location = 'gallery 241'
SELECT DISTINCT T1.fname FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' AND T2.location = '241'
SELECT medium, COUNT(*) FROM Paintings GROUP BY medium UNION ALL SELECT medium, COUNT(*) FROM Sculptures GROUP BY medium
SELECT medium, COUNT(*) FROM (SELECT medium FROM Paintings UNION ALL SELECT medium FROM Sculptures) AS combined GROUP BY medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium
SELECT medium, AVG(height_mm) FROM Paintings GROUP BY medium
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location
SELECT location, COUNT(*) FROM Paintings WHERE year < 1900 GROUP BY location
SELECT title FROM Paintings WHERE year > 1910 AND medium = 'oil'
SELECT title FROM Paintings WHERE medium = 'oil' AND year > 1910
SELECT DISTINCT T1.artistID FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' AND T2.location = 'gallery 240'
SELECT DISTINCT T1.artistID FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' AND T2.location = 'gallery 240'
SELECT DISTINCT title FROM Paintings WHERE height_mm > (SELECT max(height_mm) FROM Paintings WHERE mediumOn = 'canvas')
SELECT DISTINCT title FROM Paintings WHERE height_mm > (SELECT max(height_mm) FROM Paintings WHERE mediumOn = 'canvas')
SELECT DISTINCT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
SELECT DISTINCT T1.paintingID FROM Paintings AS T1 WHERE T1.year < ANY (SELECT T2.year FROM Paintings AS T2 WHERE T2.location = 'gallery 240')
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT paintingID FROM Paintings ORDER BY year ASC LIMIT 1
SELECT T1.fname, T1.lname FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.title LIKE '%female%'
SELECT CONCAT(T1.fname, ' ', T1.lname) AS full_name FROM Artists AS T1 JOIN Sculptures AS T2 ON T1.artistID = T2.sculptorID WHERE T2.title LIKE '%female%'
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
SELECT fname FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT fname FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT title FROM Paintings WHERE width_mm < 600 OR height_mm > 800
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT DISTINCT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT paintingID FROM Paintings WHERE height_mm > 500 AND height_mm < 2000
SELECT location FROM Paintings WHERE medium IN ('on panel', 'on canvas')
SELECT location FROM Paintings WHERE medium = 'on panels' UNION SELECT location FROM Paintings WHERE medium = 'on canvas'
SELECT location FROM Paintings WHERE year < 1885 OR year > 1930
SELECT location FROM Paintings WHERE year < 1885 UNION SELECT location FROM Paintings WHERE year > 1930
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location = 'gallery 241'
SELECT AVG(height_mm), AVG(width_mm) FROM Paintings WHERE medium = 'oil' AND location = '241'
SELECT MAX(height_mm), paintingID FROM Paintings WHERE year < 1900
SELECT height_mm, paintingID FROM Paintings WHERE year < 1900 ORDER BY height_mm DESC LIMIT 1
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT year, MAX(height_mm) AS max_height, MAX(width_mm) AS max_width FROM Paintings GROUP BY year
SELECT A.lname, A.fname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.lname, A.fname, AVG(P.height_mm) AS avg_height, AVG(P.width_mm) AS avg_width FROM Paintings P JOIN Artists A ON P.painterID = A.artistID GROUP BY P.painterID ORDER BY A.lname, A.fname
SELECT A.fname, COUNT(P.paintingID) AS NumberOfPaintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) >= 2
SELECT A.fname, COUNT(*) AS num_paintings FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(*) >= 2
SELECT A.deathYear FROM Artists A WHERE A.artistID IN (SELECT P.painterID FROM Paintings P GROUP BY P.painterID HAVING COUNT(*) <= 3)
SELECT A.deathYear FROM Artists A JOIN Paintings P ON A.artistID = P.painterID GROUP BY A.artistID HAVING COUNT(P.paintingID) < 4
SELECT deathYear FROM Artists WHERE artistID = (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT deathYear FROM Artists WHERE artistID IN (SELECT sculptorID FROM Sculptures GROUP BY sculptorID ORDER BY COUNT(*) ASC LIMIT 1)
SELECT paintingID, height_mm FROM Paintings WHERE location = 'gallery 240' ORDER BY width_mm DESC LIMIT 1
SELECT height_mm, paintingID FROM Paintings WHERE location = '240' ORDER BY width_mm DESC LIMIT 1
SELECT paintingID FROM Paintings WHERE year < (SELECT min(year) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE year < (SELECT MIN(year) FROM Paintings WHERE location = 'gallery 240')
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT max(height_mm) FROM Paintings WHERE year > 1900)
SELECT paintingID FROM Paintings WHERE height_mm > (SELECT max(height_mm) FROM Paintings WHERE year > 1900)
SELECT T1.lname, T1.fname, COUNT(T2.paintingID) AS num_paintings FROM Artists AS T1 JOIN Paintings AS T2 ON T1.artistID = T2.painterID WHERE T2.medium = 'oil' GROUP BY T1.artistID ORDER BY num_paintings DESC LIMIT 3
SELECT A.fname, A.lname FROM Artists A JOIN Paintings P ON A.artistID = P.painterID WHERE P.medium = 'oil' GROUP BY A.artistID ORDER BY COUNT(P.paintingID) DESC LIMIT 1
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT paintingID, location, title FROM Paintings WHERE medium = 'oil' ORDER BY year
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT year, location, title FROM Paintings WHERE height_mm > 1000 ORDER BY title
SELECT DISTINCT a.fname, a.lname FROM Artists a JOIN Paintings p ON a.artistID = p.painterID LEFT JOIN Sculptures s ON a.artistID = s.sculptorID WHERE s.sculptorID IS NULL;
SELECT fname, lname FROM Artists WHERE artistID IN (SELECT painterID FROM Paintings) AND artistID NOT IN (SELECT sculptorID FROM Sculptures)
SELECT location FROM Paintings WHERE year < 1885 AND location NOT IN (SELECT location FROM Paintings WHERE mediumOn = 'canvas')
SELECT location FROM Paintings WHERE year < 1885 AND mediumOn != 'canvas'
SELECT COUNT(*) FROM race
SELECT COUNT(*) FROM race
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team ASC
SELECT Winning_driver, Winning_team FROM race ORDER BY Winning_team
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Winning_driver FROM race WHERE Pole_Position != 'Junior Strous'
SELECT Constructor FROM driver ORDER BY Age
SELECT DISTINCT Constructor FROM driver ORDER BY Age
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT DISTINCT Entrant FROM driver WHERE Age >= 20
SELECT MAX(Age), MIN(Age) FROM driver
SELECT MAX(Age), MIN(Age) FROM driver
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT COUNT(DISTINCT Engine) FROM driver WHERE Age > 30 OR Age < 20
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT Driver_Name FROM driver ORDER BY Driver_Name DESC
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT T1.Driver_Name, T2.Race_Name FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID
SELECT T1.Driver_Name, COUNT(*) FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_Name
SELECT T1.Driver_ID, COUNT(*) FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID
SELECT Age FROM driver WHERE Driver_ID = (SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Age FROM driver WHERE Driver_ID = (SELECT Driver_ID FROM race GROUP BY Driver_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Driver_Name, Age FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race GROUP BY Driver_ID HAVING COUNT(*) >= 2)
SELECT T1.Driver_Name, T1.Age FROM driver AS T1 JOIN race AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Driver_ID HAVING COUNT(T2.Driver_ID) >= 2
SELECT DISTINCT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Age >= 26
SELECT T1.Race_Name FROM race AS T1 JOIN driver AS T2 ON T1.Driver_ID = T2.Driver_ID WHERE T2.Age >= 26
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT Driver_Name FROM driver WHERE Constructor != 'Bugatti'
SELECT Constructor, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Constructor
SELECT Constructor, COUNT(*) FROM driver GROUP BY Constructor
SELECT Engine FROM driver GROUP BY Engine ORDER BY COUNT(*) DESC LIMIT 1
SELECT Engine, COUNT(*) AS count FROM driver GROUP BY Engine ORDER BY count DESC LIMIT 1
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(DISTINCT Driver_ID) >= 2
SELECT Engine FROM driver GROUP BY Engine HAVING COUNT(*) > 1
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race)
SELECT Constructor FROM driver WHERE Age < 20 INTERSECT SELECT Constructor FROM driver WHERE Age > 30
SELECT Constructor FROM driver WHERE Constructor IN (SELECT Constructor FROM driver WHERE Age < 20) AND Constructor IN (SELECT Constructor FROM driver WHERE Age > 30)
SELECT Winning_team FROM race GROUP BY Winning_team HAVING COUNT(*) > 1
SELECT Winning_team FROM race GROUP BY Winning_team HAVING count(*) > 1
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe') INTERSECT SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')
SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe') INTERSECT SELECT Driver_Name FROM driver WHERE Driver_ID IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'Carl Skerlong')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT Driver_Name FROM driver WHERE Driver_ID NOT IN (SELECT Driver_ID FROM race WHERE Pole_Position = 'James Hinchcliffe')
SELECT COUNT(*) FROM languages
SELECT COUNT(*) FROM languages
SELECT name FROM languages ORDER BY name
SELECT name FROM languages ORDER BY name
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM languages WHERE name LIKE '%ish%'
SELECT name FROM countries ORDER BY overall_score DESC
SELECT name FROM countries ORDER BY overall_score DESC
SELECT AVG(justice_score) FROM countries
SELECT AVG(justice_score) FROM countries
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE name != 'Norway'
SELECT MAX(health_score), MIN(health_score) FROM countries WHERE name != 'Norway'
SELECT COUNT(DISTINCT T1.id) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id
SELECT COUNT(DISTINCT T1.id) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY education_score DESC
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT name FROM countries ORDER BY politics_score DESC LIMIT 1
SELECT T1.name, T2.name FROM countries AS T1 JOIN official_languages AS T3 ON T1.id = T3.country_id JOIN languages AS T2 ON T3.language_id = T2.id
SELECT T1.name AS country_name, T2.name AS language_name FROM countries AS T1 JOIN official_languages AS T3 ON T1.id = T3.country_id JOIN languages AS T2 ON T3.language_id = T2.id
SELECT T1.name, COUNT(T2.country_id) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.name
SELECT T1.name, COUNT(T2.country_id) FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.name
SELECT name FROM languages WHERE id = (SELECT language_id FROM official_languages GROUP BY language_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 1
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages GROUP BY language_id HAVING COUNT(country_id) > 1)
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.id HAVING COUNT(DISTINCT T2.country_id) >= 2
SELECT AVG(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id = T2.country_id JOIN languages AS T3 ON T2.language_id = T3.id WHERE T3.name = 'English'
SELECT AVG(T1.overall_score) FROM countries AS T1 JOIN official_languages AS T2 ON T1.id = T2.country_id JOIN languages AS T3 ON T2.language_id = T3.id WHERE T3.name = 'English'
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.name ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id GROUP BY T1.name ORDER BY COUNT(T2.country_id) DESC LIMIT 3
SELECT T1.name, AVG(T3.overall_score) AS avg_score FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id JOIN countries AS T3 ON T2.country_id = T3.id GROUP BY T1.name ORDER BY avg_score DESC
SELECT T1.name FROM languages AS T1 JOIN official_languages AS T2 ON T1.id = T2.language_id JOIN countries AS T3 ON T2.country_id = T3.id GROUP BY T1.name ORDER BY AVG(T3.overall_score) DESC
SELECT name FROM countries WHERE id = (SELECT country_id FROM official_languages GROUP BY country_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT name FROM countries WHERE id = (SELECT country_id FROM official_languages GROUP BY country_id ORDER BY COUNT(language_id) DESC LIMIT 1)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM languages WHERE id NOT IN (SELECT language_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM countries WHERE id NOT IN (SELECT country_id FROM official_languages)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages JOIN countries ON official_languages.country_id = countries.id WHERE overall_score > 95) INTERSECT SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages JOIN countries ON official_languages.country_id = countries.id WHERE overall_score < 90)
SELECT name FROM languages WHERE id IN (SELECT language_id FROM official_languages JOIN countries ON official_languages.country_id = countries.id WHERE overall_score > 95) AND id IN (SELECT language_id FROM official_languages JOIN countries ON official_languages.country_id = countries.id WHERE overall_score < 90)
SELECT DISTINCT country, town_city FROM Addresses
SELECT country, town_city FROM Addresses
SELECT T1.property_id, T2.county_state_province FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id = T2.address_id
SELECT T2.county_state_province FROM Properties AS T1 JOIN Addresses AS T2 ON T1.property_address_id = T2.address_id
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT feature_description FROM Features WHERE feature_name = 'rooftop'
SELECT T1.feature_name, T1.feature_description FROM Features AS T1 JOIN (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1) AS T2 ON T1.feature_id = T2.feature_id
SELECT T1.feature_name, T1.feature_description FROM Features AS T1 WHERE T1.feature_id IN (SELECT feature_id FROM Property_Features GROUP BY feature_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT MIN(room_count) FROM Properties
SELECT MIN(room_count) FROM Properties
SELECT COUNT(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y'
SELECT COUNT(*) FROM Properties WHERE parking_lots = 1 OR garage_yn = 'Y'
SELECT DISTINCT T3.age_category_description FROM Users AS T1 JOIN Ref_Age_Categories AS T3 ON T1.age_category_code = T3.age_category_code WHERE T1.other_user_details LIKE '%Mother%'
SELECT DISTINCT T1.age_category_description FROM Ref_Age_Categories AS T1 JOIN Users AS T2 ON T1.age_category_code = T2.age_category_code WHERE T2.other_user_details LIKE '%Mother%'
SELECT first_name FROM Users WHERE user_id = (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT first_name FROM Users WHERE user_id = (SELECT owner_user_id FROM Properties GROUP BY owner_user_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT AVG(T1.room_count) FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id = T2.property_id JOIN Features AS T3 ON T2.feature_id = T3.feature_id WHERE T3.feature_name = 'garden'
SELECT AVG(count) FROM (SELECT COUNT(*) AS count FROM Rooms JOIN Properties ON Rooms.property_id = Properties.property_id JOIN Property_Features ON Properties.property_id = Property_Features.property_id JOIN Features ON Property_Features.feature_id = Features.feature_id WHERE Features.feature_name = 'garden' GROUP BY Properties.property_id) AS room_counts
SELECT DISTINCT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id = T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id = T3.property_id JOIN Features AS T4 ON T3.feature_id = T4.feature_id WHERE T4.feature_name = 'swimming pool'
SELECT DISTINCT T1.town_city FROM Addresses AS T1 JOIN Properties AS T2 ON T1.address_id = T2.property_address_id JOIN Property_Features AS T3 ON T2.property_id = T3.property_id JOIN Features AS T4 ON T3.feature_id = T4.feature_id WHERE T4.feature_name = 'swimming pool'
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT property_id, vendor_requested_price FROM Properties ORDER BY vendor_requested_price ASC LIMIT 1
SELECT AVG(room_count) FROM (SELECT COUNT(room_number) AS room_count FROM Rooms GROUP BY property_id) AS room_counts
SELECT AVG(room_count) FROM Rooms
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT COUNT(DISTINCT room_size) FROM Rooms
SELECT user_id, search_string FROM User_Searches GROUP BY user_id, search_string HAVING COUNT(*) >= 2
SELECT T1.user_id, T2.search_seq FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id = T2.user_id GROUP BY T1.user_id HAVING COUNT(T2.search_seq) >= 2
SELECT MAX(search_datetime) FROM User_Searches
SELECT MAX(search_datetime) FROM User_Searches
SELECT search_datetime, search_string FROM User_Searches ORDER BY search_string DESC
SELECT search_string, search_datetime FROM User_Searches ORDER BY search_string DESC
SELECT DISTINCT a.zip_postcode FROM Addresses a JOIN Properties p ON a.address_id = p.property_address_id WHERE p.owner_user_id NOT IN ( SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(property_id) <= 2 )
SELECT zip_postcode FROM Addresses WHERE address_id IN (SELECT property_address_id FROM Properties WHERE owner_user_id NOT IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) <= 2))
SELECT T1.user_id, T1.user_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id = T2.user_id GROUP BY T2.user_id HAVING COUNT(*) = 1
SELECT U.user_id, U.user_category_code FROM Users U WHERE U.user_id IN (SELECT S.user_id FROM User_Searches S GROUP BY S.user_id HAVING COUNT(*) = 1)
SELECT T3.age_category_description FROM User_Searches AS T1 JOIN Users AS T2 ON T1.user_id = T2.user_id JOIN Ref_Age_Categories AS T3 ON T2.age_category_code = T3.age_category_code ORDER BY T1.search_datetime LIMIT 1
SELECT T1.age_category_code FROM Users AS T1 JOIN User_Searches AS T2 ON T1.user_id = T2.user_id ORDER BY T2.search_datetime ASC LIMIT 1
SELECT login_name FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE age_category_description = 'senior citizen' ORDER BY first_name
SELECT login_name FROM Users JOIN Ref_Age_Categories ON Users.age_category_code = Ref_Age_Categories.age_category_code WHERE age_category_description = 'Senior Citizen' ORDER BY first_name
SELECT COUNT(*) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = true
SELECT COUNT(*) FROM User_Searches JOIN Users ON User_Searches.user_id = Users.user_id WHERE Users.is_buyer = true
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT date_registered FROM Users WHERE login_name = 'ratione'
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT first_name, middle_name, last_name, login_name FROM Users WHERE is_seller = 1
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Users U JOIN Addresses A ON U.user_address_id = A.address_id JOIN Ref_Age_Categories R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior Citizen'
SELECT A.line_1_number_building, A.line_2_number_street, A.town_city FROM Addresses AS A JOIN Users AS U ON A.address_id = U.user_address_id JOIN Ref_Age_Categories AS R ON U.age_category_code = R.age_category_code WHERE R.age_category_description = 'Senior'
SELECT COUNT(DISTINCT property_id) FROM Property_Features GROUP BY property_id HAVING COUNT(feature_id) >= 2
SELECT COUNT(DISTINCT T1.property_id) FROM Properties AS T1 JOIN Property_Features AS T2 ON T1.property_id = T2.property_id GROUP BY T1.property_id HAVING COUNT(T2.feature_id) >= 2
SELECT property_id, COUNT(photo_seq) FROM Property_Photos GROUP BY property_id
SELECT T1.property_id, COUNT(T2.photo_seq) FROM Properties AS T1 JOIN Property_Photos AS T2 ON T1.property_id = T2.property_id GROUP BY T1.property_id
SELECT T1.user_id, COUNT(T2.photo_seq) FROM Users AS T1 JOIN Properties AS T3 ON T1.user_id = T3.owner_user_id JOIN Property_Photos AS T2 ON T3.property_id = T2.property_id GROUP BY T1.user_id
SELECT T1.user_id, COUNT(T3.photo_seq) FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id = T2.owner_user_id JOIN Property_Photos AS T3 ON T2.property_id = T3.property_id GROUP BY T1.user_id
SELECT SUM(T1.price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id = T2.user_id JOIN Ref_User_Categories AS T3 ON T2.user_category_code = T3.user_category_code WHERE T3.user_category_description = 'single mother' OR T3.user_category_description = 'student'
SELECT SUM(T1.price_max) FROM Properties AS T1 JOIN Users AS T2 ON T1.owner_user_id = T2.user_id JOIN Ref_User_Categories AS T3 ON T2.user_category_code = T3.user_category_code WHERE T3.user_category_description = 'single mother' OR T3.user_category_description = 'student'
SELECT T1.datestamp, T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id = T2.property_id ORDER BY T1.datestamp
SELECT T1.datestamp, T2.property_name FROM User_Property_History AS T1 JOIN Properties AS T2 ON T1.property_id = T2.property_id ORDER BY T1.datestamp
SELECT T2.property_type_description, T2.property_type_code FROM Ref_Property_Types AS T2 JOIN (SELECT property_type_code FROM Properties GROUP BY property_type_code ORDER BY COUNT(*) DESC LIMIT 1) AS T1 ON T2.property_type_code = T1.property_type_code
SELECT T2.property_type_description FROM Properties AS T1 JOIN Ref_Property_Types AS T2 ON T1.property_type_code = T2.property_type_code GROUP BY T1.property_type_code ORDER BY COUNT(*) DESC LIMIT 1
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT age_category_description FROM Ref_Age_Categories WHERE age_category_code = 'Over 60'
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT room_size, COUNT(*) FROM Rooms GROUP BY room_size
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = 'Robbie'
SELECT T2.country FROM Users AS T1 JOIN Addresses AS T2 ON T1.user_address_id = T2.address_id WHERE T1.first_name = 'Robbie'
SELECT first_name, middle_name, last_name FROM Users JOIN Properties ON Users.user_id = Properties.owner_user_id WHERE Users.user_address_id = Properties.property_address_id
SELECT CONCAT(T1.first_name, ' ', T1.middle_name, ' ', T1.last_name) AS full_name FROM Users AS T1 JOIN Properties AS T2 ON T1.user_id = T2.owner_user_id WHERE T1.user_address_id = T2.property_address_id
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT owner_user_id FROM Properties)
SELECT search_string FROM User_Searches WHERE user_id NOT IN (SELECT DISTINCT owner_user_id FROM Properties)
SELECT U.last_name, U.user_id FROM Users U WHERE U.user_id IN (SELECT P.owner_user_id FROM Properties P GROUP BY P.owner_user_id HAVING COUNT(*) >= 2) AND U.user_id IN (SELECT S.user_id FROM User_Searches S GROUP BY S.user_id HAVING COUNT(*) <= 2)
SELECT U.last_name, U.user_id FROM Users U WHERE U.user_id IN (SELECT user_id FROM User_Searches GROUP BY user_id HAVING COUNT(*) <= 2) AND U.user_id IN (SELECT owner_user_id FROM Properties GROUP BY owner_user_id HAVING COUNT(*) >= 2)
SELECT COUNT(*) FROM bike WHERE weight > 780
SELECT product_name, weight FROM bike ORDER BY price
SELECT heat, name, nation FROM cyclist
SELECT MAX(weight), MIN(weight) FROM bike
SELECT AVG(price) FROM bike WHERE material = 'Carbon CC'
SELECT name, result FROM cyclist WHERE nation != 'Russia'
SELECT DISTINCT T1.id, T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id WHERE T2.purchase_year > 2015
SELECT T1.id, T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id GROUP BY T1.id HAVING count(*) >= 4
SELECT T1.id, T1.name FROM cyclist AS T1 JOIN (SELECT cyclist_id, COUNT(*) AS bike_count FROM cyclists_own_bikes GROUP BY cyclist_id) AS T2 ON T1.id = T2.cyclist_id ORDER BY T2.bike_count DESC LIMIT 1
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id = T3.id WHERE T3.nation = 'Russia' OR T3.nation = 'Great Britain'
SELECT COUNT(DISTINCT heat) FROM cyclist
SELECT COUNT(*) FROM cyclist WHERE id NOT IN (SELECT DISTINCT cyclist_id FROM cyclists_own_bikes WHERE purchase_year > 2015)
SELECT DISTINCT T1.product_name FROM bike AS T1 JOIN cyclists_own_bikes AS T2 ON T1.id = T2.bike_id JOIN cyclist AS T3 ON T2.cyclist_id = T3.id WHERE T3.result < '4:21.558'
SELECT product_name, price FROM bike WHERE id IN (SELECT bike_id FROM cyclists_own_bikes JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name = 'Bradley Wiggins') AND id IN (SELECT bike_id FROM cyclists_own_bikes JOIN cyclist ON cyclists_own_bikes.cyclist_id = cyclist.id WHERE cyclist.name = 'Antonio Tauler')
SELECT name, nation, result FROM cyclist WHERE id NOT IN (SELECT cyclist_id FROM cyclists_own_bikes WHERE bike_id IN (SELECT id FROM bike WHERE product_name LIKE '%racing%'))
SELECT product_name FROM bike WHERE material LIKE '%fiber%'
SELECT cyclist_id, COUNT(bike_id) FROM cyclists_own_bikes GROUP BY cyclist_id ORDER BY cyclist_id
SELECT Flavor, MAX(Price) FROM goods WHERE Food = 'cake' GROUP BY Flavor ORDER BY MAX(Price) DESC LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Price DESC LIMIT 1
SELECT Flavor, MIN(Price) FROM goods WHERE Food = 'cookie' GROUP BY Flavor ORDER BY MIN(Price) LIMIT 1
SELECT Id, Flavor FROM goods WHERE Food = 'cookie' ORDER BY Price ASC LIMIT 1
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Flavor = 'apple'
SELECT Id FROM goods WHERE Price < 3
SELECT Id FROM goods WHERE Price < 3
SELECT DISTINCT T4.Id FROM customers AS T4 JOIN receipts AS T3 ON T4.Id = T3.CustomerId JOIN items AS T2 ON T3.ReceiptNumber = T2.Receipt JOIN goods AS T1 ON T2.Item = T1.Id WHERE T1.Food = 'cake' AND T1.Flavor = 'lemon'
SELECT DISTINCT T1.Id FROM customers AS T1 JOIN receipts AS T2 ON T1.Id = T2.CustomerId JOIN items AS T3 ON T2.ReceiptNumber = T3.Receipt JOIN goods AS T4 ON T3.Item = T4.Id WHERE T4.Flavor = 'lemon' AND T4.Food = 'cake'
SELECT T1.Food, COUNT(DISTINCT T4.Id) FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item JOIN receipts AS T3 ON T2.Receipt = T3.ReceiptNumber JOIN customers AS T4 ON T3.CustomerId = T4.Id GROUP BY T1.Food
SELECT T1.Food, COUNT(DISTINCT T4.Id) AS NumberOfCustomers FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item JOIN receipts AS T3 ON T2.Receipt = T3.ReceiptNumber JOIN customers AS T4 ON T3.CustomerId = T4.Id GROUP BY T1.Food
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'bakery' GROUP BY CustomerId HAVING COUNT(*) >= 15
SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) >= 15
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(ReceiptNumber) > 10)
SELECT LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts GROUP BY CustomerId HAVING COUNT(*) > 10)
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'Cake'
SELECT COUNT(DISTINCT Flavor) FROM goods WHERE Food = 'cake'
SELECT Flavor FROM goods WHERE Food = 'Croissant'
SELECT DISTINCT Flavor FROM goods WHERE Food = 'croissant'
SELECT DISTINCT T1.Flavor, T1.Food FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item JOIN receipts AS T3 ON T2.Receipt = T3.ReceiptNumber WHERE T3.CustomerId = 15
SELECT DISTINCT T1.Flavor, T1.Food FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item JOIN receipts AS T3 ON T2.Receipt = T3.ReceiptNumber WHERE T3.CustomerId = 15
SELECT Food, AVG(Price) AS Average_Price, MAX(Price) AS Max_Price, MIN(Price) AS Min_Price FROM goods GROUP BY Food
SELECT Food, AVG(Price) AS Average_Price, MIN(Price) AS Minimum_Price, MAX(Price) AS Maximum_Price FROM goods GROUP BY Food
SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'Cake' INTERSECT SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE goods.Food = 'Cookie'
SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE Food = 'cakes' INTERSECT SELECT Receipt FROM items JOIN goods ON items.Item = goods.Id WHERE Food = 'cookies'
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId = T2.Id JOIN items AS T3 ON T1.ReceiptNumber = T3.Receipt JOIN goods AS T4 ON T3.Item = T4.Id WHERE T2.LastName = 'LOGAN' AND T4.Food = 'Croissant'
SELECT T1.ReceiptNumber FROM receipts AS T1 JOIN customers AS T2 ON T1.CustomerId = T2.Id JOIN items AS T3 ON T1.ReceiptNumber = T3.Receipt JOIN goods AS T4 ON T3.Item = T4.Id WHERE T2.LastName = 'Logan' AND T4.Food = 'croissant'
SELECT T2.ReceiptNumber, T2.Date FROM items AS T1 JOIN receipts AS T2 ON T1.Receipt = T2.ReceiptNumber WHERE T1.Item IN (SELECT Id FROM goods WHERE Price = (SELECT max(Price) FROM goods))
SELECT T2.ReceiptNumber, T2.Date FROM goods AS T1 JOIN items AS T3 ON T1.Id = T3.Item JOIN receipts AS T2 ON T3.Receipt = T2.ReceiptNumber WHERE T1.Price = (SELECT max(Price) FROM goods)
SELECT T1.Food FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item GROUP BY T1.Id ORDER BY COUNT(*) ASC LIMIT 1
SELECT T2.Flavor, COUNT(*) AS count FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Id GROUP BY T1.Item ORDER BY count ASC LIMIT 1
SELECT Food, COUNT(*) FROM goods GROUP BY Food
SELECT Food, COUNT(*) FROM goods GROUP BY Food
SELECT Food, AVG(Price) FROM goods GROUP BY Food
SELECT Food, AVG(Price) FROM goods GROUP BY Food
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Id FROM goods WHERE Flavor = 'Apricot' AND Price < 5
SELECT Flavor FROM goods WHERE Price > 10 AND Food = 'cake'
SELECT Flavor FROM goods WHERE Food = 'cake' AND Price > 10
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id, Price FROM goods WHERE Price < (SELECT AVG(Price) FROM goods)
SELECT DISTINCT Id FROM goods WHERE Price < (SELECT MIN(Price) FROM goods WHERE Flavor = 'Tart')
SELECT DISTINCT Id FROM goods WHERE Price < (SELECT MIN(Price) FROM goods WHERE Flavor = 'Tart')
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id WHERE T3.Price > 13
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id WHERE T3.Price > 13
SELECT DISTINCT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id WHERE T3.Price > 15
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id WHERE T3.Price > 15
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Id FROM goods WHERE Id LIKE '%APP%'
SELECT Flavor, Food, Price FROM goods WHERE Id LIKE '%70%'
SELECT Id, Price FROM goods WHERE Id LIKE '%70%'
SELECT LastName FROM customers ORDER BY LastName
SELECT LastName FROM customers ORDER BY LastName
SELECT Id FROM goods ORDER BY Id
SELECT DISTINCT Id FROM goods ORDER BY Id
SELECT DISTINCT T2.ReceiptNumber FROM receipts AS T2 JOIN items AS T3 ON T2.ReceiptNumber = T3.Receipt JOIN goods AS T4 ON T3.Item = T4.Id WHERE (T4.Flavor = 'apple' AND T4.Food = 'pie') OR T2.CustomerId = 12
SELECT DISTINCT T1.ReceiptNumber FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id WHERE (T3.Flavor = 'apple' AND T3.Food = 'pie') OR T1.CustomerId = 12
SELECT ReceiptNumber, Date FROM receipts WHERE Date = (SELECT max(Date) FROM receipts)
SELECT ReceiptNumber, Date FROM receipts ORDER BY Date DESC LIMIT 1
SELECT ReceiptNumber FROM receipts WHERE Date = (SELECT min(Date) FROM receipts) OR ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10))
SELECT ReceiptNumber FROM receipts WHERE ReceiptNumber IN (SELECT Receipt FROM items WHERE Item IN (SELECT Id FROM goods WHERE Price > 10)) OR Date = (SELECT min(Date) FROM receipts)
SELECT Id FROM goods WHERE Food IN ('Cookie', 'Cake') AND Price BETWEEN 3 AND 7
SELECT Id FROM goods WHERE Food IN ('Cookies', 'Cakes') AND Price BETWEEN 3 AND 7
SELECT FirstName, LastName FROM customers WHERE Id IN (SELECT CustomerId FROM receipts WHERE Date = (SELECT min(Date) FROM receipts))
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id = T2.CustomerId ORDER BY T2.Date ASC LIMIT 1
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT AVG(Price) FROM goods WHERE Flavor IN ('blackberry', 'blueberry')
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT MIN(Price) FROM goods WHERE Flavor = 'cheese'
SELECT Flavor, MAX(Price) AS Highest, MIN(Price) AS Lowest, AVG(Price) AS Average FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Flavor, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice, AVG(Price) AS AvgPrice FROM goods GROUP BY Flavor ORDER BY Flavor
SELECT Food, MIN(Price) AS LowestPrice, MAX(Price) AS HighestPrice FROM goods GROUP BY Food ORDER BY Food
SELECT Food, MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice FROM goods GROUP BY Food ORDER BY Food
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(ReceiptNumber) DESC LIMIT 3
SELECT Date FROM receipts GROUP BY Date ORDER BY COUNT(*) DESC LIMIT 3
SELECT T1.FirstName, T1.LastName, COUNT(T2.CustomerId) AS times_shopped FROM customers AS T1 JOIN receipts AS T2 ON T1.Id = T2.CustomerId GROUP BY T1.Id ORDER BY times_shopped DESC LIMIT 1
SELECT CustomerId, COUNT(*) AS NumberOfPurchases FROM receipts GROUP BY CustomerId ORDER BY NumberOfPurchases DESC LIMIT 1
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT Date, COUNT(DISTINCT CustomerId) FROM receipts GROUP BY Date
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id = T2.CustomerId JOIN items AS T3 ON T2.ReceiptNumber = T3.Receipt JOIN goods AS T4 ON T3.Item = T4.Id WHERE T4.Flavor = 'apple' AND T4.Food = 'Tart'
SELECT T1.FirstName, T1.LastName FROM customers AS T1 JOIN receipts AS T2 ON T1.Id = T2.CustomerId JOIN items AS T3 ON T2.ReceiptNumber = T3.Receipt JOIN goods AS T4 ON T3.Item = T4.Id WHERE T4.Flavor = 'apple' AND T4.Food = 'Tarts'
SELECT Id FROM goods WHERE Food = 'Cookies' AND Price < (SELECT min(price) FROM goods WHERE Food = 'Croissant')
SELECT Id FROM goods WHERE Food = 'cookies' AND Price < (SELECT min(Price) FROM goods WHERE Food = 'croissant')
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT avg(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Food = 'Cake' AND Price >= (SELECT avg(Price) FROM goods WHERE Food = 'Tart')
SELECT Id FROM goods WHERE Price > 2 * (SELECT avg(Price) FROM goods)
SELECT Id FROM goods WHERE Price > 2 * (SELECT avg(Price) FROM goods)
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT Id, Flavor, Food FROM goods ORDER BY Price
SELECT Id, Flavor FROM goods WHERE Food = 'Cakes' ORDER BY Flavor
SELECT Id, Flavor FROM goods WHERE Food = 'cake' ORDER BY Flavor
SELECT goods.Id FROM goods JOIN (SELECT Item, COUNT(*) AS count FROM items JOIN goods ON items.Item = goods.Id WHERE Flavor = 'chocolate' GROUP BY Item) AS T1 ON goods.Id = T1.Item WHERE T1.count <= 10
SELECT goods.Id FROM goods JOIN items ON goods.Id = items.Item WHERE goods.Flavor = 'chocolate' GROUP BY goods.Id HAVING COUNT(*) <= 10
SELECT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT DISTINCT Flavor FROM goods WHERE Food = 'Cake' AND Flavor NOT IN (SELECT Flavor FROM goods WHERE Food = 'Tart')
SELECT T1.Flavor, T1.Food, COUNT(*) AS popularity FROM goods AS T1 JOIN items AS T2 ON T1.Id = T2.Item GROUP BY T1.Id ORDER BY popularity DESC LIMIT 3
SELECT T2.Food, COUNT(*) AS total_purchases FROM items AS T1 JOIN goods AS T2 ON T1.Item = T2.Id GROUP BY T1.Item ORDER BY total_purchases DESC LIMIT 3
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING SUM(Price) > 150
SELECT T4.Id FROM customers AS T4 JOIN receipts AS T3 ON T4.Id = T3.CustomerId JOIN items AS T2 ON T3.ReceiptNumber = T2.Receipt JOIN goods AS T1 ON T2.Item = T1.Id GROUP BY T4.Id HAVING SUM(T1.Price) > 150
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING AVG(Price) > 5
SELECT CustomerId FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY CustomerId HAVING AVG(Price) > 5
SELECT Date FROM receipts JOIN items ON receipts.ReceiptNumber = items.Receipt JOIN goods ON items.Item = goods.Id GROUP BY Date HAVING SUM(Price) > 100
SELECT T1.Date FROM receipts AS T1 JOIN items AS T2 ON T1.ReceiptNumber = T2.Receipt JOIN goods AS T3 ON T2.Item = T3.Id GROUP BY T1.Date HAVING SUM(T3.Price) > 100
SELECT COUNT(*) FROM driver
SELECT COUNT(*) FROM driver
SELECT Make, COUNT(Driver_ID) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, COUNT(*) FROM driver WHERE Points > 150 GROUP BY Make
SELECT Make, AVG(Age) FROM driver GROUP BY Make
SELECT AVG(Age), Make FROM driver GROUP BY Make
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT AVG(Laps) FROM driver WHERE Age < 20
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner
SELECT Manager, Sponsor FROM team ORDER BY Car_Owner
SELECT Make FROM team GROUP BY Make HAVING COUNT(*) > 1
SELECT Make FROM team GROUP BY Make HAVING COUNT(*) > 1
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT Make FROM team WHERE Car_Owner = 'Buddy Arrington'
SELECT MAX(Points), MIN(Points) FROM driver
SELECT MAX(Points), MIN(Points) FROM driver
SELECT COUNT(*) FROM driver WHERE Points < 150
SELECT COUNT(*) FROM driver WHERE Points < 150
SELECT Driver FROM driver ORDER BY Age
SELECT Driver FROM driver ORDER BY Age
SELECT Driver FROM driver ORDER BY Points DESC
SELECT Driver, Points FROM driver ORDER BY Points DESC
SELECT Driver, Country FROM driver
SELECT Driver, Country FROM driver
SELECT MAX(T1.Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country = T2.Country_Id WHERE T2.Capital = 'Dublin'
SELECT MAX(T1.Points) FROM driver AS T1 JOIN country AS T2 ON T1.Country = T2.Country_Id WHERE T2.Capital = 'Dublin'
SELECT AVG(T1.Age) FROM driver AS T1 JOIN country AS T2 ON T1.Country = T2.Country_Id WHERE T2.Official_native_language = 'English'
SELECT AVG(T1.Age) FROM driver AS T1 JOIN country AS T2 ON T1.Country = T2.Country_Id WHERE T2.Official_native_language = 'English'
SELECT DISTINCT Country FROM driver WHERE Points > 150
SELECT DISTINCT Country FROM driver WHERE Points > 150
SELECT Capital FROM country WHERE Country = (SELECT Country FROM driver ORDER BY Points DESC LIMIT 1)
SELECT T2.Capital FROM driver AS T1 JOIN country AS T2 ON T1.Country = T2.Country_Id ORDER BY T1.Points DESC LIMIT 1
SELECT Make, COUNT(Driver_ID) FROM driver GROUP BY Make
SELECT Make, COUNT(DISTINCT Driver_ID) FROM driver GROUP BY Make
SELECT T1.Make FROM driver AS T1 JOIN team_driver AS T2 ON T1.Driver_ID = T2.Driver_ID GROUP BY T1.Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make ORDER BY COUNT(*) DESC LIMIT 1
SELECT Make FROM driver GROUP BY Make HAVING COUNT(Driver_ID) >= 3
SELECT Make FROM driver JOIN team_driver ON driver.Driver_ID = team_driver.Driver_ID GROUP BY Make HAVING COUNT(DISTINCT driver.Driver_ID) >= 3
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Team FROM team WHERE Team_ID NOT IN (SELECT Team_ID FROM team_driver)
SELECT Country FROM driver WHERE Make = 'Dodge' INTERSECT SELECT Country FROM driver WHERE Make = 'Chevrolet'
SELECT Country FROM driver WHERE Make = 'Dodge' INTERSECT SELECT Country FROM driver WHERE Make = 'Chevrolet'
SELECT SUM(Points) AS Total_Points, AVG(Points) AS Average_Points FROM driver
SELECT SUM(Points), AVG(Points) FROM driver
SELECT Country FROM country WHERE Country NOT IN (SELECT DISTINCT Country FROM driver)
SELECT Country FROM country WHERE Country NOT IN (SELECT DISTINCT Country FROM driver)
SELECT Manager, Sponsor FROM team WHERE Team_ID IN (SELECT Team_ID FROM team_driver GROUP BY Team_ID ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Manager, Sponsor FROM team WHERE Team_ID = (SELECT Team_ID FROM team_driver GROUP BY Team_ID ORDER BY COUNT(Driver_ID) DESC LIMIT 1)
SELECT T1.Manager, T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID HAVING COUNT(T2.Driver_ID) >= 2
SELECT T1.Manager, T1.Car_Owner FROM team AS T1 JOIN team_driver AS T2 ON T1.Team_ID = T2.Team_ID GROUP BY T1.Team_ID HAVING COUNT(DISTINCT T2.Driver_ID) >= 2
SELECT COUNT(*) FROM institution
SELECT COUNT(*) FROM institution
SELECT Name FROM institution ORDER BY Name
SELECT Name FROM institution ORDER BY Name
SELECT Name FROM institution ORDER BY Founded
SELECT Name FROM institution ORDER BY Founded
SELECT City, Province FROM institution
SELECT City, Province FROM institution
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution
SELECT MAX(Enrollment), MIN(Enrollment) FROM institution
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Affiliation FROM institution WHERE City != 'Vancouver'
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Capacity DESC
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT Stadium FROM institution ORDER BY Enrollment DESC LIMIT 1
SELECT T1.Name, T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID
SELECT T1.Name, T2.Nickname FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID
SELECT T1.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Enrollment ASC LIMIT 1
SELECT T1.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Enrollment ASC LIMIT 1
SELECT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID GROUP BY T1.Name ORDER BY COUNT(T2.Number_of_Championships) DESC
SELECT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Number_of_Championships DESC
SELECT DISTINCT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID
SELECT T1.Name FROM institution AS T1 JOIN Championship AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Number_of_Championships >= 1
SELECT SUM(T1.Number_of_Championships) FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Affiliation = 'public'
SELECT SUM(T1.Number_of_Championships) FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID WHERE T2.Affiliation = 'Public'
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT Affiliation, COUNT(Institution_ID) FROM institution GROUP BY Affiliation
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY count(*) DESC LIMIT 1
SELECT Affiliation FROM institution GROUP BY Affiliation ORDER BY COUNT(*) DESC LIMIT 1
SELECT Founded FROM institution GROUP BY Founded HAVING count(*) > 1
SELECT Founded, COUNT(*) FROM institution GROUP BY Founded HAVING COUNT(*) > 1
SELECT T1.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Capacity DESC
SELECT T1.Nickname FROM Championship AS T1 JOIN institution AS T2 ON T1.Institution_ID = T2.Institution_ID ORDER BY T2.Capacity DESC
SELECT SUM(Enrollment) FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Enrollment FROM institution WHERE City IN ('Vancouver', 'Calgary')
SELECT Province FROM institution WHERE Founded < 1920 INTERSECT SELECT Province FROM institution WHERE Founded > 1950
SELECT DISTINCT T1.Province FROM institution AS T1 WHERE EXISTS (SELECT 1 FROM institution AS T2 WHERE T2.Province = T1.Province AND T2.Founded < 1920) AND EXISTS (SELECT 1 FROM institution AS T3 WHERE T3.Province = T1.Province AND T3.Founded > 1950)
SELECT COUNT(DISTINCT Province) FROM institution
SELECT COUNT(DISTINCT Province) FROM institution
SELECT * FROM Warehouses
SELECT * FROM Warehouses
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York'
SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'New York'
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Contents FROM Boxes WHERE Value > 150
SELECT Warehouses.Code, AVG(Boxes.Value) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT AVG(T1.Value), T2.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code GROUP BY T2.Code
SELECT AVG(Value), SUM(Value) FROM Boxes
SELECT AVG(Value), SUM(Value) FROM Boxes
SELECT AVG(Capacity), SUM(Capacity) FROM Warehouses
SELECT AVG(Capacity) AS Average_Capacity, SUM(Capacity) AS Total_Capacity FROM Warehouses
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Maximum_Value FROM Boxes GROUP BY Contents
SELECT Contents, AVG(Value) AS Average_Value, MAX(Value) AS Maximum_Value FROM Boxes GROUP BY Contents
SELECT Contents FROM Boxes GROUP BY Contents ORDER BY SUM(Value) DESC LIMIT 1
SELECT Contents FROM Boxes ORDER BY Value DESC LIMIT 1
SELECT AVG(Value) FROM Boxes
SELECT AVG(Value) FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT DISTINCT Contents FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT COUNT(DISTINCT Contents) FROM Boxes
SELECT DISTINCT Location FROM Warehouses
SELECT DISTINCT Location FROM Warehouses
SELECT T1.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location = 'Chicago' OR T2.Location = 'New York'
SELECT T1.Code FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location = 'Chicago' OR T2.Location = 'New York'
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago' OR Warehouses.Location = 'New York'
SELECT DISTINCT T1.Contents FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code WHERE T2.Location = 'Chicago' OR T2.Location = 'New York'
SELECT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'Chicago' INTERSECT SELECT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York'
SELECT Contents FROM Boxes WHERE Contents NOT IN (SELECT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York')
SELECT DISTINCT Contents FROM Boxes WHERE Contents NOT IN (SELECT DISTINCT Contents FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Location = 'New York')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') AND Code NOT IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT DISTINCT T1.Code, T1.Location FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks' OR T2.Contents = 'Scissors'
SELECT DISTINCT T1.Code FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks' OR T2.Contents = 'Scissors'
SELECT location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') INTERSECT SELECT location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Rocks') INTERSECT SELECT Location FROM Warehouses WHERE Code IN (SELECT Warehouse FROM Boxes WHERE Contents = 'Scissors')
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT Code, Contents FROM Boxes ORDER BY Value
SELECT Code, Contents FROM Boxes ORDER BY Value LIMIT 1
SELECT Code, Contents FROM Boxes WHERE Value = (SELECT min(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes WHERE Value > (SELECT AVG(Value) FROM Boxes)
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT DISTINCT Contents FROM Boxes ORDER BY Contents
SELECT Code FROM Boxes WHERE Value > (SELECT max(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT Code FROM Boxes WHERE Value > (SELECT max(Value) FROM Boxes WHERE Contents = 'Rocks')
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT max(Value) FROM Boxes WHERE Contents = 'Scissors')
SELECT Code, Contents FROM Boxes WHERE Value > (SELECT MAX(Value) FROM Boxes WHERE Contents = 'Scissors')
SELECT SUM(Value) FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses ORDER BY Capacity DESC LIMIT 1)
SELECT SUM(Value) FROM Boxes WHERE Warehouse = (SELECT Code FROM Warehouses ORDER BY Capacity DESC LIMIT 1)
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150
SELECT Warehouse, AVG(Value) FROM Boxes GROUP BY Warehouse HAVING AVG(Value) > 150
SELECT Contents, SUM(Value) AS total_value, COUNT(Code) AS number_of_boxes FROM Boxes GROUP BY Contents
SELECT Contents, SUM(Value) AS Total_Value, COUNT(*) AS Number_of_Boxes FROM Boxes GROUP BY Contents
SELECT Location, SUM(Capacity) AS Total_Capacity, AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM Warehouses GROUP BY Location
SELECT Location, SUM(Capacity) AS Total_Capacity, AVG(Capacity) AS Average_Capacity, MAX(Capacity) AS Maximum_Capacity FROM Warehouses GROUP BY Location
SELECT SUM(Capacity) FROM Warehouses
SELECT SUM(Capacity) FROM Warehouses
SELECT MAX(T1.Value), T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code GROUP BY T2.Location
SELECT T1.Location, MAX(T2.Value) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse GROUP BY T1.Location
SELECT Warehouses.Code, COUNT(Boxes.Code) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT COUNT(Boxes.Code), Warehouses.Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code GROUP BY Warehouses.Code
SELECT COUNT(DISTINCT T1.Location) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks'
SELECT COUNT(DISTINCT T1.Code) FROM Warehouses AS T1 JOIN Boxes AS T2 ON T1.Code = T2.Warehouse WHERE T2.Contents = 'Rocks'
SELECT T1.Code, T2.Location FROM Boxes AS T1 JOIN Warehouses AS T2 ON T1.Warehouse = T2.Code
SELECT Boxes.Code, Warehouses.Location FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code
SELECT Boxes.Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago'
SELECT Boxes.Code FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location = 'Chicago'
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT Warehouse, COUNT(*) FROM Boxes GROUP BY Warehouse
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT Warehouses.Code, COUNT(DISTINCT Boxes.Contents) FROM Warehouses JOIN Boxes ON Warehouses.Code = Boxes.Warehouse GROUP BY Warehouses.Code
SELECT W.Code FROM Warehouses W WHERE (SELECT COUNT(*) FROM Boxes B WHERE B.Warehouse = W.Code) > W.Capacity
SELECT W.Code FROM Warehouses W JOIN Boxes B ON W.Code = B.Warehouse GROUP BY W.Code HAVING COUNT(*) > W.Capacity
SELECT SUM(Value) FROM Boxes WHERE Warehouse NOT IN (SELECT Code FROM Warehouses WHERE Location = 'Chicago')
SELECT SUM(Value) FROM Boxes JOIN Warehouses ON Boxes.Warehouse = Warehouses.Code WHERE Warehouses.Location != 'Chicago'
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT University_Name, City, State FROM university ORDER BY University_Name
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT COUNT(*) FROM university WHERE State IN ('Illinois', 'Ohio')
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
SELECT MAX(Enrollment), AVG(Enrollment), MIN(Enrollment) FROM university
SELECT Team_Name FROM university WHERE Enrollment > (SELECT avg(Enrollment) FROM university)
SELECT Team_Name FROM university WHERE Enrollment > (SELECT avg(Enrollment) FROM university)
SELECT DISTINCT Home_Conference FROM university
SELECT DISTINCT Home_Conference FROM university
SELECT Home_Conference, COUNT(*) FROM university GROUP BY Home_Conference
SELECT Home_Conference, COUNT(DISTINCT University_ID) FROM university GROUP BY Home_Conference
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT State FROM university GROUP BY State ORDER BY COUNT(*) DESC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING avg(Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference HAVING avg(Enrollment) > 2000
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY SUM(Enrollment) ASC LIMIT 1
SELECT Home_Conference FROM university GROUP BY Home_Conference ORDER BY SUM(Enrollment) ASC LIMIT 1
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT Major_Name, Major_Code FROM major ORDER BY Major_Code
SELECT T1.Major_Name, T2.Rank FROM major AS T1 JOIN major_ranking AS T2 ON T1.Major_ID = T2.Major_ID JOIN university AS T3 ON T2.University_ID = T3.University_ID WHERE T3.University_Name = 'Augustana College'
SELECT T2.Rank, T1.Major_Name FROM major AS T1 JOIN major_ranking AS T2 ON T1.Major_ID = T2.Major_ID JOIN university AS T3 ON T2.University_ID = T3.University_ID WHERE T3.University_Name = 'Augustana College'
SELECT T1.University_Name, T1.City, T1.State FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T2.Major_ID = T3.Major_ID WHERE T2.Rank = 1 AND T3.Major_Name = 'Accounting'
SELECT T1.University_Name, T1.City, T1.State FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T2.Major_ID = T3.Major_ID WHERE T2.Rank = 1 AND T3.Major_Name = 'Accounting'
SELECT T2.University_Name FROM major_ranking AS T1 JOIN university AS T2 ON T1.University_ID = T2.University_ID WHERE T1.Rank = 1 GROUP BY T1.University_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT T2.University_Name FROM major_ranking AS T1 JOIN university AS T2 ON T1.University_ID = T2.University_ID WHERE T1.Rank = 1 GROUP BY T1.University_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT University_Name FROM university WHERE University_ID NOT IN (SELECT University_ID FROM major_ranking WHERE Rank = 1)
SELECT U.University_Name FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name = 'Accounting' INTERSECT SELECT U.University_Name FROM university U JOIN major_ranking MR ON U.University_ID = MR.University_ID JOIN major M ON MR.Major_ID = M.Major_ID WHERE M.Major_Name = 'Urban Education'
SELECT University_Name FROM university WHERE University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Accounting')) AND University_ID IN (SELECT University_ID FROM major_ranking WHERE Major_ID IN (SELECT Major_ID FROM major WHERE Major_Name = 'Urban Education'))
SELECT T1.University_Name, T2.Rank FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T1.State = 'Wisconsin'
SELECT T1.University_Name, T2.Rank FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T1.State = 'Wisconsin'
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY Research_point DESC LIMIT 1
SELECT University_Name FROM university JOIN overall_ranking ON university.University_ID = overall_ranking.University_ID ORDER BY Research_point DESC LIMIT 1
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point
SELECT T1.University_Name FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.Major_Name = 'Accounting' AND T2.Rank >= 3
SELECT T1.University_Name FROM university AS T1 JOIN major_ranking AS T2 ON T1.University_ID = T2.University_ID JOIN major AS T3 ON T2.Major_ID = T3.Major_ID WHERE T3.Major_Name = 'Accounting' AND T2.Rank >= 3
SELECT SUM(T1.Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank <= 5
SELECT SUM(T1.Enrollment) FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Rank <= 5
SELECT T1.University_Name, T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID WHERE T2.Reputation_point IN (SELECT Reputation_point FROM overall_ranking ORDER BY Reputation_point DESC LIMIT 3)
SELECT T1.University_Name, T2.Citation_point FROM university AS T1 JOIN overall_ranking AS T2 ON T1.University_ID = T2.University_ID ORDER BY T2.Reputation_point DESC LIMIT 3
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(*) > 2
SELECT State FROM university WHERE Enrollment < 3000 GROUP BY State HAVING COUNT(*) > 2
SELECT Title FROM Movies WHERE Rating IS NULL
SELECT Title FROM Movies WHERE Rating IS NULL OR Rating = ''
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT Title FROM Movies WHERE Rating = 'G'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon'
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT Movies.Title, MovieTheaters.Name FROM Movies JOIN MovieTheaters ON Movies.Code = MovieTheaters.Movie
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(*) FROM Movies WHERE Rating = 'G'
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT Movie) FROM MovieTheaters
SELECT COUNT(DISTINCT T1.Title) FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie
SELECT COUNT(DISTINCT T1.Title) FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie
SELECT COUNT(DISTINCT Code) FROM MovieTheaters
SELECT COUNT(DISTINCT Code) FROM MovieTheaters
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT Rating FROM Movies WHERE Title LIKE '%Citizen%'
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G' OR T2.Rating = 'PG'
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G' OR T2.Rating = 'PG'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon' OR T2.Name = 'Imperial'
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie WHERE T2.Name = 'Odeon' OR T2.Name = 'Imperial'
SELECT title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon') INTERSECT SELECT title FROM Movies WHERE Code IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Imperial')
SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Name = 'Odeon' INTERSECT SELECT T2.Title FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T1.Name = 'Imperial'
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters WHERE Name = 'Odeon')
SELECT Title FROM Movies ORDER BY Title
SELECT Title FROM Movies ORDER BY Title
SELECT Title FROM Movies ORDER BY Rating
SELECT Title FROM Movies ORDER BY Rating
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code GROUP BY T1.Name ORDER BY COUNT(DISTINCT T1.Movie) DESC LIMIT 1
SELECT Name FROM MovieTheaters GROUP BY Name ORDER BY COUNT(DISTINCT Movie) DESC LIMIT 1
SELECT T1.Title FROM Movies AS T1 JOIN MovieTheaters AS T2 ON T1.Code = T2.Movie GROUP BY T2.Movie ORDER BY COUNT(*) DESC LIMIT 1
SELECT Title FROM Movies WHERE Code = (SELECT Movie FROM MovieTheaters GROUP BY Movie ORDER BY COUNT(*) DESC LIMIT 1)
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT Rating, COUNT(*) FROM Movies GROUP BY Rating
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT COUNT(*) FROM Movies WHERE Rating IS NOT NULL
SELECT DISTINCT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code
SELECT DISTINCT Name FROM MovieTheaters WHERE Movie IS NOT NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT Name FROM MovieTheaters WHERE Movie IS NULL
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G'
SELECT T1.Name FROM MovieTheaters AS T1 JOIN Movies AS T2 ON T1.Movie = T2.Code WHERE T2.Rating = 'G'
SELECT Title FROM Movies
SELECT Title FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT DISTINCT Rating FROM Movies
SELECT * FROM Movies WHERE Rating = 'unrated'
SELECT * FROM Movies WHERE Rating = 'unrated'
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT Title FROM Movies WHERE Code NOT IN (SELECT Movie FROM MovieTheaters)
SELECT T2.Name FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient = T2.AccountNumber ORDER BY T1.Weight DESC LIMIT 1
SELECT T1.Name FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Recipient ORDER BY T2.Weight DESC LIMIT 1
SELECT SUM(T1.Weight) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name = 'Leo Wong'
SELECT SUM(T1.Weight) FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name = 'Leo Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Position FROM Employee WHERE Name = 'Amy Wong'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT Salary, Position FROM Employee WHERE Name = 'Turanga Leela'
SELECT AVG(Salary) FROM Employee WHERE Position = 'intern'
SELECT AVG(Salary) FROM Employee WHERE Position = 'intern'
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Position = 'Physician'
SELECT Level FROM Has_Clearance JOIN Employee ON Has_Clearance.Employee = Employee.EmployeeID WHERE Employee.Position = 'physician'
SELECT PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT PackageNumber FROM Package JOIN Client ON Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT * FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT DISTINCT PackageNumber FROM Package JOIN Client ON Package.Sender = Client.AccountNumber OR Package.Recipient = Client.AccountNumber WHERE Client.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package JOIN Client AS C1 ON Package.Sender = C1.AccountNumber JOIN Client AS C2 ON Package.Recipient = C2.AccountNumber WHERE C1.Name = 'Ogden Wernstrom' AND C2.Name = 'Leo Wong'
SELECT COUNT(*) FROM Package AS P JOIN Client AS C1 ON P.Sender = C1.AccountNumber JOIN Client AS C2 ON P.Recipient = C2.AccountNumber WHERE C1.Name = 'Ogden Wernstrom' AND C2.Name = 'Leo Wong'
SELECT Contents FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name = 'John Zoidfarb'
SELECT T1.Contents FROM Package AS T1 JOIN Client AS T2 ON T1.Sender = T2.AccountNumber WHERE T2.Name = 'John Zoidfarb'
SELECT PackageNumber, MAX(Weight) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE '%John%'
SELECT PackageNumber, Weight FROM Package JOIN Client ON Package.Sender = Client.AccountNumber WHERE Client.Name LIKE '%John%' ORDER BY Weight DESC LIMIT 1
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT PackageNumber, Weight FROM Package ORDER BY Weight ASC LIMIT 3
SELECT T1.Name, COUNT(*) AS num_packages FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.Name ORDER BY num_packages DESC LIMIT 1
SELECT T1.Name, COUNT(*) AS package_count FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Sender GROUP BY T1.AccountNumber ORDER BY package_count DESC LIMIT 1
SELECT T1.Name, COUNT(T2.Recipient) AS NumPackages FROM Client AS T1 JOIN Package AS T2 ON T1.AccountNumber = T2.Recipient GROUP BY T1.Name ORDER BY NumPackages ASC LIMIT 1
SELECT T2.Name, COUNT(*) AS NumPackages FROM Package AS T1 JOIN Client AS T2 ON T1.Recipient = T2.AccountNumber GROUP BY T1.Recipient ORDER BY NumPackages ASC LIMIT 1
SELECT Client.Name FROM Client JOIN Package ON Client.AccountNumber = Package.Sender GROUP BY Client.AccountNumber HAVING COUNT(Package.PackageNumber) > 1
SELECT Name FROM Client WHERE AccountNumber IN (SELECT Sender FROM Package GROUP BY Sender HAVING COUNT(*) > 1)
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Coordinates FROM Planet WHERE Name = 'Mars'
SELECT Name, Coordinates FROM Planet ORDER BY Name
SELECT Name, Coordinates FROM Planet ORDER BY Name
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J. Fry'
SELECT ShipmentID FROM Shipment JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Employee.Name = 'Phillip J Fry'
SELECT Date FROM Shipment
SELECT Date FROM Shipment
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars'
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID JOIN Employee AS T3 ON T1.Manager = T3.EmployeeID WHERE T2.Name = 'Mars' AND T3.Name = 'Turanga Leela'
SELECT T1.ShipmentID FROM Shipment AS T1 JOIN Planet AS T2 ON T1.Planet = T2.PlanetID JOIN Employee AS T3 ON T1.Manager = T3.EmployeeID WHERE T2.Name = 'Mars' AND T3.Name = 'Turanga Leela'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name = 'Mars' OR Employee.Name = 'Turanga Leela'
SELECT ShipmentID FROM Shipment JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Employee ON Shipment.Manager = Employee.EmployeeID WHERE Planet.Name = 'Mars' AND Employee.Name = 'Turanga Leela'
SELECT P.Name, COUNT(S.Planet) AS TotalShipments FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet GROUP BY P.Name
SELECT P.Name, COUNT(S.ShipmentID) FROM Planet AS P JOIN Shipment AS S ON P.PlanetID = S.Planet GROUP BY P.Name
SELECT T1.Name FROM Planet AS T1 JOIN Shipment AS T2 ON T1.PlanetID = T2.Planet GROUP BY T1.PlanetID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM Planet WHERE PlanetID = (SELECT Planet FROM Shipment GROUP BY Planet ORDER BY COUNT(*) DESC LIMIT 1)
SELECT E.Name, COUNT(S.ShipmentID) FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.Name
SELECT E.Name, COUNT(S.ShipmentID) AS NumberOfShipments FROM Employee E JOIN Shipment S ON E.EmployeeID = S.Manager GROUP BY E.Name
SELECT SUM(T1.Weight) FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = 'Mars'
SELECT SUM(T1.Weight) FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = 'Mars'
SELECT P.Name, SUM(Pa.Weight) AS TotalWeight FROM Planet P JOIN Shipment S ON P.PlanetID = S.Planet JOIN Package Pa ON S.ShipmentID = Pa.Shipment GROUP BY P.Name
SELECT SUM(T1.Weight), T3.Name FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID GROUP BY T3.Name
SELECT T1.Name FROM Planet AS T1 JOIN Shipment AS T2 ON T1.PlanetID = T2.Planet JOIN Package AS T3 ON T2.ShipmentID = T3.Shipment GROUP BY T1.Name HAVING SUM(T3.Weight) > 30
SELECT T1.Name FROM Planet AS T1 JOIN Shipment AS T2 ON T1.PlanetID = T2.Planet JOIN Package AS T3 ON T2.ShipmentID = T3.Shipment GROUP BY T1.Name HAVING SUM(T3.Weight) > 30
SELECT T1.PackageNumber FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID JOIN Client AS T4 ON T1.Sender = T4.AccountNumber WHERE T3.Name = 'Omicron Persei 8' AND T4.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package JOIN Client ON Package.Sender = Client.AccountNumber JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID WHERE Client.Name = 'Zapp Brannigan' AND Planet.Name = 'Omicron Persei 8'
SELECT T1.PackageNumber FROM Package AS T1 JOIN Shipment AS T2 ON T1.Shipment = T2.ShipmentID JOIN Planet AS T3 ON T2.Planet = T3.PlanetID JOIN Client AS T4 ON T1.Sender = T4.AccountNumber WHERE T3.Name = 'Omicron Persei 8' OR T4.Name = 'Zapp Brannigan'
SELECT COUNT(*) FROM Package JOIN Shipment ON Package.Shipment = Shipment.ShipmentID JOIN Planet ON Shipment.Planet = Planet.PlanetID JOIN Client ON Package.Sender = Client.AccountNumber WHERE Planet.Name = 'Omicron Persei 8' OR Client.Name = 'Zapp Brannigan'
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT PackageNumber, Weight FROM Package WHERE Weight BETWEEN 10 AND 30
SELECT Employee.Name FROM Employee LEFT JOIN Has_Clearance ON Employee.EmployeeID = Has_Clearance.Employee AND Has_Clearance.Planet = (SELECT PlanetID FROM Planet WHERE Name = 'Mars') WHERE Has_Clearance.Level IS NULL;
SELECT Name FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = 'Omega III'
SELECT T1.Name FROM Employee AS T1 JOIN Has_Clearance AS T2 ON T1.EmployeeID = T2.Employee JOIN Planet AS T3 ON T2.Planet = T3.PlanetID WHERE T3.Name = 'Omega III'
SELECT Name FROM Planet WHERE PlanetID IN (SELECT Planet FROM Has_Clearance GROUP BY Planet HAVING COUNT(DISTINCT Employee) = 1)
SELECT T1.Name FROM Planet AS T1 JOIN Has_Clearance AS T2 ON T1.PlanetID = T2.Planet GROUP BY T1.PlanetID HAVING COUNT(DISTINCT T2.Employee) = 1
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary BETWEEN 5000 AND 10000
SELECT Name FROM Employee WHERE Salary > 5000 OR Salary > (SELECT AVG(Salary) FROM Employee)
SELECT Name FROM Employee WHERE Salary > (SELECT avg(Salary) FROM Employee) OR Salary > 5000
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT COUNT(*) FROM Employee WHERE EmployeeID NOT IN (SELECT Employee FROM Has_Clearance JOIN Planet ON Has_Clearance.Planet = Planet.PlanetID WHERE Planet.Name = 'Mars')
SELECT COUNT(*) FROM game
SELECT COUNT(*) FROM game
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT Title, Developers FROM game ORDER BY Units_sold_Millions DESC
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT AVG(Units_sold_Millions) FROM game WHERE Developers != 'Nintendo'
SELECT Platform_name, Market_district FROM platform
SELECT Platform_name, Market_district FROM platform
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT Platform_ID, Platform_name FROM platform WHERE Download_rank = 1
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT MAX(Rank_of_the_year), MIN(Rank_of_the_year) FROM player
SELECT COUNT(*) FROM player WHERE Rank_of_the_year < 3
SELECT COUNT(*) FROM player WHERE Rank_of_the_year <= 3
SELECT Player_name FROM player ORDER BY Player_name
SELECT Player_name FROM player ORDER BY Player_name
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT Player_name, College FROM player ORDER BY Rank_of_the_year DESC
SELECT T1.Player_name, T1.Rank_of_the_year FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID = T2.Player_ID JOIN game AS T3 ON T2.Game_ID = T3.Game_ID WHERE T3.Title = 'Super Mario World'
SELECT T1.Player_name, T1.Rank_of_the_year FROM player AS T1 JOIN game_player AS T2 ON T1.Player_ID = T2.Player_ID JOIN game AS T3 ON T2.Game_ID = T3.Game_ID WHERE T3.Title = 'Super Mario World'
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.College = 'Auburn'
SELECT DISTINCT T1.Developers FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.College = 'Auburn'
SELECT AVG(T1.Units_sold_Millions) FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.Position = 'Guard'
SELECT AVG(T1.Units_sold_Millions) FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.Position = 'Guard'
SELECT T1.Title, T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID
SELECT T1.Title, T2.Platform_name FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID WHERE T2.Market_district = 'Asia' OR T2.Market_district = 'USA'
SELECT T1.Title FROM game AS T1 JOIN platform AS T2 ON T1.Platform_ID = T2.Platform_ID WHERE T2.Market_district = 'Asia' OR T2.Market_district = 'USA'
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise, COUNT(*) FROM game GROUP BY Franchise
SELECT Franchise FROM game GROUP BY Franchise ORDER BY count(*) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise ORDER BY COUNT(Game_ID) DESC LIMIT 1
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) >= 2
SELECT Franchise FROM game GROUP BY Franchise HAVING COUNT(Game_ID) > 1
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT Player_name FROM player WHERE Player_ID NOT IN (SELECT Player_ID FROM game_player)
SELECT title FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Oklahoma')) INTERSECT SELECT title FROM game WHERE Game_ID IN (SELECT Game_ID FROM game_player WHERE Player_ID IN (SELECT Player_ID FROM player WHERE College = 'Auburn'))
SELECT DISTINCT T1.Title FROM game AS T1 JOIN game_player AS T2 ON T1.Game_ID = T2.Game_ID JOIN player AS T3 ON T2.Player_ID = T3.Player_ID WHERE T3.College = 'Oklahoma' OR T3.College = 'Auburn'
SELECT DISTINCT Franchise FROM game
SELECT DISTINCT Franchise FROM game
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.Position = 'Guard')
SELECT Title FROM game WHERE Game_ID NOT IN (SELECT Game_ID FROM game_player JOIN player ON game_player.Player_ID = player.Player_ID WHERE player.Position = 'Guard')
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press ORDER BY Year_Profits_billion DESC
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT Name FROM press WHERE Year_Profits_billion > 15 OR Month_Profits_billion > 1
SELECT AVG(Year_Profits_billion), MAX(Year_Profits_billion) FROM press
SELECT Press_ID, Name, AVG(Year_Profits_billion) AS Average_Profit, MAX(Year_Profits_billion) AS Maximum_Profit FROM press GROUP BY Press_ID, Name
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press ORDER BY Month_Profits_billion DESC LIMIT 1
SELECT Name FROM press WHERE Month_Profits_billion = (SELECT max(Month_Profits_billion) FROM press) OR Month_Profits_billion = (SELECT min(Month_Profits_billion) FROM press)
SELECT Name FROM press WHERE Month_Profits_billion IN (SELECT max(Month_Profits_billion) FROM press UNION SELECT min(Month_Profits_billion) FROM press)
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT COUNT(*) FROM author WHERE Age < 30
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, AVG(Age) FROM author GROUP BY Gender
SELECT Gender, COUNT(*) FROM author WHERE Age > 30 GROUP BY Gender
SELECT COUNT(*), Gender FROM author WHERE Age > 30 GROUP BY Gender
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Title FROM book ORDER BY Release_date DESC
SELECT Book_Series, COUNT(Book_ID) FROM book GROUP BY Book_Series
SELECT Book_Series, COUNT(Book_ID) FROM book GROUP BY Book_Series
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Title, Release_date FROM book ORDER BY Sale_Amount DESC LIMIT 5
SELECT Book_Series FROM book WHERE Book_Series IN (SELECT Book_Series FROM book WHERE Sale_Amount > 1000) AND Book_Series IN (SELECT Book_Series FROM book WHERE Sale_Amount < 500)
SELECT Book_Series FROM book WHERE Sale_Amount > 1000 INTERSECT SELECT Book_Series FROM book WHERE Sale_Amount < 500
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'MM') AND Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'MM') INTERSECT SELECT Name FROM author WHERE Author_ID IN (SELECT Author_ID FROM book WHERE Book_Series = 'LT')
SELECT Name, Age FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book)
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Name HAVING COUNT(*) > 1
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Name HAVING COUNT(T2.Book_ID) > 1
SELECT T1.Title, T2.Name AS Author_Name, T3.Name AS Publisher_Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID = T2.Author_ID JOIN press AS T3 ON T1.Press_ID = T3.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT T1.Title, T2.Name AS Author_Name, T3.Name AS Press_Name FROM book AS T1 JOIN author AS T2 ON T1.Author_ID = T2.Author_ID JOIN press AS T3 ON T1.Press_ID = T3.Press_ID ORDER BY T1.Sale_Amount DESC LIMIT 3
SELECT P.Name, SUM(B.Sale_Amount) FROM press P JOIN book B ON P.Press_ID = B.Press_ID GROUP BY P.Name
SELECT T1.Name, SUM(T2.Sale_Amount) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID = T2.Press_ID GROUP BY T1.Name
SELECT count(*), T2.Name FROM book AS T1 JOIN press AS T2 ON T1.Press_ID = T2.Press_ID WHERE T1.Sale_Amount > 1000 GROUP BY T1.Press_ID
SELECT T1.Name, COUNT(*) FROM press AS T1 JOIN book AS T2 ON T1.Press_ID = T2.Press_ID WHERE T2.Sale_Amount > 1000 GROUP BY T1.Name
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name FROM author AS T1 JOIN book AS T2 ON T1.Author_ID = T2.Author_ID ORDER BY T2.Sale_Amount DESC LIMIT 1
SELECT T1.Name, T1.Gender FROM author AS T1 JOIN (SELECT Author_ID FROM book GROUP BY Author_ID ORDER BY COUNT(*) DESC LIMIT 1) AS T2 ON T1.Author_ID = T2.Author_ID
SELECT T2.Name, T2.Gender FROM book AS T1 JOIN author AS T2 ON T1.Author_ID = T2.Author_ID GROUP BY T1.Author_ID ORDER BY COUNT(*) DESC LIMIT 1
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book WHERE Press_ID IN (SELECT Press_ID FROM press WHERE Name = 'Accor'))
SELECT Name FROM author WHERE Author_ID NOT IN (SELECT Author_ID FROM book JOIN press ON book.Press_ID = press.Press_ID WHERE press.Name = 'Accor')
SELECT T2.Name, T2.Year_Profits_billion FROM press AS T2 JOIN book AS T1 ON T2.Press_ID = T1.Press_ID GROUP BY T2.Press_ID HAVING COUNT(T1.Book_ID) > 2
SELECT T1.Name, T1.Year_Profits_billion FROM press AS T1 JOIN book AS T2 ON T1.Press_ID = T2.Press_ID GROUP BY T1.Press_ID HAVING COUNT(*) > 2
SELECT COUNT(*) FROM Authors
SELECT author_name FROM Authors
SELECT author_name, other_details FROM Authors
SELECT other_details FROM Authors WHERE author_name = 'Addison Denesik'
SELECT COUNT(*) FROM Documents
SELECT author_name FROM Documents WHERE document_id = 4
SELECT author_name FROM Documents WHERE document_name = 'Travel to Brazil'
SELECT COUNT(*) FROM Documents WHERE author_name = 'Era Kerluke'
SELECT document_name, document_description FROM Documents
SELECT document_id, document_name FROM Documents WHERE author_name = 'Bianka Cummings'
SELECT A.author_name, A.other_details FROM Authors A JOIN Documents D ON A.author_name = D.author_name WHERE D.document_name = 'Travel to China'
SELECT Authors.author_name, COUNT(Documents.document_id) FROM Authors JOIN Documents ON Authors.author_name = Documents.author_name GROUP BY Authors.author_name
SELECT author_name FROM Documents GROUP BY author_name ORDER BY COUNT(*) DESC LIMIT 1
SELECT author_name FROM Documents GROUP BY author_name HAVING COUNT(*) >= 2
SELECT COUNT(*) FROM Business_Processes
SELECT next_process_id, process_name, process_description FROM Business_Processes WHERE process_id = 9
SELECT process_name FROM Business_Processes WHERE process_id = (SELECT next_process_id FROM Business_Processes WHERE process_id = 9)
SELECT COUNT(*) FROM Process_Outcomes
SELECT process_outcome_code, process_outcome_description FROM Process_Outcomes
SELECT process_outcome_description FROM Process_Outcomes WHERE process_outcome_code = 'working'
SELECT COUNT(DISTINCT process_status_code) FROM Process_Status
SELECT process_status_code, process_status_description FROM Process_Status
SELECT process_status_description FROM Process_Status WHERE process_status_code = 'ct'
SELECT COUNT(*) FROM Staff
SELECT staff_id, staff_details FROM Staff
SELECT staff_details FROM Staff WHERE staff_id = 100
SELECT COUNT(DISTINCT staff_role_code) FROM Ref_Staff_Roles
SELECT staff_role_code, staff_role_description FROM Ref_Staff_Roles
SELECT staff_role_description FROM Ref_Staff_Roles WHERE staff_role_code = 'HR'
SELECT COUNT(DISTINCT T1.document_id) FROM Documents AS T1 JOIN Documents_Processes AS T2 ON T1.document_id = T2.document_id
SELECT DISTINCT process_id FROM Documents_Processes
SELECT document_id FROM Documents WHERE document_id NOT IN (SELECT document_id FROM Documents_Processes)
SELECT process_id FROM Business_Processes WHERE process_id NOT IN (SELECT process_id FROM Documents_Processes)
SELECT T3.process_outcome_description, T4.process_status_description FROM Documents AS T1 JOIN Documents_Processes AS T2 ON T1.document_id = T2.document_id JOIN Process_Outcomes AS T3 ON T2.process_outcome_code = T3.process_outcome_code JOIN Process_Status AS T4 ON T2.process_status_code = T4.process_status_code WHERE T1.document_id = 0
SELECT T1.process_name FROM Business_Processes AS T1 JOIN Documents_Processes AS T2 ON T1.process_id = T2.process_id JOIN Documents AS T3 ON T2.document_id = T3.document_id WHERE T3.document_name = 'Travel to Brazil'
SELECT T1.process_id, COUNT(DISTINCT T2.document_id) FROM Business_Processes AS T1 JOIN Documents_Processes AS T2 ON T1.process_id = T2.process_id GROUP BY T1.process_id
SELECT COUNT(DISTINCT T1.staff_id) FROM Staff AS T1 JOIN Staff_in_Processes AS T2 ON T1.staff_id = T2.staff_id WHERE T2.document_id = 0 AND T2.process_id = 9
SELECT T1.staff_id, COUNT(T2.process_id) FROM Staff AS T1 JOIN Staff_in_Processes AS T2 ON T1.staff_id = T2.staff_id GROUP BY T1.staff_id
SELECT T1.staff_role_code, COUNT(T2.process_id) FROM Ref_Staff_Roles AS T1 JOIN Staff_in_Processes AS T2 ON T1.staff_role_code = T2.staff_role_code GROUP BY T1.staff_role_code
SELECT COUNT(DISTINCT T2.staff_role_code) FROM Staff AS T1 JOIN Staff_in_Processes AS T2 ON T1.staff_id = T2.staff_id WHERE T1.staff_id = 3
SELECT COUNT(*) FROM Agencies
SELECT COUNT(*) FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT agency_id, agency_details FROM Agencies
SELECT COUNT(*) FROM Clients
SELECT COUNT(*) FROM Clients
SELECT client_id, client_details FROM Clients
SELECT client_id, client_details FROM Clients
SELECT Agencies.agency_id, COUNT(Clients.client_id) FROM Agencies JOIN Clients ON Agencies.agency_id = Clients.agency_id GROUP BY Agencies.agency_id
SELECT agency_id, COUNT(client_id) FROM Clients GROUP BY agency_id
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.client_id) DESC LIMIT 1
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN (SELECT agency_id FROM Clients GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1) AS C ON A.agency_id = C.agency_id
SELECT A.agency_id, A.agency_details FROM Agencies A JOIN Clients C ON A.agency_id = C.agency_id GROUP BY A.agency_id HAVING COUNT(C.client_id) >= 2
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id HAVING COUNT(T2.client_id) >= 2
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id WHERE T2.client_details = 'Mac'
SELECT T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id WHERE T2.client_details LIKE '%Mac%'
SELECT Clients.*, Agencies.* FROM Clients JOIN Agencies ON Clients.agency_id = Agencies.agency_id
SELECT T1.client_details, T2.agency_details FROM Clients AS T1 JOIN Agencies AS T2 ON T1.agency_id = T2.agency_id
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT sic_code, COUNT(client_id) FROM Clients GROUP BY sic_code
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT client_id, client_details FROM Clients WHERE sic_code = 'Bad'
SELECT DISTINCT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id
SELECT DISTINCT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Clients AS T2 ON T1.agency_id = T2.agency_id
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT DISTINCT agency_id FROM Clients)
SELECT agency_id FROM Agencies WHERE agency_id NOT IN (SELECT agency_id FROM Clients)
SELECT COUNT(*) FROM Invoices
SELECT COUNT(*) FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT invoice_id, invoice_status, invoice_details FROM Invoices
SELECT T1.client_id, COUNT(T2.invoice_id) FROM Clients AS T1 LEFT JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id
SELECT T1.client_id, COUNT(T2.invoice_id) FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id
SELECT T1.client_id, T1.client_details FROM Clients AS T1 JOIN (SELECT client_id, COUNT(*) AS invoice_count FROM Invoices GROUP BY client_id ORDER BY invoice_count DESC LIMIT 1) AS T2 ON T1.client_id = T2.client_id
SELECT T1.client_id, T1.client_details FROM Clients AS T1 JOIN (SELECT client_id, COUNT(*) AS invoice_count FROM Invoices GROUP BY client_id ORDER BY invoice_count DESC LIMIT 1) AS T2 ON T1.client_id = T2.client_id
SELECT T1.client_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id HAVING COUNT(T2.invoice_id) >= 2
SELECT T1.client_id FROM Clients AS T1 JOIN Invoices AS T2 ON T1.client_id = T2.client_id GROUP BY T1.client_id HAVING COUNT(T2.invoice_id) >= 2
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status, COUNT(*) FROM Invoices GROUP BY invoice_status
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT invoice_status FROM Invoices GROUP BY invoice_status ORDER BY COUNT(*) DESC LIMIT 1
SELECT T1.invoice_status, T1.invoice_details, T2.client_id, T2.client_details, T3.agency_id, T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Agencies AS T3 ON T2.agency_id = T3.agency_id
SELECT T1.invoice_status, T1.invoice_details, T2.client_id, T2.client_details, T3.agency_id, T3.agency_details FROM Invoices AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Agencies AS T3 ON T2.agency_id = T3.agency_id
SELECT meeting_type, other_details FROM Meetings
SELECT DISTINCT meeting_type, other_details FROM Meetings
SELECT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT DISTINCT meeting_outcome, purpose_of_meeting FROM Meetings
SELECT T1.payment_id, T1.payment_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id WHERE T2.invoice_status = 'Working'
SELECT payment_id, payment_details FROM Payments JOIN Invoices ON Payments.invoice_id = Invoices.invoice_id WHERE Invoices.invoice_status = 'Working'
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT invoice_id, invoice_status FROM Invoices WHERE invoice_id NOT IN (SELECT invoice_id FROM Payments)
SELECT COUNT(*) FROM Payments
SELECT COUNT(*) FROM Payments
SELECT T1.payment_id, T1.invoice_id, T2.invoice_details FROM Payments AS T1 JOIN Invoices AS T2 ON T1.invoice_id = T2.invoice_id
SELECT payment_id, invoice_id, payment_details FROM Payments
SELECT DISTINCT T1.invoice_id, T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id
SELECT DISTINCT T1.invoice_id, T1.invoice_status FROM Invoices AS T1 JOIN Payments AS T2 ON T1.invoice_id = T2.invoice_id
SELECT Invoices.invoice_id, COUNT(Payments.payment_id) AS number_of_payments FROM Invoices LEFT JOIN Payments ON Invoices.invoice_id = Payments.invoice_id GROUP BY Invoices.invoice_id
SELECT invoice_id, COUNT(*) FROM Payments GROUP BY invoice_id
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 WHERE T1.invoice_id IN (SELECT invoice_id FROM Payments GROUP BY invoice_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.invoice_id, T1.invoice_status, T1.invoice_details FROM Invoices AS T1 WHERE T1.invoice_id IN (SELECT T2.invoice_id FROM Payments AS T2 GROUP BY T2.invoice_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT COUNT(*) FROM Staff
SELECT COUNT(*) FROM Staff
SELECT Agencies.agency_id, COUNT(Staff.staff_id) FROM Agencies JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id
SELECT Agencies.agency_id, COUNT(Staff.staff_id) FROM Agencies JOIN Staff ON Agencies.agency_id = Staff.agency_id GROUP BY Agencies.agency_id
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 WHERE T1.agency_id = (SELECT agency_id FROM Staff GROUP BY agency_id ORDER BY COUNT(*) DESC LIMIT 1)
SELECT T1.agency_id, T1.agency_details FROM Agencies AS T1 JOIN Staff AS T2 ON T1.agency_id = T2.agency_id GROUP BY T1.agency_id ORDER BY COUNT(T2.staff_id) DESC LIMIT 1
SELECT meeting_outcome, COUNT(meeting_id) FROM Meetings GROUP BY meeting_outcome
SELECT meeting_outcome, COUNT(*) FROM Meetings GROUP BY meeting_outcome
SELECT Clients.client_id, COUNT(Meetings.meeting_id) FROM Clients JOIN Meetings ON Clients.client_id = Meetings.client_id GROUP BY Clients.client_id
SELECT client_id, COUNT(*) FROM Meetings GROUP BY client_id
SELECT meeting_type, COUNT(*) AS number_of_meetings, client_id FROM Meetings GROUP BY client_id, meeting_type
SELECT meeting_type, COUNT(*) FROM Meetings GROUP BY meeting_type
SELECT T1.meeting_id, T1.meeting_outcome, T1.meeting_type, T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id
SELECT T1.meeting_id, T1.meeting_outcome, T1.meeting_type, T2.client_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id
SELECT T1.meeting_id, COUNT(DISTINCT T2.staff_id) AS num_staff FROM Meetings AS T1 JOIN Staff_in_Meetings AS T2 ON T1.meeting_id = T2.meeting_id GROUP BY T1.meeting_id
SELECT meeting_id, COUNT(staff_id) FROM Staff_in_Meetings GROUP BY meeting_id
SELECT staff_id, meeting_count FROM (SELECT staff_id, COUNT(meeting_id) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id) AS subquery WHERE meeting_count = (SELECT MIN(meeting_count) FROM (SELECT staff_id, COUNT(meeting_id) AS meeting_count FROM Staff_in_Meetings GROUP BY staff_id) AS subquery2)
SELECT staff_id FROM Staff_in_Meetings GROUP BY staff_id HAVING COUNT(*) = (SELECT MIN(COUNT(*)) FROM Staff_in_Meetings GROUP BY staff_id)
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(DISTINCT staff_id) FROM Staff_in_Meetings
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT COUNT(*) FROM Staff WHERE staff_id NOT IN (SELECT staff_id FROM Staff_in_Meetings)
SELECT DISTINCT T1.client_id, T1.client_details FROM Clients AS T1 LEFT JOIN Meetings AS T2 ON T1.client_id = T2.client_id LEFT JOIN Invoices AS T3 ON T1.client_id = T3.client_id WHERE T2.client_id IS NOT NULL OR T3.client_id IS NOT NULL
SELECT DISTINCT T1.client_id, T1.client_details FROM Clients AS T1 LEFT JOIN Meetings AS T2 ON T1.client_id = T2.client_id LEFT JOIN Invoices AS T3 ON T1.client_id = T3.client_id WHERE T2.client_id IS NOT NULL OR T3.client_id IS NOT NULL
SELECT DISTINCT T1.staff_id, T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id = T2.staff_id WHERE T1.staff_details LIKE '%s%'
SELECT DISTINCT T1.staff_id, T1.staff_details FROM Staff AS T1 JOIN Staff_in_Meetings AS T2 ON T1.staff_id = T2.staff_id WHERE T1.staff_details LIKE '%s%'
SELECT client_id, sic_code, agency_id FROM Clients WHERE client_id IN (SELECT client_id FROM Meetings GROUP BY client_id HAVING COUNT(*) = 1) AND client_id IN (SELECT client_id FROM Invoices)
SELECT C.client_id, C.sic_code, C.agency_id FROM Clients C WHERE C.client_id IN (SELECT client_id FROM Meetings GROUP BY client_id HAVING COUNT(*) = 1) AND C.client_id IN (SELECT client_id FROM Invoices)
SELECT T1.start_date_time, T1.end_date_time, T2.client_details, T4.staff_details FROM Meetings AS T1 JOIN Clients AS T2 ON T1.client_id = T2.client_id JOIN Staff_in_Meetings AS T3 ON T1.meeting_id = T3.meeting_id JOIN Staff AS T4 ON T3.staff_id = T4.staff_id
SELECT M.start_date_time, M.end_date_time, C.client_details, S.staff_details FROM Meetings M JOIN Clients C ON M.client_id = C.client_id JOIN Staff_in_Meetings SM ON M.meeting_id = SM.meeting_id JOIN Staff S ON SM.staff_id = S.staff_id
