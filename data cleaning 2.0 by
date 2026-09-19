create database data_cleaning;

use data_cleaning;

CREATE TABLE retail_orders_dirty (
    row_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(20),
    customer_name VARCHAR(100),
    customer_email VARCHAR(100),
    phone_number VARCHAR(30),
    gender VARCHAR(20),
    city VARCHAR(50),
    state_name VARCHAR(50),
    country VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity VARCHAR(20),
    unit_price VARCHAR(20),
    total_amount VARCHAR(30),
    order_date VARCHAR(50),
    payment_method VARCHAR(50),
    order_status VARCHAR(50),
    discount VARCHAR(20),
    customer_age VARCHAR(20),
    pincode VARCHAR(20),
    remarks VARCHAR(255)
);


INSERT INTO retail_orders_dirty 
(order_id, customer_name, customer_email, phone_number, gender, city, state_name, country,
product_name, category, quantity, unit_price, total_amount, order_date,
payment_method, order_status, discount, customer_age, pincode, remarks)

VALUES

('ORD101','Naveen Singh','naveen@gmail.com','9876543210','Male','Delhi','Delhi','India',
'Laptop','Electronics','2','55000','110000','2025-01-15',
'UPI','Delivered','10','23','110001','Good customer'),

('ORD102','  Riya Sharma ','riya@gmail.com ','9999988888','Female','Mumbai','Maharashtra','India',
'Mobile','Electronics','1','30000','30000','15/01/2025',
'Cash','Delivered','5','21','400001',''),

('ORD103','Aman Verma','aman@gmail','8888877777','male','delhi','Delhi','India',
'Headphones','Electronics','2','2500','5000','01-16-2025',
'Card','Shipped','','19','110001','NULL'),

('ORD104','Priya Kapoor',NULL,'98765','Female','Bangalore','Karnataka','India',
'Shoes','Fashion','1','abc','5000','2025/01/18',
'UPI','Pending','0','Twenty Two','560001','Wrong price'),

('ORD105','Rahul Mehta','rahul@gmail.com','7777766666','M','Chennai','Tamil Nadu','India',
'T-shirt','Fashion','3','1000','3000','18 Jan 2025',
'COD','Delivered','2','25','600001',''),

('ORD105','Rahul Mehta','rahul@gmail.com','7777766666','M','Chennai','Tamil Nadu','India',
'T-shirt','Fashion','3','1000','3000','18 Jan 2025',
'COD','Delivered','2','25','600001','Duplicate Row'),

('ORD106','Sneha Joshi','sneha@gmail.com','6666655555','Female ','Pune','Maharashtra','India',
'Watch','Accessories','-1','4500','-4500','2025-01-20',
'Card','Returned','0','24','411001','Negative quantity'),

('ORD107','','kartik@gmail.com','5555544444','Male','Hyderabad','Telangana','India',
'Bag','Fashion','2','1500','3000','2025-13-01',
'UPI','Delivered','5','27','500001','Invalid date'),

('ORD108','Anjali Gupta','anjali@gmail.com','4444433333','FEMALE','Kolkata','West Bengal','India',
'Laptop','Electronics','1','58000','58000','2025-01-22',
'Crypto','Delivered','10','22','700001','Invalid payment'),

('ORD109','Vikas Sharma','vikas@gmail.com','3333322222','Male','Delhi ','Delhi','India',
'Tablet','Electronics','NULL','20000','40000','2025-01-23',
'Card','Shipped','','30','110001','Quantity missing'),

('ORD110','Neha Arora','neha@gmail.com','2222211111','Female','Mumbai','Maharashtra','India',
'Camera','Electronics','1','45000','45000','2025-01-24',
'UPI','delivered','5','26','400001','Lowercase status'),

('ORD111','Arjun Singh','arjun@gmail.com','1111100000','Male','Jaipur','Rajasthan','India',
'Speaker','Electronics','2','3500 ','7000 ','2025-01-25',
'Card','Delivered',' ','29','302001','Extra spaces'),

