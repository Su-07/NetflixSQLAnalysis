--Netflix Project
drop table if exists netflix;
create table netflix(
	show_id	varchar(6),
	type varchar(10),
	title varchar(150),
	director varchar(208),
	casts varchar(1000),
	country varchar(150),
	date_added varchar(50),
	release_year int,
	rating varchar(10),
	duration varchar(15),
	listed_in varchar(100),
	description varchar(250)
)

select * from netflix;

select distinct type from netflix;

select count(*) from netflix;

--15 business problems

--1.Count the number of Movies and TV Shows
SELECT
	TYPE,
	COUNT(*) AS TOTAL_MOVIESANDTVSHOWS
FROM
	NETFLIX
GROUP BY TYPE;

--2.Find the most common rating for movies and TV shows
SELECT
	TYPE,
	RATING
FROM
	(
		SELECT
			TYPE,
			RATING,
			COUNT(*),
			RANK() OVER (
				PARTITION BY
					TYPE
				ORDER BY
					COUNT(*) DESC
			) AS RANKING
		FROM
			NETFLIX
		GROUP BY
			TYPE,
			RATING
	) AS T1
WHERE
	RANKING = 1

--List all movies released in a specific year(eg-2020)
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND RELEASE_YEAR = 2020

--4.Find the top 5 countries with the most content on netflix
SELECT
	UNNEST(STRING_TO_ARRAY(COUNTRY, ',')) AS NEW_COUNTRY,
	COUNT(SHOW_ID) AS TOTAL_CONTENT
FROM
	NETFLIX
GROUP BY
	1
ORDER BY
	COUNT(SHOW_ID) DESC LIMIT
	5

--5.Identify the longest movie
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND DURATION = (
		SELECT
			MAX(DURATION)
		FROM
			NETFLIX
	)

6.Find content added in the last 5 years
SELECT
	*
FROM
	NETFLIX
WHERE
	TO_DATE(DATE_ADDED, 'month dd, yyyy') >= CURRENT_DATE - INTERVAL '5 years'

--7.Find all movies/TV Shows by director 'Rajiv Chilaka'
SELECT
	*
FROM
	NETFLIX
WHERE
	DIRECTOR like '%Rajiv Chilaka%'

--8.List all TV Shows with more than 5 seasons
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'TV Show'
	AND SPLIT_PART(DURATION, ' ', 1)::NUMERIC > 5

--9.Count the number of content items in each genre
SELECT
	UNNEST(STRING_TO_ARRAY(LISTED_IN, ',')) AS GENRE,
	COUNT(SHOW_ID) AS TOTAL_CONTENT
FROM
	NETFLIX GROUP BY
	1

--10.Find each year and the average number of content release in India on netflix,
--return top 5 year with highest avg content release
SELECT
	EXTRACT(
		YEAR
		FROM
			TO_DATE(DATE_ADDED, 'Month dd, yyyy')
	) AS DATE,
	COUNT(*) AS YEARLY_CONTENT,
	ROUND(
		COUNT(*)::NUMERIC / (
			SELECT
				COUNT(*)
			FROM
				NETFLIX
			WHERE
				COUNTRY = 'India'
		)::NUMERIC * 100,
		2
	) AS AVG_CONTENT_PER_YEAR
FROM
	NETFLIX WHERE
	COUNTRY = 'India'
GROUP BY
	1
ORDER BY
	3 DESC
LIMIT
	5

--11.List all the movies that are documnetaries
SELECT
	*
FROM
	NETFLIX
WHERE
	TYPE = 'Movie'
	AND LISTED_IN ILIKE '%documentaries%'

--12.Find all the content without a director
SELECT
	*
FROM
	NETFLIX
WHERE
	DIRECTOR IS NULL;

--13.Find how many movies actor 'Salman Khan' appeared in last 10 years
SELECT
	*
FROM
	NETFLIX
WHERE
	CASTS ILIKE '%salman khan%'
	AND RELEASE_YEAR > EXTRACT(
		YEAR
		FROM
			CURRENT_DATE
	) -10

--14.Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT
	UNNEST(STRING_TO_ARRAY(CASTS, ',')),
	COUNT(*) AS TOTAL_CONTENT
FROM
	NETFLIX
WHERE
	COUNTRY ILIKE '%india'
GROUP BY
	1
ORDER BY
	2 DESC LIMIT
	10

--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in the description field. 
--label content containing these keywords as 'Bad' and all other content as 'Good'. 
--Count how many items fall into each category.
WITH
	NEW_TABLE AS (
		SELECT
			*,
			CASE
				WHEN DESCRIPTION ILIKE '%kill%'
				OR DESCRIPTION ILIKE '%violence%' THEN 'Bad_Content'
				ELSE 'Good_Content'
			END CATEGORY
		FROM
			NETFLIX
	)
SELECT
	CATEGORY,
	COUNT(*) FROM
	NEW_TABLE
GROUP BY
	1
