create table delivery_note
(
dn_id INT NOT NULL AUTO_INCREMENT,
c_id INT(10),
shipping_address varchar(100),
mobile_no varchar(11),
item_code INT(10),
quantity varchar(10),
total_amount varchar(10),
date varchar(70),
PRIMARY KEY(dn_id),
FOREIGN KEY (c_id) references customer(c_id),
FOREIGN KEY (item_code) references item(item_code)
);

