SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `region` varchar(255) NOT NULL,
  `buy_sell` enum('buy','sell') NOT NULL,
  `product_type_buy` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_description` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `company_location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `companies` (`id`, `company_name`, `mobile`, `password`, `about`, `region`, `buy_sell`, `product_type_buy`, `product_name`, `product_description`, `quantity`, `price`, `company_location`) VALUES
(1, 'Moropo pvt.ltd', '6390621966', '$2y$10$D91.ecWwy4ySjdH7GQ4/sOSqcX9fXqQ.wkj7OkkTvQH4vyGfIi2pe', 'want to sell carry bags', 'New Vihar-UP', 'sell', '', NULL, NULL, NULL, NULL, NULL),
(2, 'NBN Sellers', '6390611967', '$2y$10$3EpsAuqrKvstsLMMKjj9tenmATY7LUF/Y2AeWgTvauBvjC5tbTqsK', 'Want to buy Biodegradable Plates', 'Uttar Pradesh', 'sell', '', NULL, NULL, NULL, NULL, NULL),
(3, 'Aadi sellers', '1234567890', '$2y$10$IklWWhgqkq8aHij8jsAVI.HiQbZYMy/RjqR.rPodEkfk/Dtm5zUc6', 'Parali', 'noida, UP', 'buy', '11200', NULL, NULL, NULL, NULL, NULL),
(4, 'Edge trading company', '78654321567', '$2y$10$EMzIEvaD3T/zhH4P7WSGGOAfl9vD2c/XpzHHxCH1fXMIAWA07ph6W', 'Particleboard', 'Itwa-Bihar', 'sell', '', NULL, NULL, NULL, NULL, NULL),
(5, 'Space techno sellers', '78654321567', '$2y$10$IzhVUvDuwBaFmV7if9y3BeNxLT44ekPBfVnFkinBdJ9Wqqaszqrr.', 'Parali', 'Sawani, Bihar', 'buy', '1300', NULL, NULL, NULL, NULL, NULL),
(6, 'ukg sellers', '2345677899', '$2y$10$zOs8imDoPBPTOjzGbNxO.uJjXm6TJpWeATeYgMiiILRmqiclzIKme', 'wamt to buy Parali', 'Namanpur,punjab', 'buy', '1250', NULL, NULL, NULL, NULL, NULL);


CREATE TABLE `farmers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `agricultural_land` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `location` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `farmers` (`id`, `name`, `agricultural_land`, `amount`, `location`, `mobile`, `password`, `duration`) VALUES
(1, 'Ram Shankar', '15', 1200.00, 'Noida', '02728722323', '$2y$10$4TbbLs6dwStT0WTfobZ22O2SykxZYBr/84Hbz/r8ZAGUJcLOlNtym', 12),
(2, 'Neelam Devi', '13', 1234.00, 'Rampur,Rajasthan', '02728722323', '$2y$10$jzPueVnZbvsS8Tm9prwccecHOJ0oaW.mPw.phioHorNuhAFFnE5FO', 12),
(3, 'Anamika', '20', 1150.00, 'Seetampura, Up', '9336554498', '$2y$10$cFRtN5tnKQGb0nDvn3kY1.2byQCw3BPA8i7l3.APz16qICZfveGDS', 11),
(4, 'Sheetal', '50', 1500.00, 'Gaya', '06858885858', '$2y$10$gnSqVwH/kCaCegFSCxzIeuDmtJIJzAuoi0Lx.StSyd5s3VxcjZiVC', 15),
(5, 'Rama Shankar', '19', 1155.00, 'lakhimpur,Up', '06858885858', '$2y$10$EQiAoUkLQR7mtr7k3NfIZe.F6ceKxgShw6dPxl6GjYCEJ9QdCx1/.', 13);


ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `farmers`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `farmers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

