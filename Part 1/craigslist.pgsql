DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  category TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL UNIQUE,
  pref_region_id INT NOT NULL REFERENCES regions
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  message TEXT NOT NULL,
  author_id INT NOT NULL REFERENCES users,
  location TEXT NOT NULL,
  region_id INT NOT NULL REFERENCES regions,
  category_id INT NOT NULL REFERENCES categories
);
