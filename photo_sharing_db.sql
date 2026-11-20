-- Photo Sharing Database
-- Users, map locations, and the photographs users take at them
-- Author: Ousmana Tunkara · github.com/Kodelack47
-- Dialect: MySQL 8

DROP DATABASE IF EXISTS finalproject;
CREATE DATABASE finalproject;
USE finalproject;

-- Prompt 2: Create Tables
CREATE TABLE users (
  userid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  username VARCHAR(20),
  address VARCHAR(255),
  city VARCHAR(255),
  state VARCHAR(2),
  zip VARCHAR(10)
);

CREATE TABLE locations (
  itemid INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  type INT,
  description VARCHAR(255),
  lng REAL,
  lat REAL
);

CREATE TABLE photographs (
  photoid INT,
  locationid INT,
  userid INT NOT NULL
);

-- Prompt 3: Alter Tables
ALTER TABLE locations MODIFY type INT NOT NULL;
ALTER TABLE locations MODIFY description VARCHAR(255) NOT NULL;
ALTER TABLE locations MODIFY lng REAL NOT NULL;
ALTER TABLE locations MODIFY lat REAL NOT NULL;
ALTER TABLE users MODIFY name VARCHAR(255) NOT NULL;
ALTER TABLE users MODIFY username VARCHAR(20) NOT NULL;
ALTER TABLE photographs MODIFY photoid INT NOT NULL;
ALTER TABLE photographs MODIFY locationid INT NOT NULL;

-- Prompt 4: Create Indexes
CREATE UNIQUE INDEX id ON users (userid);
CREATE UNIQUE INDEX photo_id ON photographs (photoid);

-- Prompt 5: Insert Users
INSERT INTO users (name, username, address, city, state, zip)
VALUES ('Bonnie Buntcake', 'bbunt', '6709 Wonder Street', 'Wonderbread', 'OH', '46106');
INSERT INTO users (name, username, address, city, state, zip)
VALUES ('Sam Smarf', 'ssmarf', '356 A Street', 'Beefy', 'PA', '19943');
INSERT INTO users (name, username, address, city, state, zip)
VALUES ('Wendy Grog', 'wgrog', '900 Star Street', 'Mary', 'MD', '21340');
INSERT INTO users (name, username, address, city, state, zip)
VALUES ('Joe Jogger', 'jjogger', '183713 N North Street', 'Norther', 'WV', '51423');

SELECT * FROM users;

-- Prompt 6: Count Rows
SELECT count(*) FROM users;

-- Prompt 7: Add Column (already included at creation, showing the ALTER here for the assignment)
ALTER TABLE photographs ADD COLUMN userid2 INT AFTER userid;

-- Prompt 9: Insert Locations and Photographs
INSERT INTO locations (type, description, lng, lat) VALUES (1, 'Independence Hall', 794.35, 651.43);
INSERT INTO locations (type, description, lng, lat) VALUES (2, '6709 Wonder Street', 323.41, 412.22);
INSERT INTO locations (type, description, lng, lat) VALUES (1, 'Sunrise', 221.45, 132.43);
INSERT INTO locations (type, description, lng, lat) VALUES (2, '356 A Street', 123.32, 222.43);
INSERT INTO locations (type, description, lng, lat) VALUES (1, 'Mountains', 34.12, 87.99);
INSERT INTO locations (type, description, lng, lat) VALUES (2, '900 Star Street', 1071.9, 206.45);
INSERT INTO locations (type, description, lng, lat) VALUES (1, 'Moonrise', 816.2, 111.2);
INSERT INTO locations (type, description, lng, lat) VALUES (2, '183714 N North Street', 176.11, 11.176);

INSERT INTO photographs (photoid, locationid, userid) VALUES (1, 1, 1);
INSERT INTO photographs (photoid, locationid, userid) VALUES (2, 3, 1);
INSERT INTO photographs (photoid, locationid, userid) VALUES (3, 5, 3);
INSERT INTO photographs (photoid, locationid, userid) VALUES (4, 7, 4);

SELECT * FROM locations;
SELECT * FROM photographs;

-- Prompt 10
SELECT name FROM users;

-- Prompt 11
SELECT name FROM users, photographs WHERE users.userid = photographs.userid;

-- Prompt 12
SELECT DISTINCT name FROM users, photographs WHERE users.userid = photographs.userid;