('ORD112','Pooja Malhotra','pooja@gmail.com','9999911111','Female','Delhi','Delhi','India',
'Mouse','Electronics','0','700','0','2025-01-26',
'UPI','Cancelled','0','23','110001','Zero quantity'),

('ORD113','Karan Patel','karan@gmail.com','8888811111','Male','Ahmedabad','Gujarat','India',
'Keyboard','Electronics','1','1500','1500','2025-01-27',
'Card','Delivered','105','31','380001','Invalid discount'),

('ORD114','Simran Kaur','simran@gmail.com','7777711111','Female','Chandigarh','Punjab','India',
'Monitor','Electronics','1','12000','12000','2025-01-28',
'UPI','Delivered','5','-5','160001','Negative age');

##Task 1
##Display the complete dataset and inspect all columns manually.


SELECT * FROM data_cleaning.retail_orders_dirty;
describe retail_orders_dirty;	

-- Task 2
-- Count the total number of records in the dataset

select count(*) from retail_orders_dirty
;

-- Check the structure of the table.
-- Find
-- •	Column names 
-- •	Data types 
-- •	Nullability 


desc retail_orders_dirty;

-- Task 4
-- Identify columns that should not be stored as VARCHAR.

SELECT * FROM data_cleaning.retail_orders_dirty;

-- | Column Name  | Current Type | Correct Type  | Reason                                              |
-- | ------------ | ------------ | ------------- | --------------------------------------------------- |
-- | quantity     | VARCHAR      | INT           | Stores quantity numbers                             |
-- | unit_price   | VARCHAR      | DECIMAL(10,2) | Stores price values                                 |
-- | total_amount | VARCHAR      | DECIMAL(10,2) | Stores calculated sales amount                      |
-- | order_date   | VARCHAR      | DATE          | Stores dates                                        |
-- | discount     | VARCHAR      | DECIMAL(5,2)  | Stores percentage/numeric values                    |
-- | customer_age | VARCHAR      | INT           | Stores age numbers                                  |
-- | pincode      | VARCHAR      | VARCHAR(10)   | Correct as VARCHAR because pincodes are identifiers |

ALTER TABLE retail_orders_dirty
MODIFY COLUMN quantity INT;


-- --cleaning
update retail_orders_dirty
set quantity =2
where quantity="null"; 

SELECT * FROM data_cleaning.retail_orders_dirty;

update retail_orders_dirty
set unit_price=25000
where unit_price="abc"; 

update retail_orders_dirty
set customer_age= case
when customer_age='Twenty Two'then 22
when customer_age= -5 then 5
end
where customer_age='Twenty Two'
or customer_age=-5;
 
 update retail_orders_dirty
 set discount=case
 when discount='null'then 4
 when discount=' ' then 4
 when discount = ''then 4
 end
 where discount in ('null',' ','');
 
 ALTER TABLE retail_orders_dirty
MODIFY COLUMN unit_price DECIMAL(10,2),
MODIFY COLUMN total_amount DECIMAL(10,2),
MODIFY COLUMN discount DECIMAL(5,2),
MODIFY COLUMN customer_age INT;

desc retail_orders_dirty;

-- Task 5
-- Find all records where customer email is NULL.


select customer_email from retail_orders_dirty
where customer_email is null;

-- Task 6
-- Find records where customer name is blank or contains only spaces.

select customer_name
from retail_orders_dirty
where trim(customer_name)='';

-- Task 7
-- Find rows where quantity contains:
-- •	NULL 
-- •	blank values 
-- •	text like 'NULL' 


SELECT * FROM data_cleaning.retail_orders_dirty;

SELECT * FROM data_cleaning.retail_orders_dirty
where quantity is null
or quantity = ''
or upper(quantity)='NULL';

 -- Replace missing customer emails with:
 
 update retail_orders_dirty
 set customer_email ='unknown@gmail.com'
 where customer_email is null;

-- Task 9
-- Identify duplicate order IDs.

select order_id,count(order_id)
from retail_orders_dirty
group by order_id	
having count(order_id)>1;

-- Display complete duplicate rows.

SELECT * FROM data_cleaning.retail_orders_dirty;

