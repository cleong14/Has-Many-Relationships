-- 1. create new user
CREATE USER has_many_user;

-- 2. create new database
CREATE DATABASE has_many_blogs OWNER has_many_user;

-- 3. before each create table, drop table if it exists
DROP TABLE IF EXISTS users, posts, comments;

-- 4. create user table
CREATE TABLE users (
  id  serial  NOT NULL  PRIMARY KEY,
  username  char (90)  NOT NULL,
  first_name  char (90)  NULL,
  last_name  char (90)  NULL,
  created_at  timestamp  NOT NULL  DEFAULT now(),
  updated_at  timestamp  NOT NULL  DEFAULT now()
);

-- create posts table
CREATE TABLE posts (
  id  serial  NOT NULL  PRIMARY KEY,
  title  char (180)  NULL,
  url  char (510)  NULL,
  content  text  NULL,
  created_at  timestamp  NOT NULL  DEFAULT now(),
  updated_at  timestamp  NOT NULL  DEFAULT now(),
  users_id  int  REFERENCES users (id)
);

-- create comments table
CREATE TABLE comments (
  id  serial  NOT NULL,
  body  char (510)  NULL,
  created_at  timestamp  NOT NULL  DEFAULT now(),
  updated_at  timestamp  NOT NULL  DEFAULT now(),
  users_id  int  REFERENCES users (id),
  posts_id  int  REFERENCES posts (id)
);