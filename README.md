# **Проект TestOnlineShop**

## **Учебно-тестовая база данных интернет магазина "КомпАсс".** 

## Магазин занимается продажей компьютерной техники и комплектующих для компьютеров.
---
> ## Для учета продаж товаров в интернет магазине используется приложение, которое хранит данные в реляционной базе данных. Приложение позволяет хранить информацию о товарах, покупателях и заказах. Для этого в базе данных были созданы следующие таблицы:

 - **buyers** – *таблица покупателей;*
   - **buyer_id** – идентификатор покупателя;
   - **buyer_name** – ФИО покупателя;
   - **birthday** – день рождения покупателя.
- **orders** – *таблица заказов;*
   - **order_id** – идентификатор заказа;
   - **buyer_id** – идентификатор покупателя, ссылка на таблицу **buyers**;
   - **order_number** – номер заказа;
   - **order_date** – дата заказа;
   - **order_summa** – сумма заказа. 
- **products** – *таблица товаров;*
   - **product_id** – идентификатор товара;
   - **product_name** – наименование товара;
   - **description** – описание товара;
   - **price** – стоимость товара;
   - **type_id** – тип товара, ссылка на таблицу.
- **product_types** – *таблица типов товаров;*
   - **type_id** – идентификатор типа товара;
   - **name** – наименование типа товара.
- **orders_products** – *таблица связи заказов и товаров.*
   - **order_id** – идентификатор заказа, ссылка на таблицу orders;
   - **product_id** – идентификатор товара, ссылка на таблицу products.
  ---
> ### **Код созданных таблиц:**
```sql
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
```
---
> ### **Код добавления данных в таблицы:**

```sql
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
```
---
> ### **1. Например появилась необходимость сформировать перечень всех товаров с указанием их цены.**
> ### **Код SQL инструкции:**
```sql
SELECT product_name, price
FROM products;
```
#### Результат:
product_name | price
:--- | :--- |
Процессор V5 | 13530,00
Материнская плата R7Q |	5060,00
Клавиатура S939 | 1430,00
Мышь N56 | 990,00
Материнская плата ES20 | 7370,00
Принтер 3075 | 3850,00
Кулер для процессора D17 | 495,00
Процессор V7 | 17094,00
Антивирусная программа | 1200,00
Операционная система | 6700,00

### В SQL запросе, обращаясь к таблице ***products***, все данные товаров и их цен получаем из столбцов ***product_name, price***
---
> ### **2. Например в процессе работы магазина понадобилось узнать дату рождения всех покупателей, к тому же, нужно выгрузить список всех покупателей с указанием даты их рождения.**
> *Нужен запрос который покажет ФИО и дату рождения всех покупателей.*

```sql
SELECT buyer_name, birthday
FROM buyers;
```
#### Результат:

buyer_name | birthday
:--- | :--- 
Зайцев А.Е. | 1998-04-12
Иванов И.И. | 1993-07-16
Попова Е.В. | 2001-10-28
John Smith  | 2000-05-03
Сергеев А.С.| 1986-10-12
Андреев В.А.| 1980-09-27

### Получить нужно не все столбцы таблицы, а только ФИО и даты рождения, поэтому в списке выборки инструкции **SELECT** указывается только два соответствующих столбца ***buyer_name, birthday***
---
> ### **3. Задача сформировать список всех заказов с указанием номера, даты и суммы заказа.** 
> *Нужен запрос, который покажет номер, дату и сумму всех заказов.*

```sql
SELECT order_number, order_date, order_summa
FROM orders;
```
#### Результат:
order_number | order_date |	order_summa
:--- | :--- | :--- 
151 |	2020-04-02 |	12750,00
259 |	2020-04-17 |	6700,00
307 |	2020-05-02 |	21440,00
338 |	2020-05-07 |	15540,00
352 |	2020-05-16 |	2100,00
400 |	2020-05-21 |	6700,00
410 |	2020-05-21 |	12300,00
115 |	2020-06-11 |	4600,00
85 |	2020-06-29 |	23990,00
151 |	2020-07-02 |	1300,00
244 |	2020-07-30 |	7900,00
249 |	2020-07-30 |	16900,00
298 |	2020-08-08 |	900,00
338 |	2020-08-15 |	2200,00
373 |	2020-08-23 |	16740,00

