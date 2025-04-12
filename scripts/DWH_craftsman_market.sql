MERGE INTO dwh.d_craftsman AS target
USING (
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
    FROM external_source.craft_products_orders
) AS source
ON target.craftsman_name = source.craftsman_name
AND target.craftsman_address = source.craftsman_address
AND target.craftsman_birthday = source.craftsman_birthday
AND target.craftsman_email = source.craftsman_email

WHEN MATCHED THEN
    UPDATE SET load_dttm = current_timestamp

WHEN NOT MATCHED THEN
    INSERT (craftsman_name, craftsman_address, craftsman_birthday, craftsman_email, load_dttm)
    VALUES (source.craftsman_name, source.craftsman_address, source.craftsman_birthday, source.craftsman_email, source.load_dttm);
