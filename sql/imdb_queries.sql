/*1. What are the names of all movies released in 1995?*/
SELECT movies.name 
FROM movies 
WHERE year = 1995;

/*2. How many people played a part in the movie "Lost in Translation"?*/
SELECT COUNT(roles.actor_id) 
FROM roles 
JOIN movies 
ON roles.movie_id = movies.id 
WHERE movies.name = "Lost in Translation";

/*3. What are the names of all the people who played a part in the movie "Lost in Translation"?*/
SELECT actors.first_name, actors.last_name 
FROM actors 
JOIN roles 
ON actors.id = roles.actor_id 
JOIN movies 
ON roles.movie_id = movies.id 
WHERE movies.name = "Lost in Translation";

/*4. Who directed the movie "Fight Club"?*/
SELECT * 
FROM directors 
JOIN movies_directors 
ON directors.id = movies_directors.director_id 
JOIN movies 
ON movies_directors.movie_id = movies.id 
WHERE movies.name = "Fight Club";

/*5. How many movies has Clint Eastwood directed?*/
SELECT COUNT(*)
FROM movies
JOIN movies_directors
ON movies.id = movies_directors.movie_id
JOIN directors
ON movies_directors.director_id = directors.id
WHERE directors.first_name = "Clint"
AND directors.last_name = "Eastwood";

/*6. What are the names of all movies Clint Eastwood has directed?*/
SELECT movies.name 
FROM movies 
JOIN movies_directors 
ON movies.id = movies_directors.movie_id 
JOIN directors 
ON movies_directors.director_id = directors.id 
WHERE directors.first_name = "Clint" 
AND directors.last_name = "Eastwood";

/*7. What are the names of all directors who have directed at least one horror film?*/
SELECT directors.first_name, directors.last_name 
FROM directors 
JOIN movies_directors 
ON directors.id = movies_directors.director_id 
JOIN movies 
ON movies_directors.movie_id = movies.id 
JOIN movies_genres 
ON movies_genres.movie_id = movies.id 
WHERE movies_genres.genre = "Horror";

/*8. What are the names of every actor who has appeared in a movie directed by Christopher Nolan?*/
SELECT actors.first_name, actors.last_name 
FROM actors 
JOIN roles 
ON actors.id = roles.actor_id 
JOIN movies 
ON roles.movie_id = movies.id 
JOIN movies_directors 
ON movies.id = movies_directors.movie_id 
JOIN directors 
ON movies_directors.director_id = directors.id 
WHERE directors.first_name = "Christopher" 
AND directors.last_name = "Nolan";