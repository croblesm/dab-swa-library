CREATE TABLE [dbo].[books] (
    [id]              INT             IDENTITY (1, 1) NOT NULL,
    [title]           NVARCHAR (1000) NOT NULL,
    [authorId]        INT             NOT NULL,
    [genre]           VARCHAR (255)   NULL,
    [publicationDate] DATE            NULL,
    [imageUrl]        VARCHAR (MAX)   NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_dbo.books_authors] FOREIGN KEY ([authorId]) REFERENCES [dbo].[authors] ([id])
);


GO

