PRAGMA foreign_keys = ON;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname INTEGER NOT NULL  

);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL, 
    body TEXT NOT NULL,
    associated_author INTEGER NOT NULL,

    FOREIGN KEY (associated_author) REFERENCES users(id)

);


CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),

    FOREIGN KEY(question_id) REFERENCES questions(id)



);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    parent_reply_id,
    associated_author INTEGER NOT NULL,
    reply_body TEXT NOT NULL,


    FOREIGN KEY(question_id) REFERENCES questions(id),
    FOREIGN KEY(associated_author) REFERENCES questions(associated_author)

);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(question_id) REFERENCES questions(id)


);


INSERT INTO 
    users (fname, lname)
VALUES 
    ('Elliot', 'Maine');
    -- ('Solo', 'Maine');

INSERT INTO 
    users (fname, lname)
VALUES 
    ('Solo', 'Maine');

INSERT INTO  
    questions(title, body, associated_author)
VALUES 
    ('Where are Scritch?', 'Hi Um More Scritch Where I get them?', (SELECT id FROM users WHERE fname = 'Elliot'));
    -- ('Tuna is important??', 'Hi yes would like to Submit a petition for more Tuna. It''s very important actually for a cat to have more TUNA.', (SELECT id FROM users WHERE fname = 'Solo'));

INSERT INTO 
    questions(title, body, associated_author)
VALUES 
    ('Tuna is important??', 'Hi yes would like to Submit a petition for more Tuna. It''s very important actually for a cat to have more TUNA.', (SELECT id FROM users WHERE fname = 'Solo'));