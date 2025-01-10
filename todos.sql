-- 1. Users Table: Stores user information.

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(100) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Todos Table: Stores todo items with a foreign key linking to the Users table.

CREATE TABLE Todos (
    TodoID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT NOT NULL,
    TaskText VARCHAR(255) NOT NULL,
    IsCompleted BOOLEAN DEFAULT FALSE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);




-- 3. Register a New User

INSERT INTO Users (Username, Email, Passwor) 
VALUES ('Fahim', 'fahim@gmail.com', '12345678');


-- 4. Add a New Todo Item

INSERT INTO Todos (UserID, TaskText) 
VALUES (1, 'Complete the todo app');

-- 5. Fetch All Todos for a Specific User

SELECT TodoID, TaskText, IsCompleted, CreatedAt 
FROM Todos 
WHERE UserID = 1 
ORDER BY CreatedAt DESC;

-- 6. Mark a Todo as Completed

UPDATE Todos 
SET IsCompleted = TRUE 
WHERE TodoID = 1 AND UserID = 1;

-- 7. Edit a Todo

UPDATE Todos 
SET TaskText = 'Complete the updated todo app' 
WHERE TodoID = 1 AND UserID = 1;


-- 8. Delete a Todo

DELETE FROM Todos 
WHERE TodoID = 1 AND UserID = 1;

-- 9. Delete a User and All Their Todos

DELETE FROM Users 
WHERE UserID = 1;


