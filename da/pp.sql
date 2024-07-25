SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- More sample data for companies
INSERT INTO `companies` (`id`, `company_name`, `mobile`, `password`, `about`, `region`, `buy_sell`, `product_type_buy`, `product_name`, `product_description`, `quantity`, `price`, `company_location`) VALUES
(7, 'Green Farms', '0987654321', '$2y$10$T3xU4/QuNn9R6kj5GhDPUuVVn4sd2/gY5lmW7j/NxM6/ivCz/aFh2', 'Organic vegetables', 'Punjab', 'sell', '', 'Vegetables', 'Fresh organic vegetables', 1000, 50.00, 'Amritsar'),
(8, 'Eco Agro', '8765432109', '$2y$10$V2F2F/R4YhD2/8kgY1U6zuI3rL6du8v4tLzX3Jr9fN5/kkU5B/b0h4', 'Sustainable farming solutions', 'Haryana', 'buy', '3000', 'Fertilizer', 'Eco-friendly fertilizers', 200, 30.00, 'Gurgaon');

-- More sample data for farmers
INSERT INTO `farmers` (`id`, `name`, `agricultural_land`, `amount`, `location`, `mobile`, `password`, `duration`) VALUES
(6, 'Ajay Singh', '25', 1400.00, 'Patiala', '09988776655', '$2y$10$9df0lGJKf/O8i9JDc3V7be/W7bFz5L7L5j0Z2B8Z2d6P3fQ0kQ/qK', 14),
(7, 'Vikas Yadav', '30', 1600.00, 'Jaipur', '08877665544', '$2y$10$3EpsAuqrKvstsLMMKjj9tenmATY7LUF/Y2AeWgTvauBvjC5tbTqsK', 16);

-- Creating orders table
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_date` datetime NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Adding primary key to orders table
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

-- Adding foreign key constraints
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_farmer` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`) ON DELETE CASCADE;

-- Auto increment for orders table
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- Inserting sample data into orders table
INSERT INTO `orders` (`order_id`, `company_id`, `farmer_id`, `product_name`, `quantity`, `price`, `order_date`, `status`) VALUES
(1, 1, 1, 'Carry Bags', 500, 250.00, '2023-07-01 10:00:00', 'Pending'),
(2, 2, 2, 'Biodegradable Plates', 300, 180.00, '2023-07-02 12:00:00', 'Completed');

-- Creating a view for company orders
CREATE VIEW `company_orders` AS
SELECT o.order_id, c.company_name, f.name AS farmer_name, o.product_name, o.quantity, o.price, o.order_date, o.status
FROM orders o
JOIN companies c ON o.company_id = c.id
JOIN farmers f ON o.farmer_id = f.id;

-- Creating a procedure to get orders by status
DELIMITER //
CREATE PROCEDURE GetOrdersByStatus(IN order_status VARCHAR(50))
BEGIN
    SELECT o.order_id, c.company_name, f.name AS farmer_name, o.product_name, o.quantity, o.price, o.order_date, o.status
    FROM orders o
    JOIN companies c ON o.company_id = c.id
    JOIN farmers f ON o.farmer_id = f.id
    WHERE o.status = order_status;
END //
DELIMITER ;

-- Creating a trigger to update order status
DELIMITER //
CREATE TRIGGER UpdateOrderStatus
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF NEW.status = 'Completed' THEN
        UPDATE companies SET about = CONCAT(about, ' | Order Completed: ', NEW.product_name) WHERE id = NEW.company_id;
    END IF;
END //
DELIMITER ;

-- More sample data for companies and farmers
INSERT INTO `companies` (`id`, `company_name`, `mobile`, `password`, `about`, `region`, `buy_sell`, `product_type_buy`, `product_name`, `product_description`, `quantity`, `price`, `company_location`) VALUES
(9, 'BioTech Co', '7788990011', '$2y$10$U2F5H8/QuNn9R6kj5GhDPUuVVn4sd2/gY5lmW7j/NxM6/ivCz/aFh2', 'Biotech products', 'Delhi', 'sell', '', 'Bio Pesticides', 'Eco-friendly pesticides', 800, 45.00, 'Delhi'),
(10, 'FarmFresh', '6677889900', '$2y$10$X3F5G8/R4YhD2/8kgY1U6zuI3rL6du8v4tLzX3Jr9fN5/kkU5B/b0h4', 'Organic farm products', 'Kerala', 'buy', '5000', 'Organic Seeds', 'High-quality organic seeds', 300, 20.00, 'Kochi');

-- More sample data for farmers
INSERT INTO `farmers` (`id`, `name`, `agricultural_land`, `amount`, `location`, `mobile`, `password`, `duration`) VALUES
(8, 'Ravi Kumar', '35', 1700.00, 'Nagpur', '07788990011', '$2y$10$Y5dF7/KH8JH4/8kj7HDUuVVn4sd2/gY5lmW7j/NxM6/ivCz/aFh2M', 17),
(9, 'Suresh Patel', '45', 1900.00, 'Bhopal', '06677889900', '$2y$10$Z6fH8/LM8JI5/9kgK1V7e1VVn4sd2/gY5lmW7j/NxM6/ivCz/aFh2N', 18);

-- Creating a table for reviews
CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Adding primary key to reviews table
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

-- Adding foreign key constraints to reviews table
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_review_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_review_farmer` FOREIGN KEY (`farmer_id`) REFERENCES `farmers` (`id`) ON DELETE CASCADE;

