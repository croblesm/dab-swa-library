-- Copyright (c) Microsoft Corporation.
-- Licensed under the MIT License.
use master;
go

if not exists 
    (select name from sys.databases where name = N'library')
create database library;
go

use library;
go

drop table if exists dbo.authors;
drop table if exists dbo.books;
go

create table dbo.authors
(
    id int not null primary key identity(1,1),
    name nvarchar(255) not null,
	birthdate date null,
	bio text null,
	imageurl varchar (max) null,
)
go

create table dbo.books
(
    id int not null primary key identity(1,1),
    title nvarchar(1000) not null,
	authorId int not null,
	genre varchar(255) null,
	publicationDate date null,
	imageUrl varchar(max) null,
)
go

set identity_insert dbo.authors on
insert dbo.authors (id, name, birthdate, bio, imageurl) VALUES (1, N'Lewis Carroll', CAST(N'1832-01-27' AS Date), N'Lewis Carroll was an English author, poet, and mathematician known for his word play, logic, and fantasy, particularly in his works ''Alice''s Adventures in Wonderland'' and ''Through the Looking-Glass'', as well as his poems ''Jabberwocky'' and ''The Hunting of the Snark'', which are classified as literary nonsense.', N'https://upload.wikimedia.org/wikipedia/commons/f/fb/LewisCarrollSelfPhoto.jpg')
insert dbo.authors (id, name, birthdate, bio, imageurl) VALUES (2, N'Antoine de Saint-Exupéry', CAST(N'1900-06-29' AS Date), N'Antoine de Saint-Exupéry was a French writer, poet, aristocrat, journalist, and aviator known for his novella "The Little Prince" and his aviation writings "Wind, Sand and Stars" and "Night Flight", who received several French literary awards and the US National Book Award.', N'https://upload.wikimedia.org/wikipedia/commons/7/7f/11exupery-inline1-500.jpg')
set identity_insert dbo.authors off
go

set identity_insert dbo.books on
insert dbo.books (id, title, authorId, genre, publicationdate, imageurl) VALUES (1, N'Alice''s Adventures in Wonderland', 1, N'Fantasy', NULL, N'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Alice%27s_Adventures_in_Wonderland_cover_%281865%29.jpg/220px-Alice%27s_Adventures_in_Wonderland_cover_%281865%29.jpg')
insert dbo.books (id, title, authorId, genre, publicationdate, imageurl) VALUES (2, N'Le Petit Prince', 2, NULL, NULL, N'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Littleprince.JPG/220px-Littleprince.JPG')
insert dbo.books (id, title, authorId, genre, publicationdate, imageurl) VALUES (11, N'Through the Looking-Glass', 1, N'Fantasy', NULL, N'https://upload.wikimedia.org/wikipedia/commons/6/6c/Through_the_looking_glass.jpg')
set identity_insert dbo.books off
go

alter table dbo.books with check add constraint [FK_dbo.books_authors] foreign key(authorId)
references dbo.authors (id)
go

alter table dbo.books check constraint [FK_dbo.books_authors]
go