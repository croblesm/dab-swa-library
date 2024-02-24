CREATE TABLE [dbo].[authors] (
    [id]        INT            IDENTITY (1, 1) NOT NULL,
    [name]      NVARCHAR (255) NOT NULL,
    [birthdate] DATE           NULL,
    [bio]       TEXT           NULL,
    [imageurl]  VARCHAR (MAX)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO

