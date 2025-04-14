-- 1 Most Popular Genres
SELECT favorite_genre, COUNT(*) AS genre_count
FROM netflix_users
GROUP BY favorite_genre
ORDER BY genre_count DESC;

-- 2 Favorite Genre by Age Group
SELECT 
  CASE 
    WHEN age < 18 THEN 'Teen'
    WHEN age BETWEEN 18 AND 34 THEN 'Young Adult'
    WHEN age BETWEEN 35 AND 54 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  favorite_genre,
  COUNT(*) AS user_count
FROM netflix_users
GROUP BY age_group, favorite_genre
ORDER BY age_group, user_count DESC;

-- 3 Watch Time By Age Group
SELECT 
  CASE 
    WHEN age < 18 THEN 'Teen'
    WHEN age BETWEEN 18 AND 34 THEN 'Young Adult'
    WHEN age BETWEEN 35 AND 54 THEN 'Adult'
    ELSE 'Senior'
  END AS age_group,
  ROUND(AVG(watch_time_hours), 2) AS avg_watch_time
FROM netflix_users
GROUP BY age_group
ORDER BY avg_watch_time DESC;

 -- 4 Total Watch Time By Country
 SELECT country, SUM(watch_time_hours) AS total_watch_time
FROM netflix_users
GROUP BY country
ORDER BY total_watch_time DESC
LIMIT 10;

-- 5 Total Watch Time By Subscription Plan
SELECT subscription_type, ROUND(AVG(watch_time_hours), 2) AS avg_watch_time
FROM netflix_users
GROUP BY subscription_type
ORDER BY avg_watch_time DESC;