SELECT order_id, customer_name, customer_email, phone_number,
       gender, city, state_name, country, product_name,
       category, quantity, unit_price, total_amount,
       order_date, payment_method, order_status,
       discount, customer_age, pincode,
       COUNT(*) AS duplicate_count
FROM retail_orders_dirty
GROUP BY order_id, customer_name, customer_email, phone_number,
         gender, city, state_name, country, product_name,
         category, quantity, unit_price, total_amount,
         order_date, payment_method, order_status,
         discount, customer_age, pincode
HAVING COUNT(*) > 1;


-- Remove duplicate records while keeping only one valid row. 

 -- Task 12
UPDATE retail_orders_dirty
SET 
    customer_name = TRIM(customer_name),
    city = TRIM(city),
    unit_price = TRIM(unit_price),
    total_amount = TRIM(total_amount);

SELECT * FROM data_cleaning.retail_orders_dirty;

-- task 13
-- Find records still containing unnecessary spaces after cleaning
SELECT *
FROM retail_orders_dirty
WHERE 
    customer_name != TRIM(customer_name)
    OR city != TRIM(city)
    OR unit_price != TRIM(unit_price)
    OR total_amount != TRIM(total_amount);
    
    
update retail_orders_dirty
    set gender= case	
    when upper(gender) in ('Male','M') then 'Male'
    when upper(gender) in ('Female','F') then 'Female'
    else gender end;
    
  --   Task 15
update retail_orders_dirty
    set city= case	
    when upper(city) in ('delhi') then 'Delhi'
else city end;
 
-- task 16     
update retail_orders_dirty
    set order_status= case	
    when upper(order_status) in ('delivered') then 'Delivered'
else order_status end;

SELECT * FROM data_cleaning.retail_orders_dirty;

UPDATE retail_orders_dirty
SET order_status = 'Delivered'
WHERE order_status = 'Delhi';
 
 UPDATE retail_orders_dirty
SET order_status = 'Delivered'
WHERE order_status = 'Pune';


 UPDATE retail_orders_dirty
SET order_status = 'Delivered'
WHERE order_status = 'Bangalore';

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 17
-- Find invalid email addresses.

select * from retail_orders_dirty
where customer_email not like '%@%'
or customer_email not like '%.%';

update retail_orders_dirty
set customer_email= 'aman@gmail.com'
where customer_email='aman@gmail';

-- Task 18
-- Replace invalid emails with NULL

UPDATE retail_orders_dirty
SET customer_email = NULL
WHERE customer_email NOT LIKE '%@%.%';

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Find invalid phone numbers.
-- Must contain exactly 10 digits 

select phone_number from retail_orders_dirty
where length(phone_number)!=10;

-- Task 20
-- Separate invalid phone numbers into an error table.
CREATE TABLE invalid_phone_numbers (
    row_id INT,
    order_id VARCHAR(20),
    customer_name VARCHAR(100),
    phone_number VARCHAR(30),
    error_reason VARCHAR(100)
);


-- Step 2: Insert invalid phone number records

INSERT INTO invalid_phone_numbers
(row_id, order_id, customer_name, phone_number, error_reason)

SELECT
    row_id,
    order_id,
    customer_name,
    phone_number,
    'Invalid phone number'
FROM retail_orders_dirty
WHERE phone_number IS NULL
   OR LENGTH(phone_number) != 10
   OR phone_number NOT REGEXP '^[0-9]{10}$';

-- Step 3: View error records

SELECT * 
FROM invalid_phone_numbers;


-- Task 21
-- Find rows where quantity is
-- •	negative -- 
-- •	zero 
-- •	text 
-- •	NULL 


SELECT *
FROM retail_orders_dirty
WHERE quantity IS NULL
   OR TRIM(quantity) = ''
   OR UPPER(quantity) = 'NULL'
   OR quantity REGEXP '[A-Za-z]'
   OR quantity < 0
   OR quantity  = 0;

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 22
-- Find rows where unit_price contains text values.
-- Example:
-- •	abc 


select * from retail_orders_dirty
where unit_price regexp'[A-Za-z]';

-- Task 23
-- Replace invalid prices with NULL.

