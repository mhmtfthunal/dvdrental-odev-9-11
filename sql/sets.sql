-- Set Operasyonları — actor ve customer tabloları (first_name)


-- 1) Tüm first_name’ler (tekilleştirilmiş birleşim)
SELECT first_name FROM actor
UNION
SELECT first_name FROM customer
ORDER BY 1;


-- 2) Kesişim (iki tabloda da olan isimler)
SELECT first_name FROM actor
INTERSECT
SELECT first_name FROM customer
ORDER BY 1;


-- 3) Sadece ilk tabloda olup ikincide olmayanlar
SELECT first_name FROM actor
EXCEPT
SELECT first_name FROM customer
ORDER BY 1;


-- === ALL varyantları: tekrarları korur ===


-- 4) UNION ALL: iki tablodaki tüm satırlar (tekrarlar dahil)
SELECT first_name FROM actor
UNION ALL
SELECT first_name FROM customer
ORDER BY 1;


-- 5) INTERSECT ALL: her isim için iki tablodaki min(adet) kadar satır döner
SELECT first_name FROM actor
INTERSECT ALL
SELECT first_name FROM customer
ORDER BY 1;


-- 6) EXCEPT ALL: actor - customer, tekrar sayısını korur
SELECT first_name FROM actor
EXCEPT ALL
SELECT first_name FROM customer
ORDER BY 1;
