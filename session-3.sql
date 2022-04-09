SELECT name,composer
FROM tracks
WHERE Composer like "%Bach";

SELECT *
FROM albums
WHERE Title LIKE "%Greatest%";

SELECT *
FROM invoices
WHERE InvoiceDate LIKE "201_-02%";

SELECT * 
FROM customers 
WHERE FirstName 
LIKE "___";

SELECT FirstName,LastName,City
FROM customers
where LastName like"Sch%" OR LastName like "Go%";

SELECT FirstName,LastName,City
FROM customers
where LastName like"Sch%" OR LastName like "Go%";


/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu yazınız */

SELECT count(*)
FROM invoices;

SELECT count(DISTINCT Composer) AS composer_çeşitleri
FROM tracks;

SELECT count(DISTINCT Composer) AS composer_çeşitleri
FROM tracks;

SELECT count(*)        --NULL LARI NORMALDE SAYMAZ * KULLNMAN ŞART
FROM invoices
WHERE BillingState IS NULL;

SELECT * FROM tracks;

SELECT name as song_name,MIN(Milliseconds) / 1000.0 as min_duration
FROM tracks;

SELECT MIN(Grade),max(grade)
FROM students;

SELECT ROUND(sum(total),)
FROM invoices;

SELECT avg(total)
FROM invoices;


SELECT ROUND(avg(total),2) as avg_amount
FROM invoices;

SELECT AVG( Milliseconds)
FROM tracks;

SELECT name, Milliseconds
FROM tracks
WHERE Milliseconds>393599.22;


/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/

SELECT name,Milliseconds
from tracks
WHERE Milliseconds > (SELECT avg(Milliseconds) FROM tracks);

/*===================================================
 GROUP BY
====================================================*/

/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */

SELECT Composer,count(name)as sorgu
FROM tracks
WHERE Composer IS NOT NULL
GROUP BY Composer;

/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/

SELECT BillingCountry, avg(total)as avarage_bill
FROM invoices
WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011_12_31 00:00:00"
GROUP BY BillingCountry;








