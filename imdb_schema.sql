-- 🎬 Movie Database Schema with Sample Data (Based on ER Diagram)

-- 1. ACTORS
CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname CHAR(20),
    act_lname CHAR(20),
    act_gender CHAR(1)
);
INSERT INTO actor VALUES (1, 'Leonardo', 'DiCaprio', 'M');
INSERT INTO actor VALUES (2, 'Kate', 'Winslet', 'F');
INSERT INTO actor VALUES (3, 'Tom', 'Hanks', 'M');

-- 2. DIRECTORS
CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname CHAR(20),
    dir_lname CHAR(20)
);
INSERT INTO director VALUES (1, 'James', 'Cameron');
INSERT INTO director VALUES (2, 'Steven', 'Spielberg');

-- 3. MOVIES
CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title CHAR(50),
    mov_year INT,
    mov_time INT,
    mov_lang CHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);
INSERT INTO movie VALUES (1, 'Titanic', 1997, 195, 'English', '1997-12-19', 'US');
INSERT INTO movie VALUES (2, 'Catch Me If You Can', 2002, 141, 'English', '2002-12-25', 'US');
INSERT INTO movie VALUES (3, 'Forrest Gump', 1994, 142, 'English', '1994-07-06', 'US');

-- 4. REVIEWERS
CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name CHAR(30)
);
INSERT INTO reviewer VALUES (1, 'Roger Ebert');
INSERT INTO reviewer VALUES (2, 'IMDB User');

-- 5. GENRES
CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title CHAR(20)
);
INSERT INTO genres VALUES (1, 'Drama');
INSERT INTO genres VALUES (2, 'Romance');
INSERT INTO genres VALUES (3, 'Biography');

-- 6. MOVIE_CAST
CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role CHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);
INSERT INTO movie_cast VALUES (1, 1, 'Jack Dawson');
INSERT INTO movie_cast VALUES (2, 1, 'Rose');
INSERT INTO movie_cast VALUES (3, 3, 'Forrest Gump');

-- 7. MOVIE_DIRECTION
CREATE TABLE movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);
INSERT INTO movie_direction VALUES (1, 1);
INSERT INTO movie_direction VALUES (2, 2);
INSERT INTO movie_direction VALUES (2, 3);

-- 8. MOVIE_GENRES
CREATE TABLE movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);
INSERT INTO movie_genres VALUES (1, 1);  -- Titanic - Drama
INSERT INTO movie_genres VALUES (1, 2);  -- Titanic - Romance
INSERT INTO movie_genres VALUES (2, 1);  -- Catch Me - Drama
INSERT INTO movie_genres VALUES (2, 3);  -- Catch Me - Biography
INSERT INTO movie_genres VALUES (3, 1);  -- Forrest Gump - Drama

-- 9. RATINGS
CREATE TABLE rating (
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);
INSERT INTO rating VALUES (1, 1, 5, 1000);  -- Titanic
INSERT INTO rating VALUES (2, 2, 4, 750);   -- Catch Me If You Can
INSERT INTO rating VALUES (3, 1, 5, 850);   -- Forrest Gump
