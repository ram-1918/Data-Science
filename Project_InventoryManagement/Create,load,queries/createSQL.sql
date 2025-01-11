create table Customer
(
	Customer_ID int NOT NULL primary key,
	First_name varchar(20) NOT NULL,
	Last_name varchar(20) NOT NULL,
	Address varchar(20),
	Contact_number varchar(50)
);


create table Order_tbl
(
	Order_ID int NOT NULL primary key,
	Customer_ID int NOT NULL,
	Emp_ID int NOT NULL,
	Product_ID int NOT NULL,
	Invoice_number int NOT NULL,
	Order_Date date,
	foreign key(Customer_ID) references Customer(Customer_ID),
	foreign key(Emp_ID) references Employee(Emp_ID),
	foreign key(Product_ID) references Product(Product_ID),
	foreign key(Invoice_number) references Summary(Invoice_number)
);

create table Employee
(
	Emp_ID int NOT NULL primary key,
	Emp_Name varchar(50),
	Emp_Contact_number int,
	Emp_position int
);

create table Supplier
(
	Supplier_ID int NOT NULL primary key,
	Supplier_name varchar(50),
	Supplier_Address varchar(50),
	Supplier_cnumber int,
	Brand_ID int NOT NULL
);

create table Product
(
	Product_ID int NOT NULL primary key,
	Model int NOT NULL,
	Customer_ID int,
	Supplier_ID int,
	foreign key(Customer_ID) references Customer(Customer_ID),
	foreign key(Supplier_ID) references Supplier(Supplier_ID)
);

create table Summary
(
	Invoice_number int NOT NULL primary key,
	SerialNumber int,
	Price int,
);
