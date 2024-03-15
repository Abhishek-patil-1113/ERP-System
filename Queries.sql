--Create table Product(
--	ProductID int not null primary key,
--	ProductName varchar (100),
--	CategoryName varchar (100),
--	Price float,
--	StockQuantity int,
--);

--insert into product values (1101, 'Mixer', 'Home appliances', 3000.00, 34)
--insert into product values (1102, 'Grinder', 'Home appliances', 1500.10, 30)
--insert into product values (1103, 'Fridge', 'Home appliances', 33000.00, 10)
--insert into product values (1104, 'Cooker', 'Home appliances', 1000.00, 40)
--insert into product values (1105, 'Redme', 'Phone', 13000.00, 19)
--insert into product values (1106, 'iPhone', 'Phone', 153000.00, 14)
--insert into product values (1107, 'Realme', 'Phone', 23000.00, 34)
--insert into product values (1108, 'Samsung', 'Phone', 73000.00, 24)
--insert into product values (1109, 'Dell', 'Laptop', 5000.00, 34)
--insert into product values (1110, 'MacBook', 'Laptop', 100000.00, 14)
--insert into product values (1111, 'ASUS', 'Laptop', 120000.00, 30)
--insert into product values (1112, 'Lenovo', 'Laptop', 35000.00, 44)
--insert into product values (1113, 'Tshirt', 'Clothing', 100.00, 100)
--insert into product values (1114, 'Jeans', 'Clothing', 1000.00, 50)
--insert into product values (1115, 'Shirt', 'Clothing', 900.00, 90)
--insert into product values (1116, 'Tissue', 'Other', 30.10, 100)
--insert into product values (1117, 'Notebook', 'Other', 55.50, 84)
--insert into product values (1118, 'Blannket', 'Other', 700.00, 30)

--select * from Product

--update Product set ProductName = 'Mixer', CategoryName = 'Home appliances', price = 2500.55, StockQuantity = 19 where ProductID = 1101

--create table Orders (
--	OrderID int primary key not null,
--	CustomerName  varchar(100),
--	OrderDate date,
--	OrderStatus varchar (100),
--);

select * from Product

--insert into orders values (1, 'Abhishek', '2024/03/14', 'Delivered')
--insert into orders values (2, 'Shubham', '2024/03/10', 'Pending')
--insert into orders values (3, 'Rohit', '2024/02/29', 'Pending')
--insert into orders values (4, 'Akshay', '2024/03/7', 'Delivered')
--insert into orders values (5, 'Omkar', '2024/03/9', 'Pending')
--insert into orders values (6, 'Ramesh', '2024/03/1', 'Pending')
--insert into orders values (7, 'Pritam', '2024/03/3', 'Pending')
--insert into orders values (8, 'Suresh', '2024/03/2', 'Delivered')
--insert into orders values (9, 'Ganesh', '2024/03/11', 'Delivered')
--insert into orders values (10, 'Smita', '2024/03/10', 'Delivered')
--insert into orders values (11, 'Geeta', '2024/03/5', 'Delivered')

--SELECT * FROM Orders WHERE OrderDate < '2024-03-7' and OrderStatus = 'pending';

--update orders set OrderStatus = 

--select orderid as 'Order ID', customername as 'Customer Name', OrderDate as 'Order Date' from orders where OrderStatus = 'pending' and orderdate = '2024-3-10' 
