

CREATE TABLE accounts (
    acc_id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

INSERT INTO accounts VALUES
(1, 'Ram', 5000),
(2, 'Sam', 7000),
(3, 'Tom', 6000);



-- 1. START TRANSACTION
START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE acc_id = 1;

UPDATE accounts
SET balance = balance + 1000
WHERE acc_id = 2;

-- Check before commit
SELECT * FROM accounts;


-- 2. COMMIT
COMMIT;



START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE acc_id = 2;

UPDATE accounts
SET balance = balance + 2000
WHERE acc_id = 3;

-- Undo changes
ROLLBACK;

SELECT * FROM accounts;



START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE acc_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 500
WHERE acc_id = 3;

-- Rollback to savepoint
ROLLBACK TO sp1;

COMMIT;