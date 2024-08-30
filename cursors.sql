create table customers(
  cust_id int,
  salary int,
  address varchar2(200)
);

insert into customers values(1, 1000, 'Pune');
insert into customers values(2, 2000, 'Pune');
insert into customers values(3, 2000, 'Pune');
insert into customers values(4, 1000, 'Pune');

DECLARE
CURSOR c_customers is
SELECT cust_id, address FROM customers;
c_cust_id customers.cust_id%type;
c_addr customers.address%type;
BEGIN
OPEN c_customers;
LOOP
FETCH c_customers into c_cust_id, c_addr;
EXIT WHEN c_customers%notfound;
dbms_output.put_line(c_cust_id || ' ' || c_addr);
END LOOP;
CLOSE c_customers;
END;
/