UPDATE retail_orders_dirty
SET unit_price = NULL
WHERE unit_price REGEXP '[A-Za-z]';

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 24
-- Find rows where total_amount does not equal:
-- quantity * unit_price

SELECT *,
       (quantity * unit_price) AS calculated_total
FROM retail_orders_dirty
WHERE total_amount != (quantity * unit_price);


-- Task 25
-- Identify all different date formats in the dataset

SELECT 
    order_date,
    CASE

        -- YYYY-MM-DD
        WHEN order_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
        THEN 'YYYY-MM-DD'

        -- DD/MM/YYYY
        WHEN order_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
        THEN 'DD/MM/YYYY'

        -- MM-DD-YYYY
        WHEN order_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$'
        THEN 'MM-DD-YYYY'

        -- YYYY/MM/DD
        WHEN order_date REGEXP '^[0-9]{4}/[0-9]{2}/[0-9]{2}$'
        THEN 'YYYY/MM/DD'

        -- DD Mon YYYY
        WHEN order_date REGEXP '^[0-9]{2} [A-Za-z]{3} [0-9]{4}$'
        THEN 'DD Mon YYYY'

        ELSE 'Unknown Format'

    END AS date_format

FROM retail_orders_dirty;

ALTER TABLE retail_orders_dirty
ADD COLUMN clean_order_date date;

UPDATE retail_orders_dirty
SET clean_order_date =
CASE

    -- DD/MM/YYYY
    WHEN order_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
    THEN STR_TO_DATE(order_date, '%d/%m/%Y')

    -- MM-DD-YYYY
    WHEN order_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$'
    THEN STR_TO_DATE(order_date, '%m-%d-%Y')

    -- YYYY/MM/DD
    WHEN order_date REGEXP '^[0-9]{4}/[0-9]{2}/[0-9]{2}$'
    THEN STR_TO_DATE(order_date, '%Y/%m/%d')
    

    -- DD Mon YYYY
    WHEN order_date REGEXP '^[0-9]{2} [A-Za-z]{3} [0-9]{4}$'
    THEN STR_TO_DATE(order_date, '%d %b %Y')

    ELSE NULL

END;

UPDATE retail_orders_dirty
SET clean_order_date =
CASE
    -- YYYY-MM-DD (valid month/day check)
    WHEN order_date REGEXP '^[0-9]{4}-[0-9]{2}-[0-9]{2}$'
         AND SUBSTRING(order_date,6,2) BETWEEN '01' AND '12'
         AND SUBSTRING(order_date,9,2) BETWEEN '01' AND '31'
    THEN STR_TO_DATE(order_date, '%Y-%m-%d')

    -- DD/MM/YYYY
    WHEN order_date REGEXP '^[0-9]{2}/[0-9]{2}/[0-9]{4}$'
    THEN STR_TO_DATE(order_date, '%d/%m/%Y')

    -- MM-DD-YYYY
    WHEN order_date REGEXP '^[0-9]{2}-[0-9]{2}-[0-9]{4}$'
    THEN STR_TO_DATE(order_date, '%m-%d-%Y')

    -- YYYY/MM/DD
    WHEN order_date REGEXP '^[0-9]{4}/[0-9]{2}/[0-9]{2}$'
    THEN STR_TO_DATE(order_date, '%Y/%m/%d')
    

    -- DD Mon YYYY
    WHEN order_date REGEXP '^[0-9]{2} [A-Za-z]{3} [0-9]{4}$'
    THEN STR_TO_DATE(order_date, '%d %b %Y')

    ELSE NULL

END;

SELECT * FROM data_cleaning.retail_orders_dirty;

-- dropped wrong date column
alter table retail_orders_dirty
drop column order_date;
  
-- Task 28
-- Find invalid payment methods.

select payment_method from retail_orders_dirty
where payment_method not in ("UPI","Card","COD","Cash");

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 29
-- Find records where discount exceeds 50%.

alter table retail_orders_dirty
add column discount_in_percentage decimal(10,2);

update retail_orders_dirty
set discount_in_percentage= discount/100;