### Необходимо получить номер, дату и сумму заказа, поэтому в списке выборки инструкции **SELECT** указывается только три соответствующих столбца ***order_number, order_date	,order_summa.***
---
> ### **4. Задача посмотреть, какие типы товаров существуют в магазине.**
> *Необходимо написать запрос, который покажет типы товаров, с указанием идентификатора типа и наименования.*
```sql
SELECT type_id, name
FROM product_types;
```
#### Результат:
type_id | name
:--- | :---
1 |	Физический
2 |	Цифровой
### Нужно получить идентификатор и наименование типа товара, поэтому в списке выборки инструкции **SELECT** указывается название соответствующих столбцов ***type_id,	name.***
---
> ### **5. В процессе работы достаточно часто возникает необходимость обращаться к таблицам, которые расположены в разных базах данных, при этом некоторые из них имеют одинаковые названия. Поэтому принято решение обращаться к таблицам в запросах, используя полный путь.**
> *Нужен запрос к таблице products, который выведет идентификатор товара и его наименование, при этом необходимо использовать полный путь к таблице.*
```sql
SELECT product_id, product_name
FROM TestDB3.dbo.products;
```
#### Результат:
product_id | product_name
:--- | :---
16 | Процессор V5
29 | Материнская плата R7Q
38 | Клавиатура S939
47 | Мышь N56
60 | Материнская плата ES20
71 | Принтер 3075
83 | Кулер для процессора D17
96 | Процессор V7
108 | Антивирусная программа
125 | Операционная система
### Необходимо обратиться к таблице ***products***, которая хранит информацию о товарах, при этом нужно получить не все столбцы таблицы, а только идентификатор и наименование товара. При этом чтобы уточнить местоположение таблицы, перед ее названием указываем базу данных и схему, в которой расположена эта таблица, ***TestDB3.dbo.products;***
---
> ### **6. В процессе эксплуатации системы возникла необходимость написать инструкцию, в которой будет много SQL запросов, при этом все эти запросы должны строго выполняться в контексте одной базы данных, допустим** ***TestDB3.*** 
> *Нужна инструкция, в которой принудительно переключается контекст на базу данных ***TestDB3*** так же выгрузка идентификаторов и ФИО всех покупателей, при этом в данном случае можно не указывать полный путь к таблице.*
```sql
USE TestDB3;
 
SELECT buyer_id, buyer_name
FROM buyers;
```
#### Результат:
buyer_id |	buyer_name
:--- | :---
753 | Зайцев А.Е.
832 | Иванов И.И.
991 | Попова Е.В.
1028 | John Smith
1109 | Сергеев А.С.
1201 | Андреев В.А.
### Для переключения контекста на базу данных ***TestDB3*** можно использовать команду ***USE.*** Нужно получить не все столбцы таблицы, а только идентификаторы и ФИО, поэтому в списке выборки инструкции ***SELECT*** указывается только два соответствующих столбца ***buyer_id, buyer_name.***
---
> ### **7. Появилась задача посмотреть информацию о заказах, в частности узнать номер и сумму всех заказов. Необходимо написать SQL запрос, который выведет номер и сумму всех заказов, и использовать псевдоним таблицы при обращении к соответствующим столбцам.** 
> *Нужен запрос, который выведет соответствующую информацию, при этом полученный запрос в будущем можно было модифицировать и добавлять в него соединения с другими таблицами, поэтому принято решение сразу использовать псевдоним таблицы и обращаться к столбцам этой таблицы через псевдоним.*
```sql
SELECT O.order_number,
	   O.order_summa
FROM orders AS O;
```
#### Результат:
order_number | order_summa
:--- | :---
151 | 12750,00
259 | 6700,00
307 | 21440,00
338 | 15540,00
352 | 2100,00
400 | 6700,00
410 | 12300,00
115 | 4600,00
85 | 23990,00
151 | 1300,00
244 | 7900,00
249 | 16900,00
298 | 900,00
338 | 2200,00
373 | 16740,00
### Нужно получить не все столбцы таблицы, а только номер и сумму заказа, поэтому в списке выборки инструкции ***SELECT*** указывается только два соответствующих столбца ***order_number, order_summa.*** При обращении к столбцам используется псевдоним таблицы, в которой находятся эти столбцы, в нашем случае это псевдоним «o», для этого перед названием столбца указывается псевдоним таблицы, т.е. «o».
---
> ### **8. Компания "КомпАсс" планирует увеличить стоимость товаров на 10%. Чтобы посмотреть на общую картину, необходимо выгрузить товары с их стоимостью, при этом включить в выгрузку еще и будущую их стоимость, т.е. с учетом 10% увеличения.**
> *Нужен запрос, который выведет наименование товара, текущую стоимость, а также в отдельном столбце сформирует будущую стоимость товара с учетом 10% увеличения.*
```sql
SELECT product_name, price, price * (100+10)/100 AS price_new
FROM products;
```
#### Результат:
product_name | price | price_new
:--- | :--- | :---
Процессор V5 | 13530,00 | 14883,00
Материнская плата R7Q |	5060,00 | 5566,00
Клавиатура S939 | 1430,00 |	1573,00
Мышь N56 | 990,00 | 1089,00
Материнская плата ES20 | 7370,00 | 8107,00
Принтер 3075 | 3850,00 | 4235,00
Кулер для процессора D17 | 495,00 |	544,50
Процессор V7 | 17094,00 | 18803,40
Антивирусная программа | 1200,00 | 1320,00
Операционная система | 6700,00 | 7370,00
### Используется выражение ***price * (100+10) / 100,*** которое сформирует столбец с тем же типом, что и столбец ***price.*** В результате получится выражение, формирующее значение цены товара, увеличенной на 10%. В случае для выражения, которое формирует стоимость товаров с учетом 10% увеличения цены, задан псевдоним ***price_new.***
---
> ### **9. Задача выгрузить список товаров с указанием наименования типа товара.**
> *Нужен запрос, который выведет наименование товара, его цену, а также наименование типа товара.*
```sql
 SELECT P.product_name,
        P.price,
		T.name AS type_name
 FROM products AS P
 INNER JOIN product_types AS T ON P.type_id = T.type_id;
```
#### Результат:
product_name | Price | type_name
:--- | :--- | :---
Процессор V5 | 13530,00 | Физический
Материнская плата R7Q |	5060,00 | Физический
Клавиатура S939 | 1430,00 |	Физический
Мышь N56 | 990,00 |	Физический
Материнская плата ES20 | 7370,00 | Физический
Принтер 3075 | 3850,00 | Физический
Кулер для процессора D17 | 495,00 |	Физический
Процессор V7 | 17094,00 | Физический
Антивирусная программа | 1200,00 | Цифровой
Операционная система | 6700,00 | Цифровой
### Товары хранятся в таблице ***products,*** типы товаров хранятся в таблице ***product_types*** (между этими таблицами существует логическая связь), поэтому чтобы написать запрос, который выведет и наименование товара, и наименование типа товара, необходимо выполнить соединение двух этих таблиц по ключу ***type_id.***
---
> ### **10. Задача составить список всех заказов, включая детализацию по товарам.**
> *Нужен запрос, который выведет номер и дату заказа, наименование товаров, которые включаются в тот или иной заказ, а также цену товаров.*
```sql
SELECT O.order_number,
       O.order_date,
	   P.product_name,
	   P.price
FROM orders as O 
INNER JOIN orders_products as OP on OP.order_id = O.order_id 
INNER JOIN products as P on P.product_id = OP.product_id;
```
### Результат:
order_number | order_date |	product_name | price
:--- | :--- | :--- | :---
151 | 2020-04-02 | Процессор V5 | 13530,00
151 | 2020-04-02 | Кулер для процессора D17 | 495,00
259 | 2020-04-17 | Операционная система | 6700,00
307 | 2020-05-02 | Материнская плата R7Q | 5060,00
307 | 2020-05-02 | Процессор V7 | 17094,00
307 | 2020-05-02 | Клавиатура S939 | 1430,00
338 | 2020-05-07 | Процессор V7 | 17094,00
352 | 2020-05-1 | Антивирусная программа | 1200,00
352 | 2020-05-16 | Мышь N56 |990,00
400	| 2020-05-21 | Материнская плата ES20 | 7370,00
410 | 2020-05-21 | Процессор V5 | 13530,00
115 | 2020-06-11 | Материнская плата R7Q | 5060,00
85 | 2020-06-29 | Материнская плата ES20 | 7370,00
85 | 2020-06-29 | Кулер для процессора D17  | 495,00
85 | 2020-06-29 | Процессор V7 | 17094,00
85 | 2020-06-29 | Клавиатура S939 | 1430,00
151 | 2020-07-02 | Клавиатура S939 | 1430,00
244 | 2020-07-30 | Антивирусная программа | 1200,00
244 | 2020-07-30 | Операционная система | 6700,00
249 | 2020-07-30 | Процессор V5 | 13530,00
249 | 2020-07-30 | Материнская плата R7Q | 5060,00
298 | 2020-08-08 | Мышь N56 | 990,00
338	| 2020-08-15 | Клавиатура S939 | 1430,00
338 | 2020-08-15 | Мышь N56 | 990,00
373 | 2020-08-23 | Антивирусная программа | 1200,00
373 | 2020-08-23 | Процессор V7 | 17094,00
### Заказы хранятся в таблице ***orders,*** товары хранятся в таблице ***products*** (между этими таблицами существует логическая связь), при этом между данными таблицами связь многие ко многим, поэтому прямой связи между ними нет, они связаны через связующую таблицу ***orders_products.*** Чтобы объединить заказы и товары, нужно соединить эти 3 таблицы.
---
> ### **11. Задача определить даты оформления заказов каждого клиента компании, т.е. в какие дни каждый из клиентов оформлял заказы.**
> *Нужен запрос, который выведет ФИО покупателей и даты оформления всех их заказов.*
```sql
SELECT B.buyer_name,
       O.order_date
FROM buyers AS B
LEFT JOIN orders AS O ON B.buyer_id = O.buyer_id;
```
#### Результат:
buyer_name | order_date
:--- | :---
Зайцев А.Е.| 2020-08-08
Иванов И.И. | 2020-05-02
Иванов И.И. | 2020-05-21
Иванов И.И. | 2020-06-11
Иванов И.И. | 2020-07-30
Иванов И.И. | 2020-08-23
Попова Е.В. | 2020-04-17
Попова Е.В. | 2020-07-30
John Smith | 2020-05-21
Сергеев А.С.| 2020-05-07
Сергеев А.С. | 2020-06-29
Андреев В.А. | 2020-04-02
Андреев В.А. | 2020-05-16
Андреев В.А. | 2020-07-02
Андреев В.А. | 2020-08-15
### Информация о покупателях хранится в таблице ***buyers,*** заказы хранятся в таблице ***orders*** (между этими таблицами существует логическая связь), поэтому чтобы написать запрос, который выведет и ФИО покупателей, и дату заказов, необходимо выполнить соединение двух этих таблиц. Соединение по идентификатору покупателя (***buyer_id***), так как данный ключ есть в обеих таблицах.
---