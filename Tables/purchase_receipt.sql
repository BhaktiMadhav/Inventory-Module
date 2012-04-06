create table purchase_receipt
(
pr_id INT NOT NULL AUTO_INCREMENT,
v_id INT(10),
address varchar(100),
mobile_no varchar(11),
item_code INT(10),
quantity varchar(10),
total_amount varchar(10),
date varchar(70),
PRIMARY KEY(pr_id),
FOREIGN KEY (item_code) references item(item_code),
FOREIGN KEY (v_id) references vendor(v_id)
);

