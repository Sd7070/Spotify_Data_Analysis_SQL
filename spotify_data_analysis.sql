-- SQL Project - Spotify Data Analysis 


-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

-- EDA 

SELECT * 
FROM spotify 
LIMIT 100;

SELECT COUNT(*) AS "Total_rows"
FROM spotify;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'spotify';

-- Total no. of artists
SELECT COUNT(DISTINCT artist) FROM spotify;

SELECT DISTINCT artist FROM spotify;

-- Total no. of tracks 
SELECT COUNT(DISTINCT track) FROM spotify;

SELECT DISTINCT track FROM spotify;

-- Total no. of album 
SELECT COUNT(DISTINCT album) FROM spotify;

SELECT DISTINCT album FROM spotify;

SELECT DISTINCT album_type FROM spotify;

SELECT MAX(duration_min) FROM spotify;
SELECT MIN(duration_min) FROM spotify;

SELECT * FROM spotify 
WHERE duration_min = 0;

DELETE FROM spotify 
WHERE duration_min = 0;

SELECT * FROM spotify 
WHERE duration_min = 0;

SELECT DISTINCT channel FROM spotify;

SELECT DISTINCT most_played_on FROM spotify;

-- -----------------------------------------------------------
-- Data Analysis -- (Easy Category)
-- -----------------------------------------------------------

-- 1. Retrieve the names of all tracks that have more than 1 billion streams.

SELECT track , stream
FROM spotify 
WHERE stream > 1000000000;

-- 2. List all albums along with their respective artists.

SELECT DISTINCT album , artist 
FROM spotify 
order by 1;

-- 3. Get the total number of comments for tracks where licensed = TRUE.
SELECT title, comments , licensed
FROM spotify 
WHERE licensed = 'true';

SELECT SUM(comments) AS "Total_comments"
FROM spotify 
WHERE licensed = 'true';

-- 4. Find all tracks that belong to the album type single.

SELECT *
FROM spotify
WHERE album_type = 'single';

-- 5. Count the total number of tracks by each artist.

SELECT  artist ,count(track) AS "total_trakc" 
FROM spotify 
GROUP BY artist
ORDER BY 2 DESC;

-- -----------------------------------------------------------------------------------------
-- (Medium Category)
-- -----------------------------------------------------------------------------------------

-- 6. Calculate the average danceability of tracks in each album.

SELECT * FROM spotify;

SELECT album , AVG(danceability) AS "Avg_danceability"
FROM spotify 
GROUP by album
ORDER by 2 DESC ;


-- 7. Find the top 5 tracks with the highest energy values.

SELECT track , MAX(energy) AS "High_enery"
FROM spotify 
GROUP BY track 
ORDER BY 2 DESC
LIMIT 5;


-- 8. List all tracks along with their views and likes where official_video = 'true';.

SELECT track , sum(views) AS "Total_views" , sum(likes) AS "Total_likes"
FROM spotify 
WHERE official_video = 'true'
GROUP BY track
ORDER BY 2 DESC;

-- 9. For each album, calculate the total views of all associated tracks.

SELECT album , track ,  sum(views) AS "Total_views"
FROM spotify
GROUP BY album, track;


-- 10. Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT * FROM 
(SELECT 
     track ,
	 -- most_played_on ,
	 COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream END),0) as streammed_on_youtube,
	 COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream END),0) AS streammed_on_spotify
FROM spotify
GROUP BY 1) AS t1
WHERE streammed_on_spotify > streammed_on_youtube
      AND streammed_on_youtube <> 0;


-- ----------------------------------------------------------------------------------------------------------
--  ( Advanced category ) 
-- ----------------------------------------------------------------------------------------------------------

-- 11.Find the top 3 most-viewed tracks for each artist using window functions.

-- each artist and total views for each track 
-- track with highest view for each artist ( we need top)
-- dense rank
-- cte and filter rank <= 3

WITH ranking_artist AS (

SELECT track ,
       artist ,
	   SUM(views) AS "Most_viewed",
	   DENSE_RANK() OVER(PARTITION BY artist ORDER BY SUM(views) DESC ) AS rank
FROM spotify
GROUP BY 1,2
) 
SELECT * FROM ranking_artist 
WHERE rank <= 3;



-- 12.Write a query to find tracks where the liveness score is above the average.

SELECT AVG(liveness) FROM spotify; -- 0.19

SELECT track 
FROM spotify
WHERE liveness > 0.19 ;

SELECT track , artist , liveness
FROM spotify
WHERE liveness > (SELECT AVG(liveness) FROM spotify);
       


-- 13. Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.
WITH cte
AS
(SELECT 
	album,
	MAX(energy) as highest_energy,
	MIN(energy) as lowest_energery
FROM spotify
GROUP BY 1
)
SELECT 
	album,
	highest_energy - lowest_energery as energy_diff
FROM cte
ORDER BY 2 DESC;

-- 14.Find tracks where the energy-to-liveness ratio is greater than 1.2.

SELECT track ,
       energy_liveness
FROM spotify
WHERE energy_liveness > 1.2;


-- 15.Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

SELECT
    track,
    artist,
    views,
    likes,
    SUM(likes) OVER (
        ORDER BY views DESC
    ) AS cumulative_likes
FROM spotify
ORDER BY views DESC;
