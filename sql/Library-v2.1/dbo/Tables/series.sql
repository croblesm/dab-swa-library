-- Create series table
CREATE TABLE series (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(1000) NOT NULL
);