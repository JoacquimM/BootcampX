CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  birth_year SMALLINT NOT NULL,
  member_since TIMESTAMP NOT NULL DEFAULT Now()
);
CREATE TABLE pets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  owner_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);
SELECT users.id AS user_id,
  pets.name AS pets_name,
  users.name AS user_name
FROM users users
  JOIN pets ON users.id = owner_id;