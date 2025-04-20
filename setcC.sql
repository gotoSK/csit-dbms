-- c.
SELECT Cname FROM Customer as c
INNER JOIN Cust_Order as co ON
c.Customerno = co.Customerno
INNER JOIN Order_item as o ON
o.Ord_no = co.Orderno ON
INNER JOIN Item as i 
o.Itm_no = i.Itemno WHERE Item_name = 'Computer'; 