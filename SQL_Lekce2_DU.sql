--- Vytvořte SQL příkazy odpovídající níže uvedenému zadání.

--- 1)Vyberte prvních 5 výrobců (tabulka manufacturers) seřazených podle názvu abecedně vzestupně.

SELECT *
FROM manufacturers
ORDER BY manufacturer ASC
LIMIT 5;


--- 2) Zjistěte všechny produkty z kategorie Youth a seřaď je podle ceny (priceNew) sestupně.

SELECT *
FROM products
WHERE Category = 'Youth'
ORDER BY PriceNew DESC;


--- 3) Vyberte všechny prodeje uskutečněné v únoru a jejich tržba je mezi 1800 a 1900. Zobrazte jen sloupce productid, calendarid a tržba za jeden kus a vhodně je česky pojmenujte.

SELECT productid AS ID_Produktu, calendarid AS Kalendar, revenue AS Trzba
FROM sales 
WHERE revenue BETWEEN 1800 AND 1900
AND (calendarID LIKE '%-02-%');