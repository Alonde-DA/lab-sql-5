-- Drop column picture from staff

alter table staff
drop column picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

INSERT INTO staff (first_name, last_name, email, address_id, store_id, last_update, username)
values ('TAMMY', 'SANDERS', 'TAMMY.SANDERS@sakilacustomer.org', '79', '2', '2006-02-15 04:57:20', 'Tammy');

select *
from staff;

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the rental_date column in the rental table. Hint: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need customer_id information as well. To get that you can use the following query:

select *
from rental;

insert into rental (rental_date, inventory_id, staff_id, customer_id, last_update)
values (CURDATE(), '1', '1','130', CURDATE());

select *
from rental
where customer_id = 130 and last_update = curdate();

-- Delete non-active users, but first, create a backup table deleted_users to store customer_id, email, and the date for the users that would be deleted. Follow these steps:

drop table deleted_users;

create table deleted_users (
customer_id int unique not null,
email varchar(50),
customer_date char(20),
primary key (customer_id));

select active, last_update, customer_id, email
from customer
where active = 0;

insert into deleted_users 
select customer_id, email, last_update
from customer 
where active = 0;

select *
from deleted_users;

SET FOREIGN_KEY_CHECKS=0;

delete from customer
where active = 0;

select active
from customer;