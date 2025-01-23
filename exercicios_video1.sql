-- Exercícios criados pelo ChatGPT baseado no conteúdo do vídeo https://www.youtube.com/watch?v=QBDjB2V_uDM

-- 1) Liste os nomes e países de todos os clientes, ordenados alfabeticamente pelo nome.

select CustomerName as Nome_cliente, Country as Pais
from Customers
order by CustomerName


-- 2) Mostre o número total de clientes na tabela Customers.

SELECT count(distinct Customer_ID) as clientes_unicos
FROM Customers;

-- 3) Liste as cidades únicas em que os clientes estão localizados.

select distinct City
from customers
group by City;

-- 4) Exiba o número de clientes por país (COUNT), ordenados de forma decrescente pelo número de clientes.

select Country, count(customerID) as Qtde_Clientes
from Customers
group by Country
order by count(CustomerID) DESC;

-- 5) Mostre os nomes dos clientes que vivem em países com mais de 3 clientes (HAVING).

SELECT customername as nome_cliente, country as pais
FROM customers
WHERE country IN (
    SELECT country
    FROM customers
    GROUP BY country
    HAVING COUNT(*) > 3
);

-- 6) Liste todos os nomes de categorias, ordenados em ordem alfabética.

select distinct(categoryname) as Categoria
from categories
order by categoryname;


-- 7) Conte o número total de categorias na tabela Categories.

select count(*) as qtde_categorias
from categories;

-- 8) Exiba o nome da categoria com o menor CategoryID (MIN).

select categoryname as Categoria, categoryID as menor_id_categoria
from categories
where categoryid = (select min(categoryID) from categories);

-- 9) Mostre o nome da categoria com o maior CategoryID (MAX).

select categoryname as Categoria, categoryID as maior_id_categoria
from categories
where categoryid = (select max(categoryID) from categories);

-- 10) Liste as categorias cujo CategoryID é menor que a média de todos os CategoryIDs (AVG).

select categoryname as Categoria, categoryID
from categories
where categoryID < (select avg(categoryID) from categories);

-- 11) Liste os nomes dos funcionários, ordenados por data de nascimento em ordem crescente.

select firstname as nome, birthdate as data_nascimento
from employees
order by birthdate;

-- 12) Mostre o funcionário mais velho na tabela

select *
from employees
where Birthdate = (select min(birthdate) from employees);

--13) Exiba o número de funcionários cujo sobrenome começa com "J".

select count(employeeID) as contagem_funcionarios
from employees
where firstname like 'J%';

--14) Liste os nomes e sobrenomes dos funcionários que nasceram após 1985, ordenados em ordem alfabética.

select firstname, lastname, birthdate
from employees
where birthdate >= 01/01/1986
order by firstname, lastname;

-- 15) Liste todos os pedidos realizados, ordenados em ordem decrescente pela data do pedido

select *
from orders
order by orderid desc;


-- 16) Mostre a data do pedido mais recente

select *
from orders
where orderdate = (select max(orderdate) from orders);

-- 17) Exiba o número total de pedidos realizados por cada CustomerID, ordenados do maior para o menor.

select customerid, count(orderid) as numero_de_pedidos
from orders
group by customerid
order by count(orderid) desc;

-- 18) Liste os pedidos feitos em um intervalo de datas, como entre "1997-06-01" e "1997-12-31"

SELECT *
FROM orders
WHERE orderdate::date >= '1996-06-01' AND orderdate::date < '1998-01-01';

-- 19) Mostre o número de pedidos realizados por cada ShipperID, filtrando apenas aqueles que enviaram mais de 10 pedidos 

select shipperID as fornecedor, count(orderID) as numero_pedidos
from orders
group by shipperid
having count(orderid) >= 10

-- 20) Exiba o número total de registros na tabela OrderDetails.

select count(*) as qtde_total_registros
from orderdetails;

-- 21) Mostre o total de Quantity por OrderID, ordenado do maior para o menor (SUM com ORDER BY).

select orderid, sum(quantity) as qtde_de_produtos
from orderdetails
group by orderid
order by sum(quantity) DESC;

-- 22) Liste os registros cujo Quantity seja maior que a média de todas as quantidades

select *
from orderdetails
where quantity > (select avg(quantity) from orderdetails);

-- 23) Encontre o maior valor de Quantity em um único registro

select *
from orderdetails
where quantity = (select max(quantity) from orderdetails);

-- 24) Mostre a soma total de Quantity de todos os registros na tabela

select sum(quantity) as qtde_total_produtos_pedidos
from orderdetails;

-- 25) Liste todos os produtos com seu preço (Price), ordenados em ordem decrescente de preço.

select productname as nome_produto, price as preço
from products
order by price DESC;

-- 26) Exiba o preço médio (AVG) de todos os produtos.

select avg(price) as preco_medio_produtos
from products;

-- 27) Mostre os produtos cujo preço é maior do que a média de preços, ordenados em ordem crescente.

select *
from products
where price > (select avg(price) from products)
order by price DESC;

-- 28) Encontre o produto mais caro e o mais barato na tabela 

(SELECT productid, price, 'mais_barato' AS classificacao
FROM products
ORDER BY price ASC
LIMIT 1)
UNION ALL
(SELECT productid, price, 'mais_caro' AS classificacao
FROM products
ORDER BY price DESC
LIMIT 1);


-- 29) Liste os produtos organizados por CategoryID, e dentro de cada categoria, ordenados pelo preço.

select *
from products
order by categoryid, price;











