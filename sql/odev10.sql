-- Ödev 10 — dvdrental (LEFT/RIGHT/FULL JOIN)


-- 1) LEFT JOIN: tüm şehirler + eşleşen ülke adı
SELECT ci.city, co.country
FROM city AS ci
LEFT JOIN country AS co
ON ci.country_id = co.country_id;


-- 2) RIGHT JOIN: tüm müşteriler + varsa ödeme kaydı
SELECT p.payment_id, c.first_name, c.last_name
FROM payment AS p
RIGHT JOIN customer AS c
ON p.customer_id = c.customer_id;


-- 3) FULL JOIN: her iki taraftan da eşleşmeyenler dahil
SELECT r.rental_id, c.first_name, c.last_name
FROM rental AS r
FULL JOIN customer AS c
ON r.customer_id = c.customer_id;
