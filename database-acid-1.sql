
CREATE DATABASE belajar_acid;

use belajar_acid;

CREATE TABLE accounts(
    id VARCHAR (200) NOT NULL PRIMARY KEY,
    name VARCHAR (200) NOT NULL,
    balace BIGINT NOT NULL
);



SET autocommit=0;

START TRANSACTION;

INSERT INTO accounts(id, name, balace) 
VALUES ("lani", "mirlani", 1000000)

INSERT INTO accounts(id, name, balace) 
VALUES ("arman", "arman pro", 2000000);

COMMIT;




START TRANSACTION;

DELETE FROM accounts WHERE id = "lani";
DELETE FROM accounts WHERE id = "arman";

ROLLBACK;





-- konsitensi data 

START TRANSACTION;

UPDATE accounts SET name = null 
WHERE id = "lani";
COMMIT;




SELECT * FROM accounts;


