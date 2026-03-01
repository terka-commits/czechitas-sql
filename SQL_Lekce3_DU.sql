Vytvořte SQL příkazy odpovídající níže uvedenému zadání.

1) Ve kterém segmentu je nejvíce produktů?


SELECT segment, COUNT(product) AS Pocet_produktu
FROM products
GROUP BY segment
ORDER BY Pocet_produktu DESC 
LIMIT 1;


2) Vytvoř přehled jaké segmenty jsou zastoupeny v jednotlivých kategoriích, kolik výrobků obsahují a jaká je průměrná cena výrobků v tomto členění?

SELECT category, segment, count(product) AS Pocet_Vyrobku, Round(AVG(PriceNew), 2) AS Prumerna_cena_vyrobku
FROM products 
GROUP BY category, segment;


3) Kterých výrobků (productid) se prodalo nejvíce v dubnu 2015? (zajímají nás kusy - units)

SELECT productid, SUM(Units) AS Pocet_kusu
FROM sales
WHERE CalendarID LIKE '2015-04-%'
GROUP BY productid
ORDER by Pocet_kusu desc;