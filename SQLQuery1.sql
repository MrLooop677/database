-- Create Movie Database
CREATE DATABASE movie_database;
USE movie_database;

CREATE TABLE actor (
    act_id INT PRIMARY KEY,
    act_fname VARCHAR(20) NOT NULL,
    act_lname VARCHAR(20) NOT NULL,
    act_gender CHAR(1) NOT NULL
);

CREATE TABLE director (
    dir_id INT PRIMARY KEY,
    dir_fname VARCHAR(20) NOT NULL,
    dir_lname VARCHAR(20) NOT NULL
);

=CREATE TABLE genres (
    gen_id INT PRIMARY KEY,
    gen_title VARCHAR(20) NOT NULL
);

CREATE TABLE reviewer (
    rev_id INT PRIMARY KEY,
    rev_name VARCHAR(30) NOT NULL
);

CREATE TABLE movie (
    mov_id INT PRIMARY KEY,
    mov_title VARCHAR(50) NOT NULL,
    mov_year INT,
    mov_time INT,
    mov_lang VARCHAR(50),
    mov_dt_rel DATE,
    mov_rel_country CHAR(5)
);

CREATE TABLE movie_cast (
    act_id INT,
    mov_id INT,
    role VARCHAR(30),
    PRIMARY KEY (act_id, mov_id),
    FOREIGN KEY (act_id) REFERENCES actor(act_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_direction (
    dir_id INT,
    mov_id INT,
    PRIMARY KEY (dir_id, mov_id),
    FOREIGN KEY (dir_id) REFERENCES director(dir_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id)
);

CREATE TABLE movie_genres (
    mov_id INT,
    gen_id INT,
    PRIMARY KEY (mov_id, gen_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (gen_id) REFERENCES genres(gen_id)
);

CREATE TABLE rating (
    mov_id INT,
    rev_id INT,
    rev_stars INT,
    num_o_ratings INT,
    PRIMARY KEY (mov_id, rev_id),
    FOREIGN KEY (mov_id) REFERENCES movie(mov_id),
    FOREIGN KEY (rev_id) REFERENCES reviewer(rev_id)
);
