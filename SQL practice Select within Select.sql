-- SELECT within SELECT


--Q1. List each country name where the population is larger than that of 'Russia'.

SELECT name
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Russia')


--Q2. Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

SELECT name
FROM world 
WHERE gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom') AND continent = 'Europe'


--Q3. List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent
FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN ('Argentina', 'Australia'))


--Q4. Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.

SELECT name, population
FROM world
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') AND population < (SELECT population FROM world WHERE name = 'Germany')


--Q5. Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

SELECT name, CONCAT(ROUND(CAST((population/(SELECT population FROM world WHERE name = 'Germany'))*100, AS INT), 0), '%') AS percentage
FROM world
WHERE continent = 'Europe'


-- Q6. Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)

SELECT name
FROM world
WHERE GDP > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')


-- Q7. Find the largest country (by area) in each continent, show the continent, the name and the area:


SELECT a.continent, a.name, a.area
FROM world a
WHERE a.area = (SELECT MAX(b.area) FROM world b WHERE a.continent = b.continent)


-- Q8. List each continent and the name of the country that comes first alphabetically.

SELECT a.continent, a.name
FROM world a
WHERE a.name = (SELECT MIN(b.name) FROM world b WHERE a.continent = b.continent)


-- Q9. Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.

SELECT a.name, a.continent, a.population
FROM world a
WHERE 25000000 > ALL(SELECT b.population FROM world b WHERE a.continent = b.continent)


--Q10. Some countries have populations more than three times that of all of their neighbours (in the same continent). Give the countries and continents.

SELECT a.name, a.continent
FROM world a
WHERE a.population > ALL (SELECT b.population*3 FROM world b WHERE a.continent = b.continent AND a.name <> b.name)