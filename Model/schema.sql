CREATE DATABASE instagram;
USE instagram

CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    userName VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE Photos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    image_url VARCHAR(255) NOT NULL,
    users_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (users_id) REFERENCES Users(id)
);

CREATE TABLE Comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment_content VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (photo_id) REFERENCES Photos(id)
);

CREATE TABLE Likes(
    photo_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    FOREIGN KEY(photo_id) REFERENCES Photos(id),
    FOREIGN KEY(user_id) REFERENCES Users(id),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE Follows(
    followers_id INT NOT NULL,
    followed_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (followers_id) REFERENCES Users(id),
    FOREIGN KEY (followed_id) REFERENCES Users(id),
    PRIMARY KEY (followed_id, followers_id)
);

CREATE TABLE Tags(
    id INT PRIMARY KEY AUTO_INCREMENT,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE Photo_Tags(
    photo_id INT NOT NULL,
    tag_id INT NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES Photos(id),
    FOREIGN KEY (tag_id) REFERENCES Tags(id),
    PRIMARY KEY (photo_id, tag_id)
);

