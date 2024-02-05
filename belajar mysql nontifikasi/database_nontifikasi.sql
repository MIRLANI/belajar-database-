
CREATE DATABASE belajar_mysql_nontification;

use belajar_mysql_nontification;

SHOW TABLEs;


-- users
CREATE Table users(
    id VARCHAR (200) NOT NULL,
    name VARCHAR (200) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO users(id, name) VALUES ("lani", "mirlani");

INSERT INTO users(id, name) VALUES ("arman", "arman maulana");

SELECT * FROM users;

-- nontification
CREATE TABLE nontification(
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR (200) NOT NULL,
    detail TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    user_id VARCHAR (200),
    PRIMARY KEY (id)
);

ALTER TABLE nontification ADD constraint fk_nontification_users
FOREIGN KEY (user_id) REFERENCES users(id);


INSERT INTO nontification (title, detail, created_at, user_id)
VALUES ("contoh pesanan", "detail pesanan", CURRENT_TIMESTAMP(), "lani");

INSERT INTO nontification (title, detail, created_at, user_id)
VALUES ("contoh promo", "detail promo", CURRENT_TIMESTAMP(), NULL);

INSERT INTO nontification (title, detail, created_at, user_id)
VALUES ("contoh pembayaran", "detail pembayaran", CURRENT_TIMESTAMP(), "arman");



-- menampilkan datanya
SELECT * FROM nontification WHERE (user_id = "lani" OR user_id IS NULL) ORDER BY user_id ASC;
SELECT * FROM nontification WHERE (user_id = "arman" OR user_id IS NULL) ORDER BY user_id ASC;



SHOW CREATE TABLE nontification;

SELECT * FROM nontification;


-- catagory
CREATE Table catagory(
    id VARCHAR (200) NOT NULL,
    name VARCHAR (200) NOT NULL,
    PRIMARY KEY (id)
);

SHOW TABLEs;

ALTER Table nontification add COLUMN catagory_id VARCHAR(200);

DESCRIBE nontification;

ALTER Table nontification add constraint fk_nontification_catagory 
FOREIGN KEY (catagory_id) REFERENCES catagory(id);

SELECT * FROM nontification;


SELECT * FROM catagory;

INSERT INTO catagory (id, name)
VALUES ("INFO", "Info");

INSERT INTO catagory (id, name)
VALUES ("PROMO", "Promo");


UPDATE nontification  SET catagory_id = "INFO" WHERE id = 1;
UPDATE nontification  SET catagory_id = "PROMO" WHERE id = 2;
UPDATE nontification  SET catagory_id = "INFO" WHERE id = 3;


SELECT * FROM nontification;


SELECT * FROM nontification WHERE (user_id = "lani" OR user_id IS NULL) ORDER BY user_id ASC;

-- cara menampilakan data table nontification yang ada promonya dan infonya yang sudah join dengan tabel catagory
SELECT * FROM nontification n JOIN catagory  c ON (n.catagory_id = c.id)
WHERE (n.user_id = "lani" OR n.user_id IS NULL) ORDER BY user_id ASC;

SELECT * FROM nontification n JOIN catagory  c ON (n.catagory_id = c.id)
WHERE (n.user_id = "arman" OR n.user_id IS NULL) ORDER BY user_id ASC;



-- NontificationRed
CREATE Table nontification_read(
    id INT  NOT NULL AUTO_INCREMENT,
    is_read BOOLEAN NOT NULL,
    nontification_id INT NOT NULL,
    user_id VARCHAR(200) NOT NULL,
    PRIMARY KEY(id) 
);

SHOW TABLEs;

DESC nontification_read;

ALTER Table nontification_read
add constraint fk_nontification_read_nontification
Foreign Key (nontification_id) REFERENCES nontification(id);

ALTER Table nontification_read
add constraint fk_nontification_read_user
Foreign Key (user_id) REFERENCES users(id);


INSERT INTO nontification_read (is_read, nontification_id, user_id)
VALUES (true, 2, "lani");
INSERT INTO nontification_read (is_read, nontification_id, user_id)
VALUES (true, 2, "lani");

INSERT INTO nontification_read (is_read, nontification_id, user_id)
VALUES (true, 2, "arman");



-- untuk menampilakan nontifikasi yang read dan non read
SELECT * FROM nontification n 
    JOIN catagory c ON (n.catagory_id = c.id)
    LEFT JOIN nontification_read nr ON (nr.nontification_id = n.id)
WHERE  (n.user_id = "lani" OR n.user_id IS NULL ) 
AND (nr.user_id = "lani" OR nr.user_id IS NULL )
ORDER BY nr.user_id ASC;


-- kita pastikan masukan datanya nontification apakah sudah berhasil
INSERT INTO nontification(title, detail, created_at, catagory_id, user_id)
VALUES ("contoh pesanan lagi", "detail pesanan", CURRENT_TIMESTAMP(), "INFO", "lani");
-- kita pastikan masukan datanya nontification apakah sudah berhasil
INSERT INTO nontification(title, detail, created_at, catagory_id, user_id)
VALUES ("contoh promo lagi", "detail promo", CURRENT_TIMESTAMP(), "PROMO", NULL);





-- COUNTER
SELECT COUNT(*) FROM nontification n 
    JOIN catagory c ON (n.catagory_id = c.id)
    LEFT JOIN nontification_read nr ON (nr.nontification_id = n.id)
WHERE  (n.user_id = "lani" OR n.user_id IS NULL ) 
AND ( nr.user_id IS NULL )
ORDER BY nr.user_id ASC;


INSERT INTO nontification_read (is_read, nontification_id, user_id)
VALUES (true, 1, "lani");
INSERT INTO nontification_read (is_read, nontification_id, user_id)
VALUES (true, 5, "lani");
INSERT INTO nontification_read (is_read, nontification_id, user_id)
VALUES (true, 4, "lani");




SELECT * FROM nontification_read;
SELECT * FROM nontification;



