Vytvořte SQL příkazy odpovídající níže uvedenému zadání:

1) Kdy se prodalo nejvíce výrobků (Units) a jaké to byly produkty (Product)?

SELECT s.calendarID, SUM(s.units) AS soucet, p.product AS Produkty
FROM sales AS s
LEFT JOIN products AS p
ON s.productID = p.productID
GROUP BY s.productID, s.calendarID
ORDER BY soucet DESC;


2) Jaké byly tržby v jednotlivých státech? Zajímají nás pouze města začínající na 'Bos'.

SELECT round(sum(s.revenue), 2) AS Trzby, c.state AS Staty, GROUP_CONCAT(c.city) AS Mesta
FROM sales AS s
LEFT JOIN Cities AS c ON s.zip = c.zip
WHERE c.city LIKE 'Bos%'
GROUP BY c.State
ORDER BY Trzby DESC;


3) Jaký počet produktů mají výrobci v katerogii Mix? Zajímají nás i výrobci, kteří pro kategorii Mix nic nevyrábí.

SELECT COUNT(p.productID) AS Pocet_produktu, m.Manufacturer, p.category
FROM manufacturers AS m 
LEFT JOIN products AS p 
ON p.ManufacturerID = m.ManufacturerID
AND p.category = 'Mix'
GROUP BY m.manufacturerID;