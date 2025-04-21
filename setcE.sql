-- e.
CREATE View Items as
SELECT Item_name, Cname, Orderno FROM Item,Customer,Cust_Order;