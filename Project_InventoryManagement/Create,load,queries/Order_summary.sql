select S1.invoice_number,S1.price,O.order_id,O.order_date,C.customer_id,C.first_name,C.last_name,C.contact_number,P.product_id,P.model,S.supplier_id,
S.supplier_name from customer C,order_tbl O,product P,supplier S,summary S1 where O.customer_id=C.customer_id and
O.product_id=P.product_id and P.supplier_id=S.supplier_id and S1.invoice_number=O.invoice_number and C.customer_id=2