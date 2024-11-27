-- Begin by creating the database and switching to it
DROP DATABASE IF EXISTS UsedcarDatabase;
CREATE DATABASE IF NOT EXISTS `UsedcarDatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `UsedcarDatabase`;

-- Creating the User table
CREATE TABLE User (
  userID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username varchar(50) NOT NULL UNIQUE,
  password varchar(500) NOT NULL ,
  fname VARCHAR(50) ,
  lname VARCHAR(50) ,
  email VARCHAR(100) NOT NULL,
  phonenum VARCHAR(20) DEFAULT "-",
  registerationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  role VARCHAR(50) DEFAULT "Customer"
);


-- Creating the Car table (must be created before the Insurance table)
CREATE TABLE Car (
  carid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  cartype varchar(50),
  carcertified enum('Yes','No') default 'No' ,
  brand VARCHAR(50) NOT NULL,
  model VARCHAR(50) NOT NULL,
  mileage INT NOT NULL,
  year int ,
  description TEXT,
  carcondition varchar(50),
  fuel VARCHAR(50),
  insurance int,
  price INT NOT NULL,
  image varchar(255)
  
);


-- Creating the Seller table
CREATE TABLE Seller (
  sellerID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  numberofCars INT ,
  verified VARCHAR(50) NOT NULL,
  rating INT ,
  city VARCHAR(50) ,
  province VARCHAR(50) ,
  zipcode VARCHAR(20) ,
  contactinfo VARCHAR(150) ,
  dealershipID INT ,
  adID INT ,
  carid INT
)AUTO_INCREMENT = 60000;




-- Sample data insertion for User table
INSERT INTO User (username, password, fName, lName, email, phonenum, role) 
VALUES 
('john_doe', 'password123!hashed', 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'admin'),
('jane_smith', 'secure456!hash', 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', 'admin'),
('michael_brown', 'pass789!word', 'Michael', 'Brown', 'michael.brown@example.com', '555-123-4567', 'Customer'),
('emily_davis', 'uniquePass321!', 'Emily', 'Davis', 'emily.davis@example.com', '-', 'admin'),
('william_jones', 'secure654Pass!', 'William', 'Jones', 'william.jones@example.com', '444-555-6666', 'Customer'),
('sarah_clark', 'hash789Key!', 'Sarah', 'Clark', 'sarah.clark@example.com', '321-987-6540', 'Customer'),
('david_lee', 'randomPass!123', 'David', 'Lee', 'david.lee@example.com', '-', 'admin'),
('amy_white', 'pass!Amy456', 'Amy', 'White', 'amy.white@example.com', '333-222-1111', 'Customer'),
('daniel_wilson', 'hashWord!789', 'Daniel', 'Wilson', 'daniel.wilson@example.com', '888-777-6666', 'Customer'),
('admin', 'password', 'Laura', 'Taylor', 'laura.taylor@example.com', '-', 'admin');


-- Sample data for Car table
INSERT INTO Car (cartype, carcertified, brand, model, mileage, year, description, carcondition, fuel, insurance, price, image)
VALUES 
('Sport', 'Yes', 'BMW', 'M3', 15000, 2022, 'A high-performance sports car', 'Excellent', 'Petrol', 3, 70000, 'https://www.bmw.co.th/content/dam/bmw/common/all-models/m-series/m3-sedan/2023/highlights/bmw-3-series-cs-m-automobiles-ms-bmw-financial-services.jpg'),
('SUV', 'No', 'Mercedes-Benz', 'GLS', 20000, 2021, 'Luxury SUV with spacious interior', 'Good', 'Diesel', 2, 85000, 'https://www.mercedes-benz.co.th/content/dam/hq/passengercars/cars/gls/gls-suv-x167-fl-pi/modeloverview/03-2023/images/mercedes-benz-gls-suv-x167-modeloverview-696x392-03-2023.png'),
('Sport', 'Yes', 'Bugatti', 'Chiron', 5000, 2023, 'Ultimate luxury hypercar', 'Excellent', 'Petrol', 5, 3000000, 'https://d2ox13tjqpxop5.cloudfront.net/BUGATTI-2023/Bugatti-Models/Sport/Gallery/CS_1.jpg'),
('Sport', 'No', 'Porsche', '911 Carrera', 12000, 2022, 'Iconic sports car', 'Excellent', 'Petrol', 1, 120000, 'https://images-porsche.imgix.net/-/media/E969499404154DB79BAD58EF5CC8CFAB_82BBE0A2462E47C4B1DB34EA0B23B853_CZ25W12IX0010-911-carrera-gts-side?w=2560&h=697&q=45&crop=faces%2Centropy%2Cedges&auto=format'),
('Luxury', 'Yes', 'Bentley', 'Continental GT', 8000, 2023, 'Luxury grand tourer', 'Excellent', 'Petrol', 4, 250000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrXOoPx0Q_posz7DNl5wRIsTYhi5TAY3yDMQ&s'),
('Sport', 'No', 'Ferrari', '488 GTB', 10000, 2021, 'Italian masterpiece', 'Good', 'Petrol', 2, 280000, 'https://cdn.ferrari.com/cms/network/media/img/resize/5ea6cdda5d40a35d05a53137-12_ferrari-250_gt_pinin_farina_coup%C3%A3%C2%A9_488_gtb_esterni?width=750&height=550'),
('Sport', 'Yes', 'McLaren', '720S', 7000, 2023, 'Track-focused supercar', 'Excellent', 'Petrol', 3, 300000, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRWQeJvO4NblJZFF5l4CfTbmROBXSqJ9cvXw&s'),
('Luxury', 'No', 'Rolls-Royce', 'Phantom', 3000, 2023, 'Ultimate luxury saloon', 'Excellent', 'Petrol', 5, 500000, 'https://www.rolls-roycemotorcars.com/content/dam/rrmc/marketUK/rollsroycemotorcars_com/phantom-ii-commission/page-properties/Phantom-II-Commission-Single-Card.jpg/jcr:content/renditions/cq5dam.web.1920.webp');


-- Sample data insertion for Insurance table (ensure correct UserID and CarID)
INSERT INTO Insurance ( ProviderName, Expdate, CoverageDetail, UserID, CarID) VALUES
( 'Allstate', '2025-05-20', 'Full coverage', 1, '1'),  -- UserID 1 corresponds to John Doe
( 'Geico', '2025-07-15', 'Basic coverage', 2, '2');  -- UserID 2 corresponds to Jane Smith


-- Sample data for Seller table
INSERT INTO Seller ( NumberofCars, Verified, Rating, City, Province, Zipcode, Contactinfo,CarID) VALUES
( 10, 'Yes', 5, 'Miami', 'FL', '33101', 'seller1@example.com', '1'),
( 8, 'Yes', 4, 'Houston', 'TX', '77001', 'seller2@example.com','2');

-- Sample data for Dealership table
INSERT INTO Dealership ( DealerName, NumCar, SellerID) VALUES
( 'AutoMax', 50, 60000),
( 'CarWorld', 40, 60001);

-- Sample data for Advertisement table
INSERT INTO Advertisement ( Title, Cost, Expdate, AdDescription,carid) VALUES
( 'Tesla for Sale', 100, '2024-12-31', 'Great condition',  1),
( 'Toyota for Sale', 80, '2024-11-30', 'Low mileage', 2);


ALTER TABLE User
MODIFY COLUMN UserID INT AUTO_INCREMENT;







