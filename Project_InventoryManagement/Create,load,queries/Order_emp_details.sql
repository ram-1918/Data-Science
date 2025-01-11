select O.order_id,O.customer_id,O.order_date,E.emp_id,E.emp_name 
from Order_tbl O, Employee E
where O.emp_id=E.emp_id