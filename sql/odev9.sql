-- Ödev 9 — dvdrental (INNER JOIN)


-- 1) city + country: şehir ve ülke isimleri
SELECT ci.city, co.country
FROM city AS ci
INNER JOIN country AS co
ON ci.country_id = co.country_id;


-- 2) payment + customer: payment_id + müşteri ad/soyad
SELECT p.payment_id, c.first_name, c.last_name
FROM payment AS p
INNER JOIN customer AS c
ON p.customer_id = c.customer_id;


-- 3) rental + customer: rental_id + müşteri ad/soyad
SELECT r.rental_id, c.first_name, c.last_name
FROM rental AS r
INNER JOIN customer AS c
ON r.customer_id = c.customer_id;
