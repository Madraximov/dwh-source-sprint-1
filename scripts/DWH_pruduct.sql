insert into dwh.f_order
select cmw.order_id as order_id,
	   cmw.product_id as product_id, 
	   cmw.craftsman_id as craftsman_id, 
	   cmw.customer_id as customer_id, 
	   cmw.order_created_date as order_created_date,
	   cmw.order_completion_date as order_completion_date, 
	   cmw.order_status as order_status, 
	   current_date laod_dttm
from source1.craft_market_wide cmw
join source2.craft_market_orders_customers cmoc
	 on cmoc.craftsman_id = cmw.craftsman_id 
join source2.craft_market_masters_products cmmp 
	 on cmmp.craftsman_id = cmw.craftsman_id 
join source3.craft_market_orders cmo 
	 on cmo.craftsman_id = cmw.craftsman_id 
join external_source.craft_products_orders cpo 
	 on cpo.craftsman_id = cmw.craftsman_id 