CREATE TABLE IF NOT EXISTS `category` (
	`category_id` int AUTO_INCREMENT NOT NULL,
	`category_name` varchar(100) NOT NULL,
	`description` text,
	PRIMARY KEY (`category_id`)
);
CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`phone_number` varchar(25),
	`email` varchar(100) NOT NULL,
	`address` varchar(255),
	`registration_date` date,
	PRIMARY KEY (`customer_id`)
);
CREATE TABLE IF NOT EXISTS `product` (
	`product_id` int AUTO_INCREMENT NOT NULL,
	`category_id` int NOT NULL,
	`product_name` varchar(150) NOT NULL,
	`brand` varchar(100),
	`description` text,
	`price` decimal(10,2) NOT NULL,
	`stock_quantity` int NOT NULL DEFAULT 0,
	PRIMARY KEY (`product_id`)
);
CREATE TABLE IF NOT EXISTS `orders` (
	`order_id` int AUTO_INCREMENT NOT NULL,
	`customer_id` int NOT NULL,
	`order_date` datetime NOT NULL,
	`status` varchar(30) NOT NULL,
	`total_amount` decimal(10,2) NOT NULL,
	PRIMARY KEY (`order_id`)
);
CREATE TABLE IF NOT EXISTS `order_items` (
	`order_item_id` int AUTO_INCREMENT NOT NULL,
	`order_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	`unit_price` decimal(10,2) NOT NULL,
	PRIMARY KEY (`order_item_id`)
);
CREATE TABLE IF NOT EXISTS `payment` (
	`payment_id` int AUTO_INCREMENT NOT NULL,
	`order_id` int NOT NULL,
	`payment_date` datetime,
	`payment_method` varchar(50) NOT NULL,
	`payment_status` varchar(30) NOT NULL,
	`amount` decimal(10,2) NOT NULL,
	PRIMARY KEY (`payment_id`),
	CONSTRAINT `uq_payment_order_id` UNIQUE (order_id)
);
ALTER TABLE `product` ADD CONSTRAINT `fk_product_category` FOREIGN KEY (category_id) REFERENCES category (category_id);
ALTER TABLE `orders` ADD CONSTRAINT `fk_orders_customer` FOREIGN KEY (customer_id) REFERENCES customer (customer_id);
ALTER TABLE `order_items` ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (order_id) REFERENCES orders (order_id);
ALTER TABLE `order_items` ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (product_id) REFERENCES product (product_id);
ALTER TABLE `payment` ADD CONSTRAINT `fk_payment_order` FOREIGN KEY (order_id) REFERENCES orders (order_id);