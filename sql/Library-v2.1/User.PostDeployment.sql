-- This file contains SQL statements that will be executed after the build script.
IF '$(Environment)' = 'Development'
BEGIN
    --Create a new user for your login
    CREATE USER AppUser FOR LOGIN AppUser;
    
    -- Add user to the data reader role
    EXEC sp_addrolemember 'db_datareader', 'AppUser';

    -- Add user to the data writer role
    EXEC sp_addrolemember 'db_datawriter', 'AppUser';

    -- Grant user to execute stored procedures
    GRANT EXECUTE TO AppUser;
END
ELSE IF '$(Environment)' = 'Production'
BEGIN
    --Create a new user for your login
    CREATE USER AppUser FOR LOGIN AppUser;
    
    -- Add user to the data reader role
    EXEC sp_addrolemember 'db_owner', 'AppUser';
END