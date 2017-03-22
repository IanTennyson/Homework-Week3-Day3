DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
id SERIAL4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE albums (
id SERIAL4 PRIMARY KEY,
title VARCHAR(255),
genre VARCHAR(225),
artist_id INT4 REFERENCES artists(id)
);

> UPDATE contacts SET name = 'Wes Anderson' WHERE id = 1;

#1. What order do I have to delete to get my Artist delete function to work. My Album delete works. The error says its a Foreign key which means my albums must be dependant on it so I can't delete.

#1. Think I've figured prob 1 out.

#2. In the find_by_id method do you pass in an argument? Can sql take arguments? How does that work?

#3. What are the commands to use my update function in the terminal as the code is running? 
