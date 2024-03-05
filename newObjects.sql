CREATE TABLE dbo.series (
    id          INT IDENTITY (1, 1) NOT NULL,
    name        NVARCHAR (255) NOT NULL,
    description NVARCHAR(MAX) NULL
);
GO

CREATE VIEW AuthorBooksView AS
SELECT 
    a.id AS AuthorId,
    a.name AS AuthorName,
    a.birthdate AS AuthorBirthdate,
    a.bio AS AuthorBio,
    a.imageurl AS AuthorImageUrl,
    COUNT(b.id) AS NumberOfBooks
FROM 
    dbo.authors a
LEFT JOIN 
    dbo.books b ON a.id = b.authorId
GROUP BY 
    a.id, a.name, a.birthdate, a.bio, a.imageurl;
GO