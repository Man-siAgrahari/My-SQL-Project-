create database Online_retailshop_database;
Use Online_retailshop_database;

create table Users ( user_id int (10) not null primary key, name varchar (20), phone_number int (10) not null); 
describe Users;

CREATE TABLE Buyer
(
    user_id INT NOT NULL
    ,PRIMARY KEY(user_id)
    ,FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

describe Buyer;

CREATE TABLE Seller
(
    user_id INT NOT NULL
    ,PRIMARY KEY(user_id)
    ,FOREIGN KEY(user_id) REFERENCES Users(user_id)
);
describe Seller;

create table Bankcard (cardNumber varchar (30) not null, 
expiryDate DATE, bank Varchar (20) not null,
Primary key (cardNumber));
describe Bankcard;


create table CreditCard 
( cardNumber varchar (25) not null,
userid int not null, organization varchar (20) not null, 
Primary key (cardNumber),
foreign key (cardNumber) References BankCard (cardNumber),
foreign key (userid) references Users(user_id));


CREATE TABLE DebitCard
(
    cardNumber VARCHAR(25) NOT NULL
    ,userid INT NOT NULL
    ,PRIMARY KEY(cardNumber)
    ,FOREIGN KEY(cardNumber) REFERENCES BankCard(cardNumber)
    ,FOREIGN KEY(userid) REFERENCES Users(user_id)
);

CREATE TABLE Address
(
    addrid INT NOT NULL
    ,userid INT NOT NULL
    ,name VARCHAR(50)
    ,contactPhoneNumber VARCHAR(20)
    ,province VARCHAR(100)
    ,city VARCHAR(100)
    ,streetaddr VARCHAR(100)
    ,postCode VARCHAR(12)
    ,PRIMARY KEY(addrid)
    ,FOREIGN KEY(userid) REFERENCES Users(user_id)
);
describe Address;

CREATE TABLE Store
(
    sid INT NOT NULL
    ,name VARCHAR(20)
    ,province VARCHAR(20)
    ,city VARCHAR(20)
    ,streetaddr VARCHAR(20)
    ,customerGrade INT
    ,startTime DATE
    ,PRIMARY KEY(sid)
);
describe Store;

CREATE TABLE Brand
(
    brandName VARCHAR(20) NOT NULL
    ,PRIMARY KEY (brandName)
);
describe Brand;

CREATE TABLE Product
(
    pid INT NOT NULL
    ,sid INT NOT NULL
    ,brand VARCHAR(50) NOT NULL
    ,name VARCHAR(100)
    ,type VARCHAR(50)
    ,modelNumber VARCHAR(50)
    ,color VARCHAR(50)
    ,amount INT
    ,price INT
    ,PRIMARY KEY(pid)
    ,FOREIGN KEY(sid) REFERENCES Store(sid)
    ,FOREIGN KEY(brand) REFERENCES Brand(brandName)
);
describe product;

CREATE TABLE OrderItem
(
    itemid INT NOT NULL
    ,pid INT NOT NULL
    ,price INT
    ,creationTime DATE
    ,PRIMARY KEY(itemid)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);
describe OrderItem;


CREATE TABLE Orders
(
    orderNumber INT NOT NULL
    ,paymentState VARCHAR(12)
    ,creationTime DATE
    ,totalAmount INT
    ,PRIMARY KEY (orderNumber)
);
describe Orders;

CREATE TABLE Comments  -- Weak Entity
(
    creationTime DATE NOT NULL
    ,userid INT NOT NULL
    ,pid INT NOT NULL
    ,grade FLOAT
    ,content VARCHAR(500)
    ,PRIMARY KEY(creationTime,userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(user_id)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);
describe Comments;

CREATE TABLE ServicePoint
(
    spid INT NOT NULL
    ,streetaddr VARCHAR(40)
    ,city VARCHAR(30)
    ,province VARCHAR(20)
    ,startTime VARCHAR(20)
    ,endTime VARCHAR(20)
    ,PRIMARY KEY(spid)
);
-- Relationship
describe ServicePoint;


CREATE TABLE Save_to_Shopping_Cart
(
    userid INT NOT NULL
    ,pid INT NOT NULL
    ,addTime DATE
    ,quantity INT
    ,PRIMARY KEY (userid,pid)
    ,FOREIGN KEY(userid) REFERENCES Buyer(user_id)
    ,FOREIGN KEY(pid) REFERENCES Product(pid)
);
describe Save_to_Shopping_Cart;

CREATE TABLE Contain
(
    orderNumber INT NOT NULL
    ,itemid INT NOT NULL
    ,quantity INT
    ,PRIMARY KEY (orderNumber,itemid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(itemid) REFERENCES OrderItem(itemid)
);
describe Contain;

CREATE TABLE Payment
(
    orderNumber INT NOT NULL
    ,creditcardNumber VARCHAR(25) NOT NULL
    ,payTime DATE
    ,PRIMARY KEY(orderNumber,creditcardNumber)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
    ,FOREIGN KEY(creditcardNumber) REFERENCES CreditCard(cardNumber)
);
describe Payment;

CREATE TABLE Deliver_To
(
    addrid INT NOT NULL
    ,orderNumber INT NOT NULL
    ,TimeDelivered DATE
    ,PRIMARY KEY(addrid,orderNumber)
    ,FOREIGN KEY(addrid) REFERENCES Address(addrid)
    ,FOREIGN KEY(orderNumber) REFERENCES Orders(orderNumber)
);
describe Deliver_To;


CREATE TABLE After_Sales_Service_At
(
    brandName VARCHAR(20) NOT NULL
    ,spid INT NOT NULL
    ,PRIMARY KEY(brandName, spid)
    ,FOREIGN KEY(brandName) REFERENCES Brand (brandName)
    ,FOREIGN KEY(spid) REFERENCES ServicePoint(spid)
);

describe  After_Sales_Service_At;
