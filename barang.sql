
-- membuat table barang

CREATE Table barang(
    kode INT,
    name VARCHAR(200),
    harga INT,
    jumlah INT
)ENGINE = innoDB;

SHOW TABLES;


-- DESCRIBE dan DESC itu sama saja fungsinya
DESCRIBE barang;

DESC barang;


-- kalau show create table nama tablenya itu lebih detail lagi 
SHOW CREATE TABLE barang;


-- untuk mengubah nama table kita bisa menggunakan perintah ALTER

-- perintah untuk menambahkan kolom di table  first untuk menjadikan yang pertama
ALTER Table barang ADD COLUMN contoh VARCHAR(200) first;


-- perintah untuk menghapus kolom di table
ALTER Table barang DROP COLUMN contoh;

-- modify tipe data yang ada di colom  
ALTER table barang MODIFY harga VARCHAR (10)  after jumlah;


SELECT * FROM barang;

insert into barang (kode, name) VALUES (123, 'lani');

TRUNCATE TABLE barang;

DELETE FROM barang;


DROP Table barang;