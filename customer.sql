CREATE Table
    customer (
        id INT NOT NULL AUTO_INCREMENT,
        email VARCHAR (50) NOT NULL,
        first_name VARCHAR (20) NOT NULL,
        last_name VARCHAR (20) NOT NULL,
        PRIMARY KEY(id),
        UNIQUE KEY email_unique (email)
    );



-- menghapus UNIQUE
ALTER Table customer DROP constraint email_unique;

-- menambahkan UNIQUE dan tidak boleh sama nama unique dalam satu tabel
ALTER Table customer add constraint UNIQUE email_unique (email);



INSERT INTO customer (email) VALUES ("lani@gmail.com");

-- fungsi dari UNIQUE itu untuk menjaga datanya tidak DUPLICATE
INSERT INTO customer (email) VALUES ("lani@gmail.com");

SELECT * FROM customer;

DESC customer;

SHOW CREATE TABLE customer;




