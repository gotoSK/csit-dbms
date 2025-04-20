-- a.
CREATE TABLE Customer(
	Customerno char(5) PRIMARY KEY CHECK (Customerno like 'C%'),
	Cname char(50)
);

CREATE TABLE Cust_Order(
	Customerno char(5),
	Orderno char(5) PRIMARY KEY CHECK (Orderno like 'O%'),
	Odate date,
	Ord_amt int DEFAULT 0,
	FOREIGN KEY (Customerno) REFERENCES Customer(Customerno)
);

CREATE TABLE Item(
   Itemno char(5) PRIMARY KEY CHECK (Itemno like 'I%'), 
   Item_name char(30),
   unit_price int
);

DROP TABLE item;
CREATE TABLE Order_item(
   Ord_no char(5),
   Itm_no char(5),
   quantity int,
   FOREIGN KEY (Ord_no) REFERENCES Cust_Order(Orderno),
   FOREIGN KEY (Itm_no) REFERENCES Item(Itemno)
);