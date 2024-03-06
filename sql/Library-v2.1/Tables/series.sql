-- Create series table
CREATE TABLE series (
    id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description NVARCHAR(MAX)
);
