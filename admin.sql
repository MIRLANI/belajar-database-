CREATE TABLE
    admin(
        id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR (100) NOT NULL,
        last_name VARCHAR (100) NOT NULL
    ) engine = innodb;

INSERT INTO
    admin(first_name, last_name)
VALUES 
('mirlani', "pro"),
('arman', "maulan"),
('mirna', "wati");

INSERT INTO admin (first_name, last_name) VALUES
('lani', 'pro');



-- untuk mendapatkan id terakhir dibuat
SELECT LAST_INSERT_ID(5);




DELETE FROM admin WHERE id = 1;


DESC admin;

SELECT * FROM admin;

DROP Table admin;