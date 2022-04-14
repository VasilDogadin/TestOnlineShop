
CREATE TABLE buyers(
	buyer_id INT NOT NULL,
	buyer_name VARCHAR(100) NOT NULL,
	birthday DATE NOT NULL
);

CREATE TABLE orders(
	order_id INT NOT NULL,
	buyer_id INT NOT NULL,
	order_number INT NOT NULL,
	order_date DATE NOT NULL,
	order_summa MONEY NOT NULL
);

CREATE TABLE product_types(
	type_id INT NOT NULL,
	name VARCHAR(100) NOT NULL
);

CREATE TABLE products(
	product_id INT NOT NULL,
	product_name VARCHAR(100) NOT NULL,
	description VARCHAR(200) NULL,
	price MONEY NULL,
	type_id INT NOT NULL
);

CREATE TABLE orders_products(
	order_id INT NOT NULL,
	product_id INT NOT NULL
);


INSERT INTO buyers (buyer_id, buyer_name, birthday)
	VALUES (753, 'Зайцев А.Е.', '1998.04.12'),
		   (832, 'Иванов И.И.', '1993.07.16'),
		   (991, 'Попова Е.В.', '2001.10.28'),
		   (1028, 'John Smith', '2000.05.03'),
		   (1109, 'Сергеев А.С.', '1986.10.12'),
		   (1177, 'Петров С.Л.', '2003.06.11'),
		   (1201, 'Андреев В.А.', '1980.09.27');
		   
INSERT INTO orders (order_id, buyer_id, order_number, order_date, order_summa)
	VALUES (1459, 1201, 151, '2020.04.02', 12750),
		   (1567, 991, 259, '2020.04.17', 6700),
		   (1615, 832, 307, '2020.05.02', 21440),
		   (1646, 1109, 338, '2020.05.07', 15540),
		   (1660, 1201, 352, '2020.05.16', 2100),
		   (1708, 832, 400, '2020.05.21', 6700),
		   (1718, 1028, 410, '2020.05.21', 12300),
		   (1893, 832, 115, '2020.06.11', 4600),
		   (1923, 1109, 85, '2020.06.29', 23990),
		   (1959, 1201, 151, '2020.07.02', 1300),
		   (2052, 832, 244, '2020.07.30', 7900),
		   (2057, 991, 249, '2020.07.30', 16900),
		   (2106, 753, 298, '2020.08.08', 900),
		   (2146, 1201, 338, '2020.08.15', 2200),
		   (2181, 832, 373, '2020.08.23', 16740);

INSERT INTO product_types (type_id, name)
	VALUES (1, 'Физический'),
		   (2, 'Цифровой');

INSERT INTO products (product_id, product_name, description, price, type_id)
	VALUES (16, 'Процессор V5', '4-ядерный процессор, 3600 МГц', 12300, 1),
		   (29, 'Материнская плата R7Q', '2 слота DDR4, 1 слот PCI-E', 4600, 1),
		   (38, 'Клавиатура S939', 'Проводная, интерфейс USB', 1300, 1),
		   (47, 'Мышь N56', 'USB', 900, 1),
		   (60, 'Материнская плата ES20', '4 слота DDR4, 2 слота PCI-E', 6700, 1),
		   (71, 'Принтер 3075', 'Лазерный, 20 стр/мин (A4), USB', 3500, 1),
		   (83, 'Кулер для процессора D17', NULL, 450, 1),
		   (96, 'Процессор V7', '6-ядерный процессор, 3700 МГц', 15540, 1),
		   (108, 'Антивирусная программа', NULL, 1200, 2),
		   (125, 'Операционная система', NULL, 6700, 2);
		   
INSERT INTO orders_products (order_id, product_id)
	VALUES (1459, 16), (1459, 83), (1567, 125), (1615, 29),
		   (1615, 96), (1615, 38), (1646, 96), (1660, 108),
		   (1660, 47), (1708, 60), (1718, 16), (1893, 29),
		   (1923, 60), (1923, 83), (1923, 96), (1923, 38),
		   (1959, 38), (2052, 108), (2052, 125), (2057, 16),
		   (2057, 29), (2106, 47), (2146, 38), (2146, 47),
		   (2181, 108), (2181, 96);


SELECT product_name, price
FROM products;

SELECT product_id, product_name, description, price, TYPE_ID
FROM products;

SELECT buyer_name, birthday
FROM buyers;

SELECT order_number, order_date, order_summa
FROM orders;

SELECT type_id, name
FROM product_types;

SELECT product_id, product_name 
FROM TestDB3.dbo.products;

SELECT buyer_id, buyer_name 
FROM TestDB3.dbo.buyers;


SELECT G.productId as id,
       G.ProductName as [Имя],
	   G.Price as [Цена]
FROM goods AS G;

SELECT O.order_number,
	   O.order_summa
FROM orders as O;

