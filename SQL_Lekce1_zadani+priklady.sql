/* Představení prostředí */

/* SPOLEČNÁ PRÁCE */
-- Vyber všechny sloupce z tabulky sales
-- Vyber všechny sloupce z tabulky manufacturers
-- přejmenování sloupců ve výsledné sadě
-- Vyber jedinečné měsíce a roky z tabulky Calender a sloupce přejmenuj
-- Vyber jedinečné výrobce z tabulky Manufacturers a zobraz prvních 5 záznamů

/* SAMOSTATNÁ PRÁCE */
-- Z tabulky Products vypiš sloupce ProductID, Product, Category a Segment a vhodně je přejmenuj.
-- Vyber jedinečné Regiony z tabulky Cities (aby tam žádný region nebyl dvakrát) a zobraz pouze první záznam.
-- Najděte všechny kategorie produktů z tabulky Products.

SELECT *
FROM sales;

SELECT *
FROM manufacturers;

SELECT manufacturerid AS ID_vyrobce, manufacturer AS Výrobce, Logo AS "značka výrobce"
FROM manufacturers;

SELECT DISTINCT
year AS Rok,
monthname AS Mesic
FROM Calendar;

SELECT DISTINCT manufacturer AS Vyrobce
FROM manufacturers
LIMIT 5;

SELECT ProductID AS ID_Produktu, Product AS Produkt, Category AS Kategorie, Segment AS Oblast
FROM products;

SELECT DISTINCT 
Region AS Regiony
FROM Cities
LIMIT 1;

SELECT DISTINCT 
category AS Kategorie
FROM products;

SELECT *
from products
WHERE productid <= 5;