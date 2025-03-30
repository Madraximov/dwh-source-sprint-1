INSERT INTO dwh.d_craftsman (craftsman_name, craftsman_address, craftsman_birthday, craftsman_email, load_dttm)
SELECT DISTINCT craftsman_name, 
                craftsman_address, 
                craftsman_birthday, 
                craftsman_email, 
                current_timestamp AS load_dttm
FROM source1.craft_market_wide
UNION
SELECT DISTINCT craftsman_name, 
                craftsman_address, 
                craftsman_birthday, 
                craftsman_email, 
                current_timestamp
FROM source2.craft_market_masters_products
UNION
SELECT DISTINCT craftsman_name, 
                craftsman_address, 
                craftsman_birthday, 
                craftsman_email, 
                current_timestamp
FROM source3.craft_market_craftsmans
UNION
SELECT DISTINCT craftsman_name, 
                craftsman_address, 
                craftsman_birthday, 
                craftsman_email, 
                current_timestamp
FROM external_source.craft_products_orders;