SELECT product_name, price, price * (100+10)/100 as price_new
FROM products;


 SELECT G.ProductName,
        C.CategoryName,
		G.Price
 FROM goods as G
 INNER JOIN Categories as C ON G.Category = C.CategoryId;

  SELECT G.ProductName,
        C.CategoryName,
		G.Price
 FROM goods as G
 LEFT JOIN Categories as C ON G.Category = C.CategoryId;

  SELECT G.ProductName,
        C.CategoryName,
		G.Price
 FROM goods as G
 RIGHT JOIN Categories as C ON G.Category = C.CategoryId;

   SELECT G.ProductName,
        C.CategoryName,
		G.Price
 FROM goods as G
 FULL JOIN Categories as C ON G.Category = C.CategoryId;

    SELECT G.ProductName,
        C.CategoryName,
		G.Price
 FROM goods as G
 CROSS JOIN Categories as C;



--Задача 1
 SELECT P.product_name,
        P.Price,
		T.name as type_name
 FROM products as P
 inner JOIN product_types as T on P.type_id = T.type_id; 

 --Задача 2
SELECT O.order_number,
       O.order_date,
	   P.product_name,
	   P.price
FROM orders as O 
LEFT JOIN orders_products as OP on OP.order_id = O.order_id 
LEFT JOIN products as P on P.product_id = OP.product_id;

--Задача 3
SELECT B.buyer_name,
       O.order_date
FROM buyers AS B
FULL JOIN orders AS O ON B.buyer_id = O.buyer_id;



--Задача 1.
select p.product_name, 
       p.price
from products as p
inner join product_types as pt on pt.type_id = p.type_id
where pt.type_id = 2;

--Задача 2.
select buyer_name,
       birthday
from buyers
where birthday >= '01.01.2000';

--Задача 3.
select O.order_id,
       B.buyer_id,
	   O.order_number,
	   O.order_date,
	   O.order_summa
from orders as O
inner join buyers as B on B.buyer_id = O.buyer_id
where order_id in (1708, 1959, 2146);

--Задача 4.
select product_name,
       price
from products
where product_name like '%Процессор%';

--Задача 5.
select order_number,
       order_date
from orders
where order_date between '01. 06. 2020' and '31. 07. 2020';

--Задача 6.
select product_name,
       price
from products
where type_id = 1 and price > 5000;

--Задача 7.
select order_number,
       order_date,
	   order_summa
from orders
where order_date = '30. 07. 2020' or order_number in (151, 298);

--Задача 8.
select order_number,
       order_date,
	   order_summa
from orders
where order_number not in (400, 410) and 
 order_date between '01. 05. 2020' and '31. 05. 2020';

 --Задача 9. 
 select O.order_number,
        O.order_date,
		P.product_name,
		P.price
 from orders as O
 left join orders_products as OP on OP.order_id = O.order_id
 left join products as P on OP.product_id = P.product_id
 where o.order_date >= '01. 06. 2020' and o.order_date < '30. 06. 2020';

 --или как вариант
  select O.order_number,
        O.order_date,
		P.product_name,
		P.price
 from orders as O
 left join orders_products as OP on OP.order_id = O.order_id
 left join products as P on OP.product_id = P.product_id
 where o.order_date between '01. 06. 2020' and '30. 06. 2020'
 
select B.buyer_name,
       O.order_date,
	   P.product_name
from buyers as B
inner join orders as O on B.buyer_id = O.buyer_id
inner join orders_products as OP on O.order_id = OP.order_id
left join products as P on OP.product_id = P.product_id
where O.order_date between '01. 05. 2020' and '31. 05. 2020'
and B.buyer_name = 'Иванов И.И.'
and P.type_id = 1;


--Задача 1.
select product_name,
       description
from products
where description is null;

--Задача 2.
select PT.name as type_name,
       P.product_name,
	   P.description
from products as P
inner join product_types as PT on PT.type_id = P.type_id
where P.type_id = 1 and description is not null

 
--Задача 3.
select B.buyer_name,
       O.order_number
from buyers as B
left join orders as O on B.buyer_id = O.buyer_id
where O.order_number is null;

--Задача 4.
select O.order_number,
       P.product_name,
	   P.description
from orders as O
inner join orders_products as OP on O.order_id = OP.order_id
inner join products as P on OP.product_id = P.product_id
where O.order_number = 85 and P.description is not null;

--Задача 5.
select P.product_name,
       P.price
from products as P
left join orders_products as OP on P.product_id = OP.product_id
where OP.product_id is null;


--Задача 1.
select distinct order_date
from orders
where order_date between '01. 05. 2020' and '31. 05. 2020';

--Задача 2.
select top 50 percent product_name,
       price
from products;

--Задача 3.
select distinct B.buyer_name
from buyers as B
inner join orders as O on B.buyer_id = O.buyer_id
inner join orders_products as OP on O.order_id = OP.order_id
inner join products as P on OP.product_id = P.product_id
where P.type_id = 2;

--Задача 4.
select top 2 B.buyer_name,
             P.product_name
