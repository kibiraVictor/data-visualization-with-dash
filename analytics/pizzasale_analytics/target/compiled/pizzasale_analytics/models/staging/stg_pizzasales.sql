-- the idea is to have a source of our data
-- thus i am going to select everything from table in postgres
-- i will use this as a source for the other models



-- create a cte for selecting all the data from the table in the db

with stg_pizza_sales as (
    select
        -- first i create a surrogate key that is going to uniquely identify my records
        md5(cast(coalesce(cast(pizza_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as pizzaid,

        -- gonna work on identifiers first, ensuring they are correctly casted
        -- we have pizza_id, order_id

        
    
    cast(pizza_id as integer)
 as pizza_id,
        
    
    cast(order_id as integer)
 as order_id,

        -- working on the other attributes
        pizza_name_id as pizza_name_id,
        
    
    cast(quantity as integer)
 as quantity,
        cast(order_date as timestamp) as order_date,
        cast(order_time as timestamp) as order_time,
        cast(unit_price as numeric) as unit_price,
        cast(total_price as numeric) as total_price,
        pizza_size,
        pizza_category,
        pizza_ingredients,
        pizza_name
    from "pizza_sales"."public"."pizzasales"
)

select
    *
from stg_pizza_sales