select discount_in_percentage from retail_orders_dirty
where discount_in_percentage >0.50;

-- Task 30
-- Find negative customer ages

SELECT * FROM data_cleaning.retail_orders_dirty;

select customer_age from retail_orders_dirty
where customer_age<0;

-- Task 31
-- Find non-numeric customer ages.

select customer_age from retail_orders_dirty
where customer_age regexp "[A-Za-z]";


SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 32
-- Rename column:
-- state_name → state

ALTER TABLE retail_orders_dirty
RENAME COLUMN state_name TO state;


-- Task 33
-- Change column data types.
-- Convert:
-- Column	New Data Type
-- quantity	INT
-- unit_price	DECIMAL(10,2)
-- total_amount	DECIMAL(10,2)
-- customer_age	INT
-- order_date	DATE
describe retail_orders_dirty;

alter table retail_orders_dirty	
modify column quantity int;

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 34
-- Create a new column named full_address.

select concat(city," ", state," ",country," ")from retail_orders_dirty;

alter table retail_orders_dirty
add column full_address  varchar(200);

UPDATE retail_orders_dirty
SET full_address = CONCAT(city, ' ', state, ' ', country);

-- Task 35
-- Create customer age groups


alter table retail_orders_dirty
add column customer_category  varchar(200);

update retail_orders_dirty
set customer_category =  case 
when customer_age between 0 and 25 then "Young"
when customer_age between 25 and 45 then "Adult"
when customer_age>45 then "Senior" 
end;


-- Task 36
-- Create a cleaned total amount column.
-- already done in total amount column...


SELECT * FROM data_cleaning.retail_orders_dirty;

UPDATE retail_orders_dirty
SET phone_number = "unknown"
WHERE phone_number = 98765;

UPDATE retail_orders_dirty
SET remarks = "unknown"
WHERE remarks = "" ;

UPDATE retail_orders_dirty
SET remarks = 'Unknown'
WHERE remarks ="NULL";

SELECT * FROM data_cleaning.retail_orders_dirty;
-- Task 37
-- Create a fully cleaned table named:

-- Task 38
-- Remove unnecessary columns from final table.


-- Task 40
-- Add NOT NULL constraints to important columns.
-- Examples:
-- •	order_id 
-- •	customer_name 
-- •	order_date 

ALTER TABLE retail_orders_dirty
MODIFY order_id INT NOT NULL,
MODIFY customer_name VARCHAR(100) NOT NULL,
MODIFY order_date DATE NOT NULL;


-- Task 41
-- Check if any duplicate order IDs still exist.

select order_id, count(*) as duplicate_count
 from retail_orders_dirty	
GROUP BY order_id
having count(*) >1;


delete from retail_orders_dirty
where row_id =5;

SELECT * FROM data_cleaning.retail_orders_dirty;

-- customer name modified to unknown on row id 8

UPDATE retail_orders_dirty
SET customer_name = 'Unknown'
WHERE customer_name ="";


-- Task 42
-- Check if any NULL emails still exist.

select * from retail_orders_dirty
where customer_email is null;

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 43
-- Check if any invalid payment methods still exist


SELECT *
FROM retail_orders_dirty
WHERE payment_method NOT IN ('UPI', 'Card', 'COD', 'Cash')
   OR payment_method IS NULL
   OR TRIM(payment_method) = '';


-- or
SELECT DISTINCT payment_method
FROM retail_orders_dirty
WHERE payment_method != 'Cash'
AND payment_method != 'Credit Card'
AND payment_method != 'Debit Card'
AND payment_method != 'UPI'
AND payment_method != 'Net Banking';

-- or
SELECT DISTINCT payment_method
FROM retail_orders_dirty
WHERE payment_method NOT LIKE 'Cash'
AND payment_method NOT LIKE 'UPI';

SELECT * FROM data_cleaning.retail_orders_dirty;

-- Task 44
-- Check if any negative quantities still exist.

select quantity
from retail_orders_dirty
where quantity<0;

-- Task 45
-- Check if any incorrect dates still exist.

select * from retail_orders_dirty 
where clean_order_date is null;



