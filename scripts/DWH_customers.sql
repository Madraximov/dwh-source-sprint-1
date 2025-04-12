insert into dwh.d_craftsman
select cmw.craftsman_id as craftsman_id,
	   cmw.craftsman_name as craftsman_name,
	   cmw.craftsman_address as craftsman_address,
	   cmw.craftsman_birthday as craftsman_birthday,
	   cmw.craftsman_email as craftsman_email,
	   current_date as load_dttm
from source1.craft_market_wide cmw
join source2.craft_market_masters_products as cmmp
	 on cmmp.craftsman_id = cmw.customer_id
join source3.craft_market_craftsmans cmc
	 on cmc.craftsman_id = cmw.craftsman_id
join external_source.craft_products_orders cpo
	 on cpo.craftsman_id = cmw.craftsman_id
