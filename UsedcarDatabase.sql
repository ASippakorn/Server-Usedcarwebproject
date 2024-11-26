-- Begin by creating the database and switching to it
DROP DATABASE IF EXISTS UsedcarDatabase;
CREATE DATABASE IF NOT EXISTS `UsedcarDatabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `UsedcarDatabase`;

-- Creating the User table
CREATE TABLE User (
  userID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  username varchar(50) NOT NULL UNIQUE,
  password varchar(500) NOT NULL ,
  fName VARCHAR(50) ,
  lName VARCHAR(50) ,
  email VARCHAR(100) NOT NULL,
  phonenum VARCHAR(20) DEFAULT "-",
  registerationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  role VARCHAR(50) DEFAULT "Customer"
);

-- Creating the Review table
CREATE TABLE Review (
  reviewID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  rating INT ,
  reviewText TEXT,
  reviewDate DATE NOT NULL,
  userID INT NOT NULL
)AUTO_INCREMENT = 20000;


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


CREATE TABLE CertifiedUsedCar (
  certID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  numberofCars INT NOT NULL,
  verified enum('Yes','No') default 'No' ,
  carid INT NOT NULL
);

-- Creating the Insurance table
CREATE TABLE Insurance (
  policyNumber INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  providerName VARCHAR(50) NOT NULL,
  expdate DATE NOT NULL,
  coverageDetail VARCHAR(300),
  userID INT NOT NULL,
  carid INT NOT NULL
)AUTO_INCREMENT = 410000;



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

-- Creating the Dealership table
CREATE TABLE Dealership (
  dealershipID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  dealerName VARCHAR(50) NOT NULL,
  numCar INT NOT NULL,
  sellerID INT NOT NULL

)AUTO_INCREMENT = 710000;

-- Creating the Advertisement table
CREATE TABLE Advertisement (
  adID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
  title VARCHAR(100) NOT NULL,
  cost INT NOT NULL,
  expdate DATE NOT NULL,
  adDescription TEXT,
  carID int NOT NULL

)AUTO_INCREMENT = 810000;
-- order foreignkey

-- ALTER TABLE Review
-- ADD FOREIGN KEY (UserID) REFERENCES User(UserID);

-- ALTER TABLE Dealership
-- ADD FOREIGN KEY (SellerID) REFERENCES Seller(SellerID);

-- ALTER TABLE Insurance
-- ADD FOREIGN KEY (UserID) REFERENCES User(UserID),
-- ADD FOREIGN KEY (CarID) REFERENCES Car(CarID);

-- ALTER TABLE Dealership
-- ADD FOREIGN KEY (SellerID) REFERENCES Seller(SellerID);

-- ALTER TABLE CertifiedUsedCar
-- ADD FOREIGN KEY (CarID) REFERENCES Car(CarID);

-- ALTER TABLE Advertisement
-- ADD FOREIGN KEY (carid) REFERENCES car(carid);

-- ALTER TABLE Seller
-- ADD FOREIGN KEY (CARID) REFERENCES Car(CarID);



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
('Sport', 'Yes', 'BMW', 'M3', 15000, 2022, 'A high-performance sports car', 'Excellent', 'Petrol', 3, 70000, 'bmw_m3.jpg'),
('SUV', 'No', 'Mercedes-Benz', 'GLS', 20000, 2021, 'Luxury SUV with spacious interior', 'Good', 'Diesel', 2, 85000, 'mercedes_gls.jpg'),
('Sport', 'Yes', 'Bugatti', 'Chiron', 5000, 2023, 'Ultimate luxury hypercar', 'Excellent', 'Petrol', 5, 3000000, 'bugatti_chiron.jpg'),
('Sport', 'No', 'Porsche', '911 Carrera', 12000, 2022, 'Iconic sports car', 'Excellent', 'Petrol', 1, 120000, 'porsche_911.jpg'),
('Luxury', 'Yes', 'Bentley', 'Continental GT', 8000, 2023, 'Luxury grand tourer', 'Excellent', 'Petrol', 4, 250000, 'bentley_continental.jpg'),
('Sport', 'No', 'Ferrari', '488 GTB', 10000, 2021, 'Italian masterpiece', 'Good', 'Petrol', 2, 280000, 'ferrari_488.jpg'),
('Sport', 'Yes', 'McLaren', '720S', 7000, 2023, 'Track-focused supercar', 'Excellent', 'Petrol', 3, 300000, 'mclaren_720s.jpg'),
('Luxury', 'No', 'Rolls-Royce', 'Phantom', 3000, 2023, 'Ultimate luxury saloon', 'Excellent', 'Petrol', 5, 500000, 'rolls_royce_phantom.jpg');


-- Sample data insertion for Insurance table (ensure correct UserID and CarID)
INSERT INTO Insurance ( ProviderName, Expdate, CoverageDetail, UserID, CarID) VALUES
( 'Allstate', '2025-05-20', 'Full coverage', 1, '1'),  -- UserID 1 corresponds to John Doe
( 'Geico', '2025-07-15', 'Basic coverage', 2, '2');  -- UserID 2 corresponds to Jane Smith

-- Sample data for CertifiedUsedCar table
INSERT INTO CertifiedUsedCar (NumberofCars, Verified, CarID) VALUES
( 5, 'Yes', '1'),
( 3, 'Yes', '2');

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







