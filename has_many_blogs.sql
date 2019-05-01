DROP DATABASE has_many_blogs CASCADE;
DROP USER has_many_user CASCADE;

CREATE USER has_many_user;
CREATE DATABASE has_many_blogs
  WITH OWNER = has_many_user;
\c has_many_blogs;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  id      SERIAL PRIMARY KEY,
  username    varchar(90) NOT NULL,
  first_name    varchar(90) NULL DEFAULT NULL,
  last_name   varchar(90) NULL DEFAULT NULL,
  created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

DROP TABLE IF EXISTS posts CASCADE;
CREATE TABLE posts (
  id   SERIAL,
  title   varchar(180) NULL DEFAULT NULL,
  url   varchar(510) NULL DEFAULT NULL,
  content   TEXT NULL DEFAULT NULL,
  created_at  TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  user_id   INTEGER REFERENCES users,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
  id    SERIAL,
  body   varchar(510) NULL DEFAULT NULL,
  created_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at    TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  user_id   INTEGER REFERENCES users,
  post_id   INTEGER REFERENCES posts,
  PRIMARY KEY (id)
);