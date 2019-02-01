CREATE DATABASE IF NOT EXISTS `Restaurant`;

USE `Restaurant`;

CREATE TABLE IF NOT EXISTS `General_Restaurant_Info` (
    `Min_User_Age` TINYINT(2) UNSIGNED NOT NULL DEFAULT 18
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Restaurant_Info_in_Normal_Week_1` (
    `Open_Days` SET('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    `Close_Days` SET('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Restaurant_Info_in_Special_Week_1` (
    `Open_Days` SET('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
    `Close_Days` SET('Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Restaurant_Info_in_Normal_Week_2` (
    `Day_Status` ENUM('Workday', 'Weekend', 'Special Day') NOT NULL DEFAULT 'Workday',
    `Length_of_Open_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Open_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Close_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Max_Number_for_Guest` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Min_Length_of_Dinner_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Max_Length_of_Dinner_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 10,
    `Max_Number_for_Each_Cuisine` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Max_Number_for_All_Cuisine` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Created_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Created_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Updated_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Updated_Time` TIME NOT NULL DEFAULT '00:00:00'
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Restaurant_Info_in_Special_Week_2` (
    `Day_Status` ENUM('Workday', 'Weekend', 'Special Day') NOT NULL DEFAULT 'Workday',
    `Length_of_Open_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Open_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Close_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Max_Number_for_Guest` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Min_Length_of_Dinner_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Max_Length_of_Dinner_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 10,
    `Max_Number_for_Each_Cuisine` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Max_Number_for_All_Cuisine` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Created_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Created_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Updated_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Updated_Time` TIME NOT NULL DEFAULT '00:00:00'
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Current_Restaurant_Status` (
    `Week_Status` ENUM('Normal Week', 'Special Week') NOT NULL DEFAULT 'Normal Week',
    `Day_Status` ENUM('Workday', 'Weekend', 'Special Day') NOT NULL DEFAULT 'Workday',
    `Open_Status` ENUM('Open', 'Close') NOT NULL DEFAULT 'Open',
    `Available_Chairs_Number` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Created_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Created_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Updated_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Updated_Time` TIME NOT NULL DEFAULT '00:00:00'
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Level` (
    `ID` TINYINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` ENUM('Administrator', 'Waiter', 'Cashier', 'Owner', 'Guest') NOT NULL UNIQUE DEFAULT 'Guest',
    `Description` VARCHAR(255) NOT NULL DEFAULT 'No description given.',
    PRIMARY KEY(`ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `User` (
    `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Level_ID` TINYINT(1) UNSIGNED NOT NULL DEFAULT 5,
    `Username` VARCHAR(20) NOT NULL UNIQUE,
    `E_Mail` VARCHAR(50) NOT NULL DEFAULT 'unknown_email@unknown.com',
    `Password` VARCHAR(64) NOT NULL UNIQUE,
    `Name` VARCHAR(20) NOT NULL DEFAULT 'No Name',
    `Birth_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Gender` ENUM('Male', 'Female') NOT NULL DEFAULT 'Male',
    `Country` VARCHAR(74) NOT NULL DEFAULT 'Indonesia',
    `Province_or_State` VARCHAR(58) NOT NULL DEFAULT 'Central Borneo',
    `City` VARCHAR(176) NOT NULL DEFAULT 'Palangka Raya',
    `Created_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Created_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Updated_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Updated_Time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`ID`),
    FOREIGN KEY(`Level_ID`) REFERENCES `Level`(`ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Order` (
    `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Guest_ID` INT(11) UNSIGNED NOT NULL,
    `Guest_Number` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Table_Section` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Length_of_Dinner_in_Hours` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Message` VARCHAR(255) NOT NULL DEFAULT 'No Message Given.',
    `Fee` DOUBLE(11, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `Discount` DOUBLE(11, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `Fee_After_Discount` DOUBLE(11, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `Status` ENUM('Plan', 'Paid', 'Cancelled', 'Done', 'Rejected') NOT NULL DEFAULT 'Plan',
    `Transaction_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Transaction_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Reservation_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Reservation_Time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`ID`),
    FOREIGN KEY(`Guest_ID`) REFERENCES `User`(`ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Cuisine` (
    `ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `Category` ENUM('Dish', 'Beverage') NOT NULL DEFAULT 'Dish',
    `Name` VARCHAR(20) NOT NULL DEFAULT 'No Name',
    `Description` VARCHAR(255) NOT NULL DEFAULT 'No description given.',
    `Available_Cuisine_Number` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    `Price` DOUBLE(7, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `Discount` DOUBLE(7, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `Price_After_Discount` DOUBLE(7, 2) UNSIGNED NOT NULL DEFAULT 0.00,
    `Created_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Created_Time` TIME NOT NULL DEFAULT '00:00:00',
    `Updated_Date` DATE NOT NULL DEFAULT '1970-01-01',
    `Updated_Time` TIME NOT NULL DEFAULT '00:00:00',
    PRIMARY KEY(`ID`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `Menu` (
    `Order_ID` INT(11) UNSIGNED NOT NULL UNIQUE,
    `Cuisine_ID` INT(11) UNSIGNED NOT NULL,
    `Cuisine_Number` TINYINT(2) UNSIGNED NOT NULL DEFAULT 1,
    FOREIGN KEY(`Order_ID`) REFERENCES `Order`(`ID`),
    FOREIGN KEY(`Cuisine_ID`) REFERENCES `Cuisine`(`ID`)
) ENGINE = InnoDB;
