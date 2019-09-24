DROP TABLE rentals;
DROP TABLE bikes;
DROP TABLE customers;


CREATE TABLE bikes (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  size INT8,
  bike_available BOOLEAN
);

CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE rentals (
  rental_id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
  bike_id INT8 REFERENCES bikes(id) ON DELETE CASCADE,
  rental_date VARCHAR(255)
)
