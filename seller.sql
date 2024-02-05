CREATE Table seller(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (200) NOT NULL,
    email VARCHAR (200) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY email_unique (email),
    INDEX name_index(name)
);

INSERT INTO seller(name, email) VALUES ("lani", "lani@gmail.com");
INSERT INTO seller(name, email) VALUES ("mirna", "mirna@gmail.com");

SELECT name FROM seller WHERE name = "mirna";

ALTER Table seller add COLUMN toko VARCHAR(20) NOT NULL;

ALTER Table seller add index toko_index (toko);
ALTER Table seller DROP INDEX toko_index;

SELECT * FROM seller;

SHOW CREATE TABLE seller;