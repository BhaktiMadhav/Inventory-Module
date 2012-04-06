create table user
(
user_id INT NOT NULL AUTO_INCREMENT,
id varchar(20),
name varchar(20),
address varchar(100),
phone_no integer(11),
mobile_no integer(10),
salary integer(7),
password varchar(30),
PRIMARY KEY(user_id),
FOREIGN KEY (id) references user_role(id)
);