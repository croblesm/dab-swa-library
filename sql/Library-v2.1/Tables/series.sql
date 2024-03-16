-- create series table
CREATE TABLE series (
    id INT PRIMARY KEY IDENTITY (1, 1) NOT NULL,
    name NVARCHAR(255) NOT NULL,
    description NVARCHAR(1000) NOT NULL,
);