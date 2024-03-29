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
insert dbo.authors (id, name, birthdate, bio, imageurl) VALUES (1, 'Jules Verne', CAST('1828-02-08' AS Date), 'Jules Gabriel Verne was a French novelist, poet, and playwright. His collaboration with the publisher Pierre-Jules Hetzel led to the creation of the Voyages extraordinaires, a series of bestselling adventure novels including Journey to the Center of the Earth (1864), Twenty Thousand Leagues Under the Seas (1870), and Around the World in Eighty Days (1872).', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Jules_Verne_by_%C3%89tienne_Carjat.jpg/800px-Jules_Verne_by_%C3%89tienne_Carjat.jpg')
insert dbo.authors (id, name, birthdate, bio, imageurl) VALUES (2, 'Isaac Asimov', CAST('1920-01-02' AS Date), 'Isaac Asimov was an American writer and professor of biochemistry at Boston University. During his lifetime, Asimov was considered one of the "Big Three" science fiction writers, along with Robert A. Heinlein and Arthur C. Clarke. A prolific writer, he wrote or edited more than 500 books.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Isaac.Asimov01.jpg/800px-Isaac.Asimov01.jpg')
insert dbo.authors (id, name, birthdate, bio, imageurl) VALUES (3, 'Arthur C. Clarke', CAST('1917-12-16' AS Date), 'Sir Arthur Charles Clarke CBE FRAS was an English science fiction writer, science writer, futurist, inventor, undersea explorer, and television series host. He co-wrote the screenplay for the 1968 film 2001: A Space Odyssey, widely regarded as one of the most influential films of all time', 'https://upload.wikimedia.org/wikipedia/commons/6/62/Arthur_C._Clarke_1965.jpg')

set identity_insert dbo.authors off
go

set identity_insert dbo.books on
insert dbo.books (id, title, authorId, genre, publicationdate, imageurl) VALUES (1, 'Journey to the Center of the Earth ', 1, 'Science fiction', CAST('1864-11-25' AS Date), 'https://upload.wikimedia.org/wikipedia/commons/6/67/A_Journey_to_the_Centre_of_the_Earth-1874.jpg')
insert dbo.books (id, title, authorId, genre, publicationdate, imageurl) VALUES (2, 'Foundation', 2, 'Science fiction', CAST('1941-08-01' AS Date), 'https://upload.wikimedia.org/wikipedia/en/2/25/Foundation_gnome.jpg')
insert dbo.books (id, title, authorId, genre, publicationdate, imageurl) VALUES (3, '2001: A Space Odyssey', 3, 'Science fiction', CAST('1926-04-02' AS Date), N'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Littleprince.JPG/220px-Littleprince.JPG')

set identity_insert dbo.books off
go

alter table dbo.books with check add constraint [FK_dbo.books_authors] foreign key(authorId)
references dbo.authors (id)
go

alter table dbo.books check constraint [FK_dbo.books_authors]
go