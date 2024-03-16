-- This file contains SQL statements that will be executed after the build script.
-- This file contains SQL statements that will be executed after the build script.
-- Authors data
SET IDENTITY_INSERT dbo.authors ON;

    IF NOT EXISTS (SELECT 1 FROM dbo.authors WHERE id = 1)
        INSERT dbo.authors (id, name, birthdate, bio, imageurl) 
        VALUES (1, 'Jules Verne', CAST('1828-02-08' AS Date), 'Jules Gabriel Verne was a French novelist, poet, and playwright. His collaboration with the publisher Pierre-Jules Hetzel led to the creation of the Voyages extraordinaires, a series of bestselling adventure novels including Journey to the Center of the Earth (1864), Twenty Thousand Leagues Under the Seas (1870), and Around the World in Eighty Days (1872).', 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4b/Jules_Verne_by_%C3%89tienne_Carjat.jpg/800px-Jules_Verne_by_%C3%89tienne_Carjat.jpg');

    IF NOT EXISTS (SELECT 1 FROM dbo.authors WHERE id = 2)
        INSERT dbo.authors (id, name, birthdate, bio, imageurl) 
        VALUES (2, 'Isaac Asimov', CAST('1920-01-02' AS Date), 'Isaac Asimov was an American writer and professor of biochemistry at Boston University. During his lifetime, Asimov was considered one of the "Big Three" science fiction writers, along with Robert A. Heinlein and Arthur C. Clarke. A prolific writer, he wrote or edited more than 500 books.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Isaac.Asimov01.jpg/800px-Isaac.Asimov01.jpg');

    IF NOT EXISTS (SELECT 1 FROM dbo.authors WHERE id = 3)
        INSERT dbo.authors (id, name, birthdate, bio, imageurl) 
        VALUES (3, 'Arthur C. Clarke', CAST('1917-12-16' AS Date), 'Sir Arthur Charles Clarke CBE FRAS was an English science fiction writer, science writer, futurist, inventor, undersea explorer, and television series host. He co-wrote the screenplay for the 1968 film 2001: A Space Odyssey, widely regarded as one of the most influential films of all time', 'https://upload.wikimedia.org/wikipedia/commons/6/62/Arthur_C._Clarke_1965.jpg');
        
SET IDENTITY_INSERT dbo.authors OFF;
GO

-- Books data
SET IDENTITY_INSERT dbo.books ON

    IF NOT EXISTS (SELECT 1 FROM dbo.books WHERE id = 1)
        INSERT dbo.books (id, title, authorId, genre, publicationdate, imageurl) 
        VALUES (1, 'Journey to the Center of the Earth ', 1, 'Science fiction', CAST('1864-11-25' AS Date), 'https://upload.wikimedia.org/wikipedia/commons/6/67/A_Journey_to_the_Centre_of_the_Earth-1874.jpg');

    IF NOT EXISTS (SELECT 1 FROM dbo.books WHERE id = 2)
        INSERT dbo.books (id, title, authorId, genre, publicationdate, imageurl) 
        VALUES (2, 'Foundation', 2, 'Science fiction', CAST('1941-08-01' AS Date), 'https://upload.wikimedia.org/wikipedia/en/2/25/Foundation_gnome.jpg');

    IF NOT EXISTS (SELECT 1 FROM dbo.books WHERE id = 3)
        INSERT dbo.books (id, title, authorId, genre, publicationdate, imageurl) 
        VALUES (3, '2001: A Space Odyssey', 3, 'Science fiction', CAST('1926-04-02' AS Date), N'https://upload.wikimedia.org/wikipedia/en/thumb/0/05/Littleprince.JPG/220px-Littleprince.JPG');

SET IDENTITY_INSERT dbo.books OFF
GO

-- Series data
SET IDENTITY_INSERT dbo.series ON;

IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 1)
    INSERT INTO series (name, description) 
    VALUES (1,'Prelude to Foundation', 'The first book in the Foundation series.');

IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 2)
    INSERT INTO series (name, description) 
    VALUES (2,'Forward the Foundation', 'The second book in the Foundation series.');

IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 3)
    INSERT INTO series (name, description) 
    VALUES (3,'Foundation', 'The third book in the Foundation series.');
  
IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 4)
    INSERT INTO series (name, description) 
    VALUES (4,'Foundation and Empire', 'The fourth book in the Foundation series.');

IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 5)
    INSERT INTO series (name, description) 
    VALUES (5,'Second Foundation', 'The fifth book in the Foundation series.');

IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 6)
    INSERT INTO series (name, description) 
    VALUES (6,'Foundation''s Edge', 'The sixth book in the Foundation series.');

IF NOT EXISTS (SELECT 1 FROM dbo.series WHERE id = 7)
    INSERT INTO series (name, description) 
    VALUES (7,'Foundation and Earth', 'The seventh book in the Foundation series.');

SET IDENTITY_INSERT dbo.series OFF;
GO
