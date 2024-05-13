--first query
SELECT 
    p.product_name AS Product_Name, -- Creating an alias for the product name
    s.company_name AS Supplier_Name, -- Specifying an alias for the supplier name
    s.region AS Supplier_Region -- Designating an alias for the supplier region
FROM 
    products p -- Joining the products table
LEFT JOIN LATERAL (
    -- Subquery for retrieving supplier details for each product
    SELECT 
        company_name, -- Selecting the company name of the supplier
        region -- Choosing the region of the supplier
    FROM 
        suppliers s -- Joining the suppliers table
    WHERE 
        p.supplier_id = s.supplier_id -- Matching the supplier ID
    LIMIT 1 -- Limiting the result to one row (assuming one supplier per product)
) s ON TRUE; -- Joining using a LEFT JOIN with a LATERAL subquery



--second query
SELECT 
    e.last_name AS Employee_LastName, -- Using aliases for readability
    e.first_name AS Employee_FirstName,
    o.order_id AS Order_ID, -- Selecting order ID
    o.order_date AS Order_Date, -- Selecting order date
    o.shipped_date AS Shipped_Date -- Selecting shipped date
FROM 
    employees e -- Joining employees table
LEFT JOIN orders o ON e.employee_id = o.employee_id; -- Using LEFT JOIN to include all employees, even those without orders
