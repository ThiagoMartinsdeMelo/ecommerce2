-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15-Ago-2017 às 12:46
-- Versão do servidor: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nova_loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `brands`
--

CREATE TABLE `brands` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
(1, 'LG'),
(2, 'Samsung'),
(3, 'AOC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `sub` int(11) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categories`
--

INSERT INTO `categories` (`id`, `sub`, `name`) VALUES
(1, NULL, 'Laptops'),
(2, NULL, 'Monitores');

-- --------------------------------------------------------

--
-- Estrutura da tabela `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `coupon_type` int(11) UNSIGNED NOT NULL,
  `coupon_value` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `options`
--

CREATE TABLE `options` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pages`
--

CREATE TABLE `pages` (
  `11` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_category` int(11) UNSIGNED NOT NULL,
  `id_brand` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text,
  `stock` int(11) UNSIGNED NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `price_from` decimal(10,2) NOT NULL,
  `rating` float NOT NULL,
  `featured` tinyint(1) NOT NULL,
  `sale` tinyint(1) NOT NULL,
  `bestseller` tinyint(4) NOT NULL,
  `new_product` tinyint(4) NOT NULL,
  `options` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `id_category`, `id_brand`, `name`, `description`, `stock`, `price`, `price_from`, `rating`, `featured`, `sale`, `bestseller`, `new_product`, `options`) VALUES
(1, 2, 1, 'Monitor 21 Polegadas', 'Alguma Descrição do Produto', 10, '499.00', '0.00', 0, 0, 0, 0, 0, NULL),
(2, 2, 2, 'Monitor 18 polegadas', 'Alguma outra descrição', 10, '399.00', '999.00', 0, 0, 0, 1, 0, NULL),
(3, 2, 2, 'Monitor 19 polegadas', 'Alguma outra descrição', 10, '599.00', '699.00', 0, 0, 0, 0, 1, NULL),
(4, 2, 3, 'Monitor 17 polegadas', 'Alguma outra descrição', 10, '779.00', '900.00', 0, 0, 0, 0, 0, NULL),
(5, 2, 1, 'Monitor 20 polegadas', 'Alguma outra descrição', 10, '299.00', '499.00', 0, 0, 0, 0, 1, NULL),
(6, 2, 3, 'Monitor 20 polegadas', 'Alguma outra descrição', 10, '699.00', '0.00', 0, 0, 0, 0, 0, NULL),
(7, 2, 3, 'Monitor 19 polegadas', 'Alguma outra descrição', 10, '889.00', '999.00', 0, 0, 0, 0, 0, NULL),
(8, 2, 1, 'Monitor 18 polegadas', 'Alguma outra descrição', 10, '599.00', '699.00', 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_images`
--

CREATE TABLE `products_images` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `url` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `products_images`
--

INSERT INTO `products_images` (`id`, `id_product`, `url`) VALUES
(1, 1, '1.jpg'),
(2, 2, '2.jpg'),
(3, 3, '3.jpg'),
(4, 4, '4.jpg'),
(5, 5, '1.jpg'),
(6, 6, '3.jpg'),
(7, 7, '7.jpg'),
(8, 8, '7.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `products_options`
--

CREATE TABLE `products_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_option` int(11) UNSIGNED NOT NULL,
  `p_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `id_coupon` int(11) UNSIGNED NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_type` int(11) UNSIGNED NOT NULL,
  `payment_status` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchases_products`
--

CREATE TABLE `purchases_products` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `quantity` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `purchase_transactions`
--

CREATE TABLE `purchase_transactions` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_purchase` int(11) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_code` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rates`
--

CREATE TABLE `rates` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_product` int(11) UNSIGNED NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `date_rated` datetime NOT NULL,
  `points` int(11) UNSIGNED NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`11`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_options`
--
ALTER TABLE `products_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases_products`
--
ALTER TABLE `purchases_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `11` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products_options`
--
ALTER TABLE `products_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchases_products`
--
ALTER TABLE `purchases_products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `purchase_transactions`
--
ALTER TABLE `purchase_transactions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
