select C.first_name as Customer_name,C.customer_id,O.order_id,O.Order_date 
from Customer C,Order_tbl O where
C.customer_id=O.customer_id 