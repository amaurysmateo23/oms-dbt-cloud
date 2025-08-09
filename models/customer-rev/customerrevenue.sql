Select 
    OS.CustomerID,
    C.CustomerName,
    SUM(OS.OrderCount) AS OrderCount,
    SUM(OS.Revenue) AS Revenue
FROM
    {{ ref('orders_fact') }} OS
JOIN
    {{ ref('customers_stg') }} C ON OS.CustomerID = C.CustomerID
Group By
    OS.CustomerID,
    C.CustomerName