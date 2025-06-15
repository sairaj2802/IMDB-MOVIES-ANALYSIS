select* from imdb_movies;

#Number OF movies According to language
select language,count(language) as moviesPerLanguage
from imdb_movies
group by language
order by moviesPerLanguage desc
limit 10;

#Country With Number of movies
select country,count(country) as NumberOfCountry
from imdb_movies
group by country
order by NumberOfCountry desc
limit 10;

#Number of Movies according to color
select color,count(color) as TypeOfMovies
from imdb_movies
group by color;

#Top 10 directors with Highest Movies
select director_name,movie_title,language,country,title_year,imdb_score,budget
from imdb_movies;

select director_name, count(movie_title) as NoOfMoviesTitleByDirector
from imdb_movies
group by director_name
order by NoOfMoviesTitleByDirector desc
limit 10;

#Top 10 Movies with Highest Budget
select movie_title,country,title_year,budget
from imdb_movies
order by budget desc
limit 10;

#Most Hit Movies
Select movie_title,director_name,country,(budget-gross) as HitMovies 
from imdb_Movies
order by HitMovies desc
limit 10;

#Most Flop Movies
Select movie_title,director_name,country,(budget-gross) as FlopMovies 
from imdb_Movies
order by FlopMovies
limit 10;

#Highest imdbscore of Movies
select movie_title,genres,imdb_score
from imdb_movies
order by imdb_score desc
limit 10;

#Movies with Highest Duration and highest Imdb rating 
Select movie_title,duration,imdb_score
from imdb_movies
order by imdb_score and duration  desc;

#Top 10 country with Profit in Movies 
 
 select m.country,m.movie_title,(m.gross-m.budget) as profit
 from imdb_movies m
 join(
 
 select country ,max(gross-budget) as maxProfit
 from imdb_movies
 where gross is not null and budget is not null and country is not null
 group by country) as MaxTable
  on m.country=MaxTable.country
  and (m.gross-m.budget)=MaxTable.maxProfit
  order by profit desc
  limit 10;
#Actors Collabaration
create view actor_collab as 
 SELECT 
    LEAST(actor_1_name, actor_2_name) AS actor_a,
    GREATEST(actor_1_name, actor_2_name) AS actor_b,
    COUNT(*) AS collaboration_count
FROM imdb_movies
WHERE actor_1_name IS NOT NULL AND actor_2_name IS NOT NULL
GROUP BY actor_a, actor_b
HAVING collaboration_count > 1
ORDER BY collaboration_count DESC;

  
  
  
  
  
  
  
  
  
  
  
  
  
















