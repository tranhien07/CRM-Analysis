-- select count(invoice) as total_transactions_2_items
-- from (
-- 	select invoice, count(distinct(ta.`Item Name`)) as number_item
-- 	from test_assesment ta 
-- 	group by invoice
-- 	having number_item >= 2
-- ) as NI ;

-- complete the information table
with segmentation_by_account as(
	select ta.`Member Account Code`, sum(ta.`Sales Amt`)/26400 as Sales_USD,
			case
				when sum(ta.`Sales Amt`)/26400 >= 50000 then 'Platinum'
				when sum(ta.`Sales Amt`)/26400 < 50000 and sum(ta.`Sales Amt`)/26400 >=25000 then 'Gold'
				when sum(ta.`Sales Amt`)/26400 < 25000 and sum(ta.`Sales Amt`)/26400 >=10000 then 'Silver'
				when sum(ta.`Sales Amt`)/26400 < 10000 and sum(ta.`Sales Amt`)/26400 >=3000 then 'CT'
				else 'Others'
			end as segmentation		
	from test_assesment ta
	group by ta.`Member Account Code`
) -- create CTE
select 'Total' as seg,
		count(distinct(ta.`Member Account Code`)) as total_clients,
		sum(`Sales Amt`)/26400 as total_sales,
		count(distinct(invoice)) as total_transactions,
		sum(`Sales Qty`) as total_items_sold,
		(
			select count(invoice)
			from (
				select invoice, count(distinct(ta.`Item Name`)) as number_item
				from test_assesment ta 
				group by invoice
				having number_item >= 2
			)NI
		) as total_transactions_2_items ,
		(sum(`Sales Amt`)/26400)/count(distinct(invoice)) as ATV,
		sum(`Sales Qty`)/count(distinct(invoice)) as UPT
from test_assesment ta
UNION
select 'Platinum' as seg,
		count(distinct(ta.`Member Account Code`)) as total_clients,
		sum(`Sales Amt`)/26400 as total_sales,
		count(distinct(invoice)) as total_transactions,
		sum(`Sales Qty`) as total_items_sold,
		(
			select count(invoice)
			from (
				select invoice, count(distinct(ta.`Item Name`)) as number_item
				from test_assesment ta
				where `Member Account Code`in(
					select `Member Account Code`
					from segmentation_by_account
					where segmentation = 'Platinum'
				)
				group by invoice
				having number_item >= 2
			)NI
		) as total_transactions_2_items,
		(sum(`Sales Amt`)/26400)/count(distinct(invoice)) as ATV,
		sum(`Sales Qty`)/count(distinct(invoice)) as UPT
from test_assesment ta
	where `Member Account Code` in (
		select `Member Account Code`
		from segmentation_by_account
		where segmentation = 'Platinum'
	)
UNION
select 'Gold' as seg,
		count(distinct(ta.`Member Account Code`)) as total_clients,
		sum(`Sales Amt`)/26400 as total_sales,
		count(distinct(invoice)) as total_transactions,
		sum(`Sales Qty`) as total_items_sold,
		(
			select count(invoice)
			from (
				select invoice, count(distinct(ta.`Item Name`)) as number_item
				from test_assesment ta
				where `Member Account Code`in(
					select `Member Account Code`
					from segmentation_by_account
					where segmentation = 'Gold'
				)
				group by invoice
				having number_item >= 2
			)NI
		) as total_transactions_2_items,
		(sum(`Sales Amt`)/26400)/count(distinct(invoice)) as ATV,
		sum(`Sales Qty`)/count(distinct(invoice)) as UPT
from test_assesment ta
	where `Member Account Code` in (
		select `Member Account Code`
		from segmentation_by_account
		where segmentation = 'Gold'
	)
UNION
select 'Silver' as seg,
		count(distinct(ta.`Member Account Code`)) as total_clients,
		sum(`Sales Amt`)/26400 as total_sales,
		count(distinct(invoice)) as total_transactions,
		sum(`Sales Qty`) as total_items_sold,
		(
			select count(invoice)
			from (
				select invoice, count(distinct(ta.`Item Name`)) as number_item
				from test_assesment ta
				where `Member Account Code`in(
					select `Member Account Code`
					from segmentation_by_account
					where segmentation = 'Silver'
				)
				group by invoice
				having number_item >= 2
			)NI
		) as total_transactions_2_items,
		(sum(`Sales Amt`)/26400)/count(distinct(invoice)) as ATV,
		sum(`Sales Qty`)/count(distinct(invoice)) as UPT