-- Auto increment for reviews table
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

-- Inserting sample data into reviews table
INSERT INTO `reviews` (`review_id`, `company_id`, `farmer_id`, `rating`, `comment`, `review_date`) VALUES
(1, 1, 1, 5, 'Excellent service and quality products', '2023-07-01 10:00:00'),
(2, 2, 2, 4, 'Good experience but room for improvement', '2023-07-02 12:00:00');

-- Creating a view for reviews
CREATE VIEW `company_reviews` AS
SELECT r.review_id, c.company_name, f.name AS farmer_name, r.rating, r.comment, r.review_date
FROM reviews r
JOIN companies c ON r.company_id = c.id
JOIN farmers f ON r.farmer_id = f.id;

-- Creating a procedure to get reviews by company
DELIMITER //
CREATE PROCEDURE GetReviewsByCompany(IN comp_id INT)
BEGIN
    SELECT r.review_id, c.company_name, f.name AS farmer_name, r.rating, r.comment, r.review_date
    FROM reviews r
    JOIN companies c ON r.company_id = c.id
    JOIN farmers f ON r.farmer_id = f.id
    WHERE r.company_id = comp_id;
END //
DELIMITER ;

-- Creating a trigger to update average rating of a company after a new review
DELIMITER //
CREATE TRIGGER UpdateAverageRating
AFTER INSERT ON reviews
FOR EACH ROW
BEGIN
    DECLARE avg_rating DECIMAL(10,2);
    SELECT AVG(rating) INTO avg_rating FROM reviews WHERE company_id = NEW.company_id;
    UPDATE companies SET about = CONCAT(about, ' | Avg Rating: ', avg_rating) WHERE id = NEW.company_id;
END //
DELIMITER ;

-- More sample data for orders, companies, and farmers
INSERT INTO `orders` (`order_id`, `company_id`, `farmer_id`, `product_name`, `quantity`, `price`, `order_date`, `status`) VALUES
(3, 3, 3, 'Parali', 600, 300.00, '2023-07-03 14:00:00', 'Pending'),
(4, 4, 4, 'Particleboard', 700, 350.00, '2023-07-04 16:00:00', 'Completed');

INSERT INTO `companies` (`id`, `company_name`, `mobile`, `password`, `about`, `region`, `buy_sell`, `product_type_buy`, `product_name`, `product_description`, `quantity`, `price`, `company_location`) VALUES
(11, 'AgroTech Solutions', '5566778899', '$2y$10$X5H6G8/MK8L5/9khM1V8e2WWn5sd3/gZ6lmX8k/KxM7/ivCz/bH2P', 'Agricultural technology products', 'Maharashtra', 'buy', '7000', 'Tractors', 'High-efficiency tractors', 400, 100.00, 'Mumbai'),
(12, 'Farmers United', '4455667788', '$2y$10$Z5H7K9/OM9J6/9ljN2W9f3XXn6td4/hZ7lnY9m/HyN8/jvDz/cJ3Q', 'Farming equipment and tools', 'Gujarat', 'sell', '', 'Harvesters', 'Advanced harvesters', 500, 150.00, 'Ahmedabad');

INSERT INTO `farmers` (`id`, `name`, `agricultural_land`, `amount`, `location`, `mobile`, `password`, `duration`) VALUES
(10, 'Rajesh Verma', '40', 1800.00, 'Indore', '05566778899', '$2y$10$X5G6H8/NJ8L5/9khM1V9e2YXn6sd3/hZ6nmX8l/KyN7/ivCz/cI2P', 19),
(11, 'Mukesh Sharma', '55', 2000.00, 'Lucknow', '04455667788', '$2y$10$Z6H7K9/PQ9J6/9ljN2W9f4ZZn6ud5/iZ7moY9n/JyN8/jwEz/dK4R', 20);

COMMIT;
