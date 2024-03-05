-- Create series table
CREATE TABLE dbo.series (
    id          INT IDENTITY (1, 1) NOT NULL,
    name        NVARCHAR (255) NOT NULL,
    description NVARCHAR(MAX) NULL
);
GO