from test_assesment ta
	where `Member Account Code` in (
		select `Member Account Code`
		from segmentation_by_account
		where segmentation = 'Silver'
	)
UNION
select 'CT' as seg,
		count(distinct(ta.`Member Account Code`)) as total_clients,
		sum(`Sales Amt`)/26400 as total_sales,
		count(distinct(invoice)) as total_transactions,
		sum(`Sales Qty`) as total_items_sold,
		(
			select count(invoice)
			from (
				select invoice, count(distinct(ta.`Item Name`)) as number_item
				from test_assesment ta
				where `Member Account Code`in(
					select `Member Account Code`
					from segmentation_by_account
					where segmentation = 'CT'
				)
				group by invoice
				having number_item >= 2
			)NI
		) as total_transactions_2_items,
		(sum(`Sales Amt`)/26400)/count(distinct(invoice)) as ATV,
		sum(`Sales Qty`)/count(distinct(invoice)) as UPT
from test_assesment ta
	where `Member Account Code` in (
		select `Member Account Code`
		from segmentation_by_account
		where segmentation = 'CT'
	)
UNION
select 'Others' as seg,
		count(distinct(ta.`Member Account Code`)) as total_clients,
		sum(`Sales Amt`)/26400 as total_sales,
		count(distinct(invoice)) as total_transactions,
		sum(`Sales Qty`) as total_items_sold,
		(
			select count(invoice)
			from (
				select invoice, count(distinct(ta.`Item Name`)) as number_item
				from test_assesment ta
				where `Member Account Code`in(
					select `Member Account Code`
					from segmentation_by_account
					where segmentation = 'Others'
				)
				group by invoice
				having number_item >= 2
			)NI
		) as total_transactions_2_items,
		(sum(`Sales Amt`)/26400)/count(distinct(invoice)) as ATV,
		sum(`Sales Qty`)/count(distinct(invoice)) as UPT
from test_assesment ta
	where `Member Account Code` in (
		select `Member Account Code`
		from segmentation_by_account
		where segmentation = 'Others'
	);

-- Q1.1: Top 10 Member Account Code by Sales Quantity
select ta.`Member Account Code`, sum(ta.`Sales Qty`) as total_items_by_account
from test_assesment ta
group by ta.`Member Account Code`
order  by total_items_by_account desc
limit 10;

-- Q1.2: Top 10 Member Account Code by Sales Amount
select ta.`Member Account Code`, sum(ta.`Sales Amt`)/26400 as salesUSD_by_account
from test_assesment ta
group by ta.`Member Account Code`
order  by salesUSD_by_account desc
limit 10;

-- Q2: Analyze by Scheme Name by Sales Quantity & Sales Amount
select ta.`Scheme Name`,
	count(distinct(ta.`Member Account Code`)) as total_customers,
	count(distinct(ta.`invoice`)) as total_transaction_by_scheme,
	sum(ta.`Sales Qty`) as total_items_by_scheme,
	sum(ta.`Sales Amt`)/26400 as total_sales_by_scheme
from test_assesment ta
group by`Scheme Name`
order by total_sales_by_scheme desc;

-- Q3.1: Top 10 Items sold by Sales Quantity
select ta.`Item Name`, sum(ta.`Sales Qty`) as items_by_name
from test_assesment ta
group by`Item Name`
order by items_by_name desc
limit 10;

-- Q3.1: Top 10 Items sold by Sales Amount
select ta.`Item Name`, sum(ta.`Sales Amt`)/26400 as sales_by_name
from test_assesment ta
group by`Item Name`
order by sales_by_name desc
limit 10;

-- Analyze by Month
select DATE_FORMAT(str_to_date(`date`, '%m/%d/%Y'), '%m-%Y') as month,
	count(distinct(ta.`Member Account Code`)) as total_customers,
	count(distinct(ta.`invoice`)) as total_transactions_by_month,
	sum(ta.`Sales Qty`) as total_items_by_month,
	sum(ta.`Sales Amt`)/26400 as total_sales_by_month	
from test_assesment ta
group by month;













