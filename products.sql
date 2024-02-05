CREATE Table
    products(
        id VARCHAR (10) NOT NULL,
        name VARCHAR (100) NOT NULL,
        deskripsi TEXT,
        price INT UNSIGNED NOT NULL,
        quantity INT UNSIGNED NOT NULL DEFAULT 0,
        create_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    ) engine = InnoDB;

DESC products;

-- menggunakan perintah INSERT
INSERT INTO
    products (id, name, price, quantity)
VALUES ("P001", "Mie Ayam", 10000, 10);

INSERT INTO
    products (
        id,
        name,
        deskripsi,
        price,
        quantity
    )
VALUES (
        "P002",
        "Ayam Goreng",
        "Makanan Ayam Enak",
        20000,
        40
    );

-- MEMASUKAN BANYAK DATA
INSERT INTO
    products (id, name, price, quantity)
VALUES ("P003", "Ikan Goreng", 1500, 10), (
        "P004",
        "Telur Goreng",
        5000,
        20
    ), ("P005", "Nasi Gorang", 2500, 40);

INSERT INTO
    products (id, name, price, quantity)
VALUES ("P006", "Ayam Bakar", 8000, 15), ("P007", "Mie Goreng", 3000, 25), ("P008", "Sate Ayam", 12000, 12), ("P009", "Nasi Kuning", 3500, 30), ("P010", "Tahu Goreng", 1000, 50), ("P011", "Capcay", 5000, 18), ("P012", "Soto Ayam", 7000, 22), (
        "P013",
        "Bakso Malang",
        9000,
        15
    ), ("P014", "Nasi Uduk", 4000, 35), ("P015", "Ketoprak", 6000, 20);

-- menampilakan banyak data bisa menggunakan *
SELECT * FROM products;

-- menampilkan beberapa data dan susunan sesuka kita
SELECT id, name, price, quantity FROM products;

-- digunakan untuk menambahkan PRIMARY key
ALTER Table products ADD PRIMARY KEY (id);

-- digunakan untuk menghapus primary key di TABLE
ALTER TABLE products drop PRIMARY key;

SELECT id, name, price, quantity FROM products WHERE quantity = 20;

SELECT id, name, price, quantity FROM products WHERE price = 20000;

ALTER Table products
add
    COLUMN catagory ENUM(
        "makanan",
        "minuman",
        "lain-lain"
    ) after name;


ALTER Table products MODIFY COLUMN catagory ENUM ('makanan', 'minuman', 'lain-lain');

-- perintah melakukan update
UPDATE products set catagory = "makanan" WHERE id = "P001";

UPDATE products set catagory = "makanan" WHERE id = "P004";
UPDATE products set catagory = "minuman" WHERE id = "P005";

UPDATE products
set
    catagory = "makanan",
    deskripsi = "ikan goreng sedap"
WHERE id = "P003";

UPDATE products set price = price + 5000 WHERE id = "P004";

-- kalau kita melakukan penghapusan data kita harus mengguankan FROM
DELETE from products WHERE id = 'P015';

-- menggunakan alias kolom dengan as
SELECT
    id as kode,
    name as "nama",
    catagory as katagory,
    deskripsi as detail,
    price as harga,
    quantity as jumlah
FROM products;

-- alias pada TABLE
SELECT
    p.id as kode,
    p.name as "nama",
    p.catagory as katagory,
    p.deskripsi as detail,
    p.price as harga,
    p.quantity as jumlah
FROM products as p;



SELECT id, name, quantity, price FROM products WHERE price <= 20000;
SELECT id, name, quantity, price FROM products WHERE price != 20000;

-- MENGGUNAKAN END
SELECT id, name, quantity, price FROM products WHERE price != 20000 AND price > 5000;

SELECT id, name, quantity, price FROM products WHERE quantity > 10 OR price > 5000;


-- menggunakan tanda kurung untuk memberikan proritas
SELECT id, name, quantity, price FROM products WHERE (quantity > 10 OR price > 5000) AND price > 5000;

--  menggunakan pencarian like
SELECT id, name, quantity, price from products WHERE name LIKE "%ayam";
SELECT id, name, quantity, price from products WHERE name LIKE "ayam%";
SELECT id, name, quantity, price from products WHERE name LIKE "%ayam%";


-- pencarian data menggunakan operator null dan not NULL

