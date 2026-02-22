/* Společná práce */
-- Vyber všechny produkty s productid menší nebo rovno 5.
-- Vyber všechny prodeje s tržbou v rozmezí hodnot 200 a 300
-- Vyber všechna města obsahující v názvu bos

/* Samostatná práce */
-- Vyber všechny sloupce tabulky Sales pro ProductID se rovná 1 a seřaď výsledky sestupně dle výše Revenue.
-- V předcházejícím dotazu omez výsledek na pouze 5 řádků.
-- Vyberte z tabulky Sales jen obchody za rok 2014.

/* Extra úkoly */
-- Vyberte všechny výrobce, kteří v názvu mají písmeno 'a' na druhé pozici a délka jejich názvu je přesně 5 znaků
-- Najděte všechny jedinečné názvy produktů v kategorii 'Rural'
-- Zjistěte jaká města jsou ve státě(state) 'NH' 

/* Společná práce */
-- Najděte všechny prodeje s tržbou větší než 300 z ledna 2013 nebo ledna 2014
-- Najděte všechny prodeje s tržbou větší než 300 a počtem prodaných kusů (units) rovno 10
-- Vyberte všechny produkty v kategoriích Mix a Rural
-- Vyberte všechny prodeje s nevyplněnou tržbou

/* Samostatná práce */
-- Najděte produkty s cenou mezi 300 a 400, které jsou v kategorii Mix
-- Jaká města jsou v Regionu 'East' a districtu	'District #10'

/* Extra úkol */
-- Zjistěte produkty, které jsou v kategorii 'Mix' nebo 'Youth' a v názvu obsahují 'UM'

/* Společná práce - agregační funkce */
-- Kolik jsme toho prodali za rok 2014 celkem?
-- Na kterém produktu jsme v roce 2014 vydělali nejvíce (na kterém ProductID) a kolik kusů (units) tohoto produktu jsme prodali?
-- Kolik máme produktů (ProductId) v kategorii Rural?
-- Vyberte všechny prodeje s nevyplněnou tržbou
-- Najdi všechny kategorie produktů, které obsahují méně neš 300 produktů.

SELECT *
FROM sales
WHERE revenue BETWEEN 200 AND 300
ORDER BY revenue DESC;

SELECT *
FROM sales
WHERE revenue >= 200 AND revenue <=300
ORDER BY revenue DESC;

SELECT *
FROM Cities
WHERE city LIKE '%bos%';

SELECT *
FROM cities
WHERE city LIKE 'Bos%';

SELECT *
FROM cities
WHERE city LIKE '____BOS%';

/* Samostatná práce */
-- Vyber všechny sloupce tabulky Sales pro ProductID se rovná 1 a seřaď výsledky sestupně dle výše Revenue.
-- V předcházejícím dotazu omez výsledek na pouze 5 řádků.
-- Vyberte z tabulky Sales jen obchody za rok 2014.


SELECT *
FROM sales
WHERE productid = '1' 
ORDER BY revenue DESC;

SELECT *
FROM sales
WHERE productid = '1' 
ORDER BY revenue DESC
LIMIT 5;

SELECT *
FROM sales
WHERE Calendarid LIKE '2014%';
/* nebo */
SELECT *
FROM sales
WHERE Calendarid LIKE '2014______';
/* nebo */
SELECT *
FROM sales
WHERE Calendarid >='2014-01-01' AND calendarid <='2014-12-31';
/* nebo */
SELECT *
FROM sales
WHERE SUBSTR(Calendarid, 1,4) = '2014';
/* substr(nazev sloupce ze ktereho se vychazi, poradi znaku v retezci, pocet zohlednenych znaku celkem) */

/* Extra úkoly */
-- Vyberte všechny výrobce, kteří v názvu mají písmeno 'a' na druhé pozici a délka jejich názvu je přesně 5 znaků
-- Najděte všechny jedinečné názvy produktů v kategorii 'Rural'
-- Zjistěte jaká města jsou ve státě(state) 'NH' 

SELECT *
FROM manufacturers
WHERE manufacturer LIKE '_a___';

SELECT DISTINCT category
FROM products
WHERE category = 'Rural';

SELECT *
FROM Cities
WHERE state LIKE '%NH%';


/* Společná práce */
-- Najděte všechny prodeje s tržbou větší než 300 z ledna 2013 nebo ledna 2014

SELECT  *
FROM sales
WHERE revenue > 300
AND Calendarid LIKE '2013-01%'
OR calendarid LIKE '2014-01%'
ORDER BY revenue DESC;

/* nebo */
SELECT  *
FROM sales
WHERE revenue > 300
AND (Calendarid LIKE '2013-01%' OR calendarid LIKE '2014-01%')
ORDER BY revenue DESC;

-- Najděte všechny prodeje s tržbou větší než 300 a počtem prodaných kusů (units) rovno 10
SELECT  *
FROM sales
WHERE revenue > 300
AND units = 10
ORDER BY revenue ASC;

-- Vyberte všechny produkty v kategoriích Mix a Rural
SELECT *
FROM products
WHERE category IN ('Mix', 'Rural');

-- Vyberte všechny prodeje s nevyplněnou tržbou
SELECT *
FROM sales
WHERE revenue IS NULL; 

SELECT productid, COALESCE (revenue, 0) AS Revenue_new
FROM sales
order by revenue ASC
LIMIT 10; 


/* Samostatná práce */
-- Najděte produkty s cenou mezi 300 a 400, které jsou v kategorii Mix
SELECT *
FROM products 
WHERE priceNew BETWEEN 300 AND 400
AND category IN ('Mix');
/* category = 'Mix' */

-- Jaká města jsou v Regionu 'East' a districtu	'District #10'
SELECT *
FROM Cities
WHERE region IS ('East') AND district IS ('District #10')

/* nebo */

SELECT *
FROM Cities
WHERE region ='East'
AND district ='District #10';

/* Extra úkol */
-- Zjistěte produkty, které jsou v kategorii 'Mix' nebo 'Youth' a v názvu obsahují 'UM'

SELECT *
FROM products 
where


/* Společná práce - agregační funkce */
-- Kolik jsme toho prodali za rok 2014 celkem?

SELECT SUM(revenue)
FROM sales
WHERE calendarid LIKE '2014%'


/* Společná práce - agregační funkce */
-- Kcelkové tržby v roce 2014 dle jednotlivých produktů?
SELECT productid, SUM(revenue)
FROM sales
WHERE calendarid LIKE '2014%'
GROUP BY productid;


-- Na kterém produktu jsme v roce 2014 vydělali nejvíce (na kterém ProductID) a kolik kusů (units) tohoto produktu jsme prodali?
-- Kolik máme produktů (ProductId) v kategorii Rural?
-- Vyberte všechny prodeje s nevyplněnou tržbou
-- Najdi všechny kategorie produktů, které obsahují méně neš 300 produktů.