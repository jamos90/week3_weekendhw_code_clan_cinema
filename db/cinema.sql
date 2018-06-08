DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE tickets (
  id SERIAL4,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  ticket_id INT4 REFERENCES tickets(id) ON DELETE CASCADE
);

CREATE TABLE customers (
  id SERIAL4,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE films (
  id SERIAL4,
  title VARCHAR(255),
  price INT4
);
