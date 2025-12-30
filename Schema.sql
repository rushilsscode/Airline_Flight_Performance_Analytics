CREATE DATABASE airline_sql_analytics;
USE airline_sql_analytics;

CREATE TABLE airports (
    airport_id VARCHAR(10) PRIMARY KEY,
    airport_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE flights (
    flight_id INT AUTO_INCREMENT PRIMARY KEY,
    day_of_month INT,
    day_of_week INT,
    carrier VARCHAR(10),
    origin_airport_id INT,
    dest_airport_id INT,
    dep_delay INT,
    arr_delay INT
);