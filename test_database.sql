-- Tworzenie bazy danych
CREATE DATABASE RentingAppDB;
GO

USE RentingAppDB;
GO

-- Tabela: Users
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Role NVARCHAR(50) NOT NULL
);

-- Tabela: CarVersions
CREATE TABLE CarVersions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Model NVARCHAR(100) NOT NULL,
    Brand NVARCHAR(100) NOT NULL,
    PricePerDay DECIMAL(10, 2) NOT NULL
);

-- Tabela: Reservations
CREATE TABLE Reservations (
    Id INT PRIMARY KEY IDENTITY(1,1),
    UserId INT NOT NULL,
    Type NVARCHAR(50) NOT NULL,
    ItemId INT NOT NULL,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    FOREIGN KEY (UserId) REFERENCES Users(Id)
);

-- Dodanie przykładowych danych do tabeli Users
INSERT INTO Users (Username, Email, Password, Role) VALUES
('admin', 'admin@rentingapp.com', 'admin123', 'Admin'),
('john_doe', 'john.doe@example.com', 'password123', 'Customer'),
('jane_smith', 'jane.smith@example.com', 'pass456', 'Customer');

-- Dodanie przykładowych danych do tabeli CarVersions
INSERT INTO CarVersions (Model, Brand, PricePerDay) VALUES
('Model S', 'Tesla', 200.00),
('Corolla', 'Toyota', 50.00),
('Civic', 'Honda', 55.00),
('A4', 'Audi', 100.00),
('Mustang', 'Ford', 150.00);

-- Dodanie przykładowych danych do tabeli Reservations
INSERT INTO Reservations (UserId, Type, ItemId, StartDate, EndDate) VALUES
(2, 'Car', 1, '2025-01-15', '2025-01-20'),
(3, 'Car', 3, '2025-01-10', '2025-01-12'),
(2, 'Car', 5, '2025-01-22', '2025-01-30');