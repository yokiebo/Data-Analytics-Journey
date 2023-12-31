--SQL Problems: More JOIN Operations

-- Q1. List the films where the yr is 1962 [Show id, title]

SELECT id, title
FROM movie
WHERE yr = 1962


--Q2. Give year of 'Citizen Kane'.

SELECT yr
FROM movie
WHERE title = 'Citizen Kane'


--Q3. List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr


--Q4. What id number does the actor 'Glenn Close' have?

SELECT id
FROM actor
WHERE name = 'Glenn Close'


--Q5. What is the id of the film 'Casablanca'

SELECT id
FROM movie 
WHERE title = 'Casablanca'


/* Q6. Obtain the cast list for 'Casablanca'.

what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question)
*/

SELECT name
FROM movie a JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE title = 'Casablanca'


-- Q7. Obtain the cast list for the film 'Alien'

SELECT name
FROM movie a JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE title = 'Alien'


-- Q8. List the films in which 'Harrison Ford' has appeared

SELECT title
FROM movie a JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE name = 'Harrison Ford'


-- Q9. List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

SELECT title
FROM movie a RIGHT JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE name = 'Harrison Ford' AND ord <> 1


--Q10. List the films together with the leading star for all 1962 films.

SELECT title, name
FROM movie a RIGHT JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE yr = 1962 AND ord = 1


--Q11. Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr, COUNT(title) AS cnt
FROM movie a RIGHT JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2



/*Q12. List the film title and the leading actor for all of the films 'Julie Andrews' played in.

Did you get "Little Miss Marker twice"?
*/

SELECT title, name
FROM movie a JOIN casting b ON a.id = b.movieid AND ord = 1 RIGHT JOIN actor c ON b.actorid = c.id
WHERE a.id IN (SELECT movieid FROM casting WHERE actorid IN (SELECT id FROM actor WHERE name = 'Julie Andrews'))


--Q13. Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT name
FROM casting b JOIN actor c ON b.actorid = c.id AND ord=1
GROUP BY name
HAVING COUNT(ord) >= 15


-- Q14. List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

SELECT title, COUNT(name) AS num_cast
FROM movie a RIGHT JOIN casting b ON a.id = b.movieid RIGHT JOIN actor c ON b.actorid = c.id
WHERE yr = 1978
GROUP BY title
ORDER BY num_cast DESC, title



-- Q15. List all the people who have worked with 'Art Garfunkel'.

SELECT DISTINCT name
FROM actor c JOIN casting b ON c.id = b.actorid
WHERE movieid IN (SELECT movieid FROM casting b JOIN actor c ON (b.actorid = c.id AND name = 'Art Garfunkel')) AND name <> 'Art Garfunkel'