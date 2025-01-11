select P.product_id,P.model,S.supplier_id,S.supplier_name,P.supplier_id 
from Supplier S, Product P where 
P.supplier_id=S.supplier_id