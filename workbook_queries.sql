# Day 2 tasks: (basics)
use northwind;
select * from customers;
select CustomerName, City from customers;
select distinct City from customers;
select * from products where price > 50;
select * from customers where Country = 'UK' or Country = 'USA';
select * from orders order by OrderDate desc;
select * from products where Price between 20 and 50 order by Price desc;
select * from customers where Country = 'USA' and City in('Portland','Kirkland') order by CustomerName asc;
select * from customers where Country = 'UK' or City = 'London' order by CustomerName desc;
select * from products where CategoryID in (1,2) order by ProductName desc;

# Day 3 tasks: (JOIN practice)
use northwind;
select distinct ProductID, ProductName, SupplierName from products left join suppliers on products.SupplierID = suppliers.SupplierID;
select distinct ProductName, CategoryName from categories right join products on products.CategoryID = categories.CategoryID;
select distinct ProductName, CategoryName from categories inner join products on products.CategoryID = categories.CategoryID where CategoryName = 'Meat/Poultry';
select OrderID, OrderDate, CustomerName, concat_ws(' ',FirstName, LastName) as EmployeeName from orders left join customers on orders.CustomerID = customers.CustomerID left join employees on  orders.EmployeeID = employees.EmployeeID;
select ProductName, CategoryName, SupplierName from products left join suppliers on products.SupplierID = suppliers.SupplierID left join categories on products.CategoryID = categories.CategoryID;
select OrderID, OrderDate, ShipperName, CustomerName, Address, City, PostalCode, Country, ContactName, concat_ws(' ',FirstName, LastName) as EmployeeName, Photo, Notes from orders left join customers using(CustomerID) left join employees using(EmployeeID) left join shippers using(ShipperID) where OrderDate like '1996%';
select distinct CategoryName, count(ProductID) as Quantity from categories left join products on categories.CategoryID = products.CategoryID group by categories.CategoryID;
select ProductName, Unit, Price, sum(Quantity) as Quantity_Ordered from products left join order_details using(ProductID) group by ProductID;

# Day 4 (Practical)
use world;
select * from city;
select * from country;
select * from countrylanguage;
select * from country join city on country.Code = city.CountryCode join countrylanguage on country.Code = countrylanguage.CountryCode;

select CountryCode, count(ID) as TotalNumberOfCities from city where CountryCode = 'USA';
select Name as Country, LifeExpectancy from country order by LifeExpectancy desc limit 1;
select Name from city where Name like '%New %'; # if the space after new is not wanted: select * from city where Name like '%New%';
select city.Name as City, country.Name as Country, District, city.Population from city join country on city.ID = country.Capital order by city.Population desc limit 10;
select city.Name as City, country.Name as Country, District, city.Population from city join country on city.ID = country.Capital where city.Population > '2000000';
select Name from city where Name like 'Be%';
select city.Name as City, country.Name as Country, District, city.Population from city join country on city.ID = country.Capital where city.Population between '500000' and '1000000';
select city.Name as City, country.Name as Country, District, city.Population from city join country on city.ID = country.Capital order by city.Name asc;
select city.Name as City, country.Name as Country, District, city.Population from city join country on city.ID = country.Capital order by city.Population desc limit 1;
select distinct Name, count(ID) from city group by Name order by Name asc; 
select city.Name as City, country.Name as Country, city.Population from city join country on city.ID = country.Capital order by city.Population asc limit 1;
select Name, LocalName, Continent, Region, Population from country order by Population desc limit 1;
select country.Name as Country, city.Name as City from country join city on country.Capital = city.ID where country.Name = 'Spain';
select country.Name as Country, city.Name as City from country join city on country.Capital = city.ID where Continent = 'Europe';
select distinct CountryCode, avg(Population) as AveragePopulation from city group by CountryCode; 
select country.Name as Country, city.Name as City, city.Population from country join city on country.Capital = city.ID order by city.Population asc;
select Name as Country, Population/SurfaceArea as PopulationDensity from country order by PopulationDensity asc;
select city.Name as City, country.Name as Country, District, city.Population from city join country on city.ID = country.Capital order by city.Population limit 10 offset 30;
