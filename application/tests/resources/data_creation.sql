CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    person_id INT NOT NULL,
    created_at DATETIME
);

INSERT INTO users (username, password, email, person_id, created_at) VALUES ("shelleylong1", MD5("qwertyuoip1!"), "shelleylong1@gmail.com", 1, NOW());
INSERT INTO users (username, password, email, person_id, created_at) VALUES ("georgewendt2", MD5("fbjweghjbj^334"), "georgewendt@gmail.com", 2, NOW());
INSERT INTO users (username, password, email, person_id, created_at) VALUES ("teddanson3", MD5("ghjEDFGNMDGB"), "TED@hotmail.com", 3, NOW());
INSERT INTO users (username, password, email, person_id, created_at) VALUES ("rheapearlman4", MD5("$hjrastghG"), "rp4@aol.com", 4, NOW());
INSERT INTO users (username, password, email, person_id, created_at) VALUES ("woodyharrelson5", MD5("$hjrastghG"), "woodyh@aol.com", 5, NOW());

CREATE TABLE persons (
    person_id INT PRIMARY KEY,
    title VARCHAR(3),
    first_name VARCHAR(10),
    second_name VARCHAR(20)
);

INSERT INTO persons (person_id, title, first_name, second_name) VALUES (1, "Mrs", "Shelley", "Long");
INSERT INTO persons (person_id, title, first_name, second_name) VALUES (2, "Mr", "George", "Wendt");
INSERT INTO persons (person_id, title, first_name, second_name) VALUES (3, "Mr", "Ted", "Danson");
INSERT INTO persons (person_id, title, first_name, second_name) VALUES (4, "Mrs", "Rhea", "Pearlman");
INSERT INTO persons (person_id, title, first_name, second_name) VALUES (5, "Mr", "Woody", "Harrelson");

CREATE TABLE action_types (
    action_type_id INT PRIMARY KEY,
    action_type_description VARCHAR(100)
);

INSERT INTO action_types (action_type_id, action_type_description) VALUES (1, "Logged In");
INSERT INTO action_types (action_type_id, action_type_description) VALUES (2, "Logged Out");
INSERT INTO action_types (action_type_id, action_type_description) VALUES (3, "Modified Password");
INSERT INTO action_types (action_type_id, action_type_description) VALUES (4, "Modified Email");
INSERT INTO action_types (action_type_id, action_type_description) VALUES (5, "Modified Username");

CREATE TABLE action_history (
    action_type_id INT,
    user_id INT,
    action_timestamp DATETIME
);

INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (1, 1, "2022-04-15 19:33:27");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (3, 1, "2022-04-15 19:36:59");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (2, 1, "2022-04-15 19:38:56");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (1, 2, "2022-04-15 22:48:20");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (4, 2, "2022-04-15 22:49:12");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (2, 2, "2022-04-15 23:01:19");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (1, 1, "2022-04-16 12:13:27");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (5, 1, "2022-04-16 12:19:31");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (2, 1, "2022-04-16 12:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (1, 5, "2022-04-17 12:13:27");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (5, 5, "2022-04-17 12:19:31");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (4, 5, "2022-04-17 12:19:31");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (2, 5, "2022-04-17 12:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (1, 5, "2022-04-17 13:13:27");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (3, 5, "2022-04-17 13:19:31");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (3, 5, "2022-04-17 13:19:31");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (2, 5, "2022-04-17 13:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (1, 4, "2022-04-18 13:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (3, 4, "2022-04-18 14:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (4, 4, "2022-04-18 15:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (5, 4, "2022-04-18 16:26:15");
INSERT INTO action_history (action_type_id, user_id, action_timestamp) VALUES (2, 4, "2022-04-19 13:26:15");