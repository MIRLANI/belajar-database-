CREATE Table wishlist(
    id INT NOT NULL AUTO_INCREMENT,
    id_product  VARCHAR (20) NOT NULL,
    deskripsi TEXT,
    PRIMARY KEY (id),
    constraint fk_wistlist_products Foreign Key (id_product) REFERENCES products(id)
);



ALTER TABLE wishlist DROP constraint fk_wistlist_products;

ALTER Table wishlist ADD constraint fk_wistlist_products 
Foreign Key (id_product) REFERENCES products(id);




-- ON DELETE CASCADE ON UPDATE CASCADE 
-- data tabel induk kalau di ubah makan data FOREIGN key akan iku berubah
-- itu kalau di hapus maka data akan kosong

ALTER Table wishlist ADD constraint fk_wistlist_products 
Foreign Key (id_product) REFERENCES products(id) on delete CASCADE on update CASCADE;



SHOW CREATE TABLE wishlist;

INSERT INTO wishlist(id_product, deskripsi, id_customer)
VALUES ("P013", "makan khas sombu", 1);

-- PRODUCTS
UPDATE products set id = "P016" WHERE id = "P015";

DELETE FROM products WHERE id = "P016";



-- MENGGUNAKAN INNER JOIN

SELECT * FROM wishlist INNER JOIN products ON(wishlist.id_product = products.id );
SELECT products.id, products.name, products.price, wishlist.deskripsi
FROM wishlist JOIN products ON(products.id = wishlist.id_product);

-- MENGGUNAKAN ALIAS
SELECT p.id, p.name, p.price, w.deskripsi
FROM wishlist as w JOIN products as p ON(p.id = w.id_product);


-- JOIN DENGAN 3 TABLE PRODUCTS, CUSTUMER, DAN WISHLIST
SELECT p.id, p.name, c.email, p.price, p.quantity, w.deskripsi  FROM wishlist as w 
JOIN products as p ON (p.id = w.id_product)
JOIN customer as c ON(c.id = w.id_customer);



ALTER TABLE wishlist ADD id_customer INT;

ALTER TABLE wishlist ADD constraint fk_wishlist_customer 
Foreign Key (id_customer) REFERENCES customer(id);











SHOW CREATE TABLE wishlist;

INSERT INTO customer (first_name, last_name, email)
VALUES ("mirlani", "lani pro", "pro@gmail.com");

DELETE FROM wishlist WHERE id = "3";

SELECT * FROM wishlist;
SELECT * FROM customer;


