select
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid','p.productid']) }} as sk,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice -  o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
c.customerid,
c.customername,
c.segment,
c.country,
p.productid,
p.category,
p.productname,
p.subcategory,
{{markup('ordersellingprice','ordercostprice')}}
from {{ref('raw_orders')}} as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }}  as p
on o.productid = p.productid