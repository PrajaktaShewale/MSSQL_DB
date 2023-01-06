--UC1 Create database
Create Database PayRoll_Services;

--UC2 create table 
create table employee_payroll(ID int primary key identity(1,1),Name varchar(200), salary bigint, startDate date);

--UC3 Insert data
insert into employee_payroll values('Charlie',40000,'2017-2-2','M'),('Radha',110000,'2022-3-3','F');

--UC4 
select*from employee_payroll;

--UC5 find perticular name from table or list
select*from employee_payroll where Name = 'Bill';
select*from employee_payroll where startDate between CAST ('2018-1-1' as date) and GETDATE();

--UC6 add new column
alter table employee_payroll add Gender varchar(10);
update employee_payroll set Gender ='M' where Name='Bill' or Name='Ram';

--UC7 find sum,min,max and total 
select SUM(salary) as empSalary from employee_payroll;
select Min(Salary) as MinSalary from employee_payroll;
select Max(Salary) as MaxSalary from employee_payroll;
select Count(id) as TotalRecord from employee_payroll;
select Count(id) as TotalRecord from employee_payroll where Gender = 'M' --group by explain later

--UC8extend data
alter table employee_payroll add Phone bigint;
alter table employee_payroll add Empaddress varchar(200) not null default 'Pune';
alter table employee_payroll add Department varchar(200) not null default 'IT'
select*from employee_payroll;

--UC9add Basic Pay,Deductions, Taxable Pay,Income Tax, Net Pay for that remove salary column
Alter Table dbo.employee_payroll
DROP COLUMN salary;
Alter Table dbo.employee_payroll
ADD BasicPay bigint NULL,Deductions bigint not null default 0.00,TaxablePay bigint not null default 0.00,IncomeTax bigint not null default 0.00,
NetPay bigint not null default 0.00;
update employee_payroll SET BasicPay=30000 where Name='raj'
update employee_payroll SET BasicPay=45000 where Name='Bill'
update employee_payroll SET BasicPay=50000 where Name='Ram'
update employee_payroll SET BasicPay=90000 where Name='Rohan'
update employee_payroll SET BasicPay=80000 where Name='Rma'
update employee_payroll SET BasicPay=35000 where Name='Charlie'
update employee_payroll SET BasicPay=56980 where Name='Radha'

--UC10 Create 2 differnt id with same name but differnt department
insert into employee_payroll values('Terissa','2018-5-2','F',6589321474,'Pune','Sales',25000,0.00,0.00,0.00,25000),
('Terissa','2020-5-3','F',6989321474,'Pune','Marketing',35000,0.00,0.00,0.00,35000);


--for delete complete table
drop table employee_payroll;

