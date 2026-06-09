with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

order_payments as (
    select
        order_id,
        sum(amount) as total_amount
    from payments
    group by order_id
),

final as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        min(o.order_date)                   as first_order_date,
        max(o.order_date)                   as most_recent_order_date,
        count(o.order_id)                   as number_of_orders,
        sum(op.total_amount)                as customer_lifetime_value
    from customers c
    left join orders o using (customer_id)
    left join order_payments op using (order_id)
    group by 1, 2, 3
)

select * from final