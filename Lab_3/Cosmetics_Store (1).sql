CREATE TABLE IF NOT EXISTS `store` (
	`store_id` int AUTO_INCREMENT NOT NULL,
	`store_name` varchar(50) NOT NULL,
	`city` varchar(30) NOT NULL,
	`street` varchar(40) NOT NULL,
	`building_no` int,
	PRIMARY KEY (`store_id`)
);
CREATE TABLE IF NOT EXISTS `employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL,
	`user_name` varchar(30) NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`position` varchar(25) NOT NULL,
	`employment_date` date NOT NULL,
	`store_id` int NOT NULL,
	`manager_id` int,
	`rate` float NOT NULL,
	`bonus` float,
	PRIMARY KEY (`employee_id`)
);
CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`gender` varchar(1) NOT NULL,
	`birth_date` date NOT NULL,
	`phone_number` varchar(15) NOT NULL,
	`email` varchar(50) NOT NULL,
	`skin_type` varchar(20),
	`discount` int,
	PRIMARY KEY (`customer_id`)
);
CREATE TABLE IF NOT EXISTS `brand` (
	`brand_id` int AUTO_INCREMENT NOT NULL,
	`brand_name` varchar(40) NOT NULL,
	`country` varchar(30) NOT NULL,
	PRIMARY KEY (`brand_id`)
);
CREATE TABLE IF NOT EXISTS `category` (
	`category_id` int AUTO_INCREMENT NOT NULL,
	`category_name` varchar(40) NOT NULL,
	PRIMARY KEY (`category_id`)
);
CREATE TABLE IF NOT EXISTS `product` (
	`product_id` int AUTO_INCREMENT NOT NULL,
	`product_name` varchar(60) NOT NULL,
	`product_description` varchar(255) NOT NULL,
	`brand_id` int NOT NULL,
	`category_id` int NOT NULL,
	`product_type` varchar(30) NOT NULL,
	`volume_ml` int NOT NULL,
	`amount` int NOT NULL,
	`price` float NOT NULL,
	PRIMARY KEY (`product_id`)
);
CREATE TABLE IF NOT EXISTS `orders` (
	`orders_id` int AUTO_INCREMENT NOT NULL,
	`employee_id` int NOT NULL,
	`customer_id` int NOT NULL,
	`payment_type` varchar(20) NOT NULL,
	`transaction_moment` datetime NOT NULL,
	PRIMARY KEY (`orders_id`)
);
CREATE TABLE IF NOT EXISTS `order_items` (
	`order_item_id` int AUTO_INCREMENT NOT NULL,
	`orders_id` int NOT NULL,
	`product_id` int NOT NULL,
	`quantity` int NOT NULL,
	`price` float NOT NULL,
	PRIMARY KEY (`order_item_id`)
);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk6` FOREIGN KEY (`store_id`) REFERENCES `store`(`store_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk7` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `product` ADD CONSTRAINT `product_fk3` FOREIGN KEY (`brand_id`) REFERENCES `brand`(`brand_id`);
ALTER TABLE `product` ADD CONSTRAINT `product_fk4` FOREIGN KEY (`category_id`) REFERENCES `category`(`category_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk1` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_fk2` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_fk1` FOREIGN KEY (`orders_id`) REFERENCES `orders`(`orders_id`);
ALTER TABLE `order_items` ADD CONSTRAINT `order_items_fk2` FOREIGN KEY (`product_id`) REFERENCES `product`(`product_id`);