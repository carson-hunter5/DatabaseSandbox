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
    VALUES ('carson_hunter', NOW(), 000320),
           ('cam_hunter', NOW(), 0001025),
           ('chris_hunter', NOW(), 0001008);

INSERT INTO follows
    VALUES (NOW(),000320,0001008),
           (NOW(),0001008,000320),
           (NOW(),0001008, 0001025),
           (NOW(), 000320, 0001025);

INSERT INTO photos
    VALUES ('www.husky', 000320, NOW(), 7421),
           ('www.gram', 0001008, NOW(), 7422),
           ('www.hey', 000320, NOW(), 7424),
           ('www.Www', 000320, NOW(), 7423);

INSERT INTO comments
    VALUES ('Hello!',0001025,7422,NOW(),36),
           (' hi college!',0001008,7422,NOW(),31),
           ('Hello!',0001008,7422,NOW(),32),
           ('hbd!', 0001008, 7422, NOW(), 30);

INSERT INTO likes
    VALUES (NOW(),000320,7423);

INSERT INTO tags
    VALUES ('Hi!', NOW(), 1),
           ('Hey!', NOW(), 2),
           ('Woah!', NOW(), 3),
           ('Nice', NOW(), 4);

INSERT INTO photo_tags
    VALUES (7422,1),
           (7422,2),
           (7421,1),
           (7423,1),
           (7423,2),
           (7424, 1),
           (7422, 4),
           (7423,4),
           (7421,4);




