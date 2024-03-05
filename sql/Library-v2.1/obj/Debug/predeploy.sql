-- This file contains SQL statements that will be executed before the build script.
IF '$(Environment)' = 'Development'
BEGIN
    --Create a new login for Development
    IF NOT EXISTS (SELECT name FROM sys.sql_logins WHERE name = 'AppUser')
        CREATE LOGIN AppUser WITH PASSWORD = '$(appPasswordDev)';
END
ELSE IF '$(Environment)' = 'Production'
BEGIN
    --Create a new login for Production
    IF NOT EXISTS (SELECT name FROM sys.sql_logins WHERE name = 'AppUser')
        CREATE LOGIN AppUser WITH PASSWORD = '$(appPasswordProd)';
END
GO
