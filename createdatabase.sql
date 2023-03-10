CREATE DATABASE IF NOT EXISTS slutprojekt;

 -- USE slutprojekt;

-- SELECT * FROM games;
-- SELECT * FROM publishers;
-- SELECT * FROM movies;
-- SELECT * FROM movie_directors;

CREATE TABLE IF NOT EXISTS games(
    id INT PRIMARY KEY AUTO_INCREMENT,
    game_title VARCHAR(150) NOT NULL,
	developer_id INT REFERENCES game_publisher,
    game_rating DOUBLE,
    release_date YEAR NOT NULL
);
CREATE TABLE IF NOT EXISTS publishers(
	id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS movies(
    id INT PRIMARY KEY AUTO_INCREMENT,
    movie_title VARCHAR(150) NOT NULL,
	director_id INT REFERENCES movie_directors,
    movie_rating DOUBLE,
    release_date YEAR NOT NULL
);
CREATE TABLE IF NOT EXISTS movie_directors(
	id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR(100) NOT NULL
);
INSERT INTO games (id, game_title, developer_id, game_rating, release_date)
VALUES (DEFAULT, 'Grand Theft Auto: IV', 1 , 10, 2008);

INSERT INTO publishers
VALUES (DEFAULT, 'Rockstar Games');

INSERT INTO publishers VALUES (DEFAULT,  "Warner Bros. Interactive Entertainment");
INSERT INTO games VALUES  (DEFAULT, "Batman: Arkham Knight", 2 , 10, 2015 );

INSERT INTO publishers VALUES (DEFAULT, "FromSoftware Incorporated");

INSERT INTO movies (id, movie_title, director_id, movie_rating, release_date)
VALUES (DEFAULT, 'Django Unchained', 1 , 9.2, 2012);

INSERT INTO movie_directors
VALUES (DEFAULT, 'Quentin Tarantino');