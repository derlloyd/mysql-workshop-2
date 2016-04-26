
mysql-ctl start
mysql -u derlloyd
create database decodemtl_addressbook;
exit back to command line

$ mysql -u derlloyd decodemtl_addressbook < ./data/import-table-structure.sql

INSERT INTO Account (email, password) VALUES ("buddy@gmail.com", "buddy123");
INSERT INTO AddressBook (accountId, name) VALUES (1, "gmail addressbook");

INSERT INTO Entry (addressBookId, firstName, lastName, birthday, type, subtype, contentLineOne) 
VALUES 
    (1, "John", "Smith", "1/1/2000", "home", "phone", "514-555-1212"),
    (1, "Chris", "Adams", "12/15/1980", "work", "address", "12 Pine Ave"),
    (1, "Terry", "Oreily", "5/28/1990", "work", "email", "terry@yahoo.com");




UPDATE Account SET email="buddy@yahoo.com" WHERE id=1;
UPDATE AddressBook SET name="yahoo addressbook" WHERE id=1;
UPDATE Entry SET birthday="2000-01-01 12:30:00"; 

TRUNCATE TABLE Entry;
DROP TABLE Account;



source /home/ubuntu/workspace/data/import-table-structure.sql


SELECT email FROM Account WHERE id=63;

SELECT name FROM AddressBook WHERE accountId=3;
SELECT id, name, createdOn FROM AddressBook WHERE name="Lorem Foundation";

How many Accounts exist?


mysql> SELECT COUNT(*) AS "Number of Accounts" FROM Account;
+--------------------+
| Number of Accounts |
+--------------------+
|               1000 |
+--------------------+
1 row in set (0.00 sec)



How many Address Books exist?


mysql> SELECT COUNT(*) AS "Number of Address Books" FROM AddressBook;
+-------------------------+
| Number of Address Books |
+-------------------------+
|                    1100 |
+-------------------------+
1 row in set (0.01 sec)




How many Address Book Entries exist?

mysql> SELECT COUNT(*) AS "Number of Entries" FROM Entry;
+-------------------+
| Number of Entries |
+-------------------+
|              4000 |
+-------------------+
1 row in set (0.00 sec)


How many Address Book Entries are listed as born before February 12th of 1982?


mysql> SELECT COUNT(*) FROM Entry WHERE birthday<"1982-02-12 00:00:00";   
+----------+
| COUNT(*) |
+----------+
|     2687 |
+----------+
1 row in set (0.00 sec)



How many Address Book Entries are listed as born on or after January 1st of 1965?

mysql> SELECT COUNT(*) FROM Entry WHERE birthday>="1965-01-01 00:00:00";
+----------+
| COUNT(*) |
+----------+
|     2597 |
+----------+
1 row in set (0.01 sec)



Which Address Book Entry is listed as being the oldest of age?

mysql> SELECT firstName, lastName, MIN(birthday) FROM Entry;             
+-----------+----------+---------------------+
| firstName | lastName | MIN(birthday)       |
+-----------+----------+---------------------+
| Herrod    | Conrad   | 1945-09-02 09:21:58 |
+-----------+----------+---------------------+
1 row in set (0.00 sec)



