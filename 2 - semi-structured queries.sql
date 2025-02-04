-- Be sure to see the sample structure of the SRC column in the accompanying .json file!

use schema is566.semi_structured;


select 
    * 
from car_sales 
limit 2;

-- EXAMPLES
select
    SRC:promotions[0] as first_promotion
from 
    car_sales
limit 3;

select
    SRC:salesperson as salesperson_info,
    SRC:customer[0].phone as phone
from 
    car_sales;

select
    SRC:date as sale_date,
    SRC:vehicle[0].make as make,
    SRC:vehicle[0].model as model,
    SRC:vehicle[0].extras[0] as extra
from 
    car_sales;

-- Write a query to extract the dealership and date fields from the SRC column, along with 
-- the name of the salesperson from the SALESPERSON_INFO column.
-- 
-- Then modify your query to drive the year of the sale from the date column.

select 
    SRC:dealership as DealerName,
    year(SRC:date :: date) as SaleYear -- use double colons to cast to date
from car_sales 
limit 2;

-- Write a query to count the number of promotions (PROMOTIONS) applied to 
-- each sale. Include the dealership from the SRC column, and try it with
-- both the PROMOTIONS column as well as the promotions array nested within
-- the SRC column.

select 
    * 
from car_sales 
limit 2;


-- Write a query to find sales where there are multiple customers or multiple 
-- vehicles involved in the transaction. Include the date and dealership in 
-- the output.

select 
    * 
from car_sales 
limit 2;


-- List all distinct promotions from the PROMOTIONS column.
-- 
-- Modify your query to then provide a count of the number of times each 
-- promotion was applied.

select 
    * 
from car_sales 
limit 2;


-- Write a query to flatten the VEHICLE_INFO array and extract the make, 
-- model, and price of each vehicle for every sale.

--example
select
    sale_id,
    SRC:dealership as dealership,
    pr.VALUE as promotion
from
    car_sales,
lateral flatten(input => SRC:promotions) pr;

select
    pr.*
from
    car_sales,
lateral flatten(input => SRC:promotions) pr;

--------------------------------------------

select 
    * 
from car_sales 
limit 2;




-- Using LATERAL FLATTEN, calculate the total revenue (price) from all 
-- vehicles sold at each dealership. Include the dealership name.

select 
    * 
from car_sales 
limit 2;

