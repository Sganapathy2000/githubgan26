select *from fact
select *from Location
select *from Product
1
select COUNT(distinct state)  from location
2
select count(*) as countRegular from product where type='Regular'
3
select sum(marketing) from fact where ProductId=1

select productid,sum(marketing) from fact
group by ProductId
having ProductId=1
4
select min(sales) from fact

select ProductId,min(sales) from fact
group by ProductId
order by ProductId
5 select max(cogs) from fact

6 select * from product where product_type='Coffee'
7 select * from fact where Total_Expenses>40
8 select avg(sales) from fact where Area_Code=719

9 select sum(profit) as total_profit from fact join location
on fact.Area_Code=location.area_code
where state='Colorado'
select sum(profit) as total_profit from fact
where Area_Code in (select Area_Code from location where state='Colorado')

10 select ProductId,avg(inventory) as avg_inventory from fact
group by ProductId
order by ProductId desc

11 select distinct state from location order by state
select * from location order by state

12 select ProductId,avg(Budget_Margin) as avg_bm from fact
group by ProductId
having avg(Budget_Margin)>100

13 select sum(sales) as total_sales from fact
where Date='2010-01-01'

14 select ProductId,Date,avg(Total_Expenses) from fact
group by ProductId,Date
order by ProductId,Date

15  select date,fact.ProductId,product_type,product ,sales,Profit,state,fact.Area_Code from fact
join location
on fact.Area_Code=location.area_code
join product
on fact.ProductId=product.productid

16 select *,DENSE_RANK() OVER (Order by Sales desc) as rank_sales from fact

17 select state,sum(profit) as total_profit,SUM(Sales) as total_sales from fact
join location
on fact.Area_Code=Location.area_code
group by state

18 select state,product,sum(profit) as total_profit,SUM(Sales) as total_sales from fact
join location
on fact.Area_Code=Location.area_code
join product
on fact.ProductId=product.productid
group by state,product
order by state,product

19 select sales,sales*1.05 as increasedsales from fact

20  select fact.productid max(profit) as max_profit,product.producttype
from fact inner join product on fact .productid=product.productid
group by fact.productid,producttype

21
create procedure ptype @prod_typ varchar(20) as

select *from product

where product_type=@prod_typ

exec ptype @prod_type='coffe'

22
select total_expenses ,iif(total_expenses> 60,'profit','loss') as profitloss from fact