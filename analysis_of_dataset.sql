 -- Total number of flights-- 
 
SELECT COUNT(*) AS total_flights
FROM flights;

-- Number of flights per carrier-- 

SELECT carrier, COUNT(*) AS total_flights
FROM flights
GROUP BY carrier;

 -- Average arrival delay across all flights 
 
SELECT ROUND(AVG(arr_delay), 2) AS avg_arrival_delay
FROM flights;

-- Flights with arrival delay more than 30 minutes

select count(*) as delayed_flight 
from flights
where arr_delay > 30;

-- Average departure delay by carrier

select carrier, ROUND(AVG(dep_delay),2) as avg_delay_by_carrier
from flights
group by carrier;

-- On-time performance (%) by carrier

select carrier, 
Round(sum(case when arr_delay <=0 then 1 else 0 end)*100 / count(*), 2) 
as on_time_percentage
from flights
group by carrier;

-- Top 5 busiest origin airports

 select a.airport_name, count(*) as total_departures
 from flights f 
 Join airports a on f.origin_airport_id = a.airport_id
 group by airport_name
 order by total_departures desc
 limit 5;
 
-- Top 5 busiest origin airports 

SELECT day_of_week,
       ROUND(AVG(arr_delay), 2) AS avg_delay
FROM flights
GROUP BY day_of_week
ORDER BY avg_delay DESC;

-- Routes with highest average arrival delay

SELECT ao.city AS origin_city,
       ad.city AS destination_city,
       ROUND(AVG(f.arr_delay), 2) AS avg_delay
FROM flights f
JOIN airports ao ON f.origin_airport_id = ao.airport_id
JOIN airports ad ON f.dest_airport_id = ad.airport_id
GROUP BY origin_city, destination_city
ORDER BY avg_delay DESC;

--  Carriers with more than 20% delayed flights

SELECT carrier,
       ROUND(
         SUM(CASE WHEN arr_delay > 15 THEN 1 ELSE 0 END) * 100.0
         / COUNT(*), 2
       ) AS delay_percentage
FROM flights
GROUP BY carrier
HAVING delay_percentage > 20;
 