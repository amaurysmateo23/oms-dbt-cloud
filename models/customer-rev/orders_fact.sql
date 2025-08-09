Select 
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.EmployeeID,
    O.StoreID,
    O.StatusCD,
    O.StatusDesc,
    COUNT(DISTINCT O.OrderID) AS OrderCount, 
    SUM(OI.TotalPrice) AS Revenue--,
    -- Updated_at
FROM    
    {{ ref('orders_stg') }} O
JOIN
    {{ ref('ordersitems_stg') }} OI ON O.OrderID = OI.OrderID

Group By 1,2,3,4,5,6,7