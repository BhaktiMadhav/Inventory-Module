create table stock_ledger
(
st_no INT NOT NULL AUTO_INCREMENT,
item_code INT(10),
voucher_id INT(10),
voucher_type varchar(25),
transaction_qty INT(10),
PRIMARY KEY(st_no),
FOREIGN KEY(item_code) references item(item_code),
FOREIGN KEY (voucher_id) references delivery_note(dn_id),
FOREIGN KEY (voucher_id) references purchase_receipt(pr_id)
);