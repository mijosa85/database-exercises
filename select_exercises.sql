USE albums_db;
SELECT * FROM albums;
-- 	There are 31 rows in the albums table
SELECT DISTINCT `artist`
FROM albums;
-- There are 23 unique artists in the albums table
SHOW KEYS FROM albums WHERE Key_name = 'PRIMARY';
-- The primary key for the albums table is the id column
-- The oldest album is Sgt. Pepper's Lonely Hearts Club Band by the Beatles. The newest album is 21 by Adele
SELECT `name` FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE `name` = "Sgt. Pepper's Lonely Hearts Club Band";
SELECT genre FROM albums WHERE `name` = 'Nevermind';
SELECT `name` FROM albums
	WHERE 1989 < release_date 
	AND release_date < 2000;
SELECT `name` FROM albums WHERE sales < 20;
SELECT `name` FROM albums WHERE genre = 'Rock';
-- Hard rock and progressive rock albums are not returned because one is contained in the other but they arent equal