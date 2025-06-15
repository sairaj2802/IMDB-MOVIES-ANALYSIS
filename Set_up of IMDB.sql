create database imdb_analysis;

use imdb_analysis;

create table imdb_movies(
color varchar(20),
director_name varchar(50),
num_critic_for_reviews int,
duration float,
actor_2_name varchar(50),
gross bigint,
genres varchar(270),
actor_1_name varchar(50),
movie_title varchar(100),
num_voted_users INT,
actor_3_name varchar(50),
movie_imdb_link text,
num_user_for_reviews float,
language varchar(50),
country varchar(100),
content_rating varchar(50),
budget bigint,
title_year year,
imdb_score float
);

set global local_infile =1;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_IMDB_data.csv'
INTO TABLE imdb_movies
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select* from
imdb_movies;
