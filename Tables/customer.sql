create table customer
(
c_id INT NOT NULL AUTO_INCREMENT,
name varchar(50),
address varchar(100),
region_name varchar(20),
mobile_no varchar(11),
PRIMARY KEY(c_id),
FOREIGN KEY(region_name) references region(region_name)
);



