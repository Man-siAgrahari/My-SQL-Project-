create database SQL_basics;
use SQL_basics;

#CREATING PRODUCT TABLE

create table product_table (product_code int not null, product_name varchar (20) , 
price int, stock int, category varchar (20));
insert into product_table values ( 1, 'tulip', 198, 5, 'perfume'),
( 2, 'cornoto', 50, 21, 'icecream'),
( 3, 'pen', 10, 52, 'Stationary'),
( 4, 'lays', 10, 20, 'snacks'),
( 5, 'mayanoise', 90, 10, 'dip'),
( 6, 'jam', 105, 10, 'spread'),
( 7, 'shampoo', 5, 90, 'hair product'),
( 8, 'axe', 210, 4, 'perfume'),
( 9, 'park avenue', 901, 4, 'perfume'),
( 10, 'wattagirl', 201, 3, 'perfume'),
( 11, 'pencil', 4, 10, 'stationary'),
( 12, 'sharpener', 5, 90, 'stationary'),
( 13, 'sketchpen', 30, 10, 'stationary'),
( 14, 'tape', 15, 30, 'stationary'),
( 15, 'paint', 60, 12, 'stationary'),
( 16, 'chocolate', 25, 50, 'snacks'),
( 17, 'biscuts', 60, 26, 'snacks'),
( 18, 'mango', 100, 21, 'fruits'),
( 19, 'apple', 120, 9, 'fruits'),
( 20, 'kiwi', 140, 5, 'fruits'),
( 21, 'carrot', 35, 12, 'vegetable'),
( 22, 'onion', 22, 38, 'vegetable'),
( 23, 'tomato', 21, 15, 'vegetable'),
( 24, 'serum', 90, 4, 'hair product'),
( 25, 'conditioner', 200, 5, 'hair product'),
( 26, 'oil bottle', 40, 2, 'kitchen utensil');

select * from product_table; 
alter table product_table
modify stock varchar (20);

describe product_table;

select * from product_table where category = 'stationary' ; 
 
select * from product_table 
order by price desc;

select product_code, category from product_table where stock >= 2;


#CREATING CUSTOMER TABLE 

create table customer_table (customer_id int not null, c_name varchar (20), c_location varchar (20), c_phone_no int );
describe table customer_table;

insert into customer_table values ( 1111, 'Nisha', 'Kerala', 8392320), 
( 1212, 'Oliver', 'Kerala',4353891 ),
( 1216, 'Nila', 'Delhi',3323242 ),
( 1246, 'Vignesh', 'Chennai', 1111212),
( 1313, 'Shiny', 'Maharastra', 5454543),
( 1910, 'Mohan', 'Mumbai',9023941),
( 2123, 'Biyush', 'Bombay',1253358),
( 3452, 'Alexander', 'West Bengal', 1212134),
( 3921, 'Mukesh', 'Manipur', 4232321),
( 5334, 'Christy', 'Pakistan', 2311111),
( 9021, 'Rithika', 'Kashmir', 1121344),
( 9212, 'Jessica', 'Banglore', 1233435),
( 9875, 'Stephen', 'Chennai', 1212133);

select * from customer_table;

alter table customer_table
Rename to cutomer_details;

select c_name from cutomer_details where c_name = 'A'; 


#CREATING SALES TABLE

create table sales_table (order_date date not null, order_no int, c_id int not null,
 c_name varchar (20), product_code int, product_name varchar (20), quantity int, price int );

describe sales_table;

insert into sales_table values 
(24/07/2016, 'HM06', 9212, 'Jessica', 11, 'pencil', 3, 30); 
insert into sales_table values 
(19/10/2016, 09, 3291, 'Mukesh', 17, 'biscuits', 10, 600), 
(30/10/2016, 10, 9875, 'Stephen', 2, 'cornoto', 10, 500),
(12/04/2018, 03, 1212, 'Oliver', 20, 'kiwi', 3, 420),
(02/05/2018, 05, 1910, 'Mohan', 20, 'kiwi', 2, 280),
(20/09/2019, 08, 5334, 'Chirsty', 16, 'chocolate', 2, 50),
(11/01/2019, 07, 1246, 'Vignesh', 19, 'apple', 5, 600),
(15/03/2019, 01, 1910, 'Mohan', 5, 'mayonoise', 4, 360),
(10/02/2021, 04, 1111, 'Nisha', 25, 'conditioner', 5, 10000),
(12/02/2021, 02, 2123, 'Biyush', 3, 'pen', 2, 20);

select * from sales_table;

alter table sales_table 
add S_No int;

alter table sales_table 
add Customer varchar (12);

alter table sales_table
drop S_No;

alter table sales_table
drop Customer;

select price, quantity, c_id, order_date, order_no from sales_table;

select * from sales_table;

select * from sales_table where quantity >2 and price < 500; 

SELECT *
FROM
   cutomer_details
INNER JOIN
    sales_table
ON
    cutomer_details. c_name = sales_table.c_name;

