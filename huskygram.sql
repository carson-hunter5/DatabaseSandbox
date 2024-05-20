DROP DATABASE IF EXISTS HuskyGram;
CREATE DATABASE IF NOT EXISTS HuskyGram;

USE HuskyGram;

CREATE TABLE IF NOT EXISTS users (
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at DATETIME,
    id INT,
    PRIMARY KEY(id)

);
CREATE TABLE IF NOT EXISTS photos (
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME,
    id INT,
    PRIMARY KEY(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS follows (
    created_at  DATETIME,
    follower_id INT,
    followee_id INT,
    PRIMARY KEY (follower_id, followee_id),
    FOREIGN KEY (follower_id) REFERENCES users (id),
    FOREIGN KEY (followee_id) REFERENCES users (id)
);

CREATE TABLE IF NOT EXISTS likes (
    created_at DATETIME,
    user_id INT,
    photo_id INT,
    PRIMARY KEY (user_id,photo_id)
);

CREATE TABLE IF NOT EXISTS comments (
    comment_text varchar(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at DATETIME,
    id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (photo_id) REFERENCES photos(id)
);

CREATE TABLE IF NOT EXISTS tags (
    tag_name VARCHAR(255) UNIQUE,
    created_at DATETIME,
    id INT,
    PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS photo_tags (
    photo_id INT,
    tag_id INT,
    PRIMARY KEY (photo_id,tag_id),
    FOREIGN KEY (tag_id) REFERENCES tags (id),
    FOREIGN KEY (photo_id) REFERENCES photos (id)
);

INSERT INTO users
    Values