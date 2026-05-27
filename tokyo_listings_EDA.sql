-- Listing count by neighbourhood
SELECT neighbourhood, COUNT(*) AS total_listings
FROM tokyo_listings
GROUP BY neighbourhood
ORDER BY total_listings DESC;

-- Room type distribution
SELECT room_type, COUNT(*) AS count
FROM tokyo_listings
GROUP BY room_type
ORDER BY count DESC;

-- Average and median price by neighbourhood
SELECT neighbourhood, 
       ROUND(AVG(price), 0) AS avg_price,
       COUNT(*) AS total_listings
FROM tokyo_listings
GROUP BY neighbourhood
ORDER BY avg_price DESC;


-- Average reviews per listing by neighbourhood
SELECT neighbourhood,
       ROUND(AVG(number_of_reviews_ltm), 1) AS avg_reviews_ltm,
       COUNT(*) AS total_listings
FROM tokyo_listings
GROUP BY neighbourhood
ORDER BY avg_reviews_ltm DESC;

SELECT neighbourhood,
       ROUND(AVG(number_of_reviews_ltm), 1) AS avg_reviews_ltm,
       COUNT(*) AS total_listings
FROM tokyo_listings
GROUP BY neighbourhood
HAVING COUNT(*) >= 50
ORDER BY avg_reviews_ltm DESC;

-- opportunity finding
SELECT neighbourhood,
       COUNT(*) AS total_listings,
       ROUND(AVG(number_of_reviews_ltm), 1) AS avg_demand,
       ROUND(AVG(price), 0) AS avg_price,
       SUM(is_active) AS active_listings,
       ROUND(SUM(is_active) / COUNT(*) * 100, 1) AS active_pct
FROM tokyo_listings
GROUP BY neighbourhood
HAVING COUNT(*) >= 50
ORDER BY avg_demand DESC;


-- Host type vs average performance
SELECT host_type,
       COUNT(*) AS total_listings,
       ROUND(AVG(price), 0) AS avg_price,
       ROUND(AVG(number_of_reviews_ltm), 1) AS avg_demand,
       ROUND(SUM(is_active) / COUNT(*) * 100, 1) AS active_pct
FROM tokyo_listings
GROUP BY host_type;

-- Room type vs price and demand
SELECT room_type,
       COUNT(*) AS total_listings,
       ROUND(AVG(price), 0) AS avg_price,
       ROUND(AVG(number_of_reviews_ltm), 1) AS avg_demand
FROM tokyo_listings
GROUP BY room_type
ORDER BY avg_demand DESC;

SELECT host_type, room_type, COUNT(*) AS count
FROM tokyo_listings
GROUP BY host_type, room_type
ORDER BY host_type, count DESC;
