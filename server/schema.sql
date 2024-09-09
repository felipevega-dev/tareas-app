CREATE DATABASE tareas_app;

USE tareas_app;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE todos (
   id INT AUTO_INCREMENT PRIMARY KEY,
   title VARCHAR(255) NOT NULL,
   completed BOOLEAN DEFAULT false,
   user_id INT NOT NULL,
   FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE 
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT NOT NULL,
    user_id INT NOT NULL,
    shared_with_id INT NOT NULL,
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert todos into the todos table
INSERT INTO todos (title, user_id) 
VALUES 
('Learn SQL', 1),
('Learn GraphQL', 1),
('Learn React', 2),
('Learn Node.js', 2),
('Learn TypeScript', 2),
('Learn Docker', 1),
('Learn Kubernetes', 1);



-- Insert two users into the users table
INSERT INTO users (name, email, password) VALUES ('Alice', 'alice@gmail.com|', 'password');
INSERT INTO users (name, email, password) VALUES ('Bob', 'bob@gmail.com', 'password');

-- share todo 1 of user 1 with user 2
INSERT INTO shared_todos (todo_id, user_id, shared_with_id) 
VALUES (1, 1, 2);

-- get todos including shared todos by id
SELECT * FROM todos, shared_todos 
WHERE todos.id = shared_todos.todo_id AND shared_todos.shared_with_id = 2;

