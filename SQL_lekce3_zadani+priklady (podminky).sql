/* Společná práce */
/* Z MINULÉ LEKCE */
-- Na kterém produktu jsme v roce 2014 vydělali nejvíce (na kterém ProductID) a kolik kusů (units) tohoto produktu jsme prodali?
-- Kolik máme produktů (ProductId) v kategorii Rural?
-- Najdi všechny kategorie produktů, které obsahují méně neš 300 produktů.

SELECT productid AS Produkt, Round(SUM(revenue),0) AS Trzby, SUM(units) AS Celkem_kusu
FROM sales 
WHERE calendarid LIKE '2014-__-__'
AND revenue IS NOT NULL 
GROUP BY Produkt
ORDER BY Trzby DESC; 

SELECT COUNT(productid) AS Produkt
FROM products 
WHERE category IS 'Rural';

SELECT category, COUNT(productid) AS Pocet
FROM products
GROUP BY category
HAVING pocet < 300;


/* 3. LEKCE */
-- Kolik máme produktů (ProductId) v kategorii Mix? Výsledný sloupec přejmenuj na ‚ProductCount‘.
-- Jaká je minimální a maximální cena produktů dle výrobce. Zajímají nás pouze produkty v kategorii Rural a segment Productivity
-- Kolik měsíců mám v každém roce
-- Určete tržby podle roku a měsíce a seřaďte od největší tržby
-- Počet prodejů z tabulky sales – funkce count (null v agregačních funkcích)

SELECT COUNT(productid) AS ProductCount
FROM products 
WHERE category IS 'Mix';

SELECT manufacturerid, MIN(pricenew) AS Minimalni_cena, MAX(pricenew) AS Maximalni_cena
FROM products 
WHERE category IS 'Rural' AND segment IS 'Productivity'
GROUP BY manufacturerid
ORDER BY Maximalni_cena DESC;

SELECT YEAR AS Rok, COUNT(distinct monthname) AS Pocet_mesicu
FROM Calendar
GROUP BY Rok;

SELECT substr(calendarid, 1,7) AS Rok_mesic, Round(SUM(revenue),0) AS Celkem
FROM sales 
GROUP BY calendarid
order BY celkem DESC;

SELECT COUNT(*)
FROM sales
WHERE revenue IS NOT NULL;


/* Samostatná práce */
-- Kolik měst je v tabulce Cities
SELECT COUNT(city) AS Pocet_zaznamu, COUNT (DISTINCT city) AS Pocet_zaznamu_unik
FROM Cities;
-- Kolik měst je v jednotlivých Regionech
SELECT region, COUNT(city), COUNT (DISTINCT city) AS Pocet_zaznamu_unik
FROM Cities
GROUP BY region;
-- Zjistěte počet výrobků (productID) podle výrobců (ManufacturerID)
SELECT manufacturerid, COUNT(productid) AS Pocet, COUNT(DISTINCT productid) AS Pocet_unik
FROM products 
GROUP BY manufacturerid;


/* Úkol navíc */
-- Kterých 10 výrobců má nejvíce jedinečných (různorodých) kategorií výrobků?



/* Společná práce */
-- Jaký je vývoj prodejů výrobků s productID začínající na 49 v čase po měsících?
SELECT SUBSTR(calendarid, 1,2) AS Rok, SUBSTR(calendarid, 6, 2) AS Mesic, COUNT(*)
FROM sales
WHERE productID LIKE '49%'
GROUP BY Rok, Mesic;

-- V lednu 2015 zjistěte rozpad prodejů po jednotlivých productID.
SELECT productid, COUNT(*) AS Pocet
FROM sales
WHERE calendarid >= '2015-01-01' 
AND calendarid <= '2015-01-31'
GROUP BY productid
ORDER BY pocet DESC; 

-- Co se stane, když zapomenu groupovat podle nějakého sloupce
-- Najdi všechny kategorie produktů, které obsahují více než 300 produktů.
SELECT category, COUNT(productid) AS Pocet
FROM products
GROUP BY category
HAVING pocet > 300;

-- Uvedený dotaz uprav, tak že budeš zahrnovat jen produkty obsahující v názvu ‘Ab’. 
SELECT category, COUNT(productid) AS Pocet
FROM products
WHERE product LIKE '%AB%'
GROUP BY category 
HAVING pocet > 40;

-- Zjisti jaké regiony a státy mají více než 1000 měst, zajímají nás různé názvy měst (city)
SELECT region, state, COUNT(DISTINCT city) AS Pocet_mest
FROM Cities 
GROUP BY region, STATE
HAVING Pocet_mest > 1000
ORDER BY Pocet_mest DESC;

/* Samostatná práce */
-- Jaká je průměrná cena za kategorii? Zajímají nás pouze ceny větší jak 0 a kategorie Mix a Urban.
SELECT category, Round(AVG(PriceNew),0) AS Prumerna_cena_za_kategorii
FROM products 
WHERE category IN ('Mix','Urban')
AND PriceNew > 0
GROUP BY category;


-- Zjisti rok a jméno měsíce, kdy rok je mezi 2013 a 2015 a měsíc začíná na písmeno 'J' nebo obsahuje písmeno 'a'.   
SELECT year, monthname
FROM Calendar
WHERE YEAR between 2013 AND 2015
AND monthname LIKE 'J%' OR monthname like'%a%';

/* Úkol navíc */
-- Najděte všechny produkty (productid), které byly vždy prodány za stejnou tržbu a počet prodejů je větší než 4 
SELECT productid, COUNT(
FROM products
GROUP BY product

/* Společná práce - INNER JOIN */
-- Najdi TOP 100 prodejů podle příjmů a k nim příslušné informace z tabulky Cities.
-- Najdi prodeje pro město se zip 33906 a zjisti o jaké jde město