select * FROM products WHERE deskripsi is  NULL;
select * FROM products WHERE deskripsi is NOT NULL;


-- menggunakan operator BETWEEN
select * FROM products WHERE price BETWEEN 10000 AND 20000;

-- meggunakan operator IN
select * from products WHERE catagory IN ('minuman', 'makanan');



-- default ORDER BY itu ASC
SELECT * FROM products ORDER BY id DESC, price ASC;



SELECT * FROM products WHERE  price > 0 ORDER BY price LIMIT 2;

SELECT * FROM products WHERE  price > 0 ORDER BY price  DESC LIMIT 2, 2;

SELECT * FROM products LIMIT 4, 2;


-- mencari data yang tidak DUPLICATE menggunakan DISTINCT
SELECT DISTINCT price FROM products;


SELECT 100 * 2 as hasil;
SELECT 10000 / 2 as hasil;

select id,price, price div 100 as price_in_k FROM products;


-- FUNGSI MATEMATIKA
SELECT PI();
SELECT COS(100);
SELECT POWER(100, 2);
SELECT SIN(100);
SELECT TAN(100);




-- funtion STRING
SELECT id, name, UCASE(name) as "case" FROM products;
SELECT id, name, LOWER(name) as "Lower Name" FROM products; 
SELECT id, name, LENGTH(name) as "Lower Name" FROM products; 

SELECT id, name, TRIM(name)  as "trim" FROM products;

SELECT TRIM("    lani     ") as "trim";


-- FUNCTION waktu
SELECT id, name, create_at, EXTRACT(YEAR FROM create_at) as 'YEAR'
FROM products;
SELECT id, name, create_at, EXTRACT(MONTH FROM create_at) as 'MONT'
FROM products;

SELECT id, name, YEAR(create_at) FROM products;


-- Menggunakan cotrol case
SELECT id, catagory, 
-- colom untuk dijatikan kodisi
case catagory 
WHEN "makanan" THEN 'enak'
when "minuman" THEN 'segar'
else "apa itu"
END as "case" FROM products;

-- Menggunkan control IF
SELECT id, name, price, 
IF(price <= 10000, 'murah',
IF(price <= 20000, "mahal", "mahal bangat")) as "mahal" 
FROM products;


SELECT id, name, price, 
IF(price <= 5000, "murah",
IF(price <= 10000, "mahal", "mahal bangat")) as "definisi"
FROM products;


select id, name, deskripsi, 
IFNULL(deskripsi, "kosong") as "kosong" 
from products;


-- AGGREGATE FUNCTION
SELECT id, COUNT(id) as "Total Product" FROM products;
SELECT AVG(price) as "Harga Rata-rata" FROM products;
SELECT  MIN(price) as "Harga Termurah" FROM products;
SELECT  MAX(price) as "Harga Termahal" FROM products;


-- MENGGUNAKAN GROUP BY
SELECT id, catagory, COUNT(catagory) as Total 
FROM products GROUP BY catagory;

-- MENGGUNAKAN HAVING
SELECT id, name, catagory, COUNT(catagory) as total 
FROM products group BY catagory HAVING total >= 1;


-- constraint check menggunakan kondisi
ALTER Table products ADD constraint price_check check (price >= 1000);

INSERT INTO products (id, name, price) VALUES ("P015", 'nasi kunig', 1000);
INSERT INTO products (id, name, price) VALUES ("P015", 'nasi padang', 500);


-- DIGUNAKAN UNTUK PENCARIAN DATA 
ALTER Table products add fulltext product_search (name, deskripsi);

ALTER Table products DROP INDEX product_search;


-- melakukan pencarian data menggunakan natural laguge MODE
SELECT * FROM products WHERE
MATCH(name, deskripsi)
AGAINST("ayam" IN NATURAL LANGUAGE MODE);

-- melakukan pencarian data menggunakan boolehan MODE
SELECT * FROM products WHERE
MATCH(name, deskripsi)
AGAINST("+ayam -bakar -goreng" IN BOOLEAN MODE);

-- melakukan pencarian Query Expansion Mode
SELECT * FROM products WHERE
MATCH(name, deskripsi)
AGAINST("ayam" WITH QUERY EXPANSION);





SELECT * FROM products ;


SHOW CREATE TABLE products;


DESC products;

TRUNCATE products;