from buyers as B
inner join orders as O on B.buyer_id = O.buyer_id
inner join orders_products as OP on O.order_id = OP.order_id
inner join products as P on OP.product_id = P.product_id
where P.type_id = 1 and buyer_name like '%Сергеев А.С%' 
and order_date between '01. 06. 2020' and '30. 06. 2020';


--Задача 1.
select min(order_summa) as [min_summa],
	   MAX(order_summa) as [max_summa],
	   AVG(order_summa) as [avg_summa]
from orders 
where order_date between '01. 05. 2020' and '30. 06. 2020';

--Задача 2.
select B.buyer_name,
       SUM(order_summa) as [summa]
from buyers as B
left join orders as O on B.buyer_id = O.buyer_id
group by B.buyer_name;

--Задача 3.
select name as type_name, COUNT(*) as [quantity_sales]                 
from product_types as PT
inner join products as P on PT.type_id = P.type_id
inner join orders_products as OP on P.product_id = OP.product_id 
group by PT.name;

--Задача 4.
select P.product_id,
       P.product_name, COUNT(OP.product_id) as [quantity_sales]
from products as P
left join orders_products as OP on P.product_id = OP.product_id
group by P.product_id, P.product_name;


--Задача 1.
select O.order_date, COUNT(*) as [quantity_orders]
from orders O
group by O.order_date
having COUNT(*) > 1;

--Задача 2.
select B.buyer_name, sum(O.order_summa) as [summa]
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
group by B.buyer_name
having SUM(O.order_summa) > 20000;

--Задача 3.
select B.buyer_name, AVG(O.order_summa) as [average_cost],
                     COUNT(*) as [quantity_orders]
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
where O.order_date between '01. 04. 2020' and '30. 06. 2020'
group by B.buyer_name
having count(*) > 1;

--Задача 4.
select B.buyer_name, COUNT(*) as purchase_quantity
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
inner join orders_products as OP on O.order_id = OP.order_id
inner join products as P on OP.product_id = P.product_id
where P.type_id = 1
group by B.buyer_name
having COUNT(*) > 5;


--Задача 1.
select B.buyer_name,
       O.order_number,
	   O.order_date
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
where B.buyer_name like '%Иванов И.И%'
order by O.order_date;

--Задача 2.
select order_number,
       order_date
from orders
order by order_date desc, order_number desc;

--Задача 3.
SELECT TOP 5 product_name, price
FROM products
ORDER BY price DESC;

--Задача 4.
select product_name, price
from products 
where type_id = 1 and price > 1000
order by price desc;

--Задача 5.
select top 5 B.buyer_name,
             O.order_number,
	         O.order_date,
	         O.order_summa
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
order by O.order_summa desc;


--Задача 6.
select P.product_name,
       O.order_number,
	   O.order_date
from products P
inner join orders_products as OP on P.product_id = OP.product_id
inner join orders as O on OP.order_id = O.order_id
where P.product_name like '%Процессор V5%'
order by O.order_date;


--Задача 1.
SELECT product_id, product_name, price
FROM products
WHERE product_id IN (38, 47)
 
UNION ALL
 
SELECT product_id, product_name, price
FROM products
WHERE product_id IN (38, 47)
ORDER BY product_id;


--Задача 1.
select P.product_name, P.price
from products P
inner join orders_products as OP on P.product_id = OP.product_id
inner join orders as O on OP.order_id = O.order_id
where O.order_number = 244

intersect 

select P.product_name, P.price
from products P
inner join orders_products as OP on P.product_id = OP.product_id
inner join orders as O on OP.order_id = O.order_id
where O.order_number = 352;

--Задача 2.
select B.buyer_id, B.buyer_name
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
where O.order_date < '01. 06. 2020'

except

select B.buyer_id, B.buyer_name
from buyers B
inner join orders as O on B.buyer_id = O.buyer_id
where O.order_date > '01. 06. 2020';


--Задача 1.
alter table orders add total_summa as (order_summa - (order_summa * 10) / 100);

go

select order_number, order_summa, total_summa
from orders

--Задача 2.
alter table orders drop column total_summa;

SELECT product_name, price
FROM products
WHERE type_id = 1;


SELECT product_name, price
FROM products
WHERE type_id = 1;
 
--Обновление цены товары
UPDATE products SET price = price * (100+10) / 100
WHERE type_id = 1;
 
--После обновления
SELECT product_name, price
FROM products
WHERE type_id = 1;

--Задача 2.
select buyer_name, birthday
from buyers
where buyer_name = 'Петров С.Л.';

update buyers set birthday = '11. 06. 2002'
where buyer_name = 'Петров С.Л.'

select buyer_name, birthday
from buyers
where buyer_name = 'Петров С.Л.';

--Задача 3.
select product_name, description
from products
where description is null;

update products set description = 'Нет описания'
where description is null;

select product_name, description
from products
where description = 'Нет описания';


select buyer_id, buyer_name, birthday
from buyers;

delete buyers
where buyer_name = 'Петров С.Л.';

select buyer_id, buyer_name, birthday
from buyers;