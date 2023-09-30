-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 30, 2023 at 07:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ticket_Booking_System`
--

-- --------------------------------------------------------

--
-- Table structure for table `Buses`
--

CREATE TABLE `Buses` (
  `Bus_Number` int(11) NOT NULL,
  `Seating_capacity` int(11) DEFAULT NULL,
  `Model` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Business_Man`
--

CREATE TABLE `Business_Man` (
  `Passenger_ID` int(11) NOT NULL,
  `Business_Name` varchar(30) DEFAULT NULL,
  `Business_Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Bus_Reservation`
--

CREATE TABLE `Bus_Reservation` (
  `Reservation_id` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Seat_Number` int(11) DEFAULT NULL,
  `Ticket_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Bus_Routes`
--

CREATE TABLE `Bus_Routes` (
  `Route_Number` int(11) NOT NULL,
  `Starting_Point` varchar(30) DEFAULT NULL,
  `Destination` varchar(30) DEFAULT NULL,
  `Distance` int(11) DEFAULT NULL,
  `Total_Fare` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Bus_Schedule`
--

CREATE TABLE `Bus_Schedule` (
  `Schedule_ID` int(11) NOT NULL,
  `Departure_Time` datetime DEFAULT NULL,
  `Arrival_Time` datetime DEFAULT NULL,
  `Route_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Bus_Stations`
--

CREATE TABLE `Bus_Stations` (
  `Station_id` int(11) NOT NULL,
  `Station_Name` varchar(30) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Bus_Stops`
--

CREATE TABLE `Bus_Stops` (
  `BusStop_ID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Discount`
--

CREATE TABLE `Discount` (
  `Discount_id` int(11) NOT NULL,
  `Discount_Type` varchar(20) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Freedom_Fighter`
--

CREATE TABLE `Freedom_Fighter` (
  `Passenger_ID` int(11) NOT NULL,
  `Fighter_Name` varchar(30) DEFAULT NULL,
  `Award_Received` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Journey_History`
--

CREATE TABLE `Journey_History` (
  `History_id` int(11) NOT NULL,
  `Past_trip` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Ticket_details` text DEFAULT NULL,
  `Passenger_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Notification`
--

CREATE TABLE `Notification` (
  `Notification_id` int(11) NOT NULL,
  `Message` text DEFAULT NULL,
  `Notification_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Other`
--

CREATE TABLE `Other` (
  `Passenger_ID` int(11) NOT NULL,
  `Descriptions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Passengers`
--

CREATE TABLE `Passengers` (
  `Passenger_ID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Mobile_number` varchar(11) DEFAULT NULL,
  `Degree` varchar(20) DEFAULT NULL,
  `Institute` varchar(30) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `Profession` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Payment_Method`
--

CREATE TABLE `Payment_Method` (
  `Pay_method_id` int(11) NOT NULL,
  `Method_Name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Refund`
--

CREATE TABLE `Refund` (
  `Refund_id` int(11) NOT NULL,
  `Refund_Amount` decimal(10,2) DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `Ticket_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Seat`
--

CREATE TABLE `Seat` (
  `Seat_ID` int(11) NOT NULL,
  `Seat_Number` int(11) DEFAULT NULL,
  `Bus_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Service_holder`
--

CREATE TABLE `Service_holder` (
  `Passenger_ID` int(11) NOT NULL,
  `Company_Name` varchar(20) DEFAULT NULL,
  `Position` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `Passenger_ID` int(11) NOT NULL,
  `Major` varchar(10) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tickets`
--

CREATE TABLE `Tickets` (
  `Ticket_Number` int(11) NOT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Passenger_id` int(11) DEFAULT NULL,
  `Type_id` int(11) DEFAULT NULL,
  `Pay_method_id` int(11) DEFAULT NULL,
  `Bus_number` int(11) DEFAULT NULL,
  `Schedule_id` int(11) DEFAULT NULL,
  `Discount_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Ticket_Types`
--

CREATE TABLE `Ticket_Types` (
  `Type_ID` int(11) NOT NULL,
  `Type_Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Buses`
--
ALTER TABLE `Buses`
  ADD PRIMARY KEY (`Bus_Number`);

--
-- Indexes for table `Business_Man`
--
ALTER TABLE `Business_Man`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `Bus_Reservation`
--
ALTER TABLE `Bus_Reservation`
  ADD PRIMARY KEY (`Reservation_id`),
  ADD KEY `Ticket_number` (`Ticket_number`);

--
-- Indexes for table `Bus_Routes`
--
ALTER TABLE `Bus_Routes`
  ADD PRIMARY KEY (`Route_Number`);

--
-- Indexes for table `Bus_Schedule`
--
ALTER TABLE `Bus_Schedule`
  ADD PRIMARY KEY (`Schedule_ID`),
  ADD KEY `Route_number` (`Route_number`);

--
-- Indexes for table `Bus_Stations`
--
ALTER TABLE `Bus_Stations`
  ADD PRIMARY KEY (`Station_id`);

--
-- Indexes for table `Bus_Stops`
--
ALTER TABLE `Bus_Stops`
  ADD PRIMARY KEY (`BusStop_ID`);

--
-- Indexes for table `Discount`
--
ALTER TABLE `Discount`
  ADD PRIMARY KEY (`Discount_id`);

--
-- Indexes for table `Freedom_Fighter`
--
ALTER TABLE `Freedom_Fighter`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `Journey_History`
--
ALTER TABLE `Journey_History`
  ADD PRIMARY KEY (`History_id`),
  ADD KEY `Passenger_id` (`Passenger_id`);

--
-- Indexes for table `Notification`
--
ALTER TABLE `Notification`
  ADD PRIMARY KEY (`Notification_id`);

--
-- Indexes for table `Other`
--
ALTER TABLE `Other`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `Passengers`
--
ALTER TABLE `Passengers`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `Payment_Method`
--
ALTER TABLE `Payment_Method`
  ADD PRIMARY KEY (`Pay_method_id`);

--
-- Indexes for table `Refund`
--
ALTER TABLE `Refund`
  ADD PRIMARY KEY (`Refund_id`),
  ADD KEY `Ticket_number` (`Ticket_number`);

--
-- Indexes for table `Seat`
--
ALTER TABLE `Seat`
  ADD PRIMARY KEY (`Seat_ID`),
  ADD KEY `Bus_ID` (`Bus_ID`);

--
-- Indexes for table `Service_holder`
--
ALTER TABLE `Service_holder`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD PRIMARY KEY (`Ticket_Number`),
  ADD KEY `Passenger_id` (`Passenger_id`),
  ADD KEY `Type_id` (`Type_id`),
  ADD KEY `Pay_method_id` (`Pay_method_id`),
  ADD KEY `Bus_number` (`Bus_number`),
  ADD KEY `Schedule_id` (`Schedule_id`),
  ADD KEY `Discount_id` (`Discount_id`);

--
-- Indexes for table `Ticket_Types`
--
ALTER TABLE `Ticket_Types`
  ADD PRIMARY KEY (`Type_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Buses`
--
ALTER TABLE `Buses`
  MODIFY `Bus_Number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bus_Reservation`
--
ALTER TABLE `Bus_Reservation`
  MODIFY `Reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bus_Routes`
--
ALTER TABLE `Bus_Routes`
  MODIFY `Route_Number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bus_Schedule`
--
ALTER TABLE `Bus_Schedule`
  MODIFY `Schedule_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bus_Stations`
--
ALTER TABLE `Bus_Stations`
  MODIFY `Station_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Bus_Stops`
--
ALTER TABLE `Bus_Stops`
  MODIFY `BusStop_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Discount`
--
ALTER TABLE `Discount`
  MODIFY `Discount_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Journey_History`
--
ALTER TABLE `Journey_History`
  MODIFY `History_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Notification`
--
ALTER TABLE `Notification`
  MODIFY `Notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Passengers`
--
ALTER TABLE `Passengers`
  MODIFY `Passenger_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Payment_Method`
--
ALTER TABLE `Payment_Method`
  MODIFY `Pay_method_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Refund`
--
ALTER TABLE `Refund`
  MODIFY `Refund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Seat`
--
ALTER TABLE `Seat`
  MODIFY `Seat_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Tickets`
--
ALTER TABLE `Tickets`
  MODIFY `Ticket_Number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Ticket_Types`
--
ALTER TABLE `Ticket_Types`
  MODIFY `Type_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Business_Man`
--
ALTER TABLE `Business_Man`
  ADD CONSTRAINT `business_man_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `Passengers` (`Passenger_ID`);

--
-- Constraints for table `Bus_Reservation`
--
ALTER TABLE `Bus_Reservation`
  ADD CONSTRAINT `bus_reservation_ibfk_1` FOREIGN KEY (`Ticket_number`) REFERENCES `Tickets` (`Ticket_Number`);

--
-- Constraints for table `Bus_Schedule`
--
ALTER TABLE `Bus_Schedule`
  ADD CONSTRAINT `bus_schedule_ibfk_1` FOREIGN KEY (`Route_number`) REFERENCES `Bus_Routes` (`Route_Number`);

--
-- Constraints for table `Freedom_Fighter`
--
ALTER TABLE `Freedom_Fighter`
  ADD CONSTRAINT `freedom_fighter_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `Passengers` (`Passenger_ID`);

--
-- Constraints for table `Journey_History`
--
ALTER TABLE `Journey_History`
  ADD CONSTRAINT `journey_history_ibfk_1` FOREIGN KEY (`Passenger_id`) REFERENCES `Passengers` (`Passenger_ID`);

--
-- Constraints for table `Other`
--
ALTER TABLE `Other`
  ADD CONSTRAINT `other_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `Passengers` (`Passenger_ID`);

--
-- Constraints for table `Refund`
--
ALTER TABLE `Refund`
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`Ticket_number`) REFERENCES `Tickets` (`Ticket_Number`);

--
-- Constraints for table `Seat`
--
ALTER TABLE `Seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`Bus_ID`) REFERENCES `Buses` (`Bus_Number`);

--
-- Constraints for table `Service_holder`
--
ALTER TABLE `Service_holder`
  ADD CONSTRAINT `service_holder_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `Passengers` (`Passenger_ID`);

--
-- Constraints for table `Student`
--
ALTER TABLE `Student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `Passengers` (`Passenger_ID`);

--
-- Constraints for table `Tickets`
--
ALTER TABLE `Tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`Passenger_id`) REFERENCES `Passengers` (`Passenger_ID`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`Type_id`) REFERENCES `Ticket_Types` (`Type_ID`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`Pay_method_id`) REFERENCES `Payment_Method` (`Pay_method_id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`Bus_number`) REFERENCES `Buses` (`Bus_Number`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`Schedule_id`) REFERENCES `Bus_Schedule` (`Schedule_ID`),
  ADD CONSTRAINT `tickets_ibfk_6` FOREIGN KEY (`Discount_id`) REFERENCES `Discount` (`Discount_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
