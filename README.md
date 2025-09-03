# dvdrental-odev-9-11

Bu repo; PostgreSQL **dvdrental** veritabanı üzerinde **Ödev 9 (INNER JOIN)**, **Ödev 10 (LEFT/RIGHT/FULL JOIN)** ve **Set Operasyonları (UNION/INTERSECT/EXCEPT)** için SQL dosyalarını ve kullanımını içerir.

```
.
├─ README.md
└─ sql/
   ├─ odev9.sql            ← INNER JOIN çözümleri
   ├─ odev10.sql           ← LEFT/RIGHT/FULL JOIN çözümleri
   └─ sets.sql             ← UNION / INTERSECT / EXCEPT (ALL’lı versiyonlar dahil)
```

---


### Gereksinimler

* PostgreSQL 12+ (öneri: 14/15/16/17)
* dvdrental örnek veritabanı kurulu olmalı

### Notlar

* `\d city`, `\d country`, `\d customer`, `\d payment`, `\d rental`, `\d actor` komutlarıyla tablo şemalarına bakabilirsin.
* `FULL JOIN` PostgreSQL’de yerel olarak desteklenir.
* Set operatörlerinde `UNION/INTERSECT/EXCEPT` **tekilleştirir**, `UNION ALL / INTERSECT ALL / EXCEPT ALL` **tekrarları korur**.

---

## sql/odev9.sql — INNER JOIN’ler

```sql
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
```

---

## sql/odev10.sql — LEFT / RIGHT / FULL JOIN’ler

```sql
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
```

---

## sql/sets.sql — Set Operasyonları (UNION/INTERSECT/EXCEPT)

```sql
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
```
