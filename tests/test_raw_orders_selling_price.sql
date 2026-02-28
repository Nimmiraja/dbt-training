select 
orderid,
sum(ordersellingprice) as total_sp
from {{ ref('raw_orders') }}
group by orderid
having total_sp<0