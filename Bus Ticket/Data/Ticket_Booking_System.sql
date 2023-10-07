CREATE DATABASE IF NOT EXISTS Ticket_Booking_System;
USE Ticket_Booking_System;

CREATE TABLE Passengers (
    Passenger_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(200),
    Age INT,
    Mobile_number VARCHAR(40),
    Degree VARCHAR(200),
    Institute VARCHAR(200),
    Year INT,
    Profession VARCHAR(40)
);

CREATE TABLE Student (
    Passenger_ID INT PRIMARY KEY,
    Major VARCHAR(40),
    Student_id INT,
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Service_holder (
    Passenger_ID INT PRIMARY KEY,
    Company_Name VARCHAR(100),
    Position VARCHAR(40),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Business_Man (
    Passenger_ID INT PRIMARY KEY,
    Business_Name VARCHAR(100),
    Business_Type VARCHAR(60),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Freedom_Fighter (
    Passenger_ID INT PRIMARY KEY,
    Fighter_Name VARCHAR(100),
    Award_Received VARCHAR(60),
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Other (
    Passenger_ID INT PRIMARY KEY,
    Descriptions TEXT,
    FOREIGN KEY (Passenger_ID) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Bus_Routes (
    Route_Number INT AUTO_INCREMENT PRIMARY KEY,
    Starting_Point VARCHAR(100),
    Destination VARCHAR(100),
    Distance INT,
    Total_Fare DECIMAL(10, 2)
);

CREATE TABLE Buses (
    Bus_Number INT AUTO_INCREMENT PRIMARY KEY,
    Seating_capacity INT,
    Model VARCHAR(40)
);

CREATE TABLE Bus_Stops (
    BusStop_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Bus_Schedule (
    Schedule_ID INT AUTO_INCREMENT PRIMARY KEY,
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Route_number INT,
    FOREIGN KEY (Route_number) REFERENCES Bus_Routes(Route_Number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Ticket_Types (
    Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Type_Name VARCHAR(60)
);

CREATE TABLE Payment_Method (
    Pay_method_id INT AUTO_INCREMENT PRIMARY KEY,
    Method_Name VARCHAR(60)
);

CREATE TABLE Discount (
    Discount_id INT AUTO_INCREMENT PRIMARY KEY,
    Discount_Type VARCHAR(60),
    Amount DECIMAL(10, 2)
);

CREATE TABLE Tickets (
    Ticket_Number INT AUTO_INCREMENT PRIMARY KEY,
    Issue_Date DATE,
    Passenger_id INT,
    Type_id INT,
    Pay_method_id INT,
    Bus_number INT,
    Schedule_id INT,
    Discount_id INT,
    FOREIGN KEY (Passenger_id) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Type_id) REFERENCES Ticket_Types(Type_ID),
    FOREIGN KEY (Pay_method_id) REFERENCES Payment_Method(Pay_method_id),
    FOREIGN KEY (Bus_number) REFERENCES Buses(Bus_Number),
    FOREIGN KEY (Schedule_id) REFERENCES Bus_Schedule(Schedule_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Discount_id) REFERENCES Discount(Discount_id)
);

CREATE TABLE Journey_History (
    History_id INT AUTO_INCREMENT PRIMARY KEY,
    Past_trip VARCHAR(100),
    Date DATE,
    Ticket_details TEXT,
    Passenger_id INT,
    FOREIGN KEY (Passenger_id) REFERENCES Passengers(Passenger_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Bus_Stations (
    Station_id INT AUTO_INCREMENT PRIMARY KEY,
    Station_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Refund (
    Refund_id INT AUTO_INCREMENT PRIMARY KEY,
    Refund_Amount DECIMAL(10, 2),
    Reason TEXT,
    Ticket_number INT,
    FOREIGN KEY (Ticket_number) REFERENCES Tickets(Ticket_Number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Notification (
    Notification_id INT AUTO_INCREMENT PRIMARY KEY,
    Message TEXT,
    Notification_type VARCHAR(100)
);

CREATE TABLE Bus_Reservation (
    Reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    Date DATE,
    Seat_Number INT,
    Ticket_number INT,
    FOREIGN KEY (Ticket_number) REFERENCES Tickets(Ticket_Number) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Seat (
    Seat_ID INT AUTO_INCREMENT PRIMARY KEY,
    Seat_Number INT,
    Bus_ID INT,
    FOREIGN KEY (Bus_ID) REFERENCES Buses(Bus_Number) ON DELETE CASCADE ON UPDATE CASCADE
);
