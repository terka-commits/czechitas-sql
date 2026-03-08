/* SPOLEČNÁ PRÁCE - INNER JOIN */
-- Najdi TOP 100 prodejů podle příjmů a k nim příslušné informace z tabulky Cities.
SELECT *
FROM sales AS s
INNER JOIN Cities AS c
ON s.Zip = c.Zip
ORDER BY revenue DESC
LIMIT 100;

SELECT s.calendarID, s.Revenue, c.State c.City
FROM sales AS s
INNER JOIN Cities AS c
ON s.Zip = c.Zip
ORDER BY revenue DESC
LIMIT 100;

-- Najdi prodeje pro město se zip 33906 a zjisti o jaké jde město

SELECT *
FROM Cities AS C
INNER JOIN sales AS s
ON c.zip = s.zip
WHERE c.zip = 33906;

SELECT *
FROM Cities AS C
INNER JOIN sales AS s
ON c.zip = s.zip
and s.zip = 33906;

-- Jaké jsou tržby přes jednotlivé regiony 

SELECT c.region, ROUND(SUM(s.Revenue),0) AS celkove_trzby
FROM sales AS s
INNER JOIN Cities AS c
ON s.zip = c.zip
GROUP BY c.region;

-- Najdi 5 nejúspěšnějších měst v počtu prodejů za první kvartál roku 2014. 

SELECT c.City, COUNT(productID) AS Pocet_prodeju
FROM sales AS s
INNER JOIN Cities AS c
ON c.zip = s.zip
WHERE s.calendarID >= '2014-01-01'
AND s.CalendarID <= '2014-03-31'
GROUP BY c.city
ORDER BY Pocet_prodeju DESC
LIMIT 5;
--- beetwen


/* SAMOSTATNÁ PRÁCE */
-- Ve kterých státech jsme vydělali nejvíce, celkové tržby zaokrouhlit na celé číslo

SELECT c.State, Round(SUM(s.revenue),0) AS Celkove_trzby
FROM Cities AS c
INNER JOIN sales AS s
ON c.zip = s.zip
GROUP BY c.State
ORDER BY s.revenue DESC;

-- Který výrobce vyrábí nejvíce různých výrobků?

SELECT m.manufacturer, COUNT(p.productID) AS Pocet_vyrobku
FROM manufacturers AS m
INNER JOIN products AS p
ON m.ManufacturerID = p.ManufacturerID
GROUP BY m.manufacturer
ORDER BY Pocet_vyrobku DESC;

SELECT m.manufacturer, COUNT(p.productID) AS Pocet_vyrobku, COUNT(DISTINCT p.ProductID) AS Unik_pocet_produktu
FROM manufacturers AS m
INNER JOIN products AS p
ON m.ManufacturerID = p.ManufacturerID
GROUP BY m.manufacturer
ORDER BY Pocet_vyrobku DESC;


/* EXTRA ÚKOL */
--Jaká je minimální, průměrná a maximální cena produktů dle kategorie?
--Zajímají nás produkty výrobců, jejichž název začíná na P.
--Ceny zaokrouhli na 1 desetinné místo a výsledky seřaď podle průměrné ceny.

SELECT p.category,
ROUND(MIN(p.PriceNew),1) AS minimum,
ROUND(AVG(p.PriceNew),1) AS prumer,
ROUND(MAX(p.PriceNew),1) AS maximum
FROM products AS p
INNER JOIN manufacturers AS m
ON p.ManufacturerID = m.ManufacturerID
WHERE m.Manufacturer LIKE 'P%'
GROUP BY p.Category
ORDER BY prumer;



/* SPOLEČNÁ PRÁCE - LEFT JOIN */
-- Kolik různorodých produktů se prodalo v každém z měst? Zobraz i města, kde se neprodal žádný výrobek.

SELECT c.city, COUNT(DISTINCT s.productID) AS Pocet
FROM Cities AS C
LEFT JOIN sales AS S
ON c.zip = s.zip
GROUP BY c.city
ORDER BY Pocet DESC;

---neni primarni klic, je cizi, produkty musi byt unikatni

-- Najdi prodeje pro město se zip 33906 a zjisti o jaké jde mesto

SELECT *
FROM Cities AS C
LEFT JOIN sales AS s
ON c.zip = s.zip
and s.zip = 33906
ORDER BY revenue DESC;


SELECT *
FROM Cities AS C
LEFT JOIN sales AS s
ON c.zip = s.zip
where s.zip = 33906
ORDER BY revenue DESC;

-- Kolik různorodých produktů se nikdy neprodalo?

SELECT COUNT(p.ProductID) 
FROM products AS p
LEFT JOIN sales AS s
ON p.ProductID = s.ProductID
WHERE s.ProductID IS NULL;

-- Spočti celkové tržby pro region za měsíc duben 2014.

SELECT *
FROM Cities AS c
LEFT JOIN sales AS s
ON c.Zip = s.zip
AND CalendarID LIKE '2014-04%'
GROUP BY c.region;


/* SAMOSTATNÁ PRÁCE */
-- Najděte v jednotlivých kategoriích počty výrobků, které se nikdy nepodařilo prodat.

SELECT p.category, Count(p.productID) AS Pocty_neprodanych_vyrobku
FROM products AS p
LEFT JOIN sales AS s
ON p.productID = s.ProductID
WHERE s.productID IS NULL
GROUP BY p.category;


-- Jaká byla výše tržeb v roce 2015 v rozpadu na měsíce? Zajímají nás všechny měsíce (i ty, kde nenastaly žádné tržby).

SELECT monthname, SUM(s.revenue) AS Trzby
FROM calendar AS c 
LEFT JOIN sales AS s
ON c.CalendarID = s.calendarID
AND s.CalendarID LIKE '2015%'
GROUP BY monthname 
ORDER BY monthname;



