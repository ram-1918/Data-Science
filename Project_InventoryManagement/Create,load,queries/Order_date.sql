select O.order_id,O.order_date,C.first_name,C.last_name,C.contact_number,P.model,S.supplier_id,
S.supplier_name 
from customer C,order_tbl O,product P,supplier S where 
O.customer_id=C.customer_id and O.product_id=P.product_id and P.supplier_id=S.supplier_id and O.order_date='2021-01-31'