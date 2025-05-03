#show all users
SELECT user from mysql.user;

#create user 
CREATE USER IF NOT EXISTS 'KurtNagel'@'localhost'
IDENTIFIED BY '1234';

#delete user
DROP USER IF EXISTS 'KurtNagel'@'localhost';

#show possible permissions
SHOW GRANTS;

#show permissions of user
SHOW GRANTS FOR 'KurtNagel'@'localhost';

#grant specific permissions to user
GRANT DELETE, SELECT
ON kosidasdb.* TO 'KurtNagel'@'localhost';

#revoke specific permissions from user
REVOKE DELETE,SELECT
ON kosidasdb.* from 'KurtNagel'@'localhost';

#create a new role
CREATE ROLE IF NOT EXISTS 'rollenname';

#delete role
DROP ROLE IF EXISTS 'rollenname';

#grant permissions to a role
GRANT SELECT ON kosidasdb.* TO 'rollenname';

#give role to a user
GRANT 'rollenname' to 'KurtNagel'@'localhost';

#create a user and give role as default ## doesnt work
CREATE USER 'KurrtNagel'@'localhost'
IDENTIFIED BY'password'
DEFAULT ROLE 'rollenname';

#4.4 b)
CREATE USER IF NOT EXISTS 'Kurt_Nagel'@'localhost'
IDENTIFIED BY '1234';
CREATE ROLE IF NOT EXISTS 'Rolle_Verkauf';
GRANT SELECT on kosidasdb.* TO 'Rolle_Verkauf';
GRANT UPDATE, DELETE, INSERT ON kosidasdb.kunde TO 'Rolle_Verkauf';
GRANT 'Rolle_Verkauf' TO 'Kurt_Nagel'@'localhost';