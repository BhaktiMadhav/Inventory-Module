create table item
(
item_code INT NOT NULL AUTO_INCREMENT,
item_group varchar(50),
item_name  varchar(50),
brand varchar(50),
default_warehouse varchar(50),
default_uom varchar(50),
description varchar(50),
minimum_order_qty INT(50),
cost varchar(50),
PRIMARY KEY (item_code),
FOREIGN KEY (item_group) references item_Group(item_group),
FOREIGN KEY (default_uom) references uom(default_uom),
FOREIGN KEY (default_warehouse) references warehouse(default_warehouse)
);