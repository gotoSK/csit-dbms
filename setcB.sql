-- b.
INSERT INTO Customer(Customerno, Cname)
VALUES
('C1', 'Ram'),
('C2', 'Sita'),
('C3', 'Laxman');


INSERT INTO Cust_Order(Customerno, Orderno, Odate, Ord_amt)
VALUES
('C1', 'O1', '2022-07-18', '100000'),
('C2', 'O2', '2023-06-15', '12000'),
('C3', 'O3', '2023-01-22', '70000');

INSERT INTO Item(Itemno, Item_name, unit_price)
VALUES
('I1', 'File Sheet', '50'),
('I2', 'Stapler', '120'),
('I3', 'Print Paper', '350');


INSERT INTO Order_item(Ord_no, Itm_no, quantity)
VALUES
('O1', 'I1','2000'),
('O2', 'I2','100'),
('O3', 'I3','200');