
--
-- Table structure for table `action_recorder`
--

DROP TABLE IF EXISTS `action_recorder`;
CREATE TABLE IF NOT EXISTS `action_recorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `success` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_action_recorder_module` (`module`),
  KEY `idx_action_recorder_user_id` (`user_id`),
  KEY `idx_action_recorder_identifier` (`identifier`),
  KEY `idx_action_recorder_date_added` (`date_added`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;


-- --------------------------------------------------------

--
-- Table structure for table `address_book`
--

DROP TABLE IF EXISTS `address_book`;
CREATE TABLE IF NOT EXISTS `address_book` (
  `address_book_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `entry_gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_street_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_suburb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entry_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_country_id` int(11) NOT NULL DEFAULT '0',
  `entry_zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_book_id`),
  KEY `idx_address_book_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `address_format`
--

DROP TABLE IF EXISTS `address_format`;
CREATE TABLE IF NOT EXISTS `address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_format` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `address_summary` varchar(48) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `address_format`
--

INSERT INTO `address_format` (`address_format_id`, `address_format`, `address_summary`) VALUES
(1, '$firstname $lastname$cr$streets$cr$city, $postcode$cr$statecomma$country', '$city / $country'),
(2, '$firstname $lastname$cr$streets$cr$city, $state    $postcode$cr$country', '$city, $state / $country'),
(3, '$firstname $lastname$cr$streets$cr$city$cr$postcode - $statecomma$country', '$state / $country'),
(4, '$firstname $lastname$cr$streets$cr$city ($postcode)$cr$country', '$postcode / $country'),
(5, '$firstname $lastname$cr$streets$cr$postcode $city$cr$country', '$city / $country');

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
CREATE TABLE IF NOT EXISTS `administrators` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `user_password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
CREATE TABLE IF NOT EXISTS `banners` (
  `banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `banners_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `banners_image` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `banners_group` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `banners_html_text` text COLLATE utf8_unicode_ci,
  `expires_impressions` int(7) DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `date_scheduled` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`banners_id`),
  KEY `idx_banners_group` (`banners_group`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`banners_id`, `banners_title`, `banners_url`, `banners_image`, `banners_group`, `banners_html_text`, `expires_impressions`, `expires_date`, `date_scheduled`, `date_added`, `date_status_change`, `status`) VALUES
(2, 'Slide-1', 'index.php?cPath=2', 'banners/slide-1.jpg', 'nivoslider', 'My caption', 0, NULL, NULL, '2013-05-12 22:19:02', NULL, 1),
(3, 'Slide-2', 'index.php?cPath=3', 'banners/slide-2.jpg', 'nivoslider', 'One more caption', 0, NULL, NULL, '2013-05-12 22:19:19', NULL, 1),
(4, 'Slide-3', 'index.php?cPath=4', 'banners/slide-3.jpg', 'nivoslider', 'Not my caption', 0, NULL, NULL, '2013-05-12 22:19:34', NULL, 1),
(5, 'top banner 1', 'index.php?cPath=5', '', 'topbanners', 'banner', 0, NULL, NULL, '2014-07-21 14:59:16', NULL, 1),
(6, 'top banner 2', 'index.php?cPath=6', '', 'topbanners', 'banner 2', 0, NULL, NULL, '2014-07-21 15:22:11', NULL, 1),
(7, 'left banner', 'index.php?cPath=1', '', 'sidebanner', 'side banner', 0, NULL, NULL, '2014-07-21 15:30:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banners_history`
--

DROP TABLE IF EXISTS `banners_history`;
CREATE TABLE IF NOT EXISTS `banners_history` (
  `banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `banners_id` int(11) NOT NULL,
  `banners_shown` int(5) NOT NULL DEFAULT '0',
  `banners_clicked` int(5) NOT NULL DEFAULT '0',
  `banners_history_date` datetime NOT NULL,
  PRIMARY KEY (`banners_history_id`),
  KEY `idx_banners_history_banners_id` (`banners_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=146 ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`categories_id`),
  KEY `idx_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=26 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_image`, `parent_id`, `sort_order`, `date_added`, `last_modified`) VALUES
(1, 'categories/1.png', 0, 1, '2014-06-30 14:38:13', '2014-07-25 12:47:14'),
(2, 'categories/2.png', 0, 2, '2014-06-30 14:38:13', '2014-07-25 12:47:52'),
(3, 'categories/3.png', 0, 3, '2014-06-30 14:38:13', '2014-07-25 12:48:04'),
(4, 'categories/4.png', 1, 0, '2014-06-30 14:38:13', '2014-07-25 12:49:00'),
(5, 'categories/5.png', 16, 0, '2014-06-30 14:38:13', '2014-07-25 12:50:20'),
(6, 'categories/6.png', 16, 0, '2014-06-30 14:38:13', '2014-07-25 12:50:34'),
(7, 'categories/7.png', 16, 0, '2014-06-30 14:38:13', '2014-07-25 12:50:08'),
(8, 'categories/8.png', 1, 0, '2014-06-30 14:38:13', '2014-07-25 12:49:19'),
(9, 'categories/9.png', 1, 0, '2014-06-30 14:38:13', '2014-07-25 12:49:50'),
(10, 'categories/10.png', 4, 0, '2014-06-30 14:38:13', '2014-07-25 12:52:35'),
(11, 'categories/11.png', 4, 0, '2014-06-30 14:38:13', '2014-07-25 12:53:04'),
(12, 'categories/12.png', 9, 0, '2014-06-30 14:38:13', '2014-07-25 12:53:30'),
(13, 'categories/13.png', 9, 0, '2014-06-30 14:38:13', '2014-07-25 12:53:45'),
(14, 'categories/14.png', 4, 0, '2014-06-30 14:38:13', '2014-07-25 12:52:49'),
(15, 'categories/15.png', 4, 0, '2014-06-30 14:38:14', '2014-07-25 12:53:17'),
(16, 'categories/16.png', 1, 0, '2014-06-30 14:38:14', '2014-07-25 12:49:38'),
(17, 'categories/17.png', 1, 0, '2014-06-30 14:38:14', '2014-07-25 12:48:48'),
(18, 'categories/18.png', 8, 0, '2014-06-30 14:38:14', '2014-07-25 12:51:31'),
(19, 'categories/19.png', 8, 0, '2014-06-30 14:38:14', '2014-07-25 12:51:13'),
(20, 'categories/20.png', 8, 0, '2014-06-30 14:38:14', '2014-07-25 12:51:49'),
(21, 'categories/21.png', 0, 4, '2014-06-30 14:38:14', '2014-07-25 12:48:18'),
(22, 'categories/22.png', 17, 1, '2014-07-15 15:28:48', '2014-07-25 12:54:44'),
(23, 'categories/23.png', 17, 0, '2014-07-28 14:42:55', NULL),
(24, 'categories/24.png', 17, 0, '2014-07-28 14:43:12', NULL),
(25, 'categories/25.png', 17, 0, '2014-07-28 14:43:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories_description`
--

DROP TABLE IF EXISTS `categories_description`;
CREATE TABLE IF NOT EXISTS `categories_description` (
  `categories_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `categories_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categories_id`,`language_id`),
  KEY `idx_categories_name` (`categories_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories_description`
--

INSERT INTO `categories_description` (`categories_id`, `language_id`, `categories_name`) VALUES
(12, 1, 'Aenean a diam'),
(12, 2, 'Aenean a diam'),
(12, 3, 'Aenean a diam'),
(12, 4, 'Aenean a diam'),
(23, 1, 'Aliquam auctor'),
(23, 2, 'Aliquam auctor'),
(23, 3, 'Aliquam auctor'),
(23, 4, 'Aliquam auctor'),
(5, 1, 'Aliquam sit'),
(5, 2, 'Aliquam sit'),
(5, 3, 'Aliquam sit'),
(5, 4, 'Aliquam sit'),
(19, 1, 'Consectetur adipiscing'),
(19, 2, 'Consectetur adipiscing'),
(19, 3, 'Consectetur adipiscing'),
(19, 4, 'Consectetur adipiscing'),
(6, 1, 'Cum sociis'),
(6, 2, 'Cum sociis'),
(6, 3, 'Cum sociis'),
(6, 4, 'Cum sociis'),
(17, 1, 'Dolor sit amet'),
(17, 2, 'Dolor sit amet'),
(17, 3, 'Dolor sit amet'),
(17, 4, 'Dolor sit amet'),
(3, 1, 'Dolore'),
(3, 2, 'Dolore'),
(3, 3, 'Dolore'),
(3, 4, 'Dolore'),
(22, 1, 'Duis et nulla'),
(22, 2, 'Duis et nulla'),
(22, 3, 'Duis et nulla'),
(22, 4, 'Duis et nulla'),
(25, 1, 'Fusce lobortis'),
(25, 2, 'Fusce lobortis'),
(25, 3, 'Fusce lobortis'),
(25, 4, 'Fusce lobortis'),
(15, 1, 'Fusce risus ligula'),
(15, 2, 'Fusce risus ligula'),
(15, 3, 'Fusce risus ligula'),
(15, 4, 'Fusce risus ligula'),
(11, 1, 'In pharetra'),
(11, 2, 'In pharetra'),
(11, 3, 'In pharetra'),
(11, 4, 'In pharetra'),
(2, 1, 'Ipsum'),
(2, 2, 'Ipsum'),
(2, 3, 'Ipsum'),
(2, 4, 'Ipsum'),
(1, 1, 'Lorem'),
(1, 2, 'Lorem'),
(1, 3, 'Lorem'),
(1, 4, 'Lorem'),
(10, 1, 'Lorem ipsum'),
(10, 2, 'Lorem ipsum'),
(10, 3, 'Lorem ipsum'),
(10, 4, 'Lorem ipsum'),
(14, 1, 'Morbi feugiat'),
(14, 2, 'Morbi feugiat'),
(14, 3, 'Morbi feugiat'),
(14, 4, 'Morbi feugiat'),
(18, 1, 'Morbi suscipit'),
(18, 2, 'Morbi suscipit'),
(18, 3, 'Morbi suscipit'),
(18, 4, 'Morbi suscipit'),
(13, 1, 'Nam ullamcorper'),
(13, 2, 'Nam ullamcorper'),
(13, 3, 'Nam ullamcorper'),
(13, 4, 'Nam ullamcorper'),
(24, 1, 'Nulla consequat'),
(24, 2, 'Nulla consequat'),
(24, 3, 'Nulla consequat'),
(24, 4, 'Nulla consequat'),
(4, 1, 'Proin sed orci '),
(4, 2, 'Proin sed orci '),
(4, 3, 'Proin sed orci '),
(4, 4, 'Proin sed orci '),
(8, 1, 'Sed ac massa'),
(8, 2, 'Sed ac massa'),
(8, 3, 'Sed ac massa'),
(8, 4, 'Sed ac massa'),
(9, 1, 'Sed pharetra'),
(9, 2, 'Sed pharetra'),
(9, 3, 'Sed pharetra'),
(9, 4, 'Sed pharetra'),
(20, 1, 'Suspendisse sit'),
(20, 2, 'Suspendisse sit'),
(20, 3, 'Suspendisse sit'),
(20, 4, 'Suspendisse sit'),
(21, 1, 'Tempor'),
(21, 2, 'Tempor'),
(21, 3, 'Tempor'),
(21, 4, 'Tempor'),
(7, 1, 'Ut efficitur'),
(7, 2, 'Ut efficitur'),
(7, 3, 'Ut efficitur'),
(7, 4, 'Ut efficitur'),
(16, 1, 'Ut sit amet'),
(16, 2, 'Ut sit amet'),
(16, 3, 'Ut sit amet'),
(16, 4, 'Ut sit amet');

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

DROP TABLE IF EXISTS `configuration`;
CREATE TABLE IF NOT EXISTS `configuration` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration_value` text COLLATE utf8_unicode_ci NOT NULL,
  `configuration_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration_group_id` int(11) NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `use_function` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set_function` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=664 ;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(1, 'Store Name', 'STORE_NAME', 'My store', 'The name of my store', 1, 1, NULL, '2014-06-30 14:38:14', NULL, NULL),
(2, 'Store Owner', 'STORE_OWNER', 'me', 'The name of my store owner', 1, 2, NULL, '2014-06-30 14:38:14', NULL, NULL),
(3, 'E-Mail Address', 'STORE_OWNER_EMAIL_ADDRESS', 'admin@admin.com', 'The e-mail address of my store owner', 1, 3, NULL, '2014-06-30 14:38:14', NULL, NULL),
(4, 'E-Mail From', 'EMAIL_FROM', '"me" <admin@admin.com>', 'The e-mail address used in (sent) e-mails', 1, 4, NULL, '2014-06-30 14:38:14', NULL, NULL),
(5, 'Country', 'STORE_COUNTRY', '223', 'The country my store is located in <br /><br /><strong>Note: Please remember to update the store zone.</strong>', 1, 6, NULL, '2014-06-30 14:38:14', 'tep_get_country_name', 'tep_cfg_pull_down_country_list('),
(6, 'Zone', 'STORE_ZONE', '18', 'The zone my store is located in', 1, 7, NULL, '2014-06-30 14:38:14', 'tep_cfg_get_zone_name', 'tep_cfg_pull_down_zone_list('),
(7, 'Expected Sort Order', 'EXPECTED_PRODUCTS_SORT', 'desc', 'This is the sort order used in the expected products box.', 1, 8, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''asc'', ''desc''), '),
(8, 'Expected Sort Field', 'EXPECTED_PRODUCTS_FIELD', 'date_expected', 'The column to sort by in the expected products box.', 1, 9, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''products_name'', ''date_expected''), '),
(9, 'Switch To Default Language Currency', 'USE_DEFAULT_LANGUAGE_CURRENCY', 'false', 'Automatically switch to the language''s currency when it is changed', 1, 10, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(10, 'Send Extra Order Emails To', 'SEND_EXTRA_ORDER_EMAILS_TO', '', 'Send extra order emails to the following email addresses, in this format: Name 1 &lt;email@address1&gt;, Name 2 &lt;email@address2&gt;', 1, 11, NULL, '2014-06-30 14:38:14', NULL, NULL),
(11, 'Use Search-Engine Safe URLs', 'SEARCH_ENGINE_FRIENDLY_URLS', 'false', 'Use search-engine safe urls for all site links', 1, 12, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(12, 'Display Cart After Adding Product', 'DISPLAY_CART', 'false', 'Display the shopping cart after adding a product (or return back to their origin)', 1, 14, '2014-07-14 10:55:40', '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(13, 'Allow Guest To Tell A Friend', 'ALLOW_GUEST_TO_TELL_A_FRIEND', 'false', 'Allow guests to tell a friend about a product', 1, 15, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(14, 'Default Search Operator', 'ADVANCED_SEARCH_DEFAULT_OPERATOR', 'and', 'Default search operators', 1, 17, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''and'', ''or''), '),
(15, 'Store Address and Phone', 'STORE_NAME_ADDRESS', 'Store Name\nAddress\nCountry\nPhone', 'This is the Store Name, Address and Phone used on printable documents and displayed online', 1, 18, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_textarea('),
(16, 'Show Category Counts', 'SHOW_COUNTS', 'true', 'Count recursively how many products are in each category', 1, 19, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(17, 'Tax Decimal Places', 'TAX_DECIMAL_PLACES', '0', 'Pad the tax value this amount of decimal places', 1, 20, NULL, '2014-06-30 14:38:14', NULL, NULL),
(18, 'Display Prices with Tax', 'DISPLAY_PRICE_WITH_TAX', 'false', 'Display prices with tax included (true) or add the tax at the end (false)', 1, 21, NULL, '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(19, 'First Name', 'ENTRY_FIRST_NAME_MIN_LENGTH', '2', 'Minimum length of first name', 2, 1, NULL, '2014-06-30 14:38:14', NULL, NULL),
(20, 'Last Name', 'ENTRY_LAST_NAME_MIN_LENGTH', '2', 'Minimum length of last name', 2, 2, NULL, '2014-06-30 14:38:14', NULL, NULL),
(21, 'Date of Birth', 'ENTRY_DOB_MIN_LENGTH', '10', 'Minimum length of date of birth', 2, 3, NULL, '2014-06-30 14:38:14', NULL, NULL),
(22, 'E-Mail Address', 'ENTRY_EMAIL_ADDRESS_MIN_LENGTH', '6', 'Minimum length of e-mail address', 2, 4, NULL, '2014-06-30 14:38:14', NULL, NULL),
(23, 'Street Address', 'ENTRY_STREET_ADDRESS_MIN_LENGTH', '5', 'Minimum length of street address', 2, 5, NULL, '2014-06-30 14:38:14', NULL, NULL),
(24, 'Company', 'ENTRY_COMPANY_MIN_LENGTH', '2', 'Minimum length of company name', 2, 6, NULL, '2014-06-30 14:38:14', NULL, NULL),
(25, 'Post Code', 'ENTRY_POSTCODE_MIN_LENGTH', '4', 'Minimum length of post code', 2, 7, NULL, '2014-06-30 14:38:14', NULL, NULL),
(26, 'City', 'ENTRY_CITY_MIN_LENGTH', '3', 'Minimum length of city', 2, 8, NULL, '2014-06-30 14:38:14', NULL, NULL),
(27, 'State', 'ENTRY_STATE_MIN_LENGTH', '2', 'Minimum length of state', 2, 9, NULL, '2014-06-30 14:38:14', NULL, NULL),
(28, 'Telephone Number', 'ENTRY_TELEPHONE_MIN_LENGTH', '3', 'Minimum length of telephone number', 2, 10, NULL, '2014-06-30 14:38:14', NULL, NULL),
(29, 'Password', 'ENTRY_PASSWORD_MIN_LENGTH', '5', 'Minimum length of password', 2, 11, NULL, '2014-06-30 14:38:14', NULL, NULL),
(30, 'Credit Card Owner Name', 'CC_OWNER_MIN_LENGTH', '3', 'Minimum length of credit card owner name', 2, 12, NULL, '2014-06-30 14:38:14', NULL, NULL),
(31, 'Credit Card Number', 'CC_NUMBER_MIN_LENGTH', '10', 'Minimum length of credit card number', 2, 13, NULL, '2014-06-30 14:38:14', NULL, NULL),
(32, 'Review Text', 'REVIEW_TEXT_MIN_LENGTH', '50', 'Minimum length of review text', 2, 14, NULL, '2014-06-30 14:38:14', NULL, NULL),
(33, 'Best Sellers', 'MIN_DISPLAY_BESTSELLERS', '1', 'Minimum number of best sellers to display', 2, 15, '2014-07-03 11:42:51', '2014-06-30 14:38:14', NULL, NULL),
(34, 'Also Purchased', 'MIN_DISPLAY_ALSO_PURCHASED', '1', 'Minimum number of products to display in the ''This Customer Also Purchased'' box', 2, 16, NULL, '2014-06-30 14:38:14', NULL, NULL),
(35, 'Address Book Entries', 'MAX_ADDRESS_BOOK_ENTRIES', '5', 'Maximum address book entries a customer is allowed to have', 3, 1, NULL, '2014-06-30 14:38:14', NULL, NULL),
(36, 'Search Results', 'MAX_DISPLAY_SEARCH_RESULTS', '6', 'Amount of products to list', 3, 2, '2014-07-01 17:03:28', '2014-06-30 14:38:14', NULL, NULL),
(37, 'Page Links', 'MAX_DISPLAY_PAGE_LINKS', '5', 'Number of ''number'' links use for page-sets', 3, 3, NULL, '2014-06-30 14:38:14', NULL, NULL),
(38, 'Special Products', 'MAX_DISPLAY_SPECIAL_PRODUCTS', '6', 'Maximum number of products on special to display', 3, 4, '2014-07-01 17:03:16', '2014-06-30 14:38:14', NULL, NULL),
(39, 'New Products Module', 'MAX_DISPLAY_NEW_PRODUCTS', '6', 'Maximum number of new products to display in a category', 3, 5, '2014-07-10 11:07:48', '2014-06-30 14:38:14', NULL, NULL),
(40, 'Products Expected', 'MAX_DISPLAY_UPCOMING_PRODUCTS', '10', 'Maximum number of products expected to display', 3, 6, NULL, '2014-06-30 14:38:14', NULL, NULL),
(41, 'Manufacturers List', 'MAX_DISPLAY_MANUFACTURERS_IN_A_LIST', '0', 'Used in manufacturers box; when the number of manufacturers exceeds this number, a drop-down list will be displayed instead of the default list', 3, 7, '2014-07-01 14:39:07', '2014-06-30 14:38:14', NULL, NULL),
(42, 'Manufacturers Select Size', 'MAX_MANUFACTURERS_LIST', '1', 'Used in manufacturers box; when this value is ''1'' the classic drop-down list will be used for the manufacturers box. Otherwise, a list-box with the specified number of rows will be displayed.', 3, 7, '2014-07-01 14:39:13', '2014-06-30 14:38:14', NULL, NULL),
(43, 'Length of Manufacturers Name', 'MAX_DISPLAY_MANUFACTURER_NAME_LEN', '15', 'Used in manufacturers box; maximum length of manufacturers name to display', 3, 8, NULL, '2014-06-30 14:38:14', NULL, NULL),
(44, 'New Reviews', 'MAX_DISPLAY_NEW_REVIEWS', '6', 'Maximum number of new reviews to display', 3, 9, NULL, '2014-06-30 14:38:14', NULL, NULL),
(45, 'Selection of Random Reviews', 'MAX_RANDOM_SELECT_REVIEWS', '10', 'How many records to select from to choose one random product review', 3, 10, NULL, '2014-06-30 14:38:14', NULL, NULL),
(46, 'Selection of Random New Products', 'MAX_RANDOM_SELECT_NEW', '10', 'How many records to select from to choose one random new product to display', 3, 11, NULL, '2014-06-30 14:38:14', NULL, NULL),
(47, 'Selection of Products on Special', 'MAX_RANDOM_SELECT_SPECIALS', '10', 'How many records to select from to choose one random product special to display', 3, 12, NULL, '2014-06-30 14:38:14', NULL, NULL),
(48, 'Categories To List Per Row', 'MAX_DISPLAY_CATEGORIES_PER_ROW', '4', 'How many categories to list per row', 3, 13, '2014-07-25 14:03:26', '2014-06-30 14:38:14', NULL, NULL),
(49, 'New Products Listing', 'MAX_DISPLAY_PRODUCTS_NEW', '6', 'Maximum number of new products to display in new products page', 3, 14, '2014-07-10 11:08:16', '2014-06-30 14:38:14', NULL, NULL),
(50, 'Best Sellers', 'MAX_DISPLAY_BESTSELLERS', '6', 'Maximum number of best sellers to display', 3, 15, '2014-07-01 17:02:48', '2014-06-30 14:38:15', NULL, NULL),
(51, 'Also Purchased', 'MAX_DISPLAY_ALSO_PURCHASED', '6', 'Maximum number of products to display in the ''This Customer Also Purchased'' box', 3, 16, NULL, '2014-06-30 14:38:15', NULL, NULL),
(52, 'Customer Order History Box', 'MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX', '6', 'Maximum number of products to display in the customer order history box', 3, 17, NULL, '2014-06-30 14:38:15', NULL, NULL),
(53, 'Order History', 'MAX_DISPLAY_ORDER_HISTORY', '10', 'Maximum number of orders to display in the order history page', 3, 18, NULL, '2014-06-30 14:38:15', NULL, NULL),
(54, 'Product Quantities In Shopping Cart', 'MAX_QTY_IN_CART', '99', 'Maximum number of product quantities that can be added to the shopping cart (0 for no limit)', 3, 19, NULL, '2014-06-30 14:38:15', NULL, NULL),
(55, 'Small Image Width', 'SMALL_IMAGE_WIDTH', '100', 'The pixel width of small images', 4, 1, NULL, '2014-06-30 14:38:15', NULL, NULL),
(56, 'Small Image Height', 'SMALL_IMAGE_HEIGHT', '143', 'The pixel height of small images', 4, 2, '2014-07-25 15:37:03', '2014-06-30 14:38:15', NULL, NULL),
(57, 'Heading Image Width', 'HEADING_IMAGE_WIDTH', '60', 'The pixel width of heading images', 4, 3, '2014-07-07 12:35:36', '2014-06-30 14:38:15', NULL, NULL),
(58, 'Heading Image Height', 'HEADING_IMAGE_HEIGHT', '86', 'The pixel height of heading images', 4, 4, '2014-07-25 15:37:24', '2014-06-30 14:38:15', NULL, NULL),
(59, 'Subcategory Image Width', 'SUBCATEGORY_IMAGE_WIDTH', '100', 'The pixel width of subcategory images', 4, 5, NULL, '2014-06-30 14:38:15', NULL, NULL),
(60, 'Subcategory Image Height', 'SUBCATEGORY_IMAGE_HEIGHT', '143', 'The pixel height of subcategory images', 4, 6, '2014-07-25 15:37:12', '2014-06-30 14:38:15', NULL, NULL),
(61, 'Calculate Image Size', 'CONFIG_CALCULATE_IMAGE_SIZE', 'false', 'Calculate the size of images?', 4, 7, '2014-07-25 15:37:58', '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(62, 'Image Required', 'IMAGE_REQUIRED', 'true', 'Enable to display broken images. Good for development.', 4, 8, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(63, 'Gender', 'ACCOUNT_GENDER', 'true', 'Display gender in the customers account', 5, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(64, 'Date of Birth', 'ACCOUNT_DOB', 'true', 'Display date of birth in the customers account', 5, 2, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(65, 'Company', 'ACCOUNT_COMPANY', 'true', 'Display company in the customers account', 5, 3, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(66, 'Suburb', 'ACCOUNT_SUBURB', 'true', 'Display suburb in the customers account', 5, 4, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(67, 'State', 'ACCOUNT_STATE', 'true', 'Display state in the customers account', 5, 5, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(68, 'Installed Modules', 'MODULE_PAYMENT_INSTALLED', 'cod.php;paypal_express.php', 'List of payment module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: cod.php;paypal_express.php)', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(69, 'Installed Modules', 'MODULE_ORDER_TOTAL_INSTALLED', 'ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php', 'List of order_total module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ot_subtotal.php;ot_tax.php;ot_shipping.php;ot_total.php)', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(70, 'Installed Modules', 'MODULE_SHIPPING_INSTALLED', 'flat.php', 'List of shipping module filenames separated by a semi-colon. This is automatically updated. No need to edit. (Example: ups.php;flat.php;item.php)', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(71, 'Installed Modules', 'MODULE_ACTION_RECORDER_INSTALLED', 'ar_admin_login.php;ar_contact_us.php;ar_reset_password.php;ar_tell_a_friend.php', 'List of action recorder module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(72, 'Installed Modules', 'MODULE_SOCIAL_BOOKMARKS_INSTALLED', 'sb_email.php;sb_twitter.php;sb_facebook.php;sb_google_plus_share.php;sb_pinterest.php', 'List of social bookmark module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, '2014-07-22 15:52:18', '2014-06-30 14:38:15', NULL, NULL),
(73, 'Enable Cash On Delivery Module', 'MODULE_PAYMENT_COD_STATUS', 'True', 'Do you want to accept Cash On Delevery payments?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(74, 'Payment Zone', 'MODULE_PAYMENT_COD_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2014-06-30 14:38:15', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(75, 'Sort order of display.', 'MODULE_PAYMENT_COD_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(76, 'Set Order Status', 'MODULE_PAYMENT_COD_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2014-06-30 14:38:15', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(77, 'Enable Flat Shipping', 'MODULE_SHIPPING_FLAT_STATUS', 'True', 'Do you want to offer flat rate shipping?', 6, 0, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(78, 'Shipping Cost', 'MODULE_SHIPPING_FLAT_COST', '5.00', 'The shipping cost for all orders using this shipping method.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(79, 'Tax Class', 'MODULE_SHIPPING_FLAT_TAX_CLASS', '0', 'Use the following tax class on the shipping fee.', 6, 0, NULL, '2014-06-30 14:38:15', 'tep_get_tax_class_title', 'tep_cfg_pull_down_tax_classes('),
(80, 'Shipping Zone', 'MODULE_SHIPPING_FLAT_ZONE', '0', 'If a zone is selected, only enable this shipping method for that zone.', 6, 0, NULL, '2014-06-30 14:38:15', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(81, 'Sort Order', 'MODULE_SHIPPING_FLAT_SORT_ORDER', '0', 'Sort order of display.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(82, 'Default Currency', 'DEFAULT_CURRENCY', 'USD', 'Default Currency', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(83, 'Default Language', 'DEFAULT_LANGUAGE', 'en', 'Default Language', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(84, 'Default Order Status For New Orders', 'DEFAULT_ORDERS_STATUS_ID', '1', 'When a new order is created, this order status will be assigned to it.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(85, 'Display Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_STATUS', 'true', 'Do you want to display the order shipping cost?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(86, 'Sort Order', 'MODULE_ORDER_TOTAL_SHIPPING_SORT_ORDER', '2', 'Sort order of display.', 6, 2, NULL, '2014-06-30 14:38:15', NULL, NULL),
(87, 'Allow Free Shipping', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING', 'false', 'Do you want to allow free shipping?', 6, 3, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(88, 'Free Shipping For Orders Over', 'MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER', '50', 'Provide free shipping for orders over the set amount.', 6, 4, NULL, '2014-06-30 14:38:15', 'currencies->format', NULL),
(89, 'Provide Free Shipping For Orders Made', 'MODULE_ORDER_TOTAL_SHIPPING_DESTINATION', 'national', 'Provide free shipping for orders sent to the set destination.', 6, 5, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''national'', ''international'', ''both''), '),
(90, 'Display Sub-Total', 'MODULE_ORDER_TOTAL_SUBTOTAL_STATUS', 'true', 'Do you want to display the order sub-total cost?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(91, 'Sort Order', 'MODULE_ORDER_TOTAL_SUBTOTAL_SORT_ORDER', '1', 'Sort order of display.', 6, 2, NULL, '2014-06-30 14:38:15', NULL, NULL),
(92, 'Display Tax', 'MODULE_ORDER_TOTAL_TAX_STATUS', 'true', 'Do you want to display the order tax value?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(93, 'Sort Order', 'MODULE_ORDER_TOTAL_TAX_SORT_ORDER', '3', 'Sort order of display.', 6, 2, NULL, '2014-06-30 14:38:15', NULL, NULL),
(94, 'Display Total', 'MODULE_ORDER_TOTAL_TOTAL_STATUS', 'true', 'Do you want to display the total order value?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(95, 'Sort Order', 'MODULE_ORDER_TOTAL_TOTAL_SORT_ORDER', '4', 'Sort order of display.', 6, 2, NULL, '2014-06-30 14:38:15', NULL, NULL),
(96, 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_CONTACT_US_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(97, 'Minimum Minutes Per E-Mail', 'MODULE_ACTION_RECORDER_TELL_A_FRIEND_EMAIL_MINUTES', '15', 'Minimum number of minutes to allow 1 e-mail to be sent (eg, 15 for 1 e-mail every 15 minutes)', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(98, 'Allowed Minutes', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_MINUTES', '5', 'Number of minutes to allow login attempts to occur.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(99, 'Allowed Attempts', 'MODULE_ACTION_RECORDER_ADMIN_LOGIN_ATTEMPTS', '3', 'Number of login attempts to allow within the specified period.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(100, 'Allowed Minutes', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_MINUTES', '5', 'Number of minutes to allow password resets to occur.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(101, 'Allowed Attempts', 'MODULE_ACTION_RECORDER_RESET_PASSWORD_ATTEMPTS', '1', 'Number of password reset attempts to allow within the specified period.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(102, 'Enable E-Mail Module', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_STATUS', 'True', 'Do you want to allow products to be shared through e-mail?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(103, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_EMAIL_SORT_ORDER', '10', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(104, 'Enable Google+ Share Module', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_STATUS', 'True', 'Do you want to allow products to be shared through Google+?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(105, 'Annotation', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ANNOTATION', 'None', 'The annotation to display next to the button.', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''Inline'', ''Bubble'', ''Vertical-Bubble'', ''None''), '),
(106, 'Width', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_WIDTH', '', 'The maximum width of the button.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(107, 'Height', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_HEIGHT', '15', 'Sets the height of the button.', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''15'', ''20'', ''24'', ''60''), '),
(108, 'Alignment', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_ALIGN', 'Left', 'The alignment of the button assets.', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''Left'', ''Right''), '),
(109, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_GOOGLE_PLUS_SHARE_SORT_ORDER', '40', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(110, 'Enable Facebook Module', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_STATUS', 'True', 'Do you want to allow products to be shared through Facebook?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(111, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_FACEBOOK_SORT_ORDER', '30', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(112, 'Enable Twitter Module', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_STATUS', 'True', 'Do you want to allow products to be shared through Twitter?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(113, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_TWITTER_SORT_ORDER', '20', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(114, 'Enable Pinterest Module', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_STATUS', 'True', 'Do you want to allow Pinterest Button?', 6, 1, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(115, 'Layout Position', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_BUTTON_COUNT_POSITION', 'None', 'Horizontal or Vertical or None', 6, 2, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''Horizontal'', ''Vertical'', ''None''), '),
(116, 'Sort Order', 'MODULE_SOCIAL_BOOKMARKS_PINTEREST_SORT_ORDER', '50', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:15', NULL, NULL),
(117, 'Country of Origin', 'SHIPPING_ORIGIN_COUNTRY', '223', 'Select the country of origin to be used in shipping quotes.', 7, 1, NULL, '2014-06-30 14:38:15', 'tep_get_country_name', 'tep_cfg_pull_down_country_list('),
(118, 'Postal Code', 'SHIPPING_ORIGIN_ZIP', 'NONE', 'Enter the Postal Code (ZIP) of the Store to be used in shipping quotes.', 7, 2, NULL, '2014-06-30 14:38:15', NULL, NULL),
(119, 'Enter the Maximum Package Weight you will ship', 'SHIPPING_MAX_WEIGHT', '50', 'Carriers have a max weight limit for a single package. This is a common one for all.', 7, 3, NULL, '2014-06-30 14:38:15', NULL, NULL),
(120, 'Package Tare weight.', 'SHIPPING_BOX_WEIGHT', '3', 'What is the weight of typical packaging of small to medium packages?', 7, 4, NULL, '2014-06-30 14:38:15', NULL, NULL),
(121, 'Larger packages - percentage increase.', 'SHIPPING_BOX_PADDING', '10', 'For 10% enter 10', 7, 5, NULL, '2014-06-30 14:38:15', NULL, NULL),
(122, 'Allow Orders Not Matching Defined Shipping Zones ', 'SHIPPING_ALLOW_UNDEFINED_ZONES', 'False', 'Should orders be allowed to shipping addresses not matching defined shipping module shipping zones?', 7, 5, NULL, '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(123, 'Display Product Image (0=disable; 1=enable)', 'PRODUCT_LIST_IMAGE', '1', 'Do you want to display the Product Image?', 8, 1, '2014-07-25 16:49:37', '2014-06-30 14:38:15', NULL, NULL),
(124, 'Display Product Manufacturer Name (0=disable; 1=enable)', 'PRODUCT_LIST_MANUFACTURER', '1', 'Do you want to display the Product Manufacturer Name?', 8, 2, '2014-07-18 12:35:46', '2014-06-30 14:38:15', NULL, NULL),
(125, 'Display Product Model (0=disable; 1=enable)', 'PRODUCT_LIST_MODEL', '0', 'Do you want to display the Product Model?', 8, 3, '2014-07-28 13:30:43', '2014-06-30 14:38:15', NULL, NULL),
(126, 'Display Product Name (0=disable; 1=enable)', 'PRODUCT_LIST_NAME', '1', 'Do you want to display the Product Name?', 8, 4, '2014-07-18 12:35:55', '2014-06-30 14:38:15', NULL, NULL),
(127, 'Display Product Price (0=disable; 1=enable)', 'PRODUCT_LIST_PRICE', '1', 'Do you want to display the Product Price', 8, 5, '2014-07-18 12:36:01', '2014-06-30 14:38:15', NULL, NULL),
(128, 'Display Product Quantity (0=disable; 1=enable)', 'PRODUCT_LIST_QUANTITY', '0', 'Do you want to display the Product Quantity?', 8, 6, '2014-07-28 13:21:53', '2014-06-30 14:38:15', NULL, NULL),
(129, 'Display Product Weight (0=disable; 1=enable)', 'PRODUCT_LIST_WEIGHT', '0', 'Do you want to display the Product Weight?', 8, 7, '2014-07-28 13:21:59', '2014-06-30 14:38:16', NULL, NULL),
(130, 'Display Buy Now column (0=disable; 1=enable)', 'PRODUCT_LIST_BUY_NOW', '1', 'Do you want to display the Buy Now column?', 8, 9, '2014-07-18 12:37:47', '2014-06-30 14:38:16', NULL, NULL),
(131, 'Display Category/Manufacturer Filter (0=disable; 1=enable)', 'PRODUCT_LIST_FILTER', '1', 'Do you want to display the Category/Manufacturer Filter?', 8, 9, NULL, '2014-06-30 14:38:16', NULL, NULL),
(132, 'Location of Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 'PREV_NEXT_BAR_LOCATION', '3', 'Sets the location of the Prev/Next Navigation Bar (1-top, 2-bottom, 3-both)', 8, 10, '2014-07-02 10:20:23', '2014-06-30 14:38:16', NULL, NULL),
(133, 'Check stock level', 'STOCK_CHECK', 'true', 'Check to see if sufficent stock is available', 9, 1, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(134, 'Subtract stock', 'STOCK_LIMITED', 'true', 'Subtract product in stock by product orders', 9, 2, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(135, 'Allow Checkout', 'STOCK_ALLOW_CHECKOUT', 'true', 'Allow customer to checkout even if there is insufficient stock', 9, 3, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(136, 'Mark product out of stock', 'STOCK_MARK_PRODUCT_OUT_OF_STOCK', '***', 'Display something on screen so customer can see which product has insufficient stock', 9, 4, NULL, '2014-06-30 14:38:16', NULL, NULL),
(137, 'Stock Re-order level', 'STOCK_REORDER_LEVEL', '5', 'Define when stock needs to be re-ordered', 9, 5, NULL, '2014-06-30 14:38:16', NULL, NULL),
(138, 'Store Page Parse Time', 'STORE_PAGE_PARSE_TIME', 'false', 'Store the time it takes to parse a page', 10, 1, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(139, 'Log Destination', 'STORE_PAGE_PARSE_TIME_LOG', '/var/log/www/tep/page_parse_time.log', 'Directory and filename of the page parse time log', 10, 2, NULL, '2014-06-30 14:38:16', NULL, NULL),
(140, 'Log Date Format', 'STORE_PARSE_DATE_TIME_FORMAT', '%d/%m/%Y %H:%M:%S', 'The date format', 10, 3, NULL, '2014-06-30 14:38:16', NULL, NULL),
(141, 'Display The Page Parse Time', 'DISPLAY_PAGE_PARSE_TIME', 'true', 'Display the page parse time (store page parse time must be enabled)', 10, 4, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(142, 'Store Database Queries', 'STORE_DB_TRANSACTIONS', 'false', 'Store the database queries in the page parse time log', 10, 5, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(143, 'Use Cache', 'USE_CACHE', 'false', 'Use caching features', 11, 1, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(144, 'Cache Directory', 'DIR_FS_CACHE', 'D:/wamp/www/osc/theme_default/includes/work/', 'The directory where the cached files are saved', 11, 2, NULL, '2014-06-30 14:38:16', NULL, NULL),
(145, 'E-Mail Transport Method', 'EMAIL_TRANSPORT', 'sendmail', 'Defines if this server uses a local connection to sendmail or uses an SMTP connection via TCP/IP. Servers running on Windows and MacOS should change this setting to SMTP.', 12, 1, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''sendmail'', ''smtp''),'),
(146, 'E-Mail Linefeeds', 'EMAIL_LINEFEED', 'LF', 'Defines the character sequence used to separate mail headers.', 12, 2, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''LF'', ''CRLF''),'),
(147, 'Use MIME HTML When Sending Emails', 'EMAIL_USE_HTML', 'false', 'Send e-mails in HTML format', 12, 3, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(148, 'Verify E-Mail Addresses Through DNS', 'ENTRY_EMAIL_ADDRESS_CHECK', 'false', 'Verify e-mail address through a DNS server', 12, 4, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(149, 'Send E-Mails', 'SEND_EMAILS', 'true', 'Send out e-mails', 12, 5, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(150, 'Enable download', 'DOWNLOAD_ENABLED', 'false', 'Enable the products download functions.', 13, 1, '2014-07-25 17:46:20', '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(151, 'Download by redirect', 'DOWNLOAD_BY_REDIRECT', 'false', 'Use browser redirection for download. Disable on non-Unix systems.', 13, 2, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(152, 'Expiry delay (days)', 'DOWNLOAD_MAX_DAYS', '7', 'Set number of days before the download link expires. 0 means no limit.', 13, 3, NULL, '2014-06-30 14:38:16', NULL, ''),
(153, 'Maximum number of downloads', 'DOWNLOAD_MAX_COUNT', '5', 'Set the maximum number of downloads. 0 means no download authorized.', 13, 4, NULL, '2014-06-30 14:38:16', NULL, ''),
(154, 'Enable GZip Compression', 'GZIP_COMPRESSION', 'false', 'Enable HTTP GZip compression.', 14, 1, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(155, 'Compression Level', 'GZIP_LEVEL', '5', 'Use this compression level 0-9 (0 = minimum, 9 = maximum).', 14, 2, NULL, '2014-06-30 14:38:16', NULL, NULL),
(156, 'Session Directory', 'SESSION_WRITE_DIRECTORY', 'D:/wamp/www/osc/theme_default/includes/work/', 'If sessions are file based, store them in this directory.', 15, 1, NULL, '2014-06-30 14:38:16', NULL, NULL),
(157, 'Force Cookie Use', 'SESSION_FORCE_COOKIE_USE', 'False', 'Force the use of sessions when cookies are only enabled.', 15, 2, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(158, 'Check SSL Session ID', 'SESSION_CHECK_SSL_SESSION_ID', 'False', 'Validate the SSL_SESSION_ID on every secure HTTPS page request.', 15, 3, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(159, 'Check User Agent', 'SESSION_CHECK_USER_AGENT', 'False', 'Validate the clients browser user agent on every page request.', 15, 4, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(160, 'Check IP Address', 'SESSION_CHECK_IP_ADDRESS', 'False', 'Validate the clients IP address on every page request.', 15, 5, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(161, 'Prevent Spider Sessions', 'SESSION_BLOCK_SPIDERS', 'True', 'Prevent known spiders from starting a session.', 15, 6, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(162, 'Recreate Session', 'SESSION_RECREATE', 'True', 'Recreate the session to generate a new session ID when the customer logs on or creates an account (PHP >=4.1 needed).', 15, 7, NULL, '2014-06-30 14:38:16', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(163, 'Last Update Check Time', 'LAST_UPDATE_CHECK_TIME', '', 'Last time a check for new versions of osCommerce was run', 6, 0, NULL, '2014-06-30 14:38:16', NULL, NULL),
(164, 'Enable PayPal Express Checkout', 'MODULE_PAYMENT_PAYPAL_EXPRESS_STATUS', 'True', 'Do you want to accept PayPal Express Checkout payments?', 6, 1, NULL, '2014-06-30 14:38:24', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(165, 'Seller Account', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SELLER_ACCOUNT', 'admin@admin.com', 'The email address of the seller account if no API credentials has been setup.', 6, 0, NULL, '2014-06-30 14:38:24', NULL, NULL),
(166, 'API Username', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_USERNAME', '', 'The username to use for the PayPal API service', 6, 0, NULL, '2014-06-30 14:38:24', NULL, NULL),
(167, 'API Password', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_PASSWORD', '', 'The password to use for the PayPal API service', 6, 0, NULL, '2014-06-30 14:38:24', NULL, NULL),
(168, 'API Signature', 'MODULE_PAYMENT_PAYPAL_EXPRESS_API_SIGNATURE', '', 'The signature to use for the PayPal API service', 6, 0, NULL, '2014-06-30 14:38:24', NULL, NULL),
(169, 'PayPal Account Optional', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ACCOUNT_OPTIONAL', 'False', 'This must also be enabled in your PayPal account, in Profile > Website Payment Preferences.', 6, 0, NULL, '2014-06-30 14:38:24', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(170, 'PayPal Instant Update', 'MODULE_PAYMENT_PAYPAL_EXPRESS_INSTANT_UPDATE', 'True', 'Support PayPal shipping and tax calculations on the PayPal.com site during Express Checkout.', 6, 0, NULL, '2014-06-30 14:38:24', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(171, 'PayPal Checkout Image', 'MODULE_PAYMENT_PAYPAL_EXPRESS_CHECKOUT_IMAGE', 'Static', 'Use static or dynamic Express Checkout image buttons. Dynamic images are used with PayPal campaigns.', 6, 0, NULL, '2014-06-30 14:38:24', NULL, 'tep_cfg_select_option(array(''Static'', ''Dynamic''), '),
(172, 'Page Style', 'MODULE_PAYMENT_PAYPAL_EXPRESS_PAGE_STYLE', '', 'The page style to use for the checkout flow (defined at your PayPal Profile page)', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(173, 'Transaction Method', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_METHOD', 'Sale', 'The processing method to use for each transaction.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''Authorization'', ''Sale''), '),
(174, 'Set Order Status', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ORDER_STATUS_ID', '0', 'Set the status of orders made with this payment module to this value', 6, 0, NULL, '2014-06-30 14:38:25', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(175, 'PayPal Transactions Order Status Level', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTIONS_ORDER_STATUS_ID', '4', 'Include PayPal transaction information in this order status level', 6, 0, NULL, '2014-06-30 14:38:25', 'tep_get_order_status_name', 'tep_cfg_pull_down_order_statuses('),
(176, 'Payment Zone', 'MODULE_PAYMENT_PAYPAL_EXPRESS_ZONE', '0', 'If a zone is selected, only enable this payment method for that zone.', 6, 2, NULL, '2014-06-30 14:38:25', 'tep_get_zone_class_title', 'tep_cfg_pull_down_zone_classes('),
(177, 'Transaction Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_TRANSACTION_SERVER', 'Live', 'Use the live or testing (sandbox) gateway server to process transactions?', 6, 0, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''Live'', ''Sandbox''), '),
(178, 'Verify SSL Certificate', 'MODULE_PAYMENT_PAYPAL_EXPRESS_VERIFY_SSL', 'True', 'Verify gateway server SSL certificate on connection?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(179, 'Proxy Server', 'MODULE_PAYMENT_PAYPAL_EXPRESS_PROXY', '', 'Send API requests through this proxy server. (host:port, eg: 123.45.67.89:8080 or proxy.example.com:8080)', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(180, 'Debug E-Mail Address', 'MODULE_PAYMENT_PAYPAL_EXPRESS_DEBUG_EMAIL', '', 'All parameters of an invalid transaction will be sent to this email address.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(181, 'Sort order of display.', 'MODULE_PAYMENT_PAYPAL_EXPRESS_SORT_ORDER', '0', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(182, 'Installed Modules', 'MODULE_HEADER_TAGS_INSTALLED', 'ht_manufacturer_title.php;ht_category_title.php;ht_product_title.php;ht_canonical.php;ht_robot_noindex.php', 'List of header tag module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, '2014-07-25 17:45:50', '2014-06-30 14:38:25', NULL, NULL),
(183, 'Enable Category Title Module', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_STATUS', 'True', 'Do you want to allow category titles to be added to the page title?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(184, 'Sort Order', 'MODULE_HEADER_TAGS_CATEGORY_TITLE_SORT_ORDER', '200', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(185, 'Enable Manufacturer Title Module', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_STATUS', 'True', 'Do you want to allow manufacturer titles to be added to the page title?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(186, 'Sort Order', 'MODULE_HEADER_TAGS_MANUFACTURER_TITLE_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(187, 'Enable Product Title Module', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_STATUS', 'True', 'Do you want to allow product titles to be added to the page title?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(188, 'Sort Order', 'MODULE_HEADER_TAGS_PRODUCT_TITLE_SORT_ORDER', '300', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(189, 'Enable Canonical Module', 'MODULE_HEADER_TAGS_CANONICAL_STATUS', 'True', 'Do you want to enable the Canonical module?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(190, 'Sort Order', 'MODULE_HEADER_TAGS_CANONICAL_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(191, 'Enable Robot NoIndex Module', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_STATUS', 'True', 'Do you want to enable the Robot NoIndex module?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(192, 'Pages', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_process.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;cookie_usage.php;create_account.php;create_account_success.php;login.php;logoff.php;password_forgotten.php;password_reset.php;product_reviews_write.php;shopping_cart.php;ssl_check.php;tell_a_friend.php', 'The pages to add the meta robot noindex tag to.', 6, 0, NULL, '2014-06-30 14:38:25', 'ht_robot_noindex_show_pages', 'ht_robot_noindex_edit_pages('),
(193, 'Sort Order', 'MODULE_HEADER_TAGS_ROBOT_NOINDEX_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(194, 'Installed Modules', 'MODULE_ADMIN_DASHBOARD_INSTALLED', 'd_total_revenue.php;d_total_customers.php;d_orders.php;d_customers.php;d_admin_logins.php;d_security_checks.php;d_latest_news.php;d_latest_addons.php;d_partner_news.php;d_version_check.php;d_reviews.php', 'List of Administration Tool Dashboard module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(195, 'Enable Administrator Logins Module', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_STATUS', 'True', 'Do you want to show the latest administrator logins on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(196, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_ADMIN_LOGINS_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(197, 'Enable Customers Module', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_STATUS', 'True', 'Do you want to show the newest customers on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(198, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_CUSTOMERS_SORT_ORDER', '400', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(199, 'Enable Latest Add-Ons Module', 'MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_STATUS', 'True', 'Do you want to show the latest osCommerce Add-Ons on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(200, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_LATEST_ADDONS_SORT_ORDER', '800', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(201, 'Enable Latest News Module', 'MODULE_ADMIN_DASHBOARD_LATEST_NEWS_STATUS', 'True', 'Do you want to show the latest osCommerce News on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(202, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_LATEST_NEWS_SORT_ORDER', '700', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(203, 'Enable Orders Module', 'MODULE_ADMIN_DASHBOARD_ORDERS_STATUS', 'True', 'Do you want to show the latest orders on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(204, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_ORDERS_SORT_ORDER', '300', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(205, 'Enable Security Checks Module', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_STATUS', 'True', 'Do you want to run the security checks for this installation?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(206, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_SECURITY_CHECKS_SORT_ORDER', '600', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(207, 'Enable Total Customers Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_STATUS', 'True', 'Do you want to show the total customers chart on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(208, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_TOTAL_CUSTOMERS_SORT_ORDER', '200', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(209, 'Enable Total Revenue Module', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_STATUS', 'True', 'Do you want to show the total revenue chart on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(210, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_TOTAL_REVENUE_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(211, 'Enable Version Check Module', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_STATUS', 'True', 'Do you want to show the version check results on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(212, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_VERSION_CHECK_SORT_ORDER', '900', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(213, 'Enable Latest Reviews Module', 'MODULE_ADMIN_DASHBOARD_REVIEWS_STATUS', 'True', 'Do you want to show the latest reviews on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(214, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_REVIEWS_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(215, 'Enable Partner News Module', 'MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_STATUS', 'True', 'Do you want to show the latest osCommerce Partner News on the dashboard?', 6, 1, NULL, '2014-06-30 14:38:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(216, 'Sort Order', 'MODULE_ADMIN_DASHBOARD_PARTNER_NEWS_SORT_ORDER', '820', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:25', NULL, NULL),
(217, 'Installed Modules', 'MODULE_BOXES_INSTALLED', 'h_currencies.php;h_languages.php;h_search.php;h_menu.php;h_shopping_cart.php;bm_categories_superfish.php;bm_nivo_slider.php;bm_banner_content.php;bm_categories.php;bm_shopping_cart.php;bm_product_notifications.php;bm_currencies.php;bm_specials.php;bm_best_sellers.php;bm_tag.php;bm_card_acceptance.php;bm_featured.php;bm_whats_new.php;bm_search.php;bm_information.php;bm_manufacturers.php;bm_manufacturer_info.php;bm_languages.php;bm_order_history.php;bm_reviews.php;f_menu_footer.php;f_information_account.php;f_social.php;f_contact.php;bm_banner_box.php;bm_product_social_bookmarks.php;h_information_account.php', 'List of box module filenames separated by a semi-colon. This is automatically updated. No need to edit.', 6, 0, '2014-07-25 16:54:05', '2014-06-30 14:38:25', NULL, NULL),
(267, 'Installed Template Block Groups', 'TEMPLATE_BLOCK_GROUPS', 'boxes;header_tags', 'This is automatically updated. No need to edit.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(268, 'Installed Modules', 'MODULE_CONTENT_INSTALLED', 'account/cm_account_set_password;checkout_success/cm_cs_redirect_old_order;checkout_success/cm_cs_thank_you;checkout_success/cm_cs_product_notifications;checkout_success/cm_cs_downloads;login/cm_login_form;login/cm_create_account_link', 'This is automatically updated. No need to edit.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(269, 'Enable Set Account Password', 'MODULE_CONTENT_ACCOUNT_SET_PASSWORD_STATUS', 'True', 'Do you want to enable the Set Account Password module?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(270, 'Allow Local Passwords', 'MODULE_CONTENT_ACCOUNT_SET_PASSWORD_ALLOW_PASSWORD', 'True', 'Allow local account passwords to be set.', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(271, 'Sort Order', 'MODULE_CONTENT_ACCOUNT_SET_PASSWORD_SORT_ORDER', '100', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(272, 'Enable Redirect Old Order Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_STATUS', 'True', 'Should customers be redirected when viewing old checkout success orders?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(273, 'Redirect Minutes', 'MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_MINUTES', '60', 'Redirect customers to the My Account page after an order older than this amount is viewed.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(274, 'Sort Order', 'MODULE_CONTENT_CHECKOUT_SUCCESS_REDIRECT_OLD_ORDER_SORT_ORDER', '500', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(275, 'Enable Thank You Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_STATUS', 'True', 'Should the thank you block be shown on the checkout success page?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(276, 'Sort Order', 'MODULE_CONTENT_CHECKOUT_SUCCESS_THANK_YOU_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(277, 'Enable Product Notifications Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_STATUS', 'True', 'Should the product notifications block be shown on the checkout success page?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(278, 'Sort Order', 'MODULE_CONTENT_CHECKOUT_SUCCESS_PRODUCT_NOTIFICATIONS_SORT_ORDER', '2000', 'Sort order of display. Lowest is displayed first.', 6, 3, NULL, '2014-06-30 14:38:26', NULL, NULL),
(279, 'Enable Product Downloads Module', 'MODULE_CONTENT_CHECKOUT_SUCCESS_DOWNLOADS_STATUS', 'True', 'Should ordered product download links be shown on the checkout success page?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(280, 'Sort Order', 'MODULE_CONTENT_CHECKOUT_SUCCESS_DOWNLOADS_SORT_ORDER', '3000', 'Sort order of display. Lowest is displayed first.', 6, 3, NULL, '2014-06-30 14:38:26', NULL, NULL),
(281, 'Enable Login Form Module', 'MODULE_CONTENT_LOGIN_FORM_STATUS', 'True', 'Do you want to enable the login form module?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(282, 'Content Width', 'MODULE_CONTENT_LOGIN_FORM_CONTENT_WIDTH', 'Half', 'Should the content be shown in a full or half width container?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''Full'', ''Half''), '),
(283, 'Sort Order', 'MODULE_CONTENT_LOGIN_FORM_SORT_ORDER', '1000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL),
(284, 'Enable New User Module', 'MODULE_CONTENT_CREATE_ACCOUNT_LINK_STATUS', 'True', 'Do you want to enable the new user module?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(285, 'Content Width', 'MODULE_CONTENT_CREATE_ACCOUNT_LINK_CONTENT_WIDTH', 'Half', 'Should the content be shown in a full or half width container?', 6, 1, NULL, '2014-06-30 14:38:26', NULL, 'tep_cfg_select_option(array(''Full'', ''Half''), '),
(286, 'Sort Order', 'MODULE_CONTENT_CREATE_ACCOUNT_LINK_SORT_ORDER', '2000', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-06-30 14:38:26', NULL, NULL);
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(289, '<strong>Homepage Image Width</strong>', 'HOMEPAGE_IMAGE_WIDTH', '250', 'The pixel width of homepage and listing images', 4, 9, '2014-08-14 16:48:31', '2014-06-30 14:38:15', NULL, NULL),
(290, '<strong>Homepage Image Height</strong>', 'HOMEPAGE_IMAGE_HEIGHT', '366', 'The pixel height of homepage and listing images', 4, 10, '2014-08-14 16:48:24', '2014-06-30 14:38:15', NULL, NULL),
(291, '<strong>Also Purchased Image Width</strong>', 'ALSOPURCHASED_IMAGE_WIDTH', '185', 'The pixel width of Also Purchased images', 4, 11, NULL, '2014-06-30 14:38:15', NULL, NULL),
(292, '<strong>Also Purchased Image Height</strong>', 'ALSOPURCHASED_IMAGE_HEIGHT', '264', 'The pixel height of Also Purchased images', 4, 12, '2014-07-25 15:36:14', '2014-06-30 14:38:15', NULL, NULL),
(293, '<strong>Product Info Image Height</strong>', 'PRODUCTINFO_IMAGE_HEIGHT', '374', 'The pixel height of Product Info images', 4, 14, '2014-07-25 15:36:36', '2014-06-30 14:38:15', NULL, NULL),
(294, '<strong>Product Info Image Width</strong>', 'PRODUCTINFO_IMAGE_WIDTH', '262', 'The pixel width of Product Info images', 4, 13, '2014-07-07 17:30:00', '2014-06-30 14:38:15', NULL, NULL),
(295, '<strong>Product Info Thumbs Image Width</strong>', 'PRODUCTTHUMB_IMAGE_WIDTH', '80', 'The pixel width of Product Info Thumbs images', 4, 15, NULL, '2014-06-30 14:38:15', NULL, NULL),
(296, '<strong>Product Info Thumbs Image Height</strong>', 'PRODUCTTHUMB_IMAGE_HEIGHT', '114', 'The pixel height of Product Info Thumbs images', 4, 16, '2014-07-25 15:36:49', '2014-06-30 14:38:15', NULL, NULL),
(297, 'Current Version', 'RELATED_PRODUCTS_VERSION_INSTALLED', '4.0', 'This key is used by the SQL install to automatically update your database during upgrades. It is read only.', 17, 0, NULL, '2014-07-08 17:37:11', NULL, 'tep_version_readonly('),
(298, 'Display Thumbnail Images', 'RELATED_PRODUCTS_SHOW_THUMBS', 'True', 'Show Product Image', 17, 1, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(299, 'Display Product Name', 'RELATED_PRODUCTS_SHOW_NAME', 'True', 'Show Product Name', 17, 2, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(300, 'Display Product Model', 'RELATED_PRODUCTS_SHOW_MODEL', 'True', 'Show Product Model', 17, 3, '2014-07-08 18:30:15', '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(301, 'Display Price', 'RELATED_PRODUCTS_SHOW_PRICE', 'True', 'Show Product Price', 17, 4, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(302, 'Display Quantity Available', 'RELATED_PRODUCTS_SHOW_QUANTITY', 'True', 'Show Product Quantity', 17, 5, '2014-07-08 18:30:22', '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(303, 'Display Buy Now Button', 'RELATED_PRODUCTS_SHOW_BUY_NOW', 'True', 'Show Buy Now Button', 17, 6, '2014-07-08 18:30:28', '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(304, 'Split Display Into Rows', 'RELATED_PRODUCTS_USE_ROWS', 'True', 'Set this option to True to display Related Products in multiple rows.', 17, 7, '2014-07-08 18:30:41', '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(306, 'Define Number of Items to Display', 'RELATED_PRODUCTS_MAX_DISP', '0', 'Maximum number of Related Products to display. 0 is unlimited.', 17, 9, NULL, '2014-07-08 17:37:11', NULL, ''),
(307, 'Use Random Display Order', 'RELATED_PRODUCTS_RANDOMIZE', 'False', 'Adds random sort order to products displayed. Recommended if maximum number of products is set.', 17, 10, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(308, 'Admin Display: Maximum Rows', 'RELATED_PRODUCTS_MAX_ROW_LISTS_OPTIONS', '10', 'Sets the maximum number of rows to display per page.', 17, 11, NULL, '2014-07-08 17:37:11', NULL, ''),
(309, 'Admin Display: Drop-Down List Maximum Length', 'RELATED_PRODUCTS_MAX_NAME_LENGTH', '25', 'Sets the maximum length (in characters) of product name displayed in drop-down lists. Enter ''0'' to set this option to false.', 17, 12, NULL, '2014-07-08 17:37:11', NULL, ''),
(310, 'Admin Display: Display List Maximum Length', 'RELATED_PRODUCTS_MAX_DISPLAY_LENGTH', '0', 'Sets the maximum length (in characters) of product name displayed in list. Enter ''0'' to set this option to false.', 17, 13, NULL, '2014-07-08 17:37:11', NULL, ''),
(311, 'Admin Display: Use Product Model', 'RELATED_PRODUCTS_ADMIN_USE_MODEL', 'True', 'Uses Product Model in lists. When Product Name is also selected, Product Model is displayed first.', 17, 14, '2014-07-08 18:37:29', '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(312, 'Admin Display: Use Product Name', 'RELATED_PRODUCTS_ADMIN_USE_NAME', 'True', 'Uses Product Name in lists. When Product Model is also selected, Product Model is displayed first.', 17, 15, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(313, 'Admin Display: Combine Model and Name separator', 'RELATED_PRODUCTS_ADMIN_MODEL_SEPARATOR', ': ', 'Enter the characters you would like to separate Model from Name, when using both. Leave empty if only using Model.', 17, 16, NULL, '2014-07-08 17:37:11', NULL, ''),
(314, 'Admin Function: Use Delete Confirmation', 'RELATED_PRODUCTS_CONFIRM_DELETE', 'True', 'When set to True, a confirmation box will pop-up when deleting an association. Set to False to Delete without confirmation.', 17, 17, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(315, 'Admin Function: Combine Insert with Inherit', 'RELATED_PRODUCTS_INSERT_AND_INHERIT', 'True', 'When set to True, clicking on Inherit will also Insert the product association. When False, Inherit works as before.', 17, 18, NULL, '2014-07-08 17:37:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''),'),
(319, 'Display Featured Products', 'FEATURED_PRODUCTS_DISPLAY', 'true', 'Set to true or false in order to display featured.', 18, 1, '2014-07-09 17:34:53', '2014-07-09 17:34:53', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(320, 'Maximum Display of Featured', 'MAX_DISPLAY_FEATURED_PRODUCTS', '3', 'This is the maximum amount of items to display on the front page.', 18, 3, '2014-07-10 14:38:52', '2014-07-09 17:34:53', NULL, NULL),
(321, 'Include Sub Categories When Displaying Featured Products', 'FEATURED_PRODUCTS_SUB_CATEGORIES', 'true', 'Set to true or false in order to display featured including sub categories.', 18, 5, '2014-07-09 17:34:53', '2014-07-09 17:34:53', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(322, 'Specials Only When Displaying Featured Products', 'FEATURED_PRODUCTS_SPECIALS_ONLY', 'false', 'Set to true or false in order to display only on special featured products.', 18, 6, '2014-07-09 17:34:53', '2014-07-09 17:34:53', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(323, '<strong>Featured Products Listing</strong>', 'MAX_DISPLAY_PRODUCTS_FEATURED', '6', 'Maximum number of featured products to display in featured products page', 3, 21, '2014-07-10 11:16:19', '2014-06-30 14:38:14', NULL, NULL),
(324, '<strong>Product Listing Length of Description (grid)</strong>', 'PRODUCT_LIST_DESCRIPTION_GRID', '200', 'Length of Description in a Product Listing Pages (grid view).', 8, 8, '2014-07-16 15:27:05', '2014-06-30 14:38:15', NULL, NULL),
(325, '<strong>Product Listing Length of Description (list)</strong>', 'PRODUCT_LIST_DESCRIPTION_LIST', '400', 'Length of Description in a Product Listing Pages (list view).', 8, 9, '2014-07-16 15:28:59', '2014-06-30 14:38:15', NULL, NULL),
(326, '<b>Display Featured Products on Home page</b>', 'FEATURED_PRODUCTS_DISPLAY_HOME', 'true', 'Set to true or false in order to display featured on Home page.', 18, 1, '2014-07-10 14:42:40', '2014-07-09 17:34:53', NULL, 'tep_cfg_select_option(array(''true'', ''false''),'),
(327, '<b>Maximum Display of Featured on Home Page</b>', 'MAX_DISPLAY_FEATURED_PRODUCTS_HOME', '3', 'This is the maximum amount of items to display on the home page.', 18, 4, '2014-07-10 14:39:03', '2014-07-09 17:34:53', NULL, NULL),
(350, 'Enable Search Module', 'MODULE_BOXES_HEADER_SEARCH_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 12:51:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(351, 'Content Placement', 'MODULE_BOXES_HEADER_SEARCH_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 12:51:11', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(352, 'Sort Order', 'MODULE_BOXES_HEADER_SEARCH_SORT_ORDER', '3', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 12:51:11', NULL, NULL),
(353, 'Display in pages.', 'MODULE_BOXES_HEADER_SEARCH_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 12:51:11', NULL, 'tep_cfg_select_pages('),
(354, 'Enable Best Sellers Module', 'MODULE_BOXES_BEST_SELLERS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 12:55:14', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(355, 'Content Placement', 'MODULE_BOXES_BEST_SELLERS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 12:55:14', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(356, 'Sort Order', 'MODULE_BOXES_BEST_SELLERS_SORT_ORDER', '14', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 12:55:14', NULL, NULL),
(357, 'Display in pages.', 'MODULE_BOXES_BEST_SELLERS_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 12:55:14', NULL, 'tep_cfg_select_pages('),
(358, 'Enable Card Acceptance Module', 'MODULE_BOXES_CARD_ACCEPTANCE_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 12:58:23', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(359, 'Logos', 'MODULE_BOXES_CARD_ACCEPTANCE_LOGOS', 'paypal_horizontal_large.png;visa.png;mastercard_transparent.png;american_express.png;maestro_transparent.png', 'The card acceptance logos to show.', 6, 0, NULL, '2014-07-11 12:58:23', 'bm_card_acceptance_show_logos', 'bm_card_acceptance_edit_logos('),
(360, 'Content Placement', 'MODULE_BOXES_CARD_ACCEPTANCE_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 12:58:23', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(361, 'Sort Order', 'MODULE_BOXES_CARD_ACCEPTANCE_SORT_ORDER', '16', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 12:58:24', NULL, NULL),
(362, 'Display in pages.', 'MODULE_BOXES_CARD_ACCEPTANCE_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 12:58:24', NULL, 'tep_cfg_select_pages('),
(367, 'Enable Currencies Module', 'MODULE_BOXES_CURRENCIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:14:35', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(368, 'Content Placement', 'MODULE_BOXES_CURRENCIES_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:14:35', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(369, 'Sort Order', 'MODULE_BOXES_CURRENCIES_SORT_ORDER', '12', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:14:35', NULL, NULL),
(370, 'Display in pages.', 'MODULE_BOXES_CURRENCIES_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:14:35', NULL, 'tep_cfg_select_pages('),
(371, 'Enable Featured Module', 'MODULE_BOXES_FEATURED_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:16:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(372, 'Content Placement', 'MODULE_BOXES_FEATURED_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:16:12', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(373, 'Sort Order', 'MODULE_BOXES_FEATURED_SORT_ORDER', '17', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:16:12', NULL, NULL),
(374, 'Display in pages.', 'MODULE_BOXES_FEATURED_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:16:12', NULL, 'tep_cfg_select_pages('),
(375, 'Enable Information Module', 'MODULE_BOXES_INFORMATION_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:19:05', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(376, 'Content Placement', 'MODULE_BOXES_INFORMATION_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:19:05', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(377, 'Sort Order', 'MODULE_BOXES_INFORMATION_SORT_ORDER', '20', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:19:05', NULL, NULL),
(378, 'Display in pages.', 'MODULE_BOXES_INFORMATION_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:19:05', NULL, 'tep_cfg_select_pages('),
(379, 'Enable Languages Module', 'MODULE_BOXES_LANGUAGES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:22:39', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(380, 'Content Placement', 'MODULE_BOXES_LANGUAGES_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:22:39', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(381, 'Sort Order', 'MODULE_BOXES_LANGUAGES_SORT_ORDER', '23', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:22:39', NULL, NULL),
(382, 'Display in pages.', 'MODULE_BOXES_LANGUAGES_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:22:39', NULL, 'tep_cfg_select_pages('),
(383, 'Enable Manufacturer Info Module', 'MODULE_BOXES_MANUFACTURER_INFO_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:24:28', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(384, 'Content Placement', 'MODULE_BOXES_MANUFACTURER_INFO_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:24:28', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(385, 'Sort Order', 'MODULE_BOXES_MANUFACTURER_INFO_SORT_ORDER', '22', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:24:28', NULL, NULL),
(386, 'Display in pages.', 'MODULE_BOXES_MANUFACTURER_INFO_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:24:28', NULL, 'tep_cfg_select_pages('),
(387, 'Enable Manufacturers Module', 'MODULE_BOXES_MANUFACTURERS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:26:11', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(388, 'Content Placement', 'MODULE_BOXES_MANUFACTURERS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:26:11', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(389, 'Sort Order', 'MODULE_BOXES_MANUFACTURERS_SORT_ORDER', '21', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:26:11', NULL, NULL),
(390, 'Display in pages.', 'MODULE_BOXES_MANUFACTURERS_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:26:11', NULL, 'tep_cfg_select_pages('),
(391, 'Enable Order History Module', 'MODULE_BOXES_ORDER_HISTORY_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:28:25', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(392, 'Content Placement', 'MODULE_BOXES_ORDER_HISTORY_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:28:25', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(393, 'Sort Order', 'MODULE_BOXES_ORDER_HISTORY_SORT_ORDER', '24', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:28:25', NULL, NULL),
(394, 'Display in pages.', 'MODULE_BOXES_ORDER_HISTORY_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:28:25', NULL, 'tep_cfg_select_pages('),
(395, 'Enable Product Notifications Module', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:31:02', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(396, 'Content Placement', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:31:02', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(397, 'Sort Order', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_SORT_ORDER', '11', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:31:02', NULL, NULL),
(398, 'Display in pages.', 'MODULE_BOXES_PRODUCT_NOTIFICATIONS_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:31:02', NULL, 'tep_cfg_select_pages('),
(399, 'Enable Product Social Bookmarks Module', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:32:27', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(400, 'Content Placement', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:32:27', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(401, 'Sort Order', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_SORT_ORDER', '12', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:32:27', NULL, NULL),
(402, 'Display in pages.', 'MODULE_BOXES_PRODUCT_SOCIAL_BOOKMARKS_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:32:27', NULL, 'tep_cfg_select_pages('),
(403, 'Enable Reviews Module', 'MODULE_BOXES_REVIEWS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:34:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(404, 'Content Placement', 'MODULE_BOXES_REVIEWS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:34:12', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(405, 'Sort Order', 'MODULE_BOXES_REVIEWS_SORT_ORDER', '25', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:34:12', NULL, NULL),
(406, 'Display in pages.', 'MODULE_BOXES_REVIEWS_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:34:12', NULL, 'tep_cfg_select_pages('),
(411, 'Enable Shopping Cart Module', 'MODULE_BOXES_SHOPPING_CART_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:37:15', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(412, 'Content Placement', 'MODULE_BOXES_SHOPPING_CART_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:37:15', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(413, 'Sort Order', 'MODULE_BOXES_SHOPPING_CART_SORT_ORDER', '10', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:37:15', NULL, NULL),
(414, 'Display in pages.', 'MODULE_BOXES_SHOPPING_CART_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:37:15', NULL, 'tep_cfg_select_pages('),
(415, 'Enable Specials Module', 'MODULE_BOXES_SPECIALS_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:38:30', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(416, 'Content Placement', 'MODULE_BOXES_SPECIALS_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:38:30', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(417, 'Sort Order', 'MODULE_BOXES_SPECIALS_SORT_ORDER', '13', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:38:30', NULL, NULL),
(418, 'Display in pages.', 'MODULE_BOXES_SPECIALS_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:38:30', NULL, 'tep_cfg_select_pages('),
(419, 'Enable Specials Module', 'MODULE_BOXES_TAG_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-11 14:40:44', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(420, 'Content Placement', 'MODULE_BOXES_TAG_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-11 14:40:44', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(421, 'Sort Order', 'MODULE_BOXES_TAG_SORT_ORDER', '15', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-11 14:40:44', NULL, NULL),
(422, 'Display in pages.', 'MODULE_BOXES_TAG_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-11 14:40:44', NULL, 'tep_cfg_select_pages('),
(474, 'Enable Categories Module', 'MODULE_BOXES_CATEGORIES_MENU_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 14:12:47', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(475, 'Content Placement', 'MODULE_BOXES_CATEGORIES_MENU_CONTENT_PLACEMENT', 'Header', 'Should the module be loaded in the Header Top or Header position?', 6, 1, NULL, '2014-07-14 14:12:47', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(476, 'Sort Order', 'MODULE_BOXES_CATEGORIES_MENU_SORT_ORDER', '3', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 14:12:47', NULL, NULL),
(477, 'Display in pages.', 'MODULE_BOXES_CATEGORIES_MENU_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 14:12:47', NULL, 'tep_cfg_select_pages('),
(478, 'Enable Search Module', 'MODULE_BOXES_HEADER_GATEGORIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 14:37:35', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(479, 'Content Placement', 'MODULE_BOXES_HEADER_GATEGORIES_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-14 14:37:35', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(480, 'Sort Order', 'MODULE_BOXES_HEADER_GATEGORIES_SORT_ORDER', '3', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 14:37:35', NULL, NULL),
(481, 'Display in pages.', 'MODULE_BOXES_HEADER_GATEGORIES_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 14:37:35', NULL, 'tep_cfg_select_pages('),
(496, 'Enable Search Module', 'MODULE_BOXES_HEADER_MENU_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 16:04:48', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(497, 'Content Placement', 'MODULE_BOXES_HEADER_MENU_CONTENT_PLACEMENT', 'Header', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-14 16:04:48', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(498, 'Sort Order', 'MODULE_BOXES_HEADER_MENU_SORT_ORDER', '4', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 16:04:48', NULL, NULL),
(499, 'Display in pages.', 'MODULE_BOXES_HEADER_MENU_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 16:04:48', NULL, 'tep_cfg_select_pages('),
(505, 'Enable Header Shopping Cart Module', 'MODULE_BOXES_HEADER_SHOPPING_CART_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 17:03:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(506, 'Content Placement', 'MODULE_BOXES_HEADER_SHOPPING_CART_CONTENT_PLACEMENT', 'Header', 'Should the module be loaded in the Header or Header top position?', 6, 1, NULL, '2014-07-14 17:03:12', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(507, 'Sort Order', 'MODULE_BOXES_HEADER_SHOPPING_CART_SORT_ORDER', '5', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:03:12', NULL, NULL),
(508, 'Dropdown cart', 'MODULE_BOXES_HEADER_SHOPPING_CART_DROPDOWN', 'True', 'Disable/Enable dropdown Header Shopping Cart. ', 6, 0, NULL, '2014-07-14 17:03:12', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(509, 'Display in pages.', 'MODULE_BOXES_HEADER_SHOPPING_CART_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:03:12', NULL, 'tep_cfg_select_pages('),
(519, 'English Title', 'MODULE_BOXES_CATEGORIES_SUPERFISH_FRONT_TITLE_ENGLISH', '', 'Enter the title that you want in the header in english. Leave this blank for no header or title.', 6, 10, NULL, '2014-07-14 17:06:12', NULL, NULL),
(520, 'Enable Categories Module', 'MODULE_BOXES_CATEGORIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 17:28:29', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(521, 'Content Placement', 'MODULE_BOXES_CATEGORIES_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-14 17:28:29', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(522, 'Sort Order', 'MODULE_BOXES_CATEGORIES_SORT_ORDER', '9', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:28:29', NULL, NULL),
(523, 'Display in pages.', 'MODULE_BOXES_CATEGORIES_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:28:29', NULL, 'tep_cfg_select_pages('),
(524, 'Enable Search Module', 'MODULE_BOXES_SEARCH_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 17:28:41', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(525, 'Content Placement', 'MODULE_BOXES_SEARCH_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-14 17:28:41', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(526, 'Sort Order', 'MODULE_BOXES_SEARCH_SORT_ORDER', '19', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:28:41', NULL, NULL),
(527, 'Display in pages.', 'MODULE_BOXES_SEARCH_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:28:41', NULL, 'tep_cfg_select_pages('),
(528, 'Enable What''s New Module', 'MODULE_BOXES_WHATS_NEW_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 17:28:47', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(529, 'Content Placement', 'MODULE_BOXES_WHATS_NEW_CONTENT_PLACEMENT', 'Left Column', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-14 17:28:47', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(530, 'Sort Order', 'MODULE_BOXES_WHATS_NEW_SORT_ORDER', '18', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:28:47', NULL, NULL),
(531, 'Display in pages.', 'MODULE_BOXES_WHATS_NEW_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:28:47', NULL, 'tep_cfg_select_pages('),
(544, 'Enable Currencies Module', 'MODULE_BOXES_H_CURRENCIES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 17:33:18', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(545, 'Content Placement', 'MODULE_BOXES_H_CURRENCIES_CONTENT_PLACEMENT', 'Header Top', '', 0, 1, NULL, '2014-07-14 17:33:18', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(546, 'Sort Order', 'MODULE_BOXES_H_CURRENCIES_SORT_ORDER', '1', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:33:18', NULL, NULL),
(547, 'Display in pages.', 'MODULE_BOXES_H_CURRENCIES_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:33:18', NULL, 'tep_cfg_select_pages('),
(548, 'Enable Languages Module', 'MODULE_BOXES_HEADER_LANGUAGES_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-14 17:37:36', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(549, 'Content Placement', 'MODULE_BOXES_HEADER_LANGUAGES_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-14 17:37:36', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(550, 'Sort Order', 'MODULE_BOXES_HEADER_LANGUAGES_SORT_ORDER', '2', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:37:36', NULL, NULL),
(551, 'Display in pages.', 'MODULE_BOXES_HEADER_LANGUAGES_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:37:36', NULL, 'tep_cfg_select_pages('),
(552, 'Sort Order', 'MODULE_BOXES_CATEGORIES_SUPERFISH_SORT_ORDER', '6', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-14 17:47:17', NULL, NULL),
(553, 'Enable Superfish Categories Box', 'MODULE_BOXES_CATEGORIES_SUPERFISH_STATUS', 'True', 'Do you want to show the Superfish Categories box?', 6, 1, NULL, '2014-07-14 17:47:17', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(554, 'Content Placement', 'MODULE_BOXES_CATEGORIES_SUPERFISH_CONTENT_PLACEMENT', 'Header', 'Where should the module be loaded?', 6, 1, NULL, '2014-07-14 17:47:17', NULL, 'tep_cfg_select_option(array(''Header'', ''Header Top''), '),
(555, 'Display in pages.', 'MODULE_BOXES_CATEGORIES_SUPERFISH_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-14 17:47:17', NULL, 'tep_cfg_select_pages('),
(556, 'Enable SEO URLs 5?', 'USU5_ENABLED', 'true', 'Turn Seo Urls 5 on', 16, 1, '2014-08-14 17:12:13', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(557, 'Enable the cache?', 'USU5_CACHE_ON', 'true', 'Turn the cache system on', 16, 2, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(558, 'Enable multi language support?', 'USU5_MULTI_LANGUAGE_SEO_SUPPORT', 'true', 'Enable the multi language functionality', 16, 3, '2014-07-15 12:15:02', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(559, 'Output W3C valid URLs?', 'USU5_USE_W3C_VALID', 'true', 'This setting will output W3C valid URLs.', 16, 4, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(560, 'Select your chosen cache system?', 'USU5_CACHE_SYSTEM', 'file', 'Choose from the 4 available caching strategies.', 16, 5, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''mysql'', ''file'',''sqlite'',''memcache''), '),
(561, 'Set the number of days to store the cache.', 'USU5_CACHE_DAYS', '7', 'Set the number of days you wish to retain cached data, after this the cache will auto reset.', 16, 6, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, NULL),
(562, 'Choose the uri format', 'USU5_URLS_TYPE', 'path_standard', '<b>Choose USU5 URL format:</b>', 16, 7, '2014-07-15 12:16:49', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''standard'',''path_standard'',''rewrite'',''path_rewrite'',), '),
(563, 'Choose how your product link text is made up', 'USU5_PRODUCTS_LINK_TEXT_ORDER', 'p', 'Product link text can be made up of:<br /><b>p</b> = product name<br /><b>c</b> = category name<br /><b>b</b> = manufacturer (brand)<br /><b>m</b> = model<br />e.g. <b>bp</b> (brand/product)', 16, 8, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, NULL),
(564, 'Filter Short Words', 'USU5_FILTER_SHORT_WORDS', '2', '<b>This setting will filter words.</b><br>1 = Remove words of 1 letter<br>2 = Remove words of 2 letters or less<br>3 = Remove words of 3 letters or less<br>', 16, 9, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''1'',''2'',''3'',), '),
(565, 'Add category parent to beginning of category uris?', 'USU5_ADD_CAT_PARENT', 'false', 'This setting will add the category parent name to the beginning of the category URLs (i.e. - parent-category-c-1.html).', 16, 10, '2014-07-15 12:51:46', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(566, 'Remove all non-alphanumeric characters?', 'USU5_REMOVE_ALL_SPEC_CHARS', 'true', 'This will remove all non-letters and non-numbers. If your language has special characters then you will need to use the character conversion system.', 16, 11, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(567, 'Add cPath to product URLs?', 'USU5_ADD_CPATH_TO_PRODUCT_URLS', 'false', 'This setting will append the cPath to the end of product URLs (i.e. - some-product-p-1.html?cPath=xx).', 16, 12, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(568, 'Enter special character conversions. <b>(Better to use the file based character conversions)</b>', 'USU5_CHAR_CONVERT_SET', '', 'This setting will convert characters.<br><br>The format <b>MUST</b> be in the form: <b>char=>conv,char2=>conv2</b>', 16, 13, '2014-07-15 02:58:59', '2014-07-15 02:58:59', NULL, NULL),
(569, 'Turn performance reporting on true/false.', 'USU5_OUPUT_PERFORMANCE', 'false', '<span style="color: red;">Performance reporting should not be set to ON on a live site</span><br>It is for reporting re: performance and queries and shows at the bottom of your site.', 16, 14, '2014-07-15 14:27:11', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(570, 'Turn variable reporting on true/false.', 'USU5_DEBUG_OUPUT_VARS', 'false', '<span style="color: red;">Variable reporting should not be set to ON on a live site</span><br>It is for reporting the contents of USU classes and shows unformatted at the bottom of your site.', 16, 15, '2014-07-15 14:27:05', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), ');
INSERT INTO `configuration` (`configuration_id`, `configuration_title`, `configuration_key`, `configuration_value`, `configuration_description`, `configuration_group_id`, `sort_order`, `last_modified`, `date_added`, `use_function`, `set_function`) VALUES
(571, 'Force www.mysite.com/ when www.mysite.com/index.php', 'USU5_HOME_PAGE_REDIRECT', 'false', 'Force a redirect to www.mysite.com/ when www.mysite.com/index.php', 16, 16, '2014-07-15 12:15:58', '2014-07-15 02:58:59', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(572, 'Reset USU5 Cache', 'USU5_RESET_CACHE', 'false', 'This will reset the cache data for USU5', 16, 17, '2014-07-31 12:45:42', '2014-07-15 02:58:59', 'tep_reset_cache_data_usu5', 'tep_cfg_select_option(array(''reset'', ''false''), '),
(573, '<strong>Product Listing Default View (grid/list)</strong>', 'LISTING_VIEW_TYPE', 'list', 'Product Listing Default View', 8, 12, '2014-08-13 17:15:23', '2014-06-30 14:38:15', NULL, 'tep_cfg_select_option(array(''list'', ''grid''),'),
(574, '<strong>Bestseller Products Listing</strong>', 'MAX_DISPLAY_PRODUCTS_BESTSELLER', '6', 'Maximum number of bestsellers to display in bestsellers page', 3, 22, '2014-07-10 11:16:19', '2014-06-30 14:38:14', NULL, NULL),
(575, 'Effect', 'EFFECT_NIVO', 'random', 'random, sliceDownRight, sliceDownLeft, sliceUpRight, sliceUpLeft, sliceUpDown, sliceUpDownLeft, fold, fade, boxRandom, boxRain, boxRainReverse, boxRainGrow, boxRainGrowReverse', 100, 1, '2013-05-24 00:30:00', '2013-05-24 00:30:00', NULL, 'tep_cfg_select_option(array(''random'', ''sliceDownRight'', ''sliceDownLeft'', ''sliceUpRight'', ''sliceUpLeft'', ''sliceUpDown'', ''sliceUpDownLeft'', ''fold'', ''fade'', ''boxRandom'', ''boxRain'', ''boxRainReverse'', ''boxRainGrow'', ''boxRainGrowReverse''), '),
(576, 'Delay', 'DELAY_NIVO', '5000', 'Delay between images in ms', 100, 2, NULL, '2013-05-24 00:30:00', NULL, NULL),
(577, 'Box Columns', 'BOX_COLS', '8', 'Quantity of columns', 100, 3, '2013-05-24 00:30:00', '2013-05-24 00:30:00', NULL, NULL),
(578, 'Box Rows', 'BOX_ROWS', '4', 'Quantity of rows', 100, 4, NULL, '2013-05-24 00:30:00', NULL, NULL),
(579, 'Control Navigation', 'CONTROLNAV_NIVO', 'true', 'Show control 1,2,3...', 100, 5, NULL, '2013-05-24 00:30:00', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(580, 'Navigation', 'NAVIGATION_NIVO', 'true', 'Show navigation prev next', 100, 6, '2013-05-24 00:30:00', '2013-05-24 00:30:00', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(581, 'Slices', 'SLICES_NIVO', '15', 'Quantity of slices on which is cut a slide during animation', 100, 7, '2013-05-24 00:30:00', '2013-05-24 00:30:00', NULL, NULL),
(582, 'Hover Pause', 'HOVERPAUSE_NIVO', 'true', 'Stop animation while hovering', 100, 8, NULL, '2013-05-24 00:30:00', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(583, 'Delay', 'SDELAY_NIVO', '500', 'Delay beetwen slides in ms', 100, 9, NULL, '2013-05-24 00:30:00', NULL, NULL),
(584, 'Direction Navigation Hide', 'DIRECTIONNAVHIDE', 'false', 'Show prev next only show on hover', 100, 10, '2014-07-18 17:32:54', '2013-05-24 00:30:00', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(585, 'Start Slide', 'START_SLIDE', '0', 'Set starting Slide (0 index)', 100, 11, NULL, '2013-05-24 00:30:00', NULL, NULL),
(586, 'Prev Text', 'PREV_NIVO', '', '', 100, 12, '2014-07-18 18:21:00', '2013-05-24 00:30:00', NULL, NULL),
(587, 'Next Text', 'NEXT_NIVO', '', '', 100, 13, '2014-07-18 17:32:05', '2013-05-24 00:30:00', NULL, NULL),
(588, 'Width of nivoSlider', 'NIVO_SLIDER_WIDTH', '1170', 'The pixel width of nivoSlider', 100, 14, '2014-07-18 15:57:41', '2013-05-24 00:30:00', NULL, NULL),
(589, 'Height of nivoSlider', 'NIVO_SLIDER_HEIGHT', '608', 'The pixel height of nivoSlider', 100, 15, '2014-07-25 16:28:23', '2013-05-24 00:30:00', NULL, NULL),
(590, 'Show Banner Title', 'BANNER_TITLE_NIVO', 'true', 'Show banner title in slider', 100, 16, '2013-04-08 00:30:00', '2013-05-24 00:30:00', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(591, 'Banner group for slider', 'BANNER_SLIDER', 'nivoslider', 'Group of banners for Nivo Slider', 100, 17, '2013-05-24 00:30:00', '2013-05-24 00:30:00', NULL, NULL),
(598, 'Display in pages.', 'MODULE_BOXES_NIVO_SLIDER_DISPLAY_PAGES', 'index.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-18 15:25:29', NULL, 'tep_cfg_select_pages('),
(599, 'Enable Content Nivo Slider Module', 'MODULE_BOXES_NIVO_SLIDER_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-18 15:30:03', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(600, 'Content Placement', 'MODULE_BOXES_NIVO_SLIDER_CONTENT_PLACEMENT', 'Under Header Block', 'The module should be loaded in the under header or in home content', 6, 1, NULL, '2014-07-18 15:30:03', NULL, 'tep_cfg_select_option(array(''Under Header Block'', ''Home Content Block''), '),
(601, 'Sort Order', 'MODULE_BOXES_NIVO_SLIDER_SORT_ORDER', '7', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-18 15:30:03', NULL, NULL),
(623, 'Enable Content Nivo Slider Module', 'MODULE_BOXES_BANNER_BOX_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-21 12:18:54', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(624, 'Content Placement', 'MODULE_BOXES_BANNER_BOX_CONTENT_PLACEMENT', 'Left Column', 'The module should be loaded in the under header or in home content', 6, 1, NULL, '2014-07-21 12:18:54', NULL, 'tep_cfg_select_option(array(''Left Column'', ''Right Column''), '),
(625, 'Sort Order', 'MODULE_BOXES_BANNER_BOX_SORT_ORDER', '9999', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-21 12:18:54', NULL, NULL),
(626, 'Display banner group.', 'MODULE_BOXES_BANNER_BOX_DISPLAY_GROUP', 'sidebanner', 'select banner group to display. ', 6, 0, NULL, '2014-07-21 12:18:54', NULL, 'tep_cfg_select_banner_group('),
(627, 'Display in pages.', 'MODULE_BOXES_BANNER_BOX_DISPLAY_PAGES', 'account.php;account_edit.php;account_history.php;account_history_info.php;account_newsletters.php;account_notifications.php;account_password.php;address_book.php;address_book_process.php;advanced_search.php;advanced_search_result.php;checkout_confirmation.php;checkout_payment.php;checkout_payment_address.php;checkout_shipping.php;checkout_shipping_address.php;checkout_success.php;conditions.php;contact_us.php;cookie_usage.php;create_account.php;create_account_success.php;featured_products.php;login.php;logoff.php;manufacturers.php;password_forgotten.php;password_reset.php;privacy.php;products_new.php;product_info.php;product_reviews.php;product_reviews_info.php;product_reviews_write.php;reviews.php;shipping.php;shopping_cart.php;specials.php;ssl_check.php;tag_products.php;tell_a_friend.php;topsellers_products.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-21 12:18:54', NULL, 'tep_cfg_select_pages('),
(632, 'Display in pages.', 'MODULE_BOXES_BANNER_CONTENT_DISPLAY_PAGES', 'index.php;', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-21 12:27:26', NULL, 'tep_cfg_select_pages('),
(633, '<b>Live Chat Olark</b>', 'LIVE_CHAT', 'false', 'Enable/disable live chat', 1, 19, '2014-07-21 14:29:14', '2014-06-30 14:38:14', NULL, 'tep_cfg_select_option(array(''true'', ''false''), '),
(638, 'Enable Information Module', 'MODULE_BOXES_CONTACT_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-21 16:11:05', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(639, 'Sort Order', 'MODULE_BOXES_CONTACT_SORT_ORDER', '30', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-21 16:11:05', NULL, NULL),
(640, 'Display in pages.', 'MODULE_BOXES_CONTACT_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-21 16:11:05', NULL, 'tep_cfg_select_pages('),
(641, 'Enable Information Module', 'MODULE_BOXES_INFORMATION_ACCOUNT_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-21 16:13:23', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(642, 'Sort Order', 'MODULE_BOXES_INFORMATION_ACCOUNT_SORT_ORDER', '27', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-21 16:13:23', NULL, NULL),
(643, 'Display in pages.', 'MODULE_BOXES_INFORMATION_ACCOUNT_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-21 16:13:23', NULL, 'tep_cfg_select_pages('),
(644, 'Enable Information Module', 'MODULE_BOXES_MAIN_MENU_FOOTER_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-21 16:13:45', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(645, 'Sort Order', 'MODULE_BOXES_MAIN_MENU_FOOTER_SORT_ORDER', '26', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-21 16:13:45', NULL, NULL),
(646, 'Display in pages.', 'MODULE_BOXES_MAIN_MENU_FOOTER_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-21 16:13:45', NULL, 'tep_cfg_select_pages('),
(647, 'Enable Information Module', 'MODULE_BOXES_SOCIAL_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-21 16:14:00', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(648, 'Sort Order', 'MODULE_BOXES_SOCIAL_SORT_ORDER', '29', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-21 16:14:00', NULL, NULL),
(649, 'Display in pages.', 'MODULE_BOXES_SOCIAL_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-21 16:14:00', NULL, 'tep_cfg_select_pages('),
(650, '<b>Store Facebook</b>', 'MODULE_BOXES_SOCIAL_BOX_FACEBOOK', 'http://www.facebook.com', 'Facebook link', 1, 21, '2014-07-21 17:08:00', '2014-06-30 14:38:14', NULL, NULL),
(651, '<b>Store Twitter</b>', 'MODULE_BOXES_SOCIAL_BOX_TWITTER', 'http://www.twitter.com', 'Twitter link', 1, 22, '2014-07-21 17:02:13', '2014-06-30 14:38:14', NULL, NULL),
(652, '<b>Store RSS</b>', 'MODULE_BOXES_SOCIAL_BOX_RSS', '#', 'RSS link', 1, 23, '2014-07-21 17:02:23', '2014-06-30 14:38:14', NULL, NULL),
(653, '<b>Store Youtube</b>', 'MODULE_BOXES_SOCIAL_BOX_YOUTUBE', 'http://www.youtube.com', 'Youtube link', 1, 24, '2014-07-21 17:02:39', '2014-06-30 14:38:14', NULL, NULL),
(654, '<b>Store Google plus</b>', 'MODULE_BOXES_SOCIAL_BOX_GOOGLE', 'https://plus.google.com', 'Google plus link', 1, 25, '2014-07-21 17:03:40', '2014-06-30 14:38:14', NULL, NULL),
(655, 'Enable Search Module', 'MODULE_BOXES_HEADER_ACCOUNT_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-22 16:35:01', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(656, 'Content Placement', 'MODULE_BOXES_HEADER_ACCOUNT_CONTENT_PLACEMENT', 'Header Top', 'Should the module be loaded in the left or right column?', 6, 1, NULL, '2014-07-22 16:35:01', NULL, 'tep_cfg_select_option(array(''Header Top'', ''Header''), '),
(657, 'Sort Order', 'MODULE_BOXES_HEADER_ACCOUNT_SORT_ORDER', '30', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-22 16:35:01', NULL, NULL),
(658, 'Display in pages.', 'MODULE_BOXES_HEADER_ACCOUNT_DISPLAY_PAGES', 'all', 'select pages where this box should be displayed. ', 6, 0, NULL, '2014-07-22 16:35:01', NULL, 'tep_cfg_select_pages('),
(659, 'Enable Content Nivo Slider Module', 'MODULE_BOXES_BANNER_CONTENT_STATUS', 'True', 'Do you want to add the module to your shop?', 6, 1, NULL, '2014-07-25 16:53:54', NULL, 'tep_cfg_select_option(array(''True'', ''False''), '),
(660, 'Content Placement', 'MODULE_BOXES_BANNER_CONTENT_CONTENT_PLACEMENT', 'Under Header Block', 'The module should be loaded in the under header or in home content', 6, 1, NULL, '2014-07-25 16:53:54', NULL, 'tep_cfg_select_option(array(''Under Header Block'', ''Home Content Block''), '),
(661, 'Sort Order', 'MODULE_BOXES_BANNER_CONTENT_SORT_ORDER', '8', 'Sort order of display. Lowest is displayed first.', 6, 0, NULL, '2014-07-25 16:53:54', NULL, NULL),
(662, 'Display banner group.', 'MODULE_BOXES_BANNER_CONTENT_DISPLAY_GROUP', 'topbanners', 'select banner group to display. ', 6, 0, NULL, '2014-07-25 16:53:54', NULL, 'tep_cfg_select_banner_group('),
(663, 'Security Check Extended Last Run', 'MODULE_SECURITY_CHECK_EXTENDED_LAST_RUN_DATETIME', '1406299139', 'The date and time the last extended security check was performed.', 6, NULL, NULL, '2014-07-25 17:36:49', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configuration_group`
--

DROP TABLE IF EXISTS `configuration_group`;
CREATE TABLE IF NOT EXISTS `configuration_group` (
  `configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `configuration_group_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `configuration_group_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(5) DEFAULT NULL,
  `visible` int(1) DEFAULT '1',
  PRIMARY KEY (`configuration_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=101 ;

--
-- Dumping data for table `configuration_group`
--

INSERT INTO `configuration_group` (`configuration_group_id`, `configuration_group_title`, `configuration_group_description`, `sort_order`, `visible`) VALUES
(1, 'My Store', 'General information about my store', 1, 1),
(2, 'Minimum Values', 'The minimum values for functions / data', 2, 1),
(3, 'Maximum Values', 'The maximum values for functions / data', 3, 1),
(4, 'Images', 'Image parameters', 4, 1),
(5, 'Customer Details', 'Customer account configuration', 5, 1),
(6, 'Module Options', 'Hidden from configuration', 6, 0),
(7, 'Shipping/Packaging', 'Shipping options available at my store', 7, 1),
(8, 'Product Listing', 'Product Listing    configuration options', 8, 1),
(9, 'Stock', 'Stock configuration options', 9, 1),
(10, 'Logging', 'Logging configuration options', 10, 1),
(11, 'Cache', 'Caching configuration options', 11, 1),
(12, 'E-Mail Options', 'General setting for E-Mail transport and HTML E-Mails', 12, 1),
(13, 'Download', 'Downloadable products options', 13, 1),
(14, 'GZip Compression', 'GZip compression options', 14, 1),
(15, 'Sessions', 'Session options', 15, 1),
(16, 'Seo Urls 5', 'Options for ULTIMATE Seo Urls 5 by FWR Media', 1000, 1),
(17, '<b>Related Products</b>', 'Optional Related Products module', 999, 1),
(18, '<strong>Featured</strong>', 'Featured Products Display', 18, 1),
(100, 'Nivo Slider', 'Nivo Slider options', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
CREATE TABLE IF NOT EXISTS `counter` (
  `startdate` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `counter_history`
--

DROP TABLE IF EXISTS `counter_history`;
CREATE TABLE IF NOT EXISTS `counter_history` (
  `month` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `counter` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `countries_id` int(11) NOT NULL AUTO_INCREMENT,
  `countries_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `countries_iso_code_2` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `countries_iso_code_3` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `address_format_id` int(11) NOT NULL,
  PRIMARY KEY (`countries_id`),
  KEY `IDX_COUNTRIES_NAME` (`countries_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=240 ;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countries_id`, `countries_name`, `countries_iso_code_2`, `countries_iso_code_3`, `address_format_id`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', 1),
(2, 'Albania', 'AL', 'ALB', 1),
(3, 'Algeria', 'DZ', 'DZA', 1),
(4, 'American Samoa', 'AS', 'ASM', 1),
(5, 'Andorra', 'AD', 'AND', 1),
(6, 'Angola', 'AO', 'AGO', 1),
(7, 'Anguilla', 'AI', 'AIA', 1),
(8, 'Antarctica', 'AQ', 'ATA', 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', 1),
(10, 'Argentina', 'AR', 'ARG', 1),
(11, 'Armenia', 'AM', 'ARM', 1),
(12, 'Aruba', 'AW', 'ABW', 1),
(13, 'Australia', 'AU', 'AUS', 1),
(14, 'Austria', 'AT', 'AUT', 5),
(15, 'Azerbaijan', 'AZ', 'AZE', 1),
(16, 'Bahamas', 'BS', 'BHS', 1),
(17, 'Bahrain', 'BH', 'BHR', 1),
(18, 'Bangladesh', 'BD', 'BGD', 1),
(19, 'Barbados', 'BB', 'BRB', 1),
(20, 'Belarus', 'BY', 'BLR', 1),
(21, 'Belgium', 'BE', 'BEL', 1),
(22, 'Belize', 'BZ', 'BLZ', 1),
(23, 'Benin', 'BJ', 'BEN', 1),
(24, 'Bermuda', 'BM', 'BMU', 1),
(25, 'Bhutan', 'BT', 'BTN', 1),
(26, 'Bolivia', 'BO', 'BOL', 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', 1),
(28, 'Botswana', 'BW', 'BWA', 1),
(29, 'Bouvet Island', 'BV', 'BVT', 1),
(30, 'Brazil', 'BR', 'BRA', 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', 1),
(33, 'Bulgaria', 'BG', 'BGR', 1),
(34, 'Burkina Faso', 'BF', 'BFA', 1),
(35, 'Burundi', 'BI', 'BDI', 1),
(36, 'Cambodia', 'KH', 'KHM', 1),
(37, 'Cameroon', 'CM', 'CMR', 1),
(38, 'Canada', 'CA', 'CAN', 1),
(39, 'Cape Verde', 'CV', 'CPV', 1),
(40, 'Cayman Islands', 'KY', 'CYM', 1),
(41, 'Central African Republic', 'CF', 'CAF', 1),
(42, 'Chad', 'TD', 'TCD', 1),
(43, 'Chile', 'CL', 'CHL', 1),
(44, 'China', 'CN', 'CHN', 1),
(45, 'Christmas Island', 'CX', 'CXR', 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', 1),
(47, 'Colombia', 'CO', 'COL', 1),
(48, 'Comoros', 'KM', 'COM', 1),
(49, 'Congo', 'CG', 'COG', 1),
(50, 'Cook Islands', 'CK', 'COK', 1),
(51, 'Costa Rica', 'CR', 'CRI', 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', 1),
(53, 'Croatia', 'HR', 'HRV', 1),
(54, 'Cuba', 'CU', 'CUB', 1),
(55, 'Cyprus', 'CY', 'CYP', 1),
(56, 'Czech Republic', 'CZ', 'CZE', 1),
(57, 'Denmark', 'DK', 'DNK', 1),
(58, 'Djibouti', 'DJ', 'DJI', 1),
(59, 'Dominica', 'DM', 'DMA', 1),
(60, 'Dominican Republic', 'DO', 'DOM', 1),
(61, 'East Timor', 'TP', 'TMP', 1),
(62, 'Ecuador', 'EC', 'ECU', 1),
(63, 'Egypt', 'EG', 'EGY', 1),
(64, 'El Salvador', 'SV', 'SLV', 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', 1),
(66, 'Eritrea', 'ER', 'ERI', 1),
(67, 'Estonia', 'EE', 'EST', 1),
(68, 'Ethiopia', 'ET', 'ETH', 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', 1),
(70, 'Faroe Islands', 'FO', 'FRO', 1),
(71, 'Fiji', 'FJ', 'FJI', 1),
(72, 'Finland', 'FI', 'FIN', 1),
(73, 'France', 'FR', 'FRA', 1),
(74, 'France, Metropolitan', 'FX', 'FXX', 1),
(75, 'French Guiana', 'GF', 'GUF', 1),
(76, 'French Polynesia', 'PF', 'PYF', 1),
(77, 'French Southern Territories', 'TF', 'ATF', 1),
(78, 'Gabon', 'GA', 'GAB', 1),
(79, 'Gambia', 'GM', 'GMB', 1),
(80, 'Georgia', 'GE', 'GEO', 1),
(81, 'Germany', 'DE', 'DEU', 5),
(82, 'Ghana', 'GH', 'GHA', 1),
(83, 'Gibraltar', 'GI', 'GIB', 1),
(84, 'Greece', 'GR', 'GRC', 1),
(85, 'Greenland', 'GL', 'GRL', 1),
(86, 'Grenada', 'GD', 'GRD', 1),
(87, 'Guadeloupe', 'GP', 'GLP', 1),
(88, 'Guam', 'GU', 'GUM', 1),
(89, 'Guatemala', 'GT', 'GTM', 1),
(90, 'Guinea', 'GN', 'GIN', 1),
(91, 'Guinea-bissau', 'GW', 'GNB', 1),
(92, 'Guyana', 'GY', 'GUY', 1),
(93, 'Haiti', 'HT', 'HTI', 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', 1),
(95, 'Honduras', 'HN', 'HND', 1),
(96, 'Hong Kong', 'HK', 'HKG', 1),
(97, 'Hungary', 'HU', 'HUN', 1),
(98, 'Iceland', 'IS', 'ISL', 1),
(99, 'India', 'IN', 'IND', 1),
(100, 'Indonesia', 'ID', 'IDN', 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', 1),
(102, 'Iraq', 'IQ', 'IRQ', 1),
(103, 'Ireland', 'IE', 'IRL', 1),
(104, 'Israel', 'IL', 'ISR', 1),
(105, 'Italy', 'IT', 'ITA', 1),
(106, 'Jamaica', 'JM', 'JAM', 1),
(107, 'Japan', 'JP', 'JPN', 1),
(108, 'Jordan', 'JO', 'JOR', 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', 1),
(110, 'Kenya', 'KE', 'KEN', 1),
(111, 'Kiribati', 'KI', 'KIR', 1),
(112, 'Korea, Democratic People''s Republic of', 'KP', 'PRK', 1),
(113, 'Korea, Republic of', 'KR', 'KOR', 1),
(114, 'Kuwait', 'KW', 'KWT', 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', 1),
(117, 'Latvia', 'LV', 'LVA', 1),
(118, 'Lebanon', 'LB', 'LBN', 1),
(119, 'Lesotho', 'LS', 'LSO', 1),
(120, 'Liberia', 'LR', 'LBR', 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', 1),
(122, 'Liechtenstein', 'LI', 'LIE', 1),
(123, 'Lithuania', 'LT', 'LTU', 1),
(124, 'Luxembourg', 'LU', 'LUX', 1),
(125, 'Macau', 'MO', 'MAC', 1),
(126, 'Macedonia, The Former Yugoslav Republic of', 'MK', 'MKD', 1),
(127, 'Madagascar', 'MG', 'MDG', 1),
(128, 'Malawi', 'MW', 'MWI', 1),
(129, 'Malaysia', 'MY', 'MYS', 1),
(130, 'Maldives', 'MV', 'MDV', 1),
(131, 'Mali', 'ML', 'MLI', 1),
(132, 'Malta', 'MT', 'MLT', 1),
(133, 'Marshall Islands', 'MH', 'MHL', 1),
(134, 'Martinique', 'MQ', 'MTQ', 1),
(135, 'Mauritania', 'MR', 'MRT', 1),
(136, 'Mauritius', 'MU', 'MUS', 1),
(137, 'Mayotte', 'YT', 'MYT', 1),
(138, 'Mexico', 'MX', 'MEX', 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', 1),
(141, 'Monaco', 'MC', 'MCO', 1),
(142, 'Mongolia', 'MN', 'MNG', 1),
(143, 'Montserrat', 'MS', 'MSR', 1),
(144, 'Morocco', 'MA', 'MAR', 1),
(145, 'Mozambique', 'MZ', 'MOZ', 1),
(146, 'Myanmar', 'MM', 'MMR', 1),
(147, 'Namibia', 'NA', 'NAM', 1),
(148, 'Nauru', 'NR', 'NRU', 1),
(149, 'Nepal', 'NP', 'NPL', 1),
(150, 'Netherlands', 'NL', 'NLD', 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', 1),
(152, 'New Caledonia', 'NC', 'NCL', 1),
(153, 'New Zealand', 'NZ', 'NZL', 1),
(154, 'Nicaragua', 'NI', 'NIC', 1),
(155, 'Niger', 'NE', 'NER', 1),
(156, 'Nigeria', 'NG', 'NGA', 1),
(157, 'Niue', 'NU', 'NIU', 1),
(158, 'Norfolk Island', 'NF', 'NFK', 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', 1),
(160, 'Norway', 'NO', 'NOR', 1),
(161, 'Oman', 'OM', 'OMN', 1),
(162, 'Pakistan', 'PK', 'PAK', 1),
(163, 'Palau', 'PW', 'PLW', 1),
(164, 'Panama', 'PA', 'PAN', 1),
(165, 'Papua New Guinea', 'PG', 'PNG', 1),
(166, 'Paraguay', 'PY', 'PRY', 1),
(167, 'Peru', 'PE', 'PER', 1),
(168, 'Philippines', 'PH', 'PHL', 1),
(169, 'Pitcairn', 'PN', 'PCN', 1),
(170, 'Poland', 'PL', 'POL', 1),
(171, 'Portugal', 'PT', 'PRT', 1),
(172, 'Puerto Rico', 'PR', 'PRI', 1),
(173, 'Qatar', 'QA', 'QAT', 1),
(174, 'Reunion', 'RE', 'REU', 1),
(175, 'Romania', 'RO', 'ROM', 1),
(176, 'Russian Federation', 'RU', 'RUS', 1),
(177, 'Rwanda', 'RW', 'RWA', 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', 1),
(179, 'Saint Lucia', 'LC', 'LCA', 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', 1),
(181, 'Samoa', 'WS', 'WSM', 1),
(182, 'San Marino', 'SM', 'SMR', 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', 1),
(184, 'Saudi Arabia', 'SA', 'SAU', 1),
(185, 'Senegal', 'SN', 'SEN', 1),
(186, 'Seychelles', 'SC', 'SYC', 1),
(187, 'Sierra Leone', 'SL', 'SLE', 1),
(188, 'Singapore', 'SG', 'SGP', 4),
(189, 'Slovakia (Slovak Republic)', 'SK', 'SVK', 1),
(190, 'Slovenia', 'SI', 'SVN', 1),
(191, 'Solomon Islands', 'SB', 'SLB', 1),
(192, 'Somalia', 'SO', 'SOM', 1),
(193, 'South Africa', 'ZA', 'ZAF', 1),
(194, 'South Georgia and the South Sandwich Islands', 'GS', 'SGS', 1),
(195, 'Spain', 'ES', 'ESP', 3),
(196, 'Sri Lanka', 'LK', 'LKA', 1),
(197, 'St. Helena', 'SH', 'SHN', 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', 1),
(199, 'Sudan', 'SD', 'SDN', 1),
(200, 'Suriname', 'SR', 'SUR', 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', 1),
(202, 'Swaziland', 'SZ', 'SWZ', 1),
(203, 'Sweden', 'SE', 'SWE', 1),
(204, 'Switzerland', 'CH', 'CHE', 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', 1),
(206, 'Taiwan', 'TW', 'TWN', 1),
(207, 'Tajikistan', 'TJ', 'TJK', 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', 1),
(209, 'Thailand', 'TH', 'THA', 1),
(210, 'Togo', 'TG', 'TGO', 1),
(211, 'Tokelau', 'TK', 'TKL', 1),
(212, 'Tonga', 'TO', 'TON', 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', 1),
(214, 'Tunisia', 'TN', 'TUN', 1),
(215, 'Turkey', 'TR', 'TUR', 1),
(216, 'Turkmenistan', 'TM', 'TKM', 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', 1),
(218, 'Tuvalu', 'TV', 'TUV', 1),
(219, 'Uganda', 'UG', 'UGA', 1),
(220, 'Ukraine', 'UA', 'UKR', 1),
(221, 'United Arab Emirates', 'AE', 'ARE', 1),
(222, 'United Kingdom', 'GB', 'GBR', 1),
(223, 'United States', 'US', 'USA', 2),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', 1),
(225, 'Uruguay', 'UY', 'URY', 1),
(226, 'Uzbekistan', 'UZ', 'UZB', 1),
(227, 'Vanuatu', 'VU', 'VUT', 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', 1),
(229, 'Venezuela', 'VE', 'VEN', 1),
(230, 'Viet Nam', 'VN', 'VNM', 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', 1),
(234, 'Western Sahara', 'EH', 'ESH', 1),
(235, 'Yemen', 'YE', 'YEM', 1),
(236, 'Yugoslavia', 'YU', 'YUG', 1),
(237, 'Zaire', 'ZR', 'ZAR', 1),
(238, 'Zambia', 'ZM', 'ZMB', 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

DROP TABLE IF EXISTS `currencies`;
CREATE TABLE IF NOT EXISTS `currencies` (
  `currencies_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_left` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `symbol_right` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_point` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thousands_point` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decimal_places` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` float(13,8) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`currencies_id`),
  KEY `idx_currencies_code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currencies_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_point`, `thousands_point`, `decimal_places`, `value`, `last_updated`) VALUES
(1, 'U.S. Dollar', 'USD', '$', '', '.', ',', '2', 1.00000000, '2014-06-30 14:38:19'),
(2, 'Euro', 'EUR', '', '€', '.', ',', '2', 1.00000000, '2014-06-30 14:38:19');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customers_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_gender` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `customers_email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_default_address_id` int(11) DEFAULT NULL,
  `customers_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `customers_newsletter` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customers_id`),
  KEY `idx_customers_email_address` (`customers_email_address`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customers_id`, `customers_gender`, `customers_firstname`, `customers_lastname`, `customers_dob`, `customers_email_address`, `customers_default_address_id`, `customers_telephone`, `customers_fax`, `customers_password`, `customers_newsletter`) VALUES
(1, 'm', 'admin', 'admin', '1987-07-16 00:00:00', 'admin@admin.com', 1, '123456789', 'administrator', '$P$DCuHEtSx0DPmtjESSZ3RQsKJGb2KLu0', '1'),
(2, 'm', 'admin', 'admin', '1987-07-16 00:00:00', 'admin@admin2.com', 3, '123456789', 'administrator', '$P$DMNnVWQ49PhxrhYObcjlhz0ZnXkBCo1', '1'),
(3, 'm', 'meddif', 'tm', '1980-07-09 00:00:00', 'meddif@tm.com', 6, '0975070738', '', '$P$DSRiR9YkCCw07x8oB8ilJxjrctiMpf.', '1');

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket`
--

DROP TABLE IF EXISTS `customers_basket`;
CREATE TABLE IF NOT EXISTS `customers_basket` (
  `customers_basket_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `customers_basket_quantity` int(2) NOT NULL,
  `final_price` decimal(15,4) DEFAULT NULL,
  `customers_basket_date_added` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`customers_basket_id`),
  KEY `idx_customers_basket_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers_basket_attributes`
--

DROP TABLE IF EXISTS `customers_basket_attributes`;
CREATE TABLE IF NOT EXISTS `customers_basket_attributes` (
  `customers_basket_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `products_id` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `products_options_id` int(11) NOT NULL,
  `products_options_value_id` int(11) NOT NULL,
  PRIMARY KEY (`customers_basket_attributes_id`),
  KEY `idx_customers_basket_att_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `customers_info`
--

DROP TABLE IF EXISTS `customers_info`;
CREATE TABLE IF NOT EXISTS `customers_info` (
  `customers_info_id` int(11) NOT NULL,
  `customers_info_date_of_last_logon` datetime DEFAULT NULL,
  `customers_info_number_of_logons` int(5) DEFAULT NULL,
  `customers_info_date_account_created` datetime DEFAULT NULL,
  `customers_info_date_account_last_modified` datetime DEFAULT NULL,
  `global_product_notifications` int(1) DEFAULT '0',
  `password_reset_key` char(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_reset_date` datetime DEFAULT NULL,
  PRIMARY KEY (`customers_info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

DROP TABLE IF EXISTS `featured`;
CREATE TABLE IF NOT EXISTS `featured` (
  `featured_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL DEFAULT '0',
  `featured_date_added` datetime DEFAULT NULL,
  `featured_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`featured_id`),
  KEY `idx_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `featured`
--

INSERT INTO `featured` (`featured_id`, `products_id`, `featured_date_added`, `featured_last_modified`, `expires_date`, `date_status_change`, `status`) VALUES
(1, 8, '2014-07-09 17:37:50', '2014-07-09 17:59:39', NULL, NULL, 1),
(2, 5, '2014-07-09 17:40:49', NULL, NULL, NULL, 1),
(3, 3, '2014-07-10 11:37:56', NULL, '0000-00-00 00:00:00', NULL, 1),
(4, 17, '2014-07-10 14:37:50', NULL, '0000-00-00 00:00:00', NULL, 1),
(5, 20, '2014-07-16 14:54:55', NULL, '0000-00-00 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `geo_zones`
--

DROP TABLE IF EXISTS `geo_zones`;
CREATE TABLE IF NOT EXISTS `geo_zones` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `geo_zone_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `geo_zones`
--

INSERT INTO `geo_zones` (`geo_zone_id`, `geo_zone_name`, `geo_zone_description`, `last_modified`, `date_added`) VALUES
(1, 'Florida', 'Florida local sales tax zone', NULL, '2014-06-30 14:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `languages_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `code` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `directory` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(3) DEFAULT NULL,
  PRIMARY KEY (`languages_id`),
  KEY `IDX_LANGUAGES_NAME` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`languages_id`, `name`, `code`, `image`, `directory`, `sort_order`) VALUES
(1, 'English', 'en', 'icon.gif', 'english', 1),
(2, 'German', 'de', 'icon.gif', 'german', 2),
(3, 'Spanish', 'es', 'icon.gif', 'espanol', 3),
(4, 'Russian', 'ru', 'icon.gif', 'russian', 4);

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `manufacturers_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturers_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `manufacturers_image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`),
  KEY `IDX_MANUFACTURERS_NAME` (`manufacturers_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturers_id`, `manufacturers_name`, `manufacturers_image`, `date_added`, `last_modified`) VALUES
(1, 'Viverra, nunc', 'manufacturers/1.jpg', '2014-06-30 14:38:19', '2014-07-25 15:00:44'),
(2, 'Erat facilisis leo', 'manufacturers/2.jpg', '2014-06-30 14:38:19', '2014-07-25 15:02:26'),
(3, 'Duis pulvinar commodo', 'manufacturers/3.jpg', '2014-06-30 14:38:19', '2014-07-25 15:02:16'),
(4, 'Dolor sit', 'manufacturers/4.jpg', '2014-06-30 14:38:19', '2014-07-25 14:58:53'),
(5, 'Neque quis vestibulum', 'manufacturers/5.jpg', '2014-06-30 14:38:19', '2014-07-25 15:00:05'),
(6, 'Lorem ipsum', 'manufacturers/6.jpg', '2014-06-30 14:38:19', '2014-07-25 15:08:28'),
(7, 'Arcu vel sapien', 'manufacturers/7.jpg', '2014-06-30 14:38:19', '2014-07-25 15:02:01'),
(8, 'Consectetur adipiscing elit', 'manufacturers/8.jpg', '2014-06-30 14:38:19', '2014-07-25 14:59:20'),
(9, 'Proin hendrerit', 'manufacturers/9.jpg', '2014-06-30 14:38:20', '2014-07-25 14:59:39'),
(10, 'Eu vulputate ante', 'manufacturers/10.jpg', '2014-06-30 14:38:20', '2014-07-25 15:01:30');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers_info`
--

DROP TABLE IF EXISTS `manufacturers_info`;
CREATE TABLE IF NOT EXISTS `manufacturers_info` (
  `manufacturers_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `manufacturers_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url_clicked` int(5) NOT NULL DEFAULT '0',
  `date_last_click` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacturers_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `manufacturers_info`
--

INSERT INTO `manufacturers_info` (`manufacturers_id`, `languages_id`, `manufacturers_url`, `url_clicked`, `date_last_click`) VALUES
(1, 1, '', 0, NULL),
(1, 2, '', 0, NULL),
(1, 3, '', 0, NULL),
(1, 4, '', 0, NULL),
(2, 1, '', 0, NULL),
(2, 2, '', 0, NULL),
(2, 3, '', 0, NULL),
(2, 4, '', 0, NULL),
(3, 1, '', 1, '2014-07-21 17:28:25'),
(3, 2, '', 0, NULL),
(3, 3, '', 0, NULL),
(3, 4, '', 0, NULL),
(4, 1, '', 0, NULL),
(4, 2, '', 0, NULL),
(4, 3, '', 0, NULL),
(4, 4, '', 0, NULL),
(5, 1, '', 0, NULL),
(5, 2, '', 0, NULL),
(5, 3, '', 0, NULL),
(5, 4, '', 0, NULL),
(6, 1, '', 0, NULL),
(6, 2, '', 0, NULL),
(6, 3, '', 0, NULL),
(6, 4, '', 0, NULL),
(7, 1, '', 0, NULL),
(7, 2, '', 0, NULL),
(7, 3, '', 0, NULL),
(7, 4, '', 0, NULL),
(8, 1, '', 0, NULL),
(8, 2, '', 0, NULL),
(8, 3, '', 0, NULL),
(8, 4, '', 0, NULL),

(9, 1, '', 0, NULL),
(9, 2, '', 0, NULL),
(9, 3, '', 0, NULL),
(9, 4, '', 0, NULL),
(10, 1, '', 0, NULL),
(10, 2, '', 0, NULL),
(10, 3, '', 0, NULL),
(10, 4, '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
CREATE TABLE IF NOT EXISTS `newsletters` (
  `newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`newsletters_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `customers_id` int(11) NOT NULL,
  `customers_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_street_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_suburb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customers_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customers_address_format_id` int(5) NOT NULL,
  `delivery_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_street_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_suburb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delivery_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delivery_address_format_id` int(5) NOT NULL,
  `billing_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_street_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_suburb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_postcode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `billing_address_format_id` int(5) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cc_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_number` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_expires` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_purchased` datetime DEFAULT NULL,
  `orders_status` int(5) NOT NULL,
  `orders_date_finished` datetime DEFAULT NULL,
  `currency` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_value` decimal(14,6) DEFAULT NULL,
  PRIMARY KEY (`orders_id`),
  KEY `idx_orders_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `customers_id`, `customers_name`, `customers_company`, `customers_street_address`, `customers_suburb`, `customers_city`, `customers_postcode`, `customers_state`, `customers_country`, `customers_telephone`, `customers_email_address`, `customers_address_format_id`, `delivery_name`, `delivery_company`, `delivery_street_address`, `delivery_suburb`, `delivery_city`, `delivery_postcode`, `delivery_state`, `delivery_country`, `delivery_address_format_id`, `billing_name`, `billing_company`, `billing_street_address`, `billing_suburb`, `billing_city`, `billing_postcode`, `billing_state`, `billing_country`, `billing_address_format_id`, `payment_method`, `cc_type`, `cc_owner`, `cc_number`, `cc_expires`, `last_modified`, `date_purchased`, `orders_status`, `orders_date_finished`, `currency`, `currency_value`) VALUES
(1, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'Cash on Delivery', '', '', '', '', '2014-07-02 16:37:06', '2014-07-02 16:36:39', 3, NULL, 'USD', '1.000000'),
(2, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'California', 'United States', 2, 'Cash on Delivery', '', '', '', '', NULL, '2014-07-07 10:58:03', 1, NULL, 'USD', '1.000000'),
(3, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'Cash on Delivery', '', '', '', '', NULL, '2014-07-07 11:36:51', 1, NULL, 'USD', '1.000000'),
(4, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'Cash on Delivery', '', '', '', '', NULL, '2014-07-17 10:35:17', 1, NULL, 'USD', '1.000000'),
(5, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'Cash on Delivery', '', '', '', '', NULL, '2014-07-30 10:46:21', 1, NULL, 'USD', '1.000000'),
(6, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'Barzahlung bei Lieferung', '', '', '', '', NULL, '2014-08-13 15:36:35', 1, NULL, 'USD', '1.000000'),
(7, 1, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', '123456789', 'admin@admin.com', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'admin admin', '', 'adress', 'adress', 'City', '12345', 'Alabama', 'United States', 2, 'Оплата наличными при получении ', '', '', '', '', NULL, '2014-08-13 16:38:34', 1, NULL, 'USD', '1.000000');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products`
--

DROP TABLE IF EXISTS `orders_products`;
CREATE TABLE IF NOT EXISTS `orders_products` (
  `orders_products_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `products_model` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `final_price` decimal(15,4) NOT NULL,
  `products_tax` decimal(7,4) NOT NULL,
  `products_quantity` int(2) NOT NULL,
  PRIMARY KEY (`orders_products_id`),
  KEY `idx_orders_products_orders_id` (`orders_id`),
  KEY `idx_orders_products_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `orders_products`
--

INSERT INTO `orders_products` (`orders_products_id`, `orders_id`, `products_id`, `products_model`, `products_name`, `products_price`, `final_price`, `products_tax`, `products_quantity`) VALUES
(1, 1, 1, 'MG200MMS', 'Matrox G200 MMS', '299.9900', '299.9900', '0.0000', 1),
(2, 1, 13, 'DVD-LTWP', 'Lethal Weapon', '34.9900', '34.9900', '0.0000', 1),
(3, 1, 22, 'PC-UNTM', 'Unreal Tournament', '89.9900', '89.9900', '0.0000', 1),
(4, 1, 6, 'DVD-MATR', 'The Matrix', '30.0000', '30.0000', '0.0000', 1),
(5, 1, 20, 'DVD-BELOVED', 'Beloved', '54.9900', '54.9900', '0.0000', 1),
(6, 1, 12, 'DVD-DHWV', 'Die Hard With A Vengeance', '39.9900', '39.9900', '0.0000', 1),
(7, 2, 20, 'DVD-BELOVED', 'Beloved', '54.9900', '54.9900', '0.0000', 1),
(8, 2, 25, 'MSINTKB', 'Microsoft Internet Keyboard PS/2', '69.9900', '69.9900', '0.0000', 1),
(9, 3, 12, 'DVD-DHWV', 'Die Hard With A Vengeance', '39.9900', '39.9900', '0.0000', 1),
(10, 4, 17, 'DVD-SPEED', 'Speed', '39.9900', '39.9900', '0.0000', 1),
(11, 5, 13, 'MOD-0CDS', 'Product 13', '34.9900', '34.9900', '0.0000', 1),
(12, 5, 22, 'MOD-BUK', 'Product 22', '89.9900', '89.9900', '0.0000', 1),
(13, 5, 11, 'MOD-fSDs', 'Product 11', '29.9900', '29.9900', '0.0000', 1),
(14, 5, 28, 'MOD-0445ss', 'Product 28', '749.9900', '749.9900', '0.0000', 2),
(15, 5, 9, 'MOD-14', 'Product 9', '29.9900', '29.9900', '0.0000', 3),
(16, 5, 3, 'MOD-147', 'Product 3', '39.9900', '39.9900', '0.0000', 1),
(17, 5, 18, 'MOD-AKM', 'Product 18', '42.0000', '42.0000', '0.0000', 2),
(18, 5, 1, 'MOD-1000', 'Product 1', '299.9900', '299.9900', '0.0000', 8),
(19, 6, 11, 'MOD-fSDs', 'Product 11', '29.9900', '29.9900', '0.0000', 1),
(20, 6, 5, 'MOD-755SW', 'Product 5', '30.0000', '30.0000', '0.0000', 1),
(21, 7, 16, 'MOD-DDSA', 'Product 16', '29.9900', '29.9900', '0.0000', 2),
(22, 7, 5, 'MOD-755SW', 'Product 5', '30.0000', '30.0000', '0.0000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_attributes`
--

DROP TABLE IF EXISTS `orders_products_attributes`;
CREATE TABLE IF NOT EXISTS `orders_products_attributes` (
  `orders_products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_products_id` int(11) NOT NULL,
  `products_options` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `products_options_values` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`orders_products_attributes_id`),
  KEY `idx_orders_products_att_orders_id` (`orders_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `orders_products_attributes`
--

INSERT INTO `orders_products_attributes` (`orders_products_attributes_id`, `orders_id`, `orders_products_id`, `products_options`, `products_options_values`, `options_values_price`, `price_prefix`) VALUES
(1, 1, 1, 'Memory', '4 mb', '0.0000', '+'),
(2, 1, 1, 'Model', 'Value', '0.0000', '+'),
(3, 1, 3, 'Version', 'Download: Windows - English', '0.0000', '+'),
(4, 5, 12, 'Attribute 5', 'value 1', '0.0000', '+'),
(5, 5, 18, 'Attribute 3', 'value 1', '0.0000', '+'),
(6, 5, 18, 'Attribute 4', 'value 1', '0.0000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `orders_products_download`
--

DROP TABLE IF EXISTS `orders_products_download`;
CREATE TABLE IF NOT EXISTS `orders_products_download` (
  `orders_products_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_id` int(11) NOT NULL DEFAULT '0',
  `orders_products_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `download_maxdays` int(2) NOT NULL DEFAULT '0',
  `download_count` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orders_products_download_id`),
  KEY `idx_orders_products_download_orders_id` (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

DROP TABLE IF EXISTS `orders_status`;
CREATE TABLE IF NOT EXISTS `orders_status` (
  `orders_status_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `orders_status_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `public_flag` int(11) DEFAULT '1',
  `downloads_flag` int(11) DEFAULT '0',
  PRIMARY KEY (`orders_status_id`,`language_id`),
  KEY `idx_orders_status_name` (`orders_status_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`orders_status_id`, `language_id`, `orders_status_name`, `public_flag`, `downloads_flag`) VALUES
(1, 1, 'Pending', 1, 0),
(1, 2, 'Pending', 1, 0),
(1, 3, 'Pending', 1, 0),
(1, 4, 'Pending', 1, 0),
(2, 1, 'Processing', 1, 1),
(2, 2, 'Processing', 1, 0),
(2, 3, 'Processing', 1, 0),
(2, 4, 'Processing', 1, 0),
(3, 1, 'Delivered', 1, 1),
(3, 2, 'Delivered', 1, 0),
(3, 3, 'Delivered', 1, 0),
(3, 4, 'Delivered', 1, 0),
(4, 1, 'PayPal [Transactions]', 0, 0),
(4, 2, 'PayPal [Transactions]', 1, 0),
(4, 3, 'PayPal [Transactions]', 1, 0),
(4, 4, 'PayPal [Transactions]', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status_history`
--

DROP TABLE IF EXISTS `orders_status_history`;
CREATE TABLE IF NOT EXISTS `orders_status_history` (
  `orders_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `orders_status_id` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  `customer_notified` int(1) DEFAULT '0',
  `comments` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`orders_status_history_id`),
  KEY `idx_orders_status_history_orders_id` (`orders_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `orders_status_history`
--

INSERT INTO `orders_status_history` (`orders_status_history_id`, `orders_id`, `orders_status_id`, `date_added`, `customer_notified`, `comments`) VALUES
(1, 1, 1, '2014-07-02 16:36:39', 1, ''),
(2, 1, 3, '2014-07-02 16:37:07', 1, ''),
(3, 2, 1, '2014-07-07 10:58:03', 1, 'my new comment'),
(4, 3, 1, '2014-07-07 11:36:51', 1, ''),
(5, 4, 1, '2014-07-17 10:35:17', 1, ''),
(6, 5, 1, '2014-07-30 10:46:22', 1, ''),
(7, 6, 1, '2014-08-13 15:36:35', 1, ''),
(8, 7, 1, '2014-08-13 16:38:34', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `orders_total`
--

DROP TABLE IF EXISTS `orders_total`;
CREATE TABLE IF NOT EXISTS `orders_total` (
  `orders_total_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orders_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` decimal(15,4) NOT NULL,
  `class` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`orders_total_id`),
  KEY `idx_orders_total_orders_id` (`orders_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Dumping data for table `orders_total`
--

INSERT INTO `orders_total` (`orders_total_id`, `orders_id`, `title`, `text`, `value`, `class`, `sort_order`) VALUES
(1, 1, 'Sub-Total:', '$549.95', '549.9500', 'ot_subtotal', 1),
(2, 1, 'Flat Rate (Best Way):', '$5.00', '5.0000', 'ot_shipping', 2),
(3, 1, 'Total:', '<strong>$554.95</strong>', '554.9500', 'ot_total', 4),
(4, 2, 'Sub-Total:', '$124.98', '124.9800', 'ot_subtotal', 1),
(5, 2, 'Flat Rate (Best Way):', '$5.00', '5.0000', 'ot_shipping', 2),
(6, 2, 'Total:', '<strong>$129.98</strong>', '129.9800', 'ot_total', 4),
(7, 3, 'Sub-Total:', '$39.99', '39.9900', 'ot_subtotal', 1),
(8, 3, 'Flat Rate (Best Way):', '$5.00', '5.0000', 'ot_shipping', 2),
(9, 3, 'Total:', '<strong>$44.99</strong>', '44.9900', 'ot_total', 4),
(10, 4, 'Sub-Total:', '$39.99', '39.9900', 'ot_subtotal', 1),
(11, 4, 'Flat Rate (Best Way):', '$5.00', '5.0000', 'ot_shipping', 2),
(12, 4, 'Total:', '<strong>$44.99</strong>', '44.9900', 'ot_total', 4),
(13, 5, 'Sub-Total:', '$4,268.83', '4268.8300', 'ot_subtotal', 1),
(14, 5, 'Flat Rate (Best Way):', '$5.00', '5.0000', 'ot_shipping', 2),
(15, 5, 'Total:', '<strong>$4,273.83</strong>', '4273.8300', 'ot_total', 4),
(16, 6, 'Zwischensumme:', '$59.99', '59.9900', 'ot_subtotal', 1),
(17, 6, 'Pauschalpreis (Best Way):', '$5.00', '5.0000', 'ot_shipping', 2),
(18, 6, 'Gesamtsumme:', '<strong>$64.99</strong>', '64.9900', 'ot_total', 4),
(19, 7, 'Стоимость товара:', '$89.98', '89.9800', 'ot_subtotal', 1),
(20, 7, 'Российская почта (Бандероль):', '$5.00', '5.0000', 'ot_shipping', 2),
(21, 7, 'Всего:', '<strong>$94.98</strong>', '94.9800', 'ot_total', 4);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_quantity` int(4) NOT NULL,
  `products_model` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_price` decimal(15,4) NOT NULL,
  `products_date_added` datetime NOT NULL,
  `products_last_modified` datetime DEFAULT NULL,
  `products_date_available` datetime DEFAULT NULL,
  `products_weight` decimal(5,2) NOT NULL,
  `products_status` tinyint(1) NOT NULL,
  `products_tax_class_id` int(11) NOT NULL,
  `manufacturers_id` int(11) DEFAULT NULL,
  `products_ordered` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`products_id`),
  KEY `idx_products_model` (`products_model`),
  KEY `idx_products_date_added` (`products_date_added`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`products_id`, `products_quantity`, `products_model`, `products_image`, `products_price`, `products_date_added`, `products_last_modified`, `products_date_available`, `products_weight`, `products_status`, `products_tax_class_id`, `manufacturers_id`, `products_ordered`) VALUES
(1, 23, 'MOD-1000', 'products/1/1.png', '299.9900', '2014-06-30 14:38:20', '2014-09-19 16:22:28', '2015-04-11 00:00:00', '23.00', 1, 1, 6, 9),
(2, 32, 'MOD-1150', 'products/2/1.png', '499.9900', '2014-06-30 14:38:20', '2014-09-19 16:23:07', '2015-07-04 00:00:00', '23.00', 1, 1, 1, 0),
(3, 1, 'MOD-147', 'products/3/1.png', '49.9900', '2014-06-30 14:38:20', '2014-07-10 11:42:13', NULL, '7.00', 1, 1, 3, 1),
(4, 13, 'MOD-75sd', 'products/4/1.png', '42.0000', '2014-06-30 14:38:20', NULL, NULL, '23.00', 1, 1, 2, 0),
(5, 15, 'MOD-755SW', 'products/5/1.png', '35.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 2),
(6, 9, 'MOD-78SDe', 'products/6/1.png', '39.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 1),
(7, 10, 'MOD-641c', 'products/7/1.png', '34.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 0),
(8, 10, 'MOD-575', 'products/8/1.png', '35.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 0),
(9, 7, 'MOD-14', 'products/9/1.png', '29.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 3),
(10, 10, 'MOD-000', 'products/10/1.png', '29.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 0),
(11, 8, 'MOD-fSDs', 'products/11/1.png', '29.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 2),
(12, 8, 'MOD-88S', 'products/12/1.png', '39.9900', '2014-06-30 14:38:20', '2014-09-19 16:23:38', '2015-07-11 00:00:00', '7.00', 1, 1, 4, 2),
(13, 8, 'MOD-0CDS', 'products/13/1.png', '34.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 2),
(14, 10, 'MOD-DSX-1', 'products/14/1.png', '32.0000', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 0),
(15, 10, 'MOD-ddsS', 'products/15/1.png', '35.0000', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 3, 0),
(16, 8, 'MOD-DDSA', 'products/16/1.png', '38.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 4, 2),
(17, 9, 'MOD-ASWD', 'products/17/1.png', '39.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 4, 1),
(18, 8, 'MOD-AKM', 'products/18/1.png', '42.0000', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 4, 2),
(19, 10, 'MOD-ASU', 'products/19/1.png', '49.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 4, 0),
(20, 8, 'MOD-DURU', 'products/20/1.png', '54.9900', '2014-06-30 14:38:20', '2014-07-16 14:54:00', NULL, '7.00', 1, 1, 3, 2),
(21, 16, 'MOD-ME1', 'products/21/1.png', '79.9900', '2014-06-30 14:38:20', '2014-09-19 16:23:58', '2015-12-18 00:00:00', '7.00', 1, 1, 7, 0),
(22, 11, 'MOD-BUK', 'products/22/1.png', '89.9900', '2014-06-30 14:38:20', NULL, NULL, '7.00', 1, 1, 8, 2),
(23, 16, 'MOD-SUK', 'products/23/1.png', '99.9900', '2014-06-30 14:38:20', NULL, NULL, '10.00', 1, 1, 8, 0),
(24, 17, 'MOD-TUK-1d', 'products/24/1.png', '90.0000', '2014-06-30 14:38:20', NULL, NULL, '8.00', 1, 1, 8, 0),
(25, 15, 'MOD-NEW568', 'products/25/1.png', '69.9900', '2014-06-30 14:38:20', NULL, NULL, '8.00', 1, 1, 2, 1),
(26, 10, 'MOD-464864n', 'products/26/1.png', '64.9500', '2014-06-30 14:38:20', NULL, NULL, '8.00', 1, 1, 2, 0),
(27, 8, 'MOD-DDWS', 'products/27/1.png', '499.9900', '2014-06-30 14:38:20', NULL, NULL, '45.00', 1, 1, 9, 0),
(28, 98, 'MOD-0445ss', 'products/28/1.png', '749.9900', '2014-06-30 14:38:20', NULL, NULL, '1.00', 1, 1, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

DROP TABLE IF EXISTS `products_attributes`;
CREATE TABLE IF NOT EXISTS `products_attributes` (
  `products_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `options_id` int(11) NOT NULL,
  `options_values_id` int(11) NOT NULL,
  `options_values_price` decimal(15,4) NOT NULL,
  `price_prefix` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`products_attributes_id`),
  KEY `idx_products_attributes_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`products_attributes_id`, `products_id`, `options_id`, `options_values_id`, `options_values_price`, `price_prefix`) VALUES
(1, 1, 4, 1, '0.0000', '+'),
(2, 1, 4, 2, '50.0000', '+'),
(3, 1, 4, 3, '70.0000', '+'),
(4, 1, 3, 5, '0.0000', '+'),
(5, 1, 3, 6, '100.0000', '+'),
(6, 2, 4, 3, '10.0000', '-'),
(7, 2, 4, 4, '0.0000', '+'),
(8, 2, 3, 6, '0.0000', '+'),
(9, 2, 3, 7, '120.0000', '+'),
(10, 26, 3, 8, '0.0000', '+'),
(11, 26, 3, 9, '6.0000', '+'),
(26, 22, 5, 10, '0.0000', '+'),
(27, 22, 5, 13, '0.0000', '+'),
(28, 8, 1, 1, '0.0000', '+');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes_download`
--

DROP TABLE IF EXISTS `products_attributes_download`;
CREATE TABLE IF NOT EXISTS `products_attributes_download` (
  `products_attributes_id` int(11) NOT NULL,
  `products_attributes_filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `products_attributes_maxdays` int(2) DEFAULT '0',
  `products_attributes_maxcount` int(2) DEFAULT '0',
  PRIMARY KEY (`products_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_attributes_download`
--

INSERT INTO `products_attributes_download` (`products_attributes_id`, `products_attributes_filename`, `products_attributes_maxdays`, `products_attributes_maxcount`) VALUES
(26, 'unreal.zip', 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_description`
--

DROP TABLE IF EXISTS `products_description`;
CREATE TABLE IF NOT EXISTS `products_description` (
  `products_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `products_description` text COLLATE utf8_unicode_ci,
  `products_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `products_viewed` int(5) DEFAULT '0',
  PRIMARY KEY (`products_id`,`language_id`),
  KEY `products_name` (`products_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=29 ;

--
-- Dumping data for table `products_description`
--

INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(1, 1, 'Product 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 889),
(1, 2, 'Product 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 9),
(1, 3, 'Product 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 4),
(1, 4, 'Product 1', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 8),
(2, 1, 'Product 2', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 28),
(2, 2, 'Product 2', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(2, 3, 'Product 3', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(2, 4, 'Product 2', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(3, 1, 'Product 3', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 26),
(3, 2, 'Product 3', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 3),
(3, 3, 'Product 3', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(3, 4, 'Product 3', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(4, 1, 'Product 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 22),
(4, 2, 'Product 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(4, 3, 'Product 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(4, 4, 'Product 4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(5, 1, 'Product 5', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 12),
(5, 2, 'Product 5', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(5, 3, 'Product 5', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(5, 4, 'Product 5', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(6, 1, 'Product 6', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 58),
(6, 2, 'Product 6', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(6, 3, 'Product 6', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(6, 4, 'Product 6', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 1),
(7, 1, 'Product 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 7),
(7, 2, 'Product 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(7, 3, 'Product 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(7, 4, 'Product 7', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(8, 1, 'Product 8', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 56),
(8, 2, 'Product 8', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(8, 3, 'Product 8', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(8, 4, 'Product 8', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(9, 1, 'Product 9', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 37),
(9, 2, 'Product 9', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(9, 3, 'Product 9', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(9, 4, 'Product 9', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(10, 1, 'Product 10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 80),
(10, 2, 'Product 10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 1),
(10, 3, 'Product 10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 1),
(10, 4, 'Product 10', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 6),
(11, 1, 'Product 11', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 20),
(11, 2, 'Product 11', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(11, 3, 'Product 11', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(11, 4, 'Product 11', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(12, 1, 'Product 12', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 88),
(12, 2, 'Product 12', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(12, 3, 'Product 12', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(12, 4, 'Product 12', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(13, 1, 'Product 13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 16),
(13, 2, 'Product 13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(13, 3, 'Product 13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(13, 4, 'Product 13', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(14, 1, 'Product 14', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 18),
(14, 2, 'Product 14', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(14, 3, 'Product 14', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(14, 4, 'Product 14', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(15, 1, 'Product 15', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 2),
(15, 2, 'Product 15', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(15, 3, 'Product 15', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(15, 4, 'Product 15', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(16, 1, 'Product 16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 30),
(16, 2, 'Product 16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(16, 3, 'Product 16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(16, 4, 'Product 16', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(17, 1, 'Product 17', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 10),
(17, 2, 'Product 17', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(17, 3, 'Product 17', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(17, 4, 'Product 17', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(18, 1, 'Product 18', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 8),
(18, 2, 'Product 18', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(18, 3, 'Product 18', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(18, 4, 'Product 18', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(19, 1, 'Product 19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 31),
(19, 2, 'Product 19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(19, 3, 'Product 19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(19, 4, 'Product 19', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(20, 1, 'Product 20', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 61),
(20, 2, 'Product 20', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(20, 3, 'Product 20', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(20, 4, 'Product 20', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0);
INSERT INTO `products_description` (`products_id`, `language_id`, `products_name`, `products_description`, `products_url`, `products_viewed`) VALUES
(21, 1, 'Product 21', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 10),
(21, 2, 'Product 21', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(21, 3, 'Product 21', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(21, 4, 'Product 21', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(22, 1, 'Product 22', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 25),
(22, 2, 'Product 22', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(22, 3, 'Product 22', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(22, 4, 'Product 22', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(23, 1, 'Product 23', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 6),
(23, 2, 'Product 23', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(23, 3, 'Product 23', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(23, 4, 'Product 23', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(24, 1, 'Product 24', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 10),
(24, 2, 'Product 24', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(24, 3, 'Product 24', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(24, 4, 'Product 24', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(25, 1, 'Product 25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 10),
(25, 2, 'Product 25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(25, 3, 'Product 25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(25, 4, 'Product 25', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(26, 1, 'Product 26', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 28),
(26, 2, 'Product 26', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(26, 3, 'Product 26', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(26, 4, 'Product 26', 'Sed pharetra tempor metus vitae sodales. Aenean a diam at nulla finibus malesuada. Ut efficitur libero in turpis feugiat, et porttitor mi sodales. Nam ullamcorper et leo at consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec consequat rutrum ante. Donec non posuere lorem. Morbi tristique scelerisque lacus, et hendrerit justo laoreet id. Quisque eu erat a ligula scelerisque ullamcorper nec non sapien. ', '', 0),
(27, 1, 'Product 27', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 3),
(27, 2, 'Product 27', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(27, 3, 'Product 27', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(27, 4, 'Product 27', 'Aliquam sit amet ultrices leo. Quisque lacus nisl, finibus eget dui sed, consequat maximus diam. Aliquam vehicula hendrerit enim vitae eleifend. Cras hendrerit ante pulvinar dui accumsan molestie. Duis ornare urna quam, sit amet semper neque finibus vitae. Donec sed sodales orci, sit amet sollicitudin enim. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam sollicitudin odio et massa aliquet, non euismod quam fermentum. Suspendisse sodales nibh at erat hendrerit porta. Quisque imperdiet leo ut placerat semper. Integer erat enim, venenatis nec malesuada non, facilisis in massa.', '', 0),
(28, 1, 'Product 28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 60),
(28, 2, 'Product 28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(28, 3, 'Product 28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0),
(28, 4, 'Product 28', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis et nulla at dolor interdum faucibus id non urna. Aliquam auctor venenatis lobortis. Nulla consequat vel ligula at faucibus. Fusce lobortis augue vitae odio lobortis sollicitudin. Proin sed orci tincidunt, aliquet ipsum eu, dictum lectus. Morbi feugiat dapibus libero pellentesque sollicitudin. Morbi suscipit lacus porta semper fringilla. Sed ac massa metus. In pharetra, risus sed hendrerit vehicula, nulla metus maximus eros, sit amet tristique orci quam quis odio. Suspendisse sit amet augue ornare, mollis turpis a, ornare mauris. Fusce risus ligula, pulvinar egestas vehicula sed, dignissim a turpis. Ut sit amet convallis urna, eget iaculis metus. ', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
CREATE TABLE IF NOT EXISTS `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `htmlcontent` text COLLATE utf8_unicode_ci,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_images_prodid` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `products_id`, `image`, `htmlcontent`, `sort_order`) VALUES
(1, 1, 'products/1/1.png', '', 1),
(2, 1, 'products/1/2.png', '', 2),
(3, 1, 'products/1/3.png', '', 3),
(4, 2, 'products/2/1.png', '', 1),
(5, 2, 'products/2/2.png', '', 2),
(6, 2, 'products/2/3.png', '', 3),
(7, 3, 'products/3/1.png', NULL, 1),
(8, 3, 'products/3/2.png', NULL, 2),
(9, 3, 'products/3/3.png', NULL, 3),
(10, 4, 'products/4/1.png', NULL, 1),
(11, 4, 'products/4/2.png', NULL, 2),
(12, 4, 'products/4/3.png', NULL, 3),
(13, 5, 'products/5/1.png', NULL, 1),
(14, 5, 'products/5/2.png', NULL, 2),
(15, 5, 'products/5/3.png', NULL, 3),
(16, 6, 'products/6/1.png', NULL, 1),
(17, 6, 'products/6/2.png', NULL, 2),
(18, 6, 'products/6/3.png', NULL, 3),
(19, 7, 'products/7/1.png', NULL, 1),
(20, 7, 'products/7/2.png', NULL, 2),
(21, 7, 'products/7/3.png', NULL, 3),
(22, 8, 'products/8/1.png', NULL, 1),
(23, 8, 'products/8/2.png', NULL, 2),
(24, 8, 'products/8/3.png', NULL, 3),
(25, 9, 'products/9/1.png', NULL, 1),
(26, 9, 'products/9/2.png', NULL, 2),
(27, 9, 'products/9/3.png', NULL, 3),
(28, 10, 'products/10/1.png', NULL, 1),
(29, 10, 'products/10/2.png', NULL, 2),
(30, 10, 'products/10/3.png', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_notifications`
--

DROP TABLE IF EXISTS `products_notifications`;
CREATE TABLE IF NOT EXISTS `products_notifications` (
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`products_id`,`customers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_notifications`
--

INSERT INTO `products_notifications` (`products_id`, `customers_id`, `date_added`) VALUES
(1, 1, '2014-08-13 15:45:37'),
(1, 3, '2014-07-25 17:36:36'),
(3, 1, '2014-07-30 10:46:32'),
(6, 1, '2014-07-02 16:36:46'),
(9, 1, '2014-07-02 17:19:07'),
(11, 1, '2014-07-30 10:46:32'),
(12, 1, '2014-07-02 16:36:46'),
(13, 1, '2014-07-02 16:36:46'),
(18, 1, '2014-07-30 10:46:32'),
(20, 1, '2014-07-02 16:36:46'),
(22, 1, '2014-07-16 10:37:27'),
(25, 1, '2014-07-07 11:14:39'),
(28, 1, '2014-07-30 10:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `products_options`
--

DROP TABLE IF EXISTS `products_options`;
CREATE TABLE IF NOT EXISTS `products_options` (
  `products_options_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_options`
--

INSERT INTO `products_options` (`products_options_id`, `language_id`, `products_options_name`) VALUES
(1, 1, 'Attribute 1'),
(1, 2, 'Attribute 1'),
(1, 3, 'Attribute 1'),
(1, 4, 'Attribute 1'),
(2, 1, 'Attribute 2'),
(2, 2, 'Attribute 2'),
(2, 3, 'Attribute 2'),
(2, 4, 'Attribute 2'),
(3, 1, 'Attribute 3'),
(3, 2, 'Attribute 3'),
(3, 3, 'Attribute 3'),
(3, 4, 'Attribute 3'),
(4, 1, 'Attribute 4'),
(4, 2, 'Attribute 4'),
(4, 3, 'Attribute 4'),
(4, 4, 'Attribute 4'),
(5, 1, 'Attribute 5'),
(5, 2, 'Attribute 5'),
(5, 3, 'Attribute 5'),
(5, 4, 'Attribute 5');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values`
--

DROP TABLE IF EXISTS `products_options_values`;
CREATE TABLE IF NOT EXISTS `products_options_values` (
  `products_options_values_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL DEFAULT '1',
  `products_options_values_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`products_options_values_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_options_values`
--

INSERT INTO `products_options_values` (`products_options_values_id`, `language_id`, `products_options_values_name`) VALUES
(1, 1, 'value 1'),
(1, 2, 'value 1'),
(1, 3, 'value 1'),
(1, 4, 'value 1'),
(2, 1, 'value 2'),
(2, 2, 'value 2'),
(2, 3, 'value 2'),
(2, 4, 'value 2'),
(3, 1, 'value 3'),
(3, 2, 'value 3'),
(3, 3, 'value 3'),
(3, 4, 'value 3'),
(4, 1, 'value 4'),
(4, 2, 'value 4'),
(4, 3, 'value 4'),
(4, 4, 'value 4'),
(5, 1, 'value 1'),
(5, 2, 'value 1'),
(5, 3, 'value 1'),
(5, 4, 'value 1'),
(6, 1, 'value 2'),
(6, 2, 'value 2'),
(6, 3, 'value 2'),
(6, 4, 'value 2'),
(7, 1, 'value 3'),
(7, 2, 'value 3'),
(7, 3, 'value 3'),
(7, 4, 'value 3'),
(8, 1, 'value 4'),
(8, 2, 'value 4'),
(8, 3, 'value 4'),
(8, 4, 'value 4'),
(9, 1, 'value 5'),
(9, 2, 'value 5'),
(9, 3, 'value 5'),
(9, 4, 'value 5'),
(10, 1, 'value 1'),
(10, 2, 'value 1'),
(10, 3, 'value 1'),
(10, 4, 'value 1'),
(13, 1, 'value 2'),
(13, 2, 'value 2'),
(13, 3, 'value 2'),
(13, 4, 'value 2');

-- --------------------------------------------------------

--
-- Table structure for table `products_options_values_to_products_options`
--

DROP TABLE IF EXISTS `products_options_values_to_products_options`;
CREATE TABLE IF NOT EXISTS `products_options_values_to_products_options` (
  `products_options_values_to_products_options_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_options_id` int(11) NOT NULL,
  `products_options_values_id` int(11) NOT NULL,
  PRIMARY KEY (`products_options_values_to_products_options_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `products_options_values_to_products_options`
--

INSERT INTO `products_options_values_to_products_options` (`products_options_values_to_products_options_id`, `products_options_id`, `products_options_values_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 3, 5),
(6, 3, 6),
(7, 3, 7),
(8, 3, 8),
(9, 3, 9),
(10, 5, 10),
(13, 5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `products_related_products`
--

DROP TABLE IF EXISTS `products_related_products`;
CREATE TABLE IF NOT EXISTS `products_related_products` (
  `pop_id` int(11) NOT NULL AUTO_INCREMENT,
  `pop_products_id_master` int(11) NOT NULL DEFAULT '0',
  `pop_products_id_slave` int(11) NOT NULL DEFAULT '0',
  `pop_order_id` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pop_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `products_related_products`
--

INSERT INTO `products_related_products` (`pop_id`, `pop_products_id_master`, `pop_products_id_slave`, `pop_order_id`) VALUES
(1, 10, 9, 0),
(2, 9, 10, 0),
(3, 1, 8, 0),
(4, 20, 8, 0),
(5, 8, 20, 0),
(6, 1, 20, 0),
(7, 1, 5, 0),
(8, 8, 11, 0),
(9, 11, 8, 0),
(10, 13, 8, 0),
(11, 8, 13, 0),
(12, 19, 14, 0),
(13, 14, 19, 0),
(14, 19, 17, 0),
(15, 19, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `products_tags`
--

DROP TABLE IF EXISTS `products_tags`;
CREATE TABLE IF NOT EXISTS `products_tags` (
  `products_id` int(11) NOT NULL,
  `tag_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_tags`
--

INSERT INTO `products_tags` (`products_id`, `tag_id`) VALUES
(1, 7),
(10, 9),
(1, 11),
(10, 12),
(12, 13),
(12, 14),
(12, 7),
(12, 15),
(14, 7),
(14, 15),
(17, 16),
(17, 17),
(28, 13),
(28, 14);

-- --------------------------------------------------------

--
-- Table structure for table `products_to_categories`
--

DROP TABLE IF EXISTS `products_to_categories`;
CREATE TABLE IF NOT EXISTS `products_to_categories` (
  `products_id` int(11) NOT NULL,
  `categories_id` int(11) NOT NULL,
  PRIMARY KEY (`products_id`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_to_categories`
--

INSERT INTO `products_to_categories` (`products_id`, `categories_id`) VALUES
(1, 3),
(1, 4),
(1, 24),
(2, 3),
(2, 4),
(3, 9),
(3, 25),
(4, 2),
(4, 10),
(5, 11),
(6, 10),
(7, 12),
(7, 23),
(7, 25),
(8, 13),
(8, 24),
(9, 10),
(10, 2),
(11, 10),
(12, 10),
(13, 10),
(14, 15),
(15, 6),
(15, 14),
(15, 22),
(16, 15),
(17, 10),
(18, 10),
(18, 22),
(19, 6),
(19, 12),
(20, 15),
(21, 7),
(21, 18),
(22, 19),
(23, 20),
(24, 20),
(24, 23),
(25, 7),
(25, 8),
(25, 25),
(26, 9),
(26, 24),
(27, 5),
(28, 21),
(28, 23);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `reviews_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `customers_id` int(11) DEFAULT NULL,
  `customers_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reviews_rating` int(1) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reviews_status` tinyint(1) NOT NULL DEFAULT '0',
  `reviews_read` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`reviews_id`),
  KEY `idx_reviews_products_id` (`products_id`),
  KEY `idx_reviews_customers_id` (`customers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`reviews_id`, `products_id`, `customers_id`, `customers_name`, `reviews_rating`, `date_added`, `last_modified`, `reviews_status`, `reviews_read`) VALUES
(10, 1, 1, 'admin admin', 4, '2014-08-13 14:50:05', '2014-08-13 14:50:58', 1, 3),
(11, 1, 1, 'admin admin', 3, '2014-08-13 15:29:09', '2014-08-13 15:29:28', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `reviews_description`
--

DROP TABLE IF EXISTS `reviews_description`;
CREATE TABLE IF NOT EXISTS `reviews_description` (
  `reviews_id` int(11) NOT NULL,
  `languages_id` int(11) NOT NULL,
  `reviews_text` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`reviews_id`,`languages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reviews_description`
--

INSERT INTO `reviews_description` (`reviews_id`, `languages_id`, `reviews_text`) VALUES
(10, 4, 'Not bed Not bed Not bed Not bed Not bed Not bed Not bed'),
(11, 2, 'My feedback for this product to see some result! But no less that 50 symbols');

-- --------------------------------------------------------

--
-- Table structure for table `sec_directory_whitelist`
--

DROP TABLE IF EXISTS `sec_directory_whitelist`;
CREATE TABLE IF NOT EXISTS `sec_directory_whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `directory` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `sec_directory_whitelist`
--

INSERT INTO `sec_directory_whitelist` (`id`, `directory`) VALUES
(1, 'admin/backups'),
(2, 'admin/images/graphs'),
(3, 'images'),
(4, 'images/banners'),
(5, 'images/dvd'),
(6, 'images/gt_interactive'),
(7, 'images/hewlett_packard'),
(8, 'images/matrox'),
(9, 'images/microsoft'),
(10, 'images/samsung'),
(11, 'images/sierra'),
(12, 'includes/work'),
(13, 'pub');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sesskey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

DROP TABLE IF EXISTS `specials`;
CREATE TABLE IF NOT EXISTS `specials` (
  `specials_id` int(11) NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `specials_new_products_price` decimal(15,4) NOT NULL,
  `specials_date_added` datetime DEFAULT NULL,
  `specials_last_modified` datetime DEFAULT NULL,
  `expires_date` datetime DEFAULT NULL,
  `date_status_change` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`specials_id`),
  KEY `idx_specials_products_id` (`products_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`specials_id`, `products_id`, `specials_new_products_price`, `specials_date_added`, `specials_last_modified`, `expires_date`, `date_status_change`, `status`) VALUES
(1, 3, '39.9900', '2014-06-30 14:38:22', NULL, NULL, NULL, 1),
(2, 5, '30.0000', '2014-06-30 14:38:22', NULL, NULL, NULL, 1),
(3, 6, '30.0000', '2014-06-30 14:38:22', NULL, NULL, NULL, 1),
(4, 16, '29.9900', '2014-06-30 14:38:22', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
CREATE TABLE IF NOT EXISTS `tags` (
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`tag_id`),
  UNIQUE KEY `tag_text` (`tag_text`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_text`) VALUES
(17, 'amet'),
(7, 'dolore'),
(11, 'dolore+sit'),
(14, 'ipsum'),
(13, 'lorem'),
(12, 'new+tag'),
(15, 'set'),
(16, 'sit'),
(9, 'tag');

-- --------------------------------------------------------

--
-- Table structure for table `tax_class`
--

DROP TABLE IF EXISTS `tax_class`;
CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_title` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tax_class_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `tax_class_title`, `tax_class_description`, `last_modified`, `date_added`) VALUES
(1, 'Taxable Goods', 'The following types of products are included non-food, services, etc', '2014-06-30 14:38:22', '2014-06-30 14:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE IF NOT EXISTS `tax_rates` (
  `tax_rates_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_zone_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_priority` int(5) DEFAULT '1',
  `tax_rate` decimal(7,4) NOT NULL,
  `tax_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`tax_rates_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`tax_rates_id`, `tax_zone_id`, `tax_class_id`, `tax_priority`, `tax_rate`, `tax_description`, `last_modified`, `date_added`) VALUES
(1, 1, 1, 1, '7.0000', 'FL TAX 7.0%', '2014-06-30 14:38:22', '2014-06-30 14:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `usu_cache`
--

DROP TABLE IF EXISTS `usu_cache`;
CREATE TABLE IF NOT EXISTS `usu_cache` (
  `cache_name` varchar(64) CHARACTER SET latin1 NOT NULL,
  `cache_data` mediumtext CHARACTER SET latin1 NOT NULL,
  `cache_date` datetime NOT NULL,
  UNIQUE KEY `cache_name` (`cache_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `whos_online`
--

DROP TABLE IF EXISTS `whos_online`;
CREATE TABLE IF NOT EXISTS `whos_online` (
  `customer_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `session_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `time_entry` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `time_last_click` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `last_page_url` text COLLATE utf8_unicode_ci NOT NULL,
  KEY `idx_whos_online_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
CREATE TABLE IF NOT EXISTS `zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `zone_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `idx_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=182 ;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`zone_id`, `zone_country_id`, `zone_code`, `zone_name`) VALUES
(1, 223, 'AL', 'Alabama'),
(2, 223, 'AK', 'Alaska'),
(3, 223, 'AS', 'American Samoa'),
(4, 223, 'AZ', 'Arizona'),
(5, 223, 'AR', 'Arkansas'),
(6, 223, 'AF', 'Armed Forces Africa'),
(7, 223, 'AA', 'Armed Forces Americas'),
(8, 223, 'AC', 'Armed Forces Canada'),
(9, 223, 'AE', 'Armed Forces Europe'),
(10, 223, 'AM', 'Armed Forces Middle East'),
(11, 223, 'AP', 'Armed Forces Pacific'),
(12, 223, 'CA', 'California'),
(13, 223, 'CO', 'Colorado'),
(14, 223, 'CT', 'Connecticut'),
(15, 223, 'DE', 'Delaware'),
(16, 223, 'DC', 'District of Columbia'),
(17, 223, 'FM', 'Federated States Of Micronesia'),
(18, 223, 'FL', 'Florida'),
(19, 223, 'GA', 'Georgia'),
(20, 223, 'GU', 'Guam'),
(21, 223, 'HI', 'Hawaii'),
(22, 223, 'ID', 'Idaho'),
(23, 223, 'IL', 'Illinois'),
(24, 223, 'IN', 'Indiana'),
(25, 223, 'IA', 'Iowa'),
(26, 223, 'KS', 'Kansas'),
(27, 223, 'KY', 'Kentucky'),
(28, 223, 'LA', 'Louisiana'),
(29, 223, 'ME', 'Maine'),
(30, 223, 'MH', 'Marshall Islands'),
(31, 223, 'MD', 'Maryland'),
(32, 223, 'MA', 'Massachusetts'),
(33, 223, 'MI', 'Michigan'),
(34, 223, 'MN', 'Minnesota'),
(35, 223, 'MS', 'Mississippi'),
(36, 223, 'MO', 'Missouri'),
(37, 223, 'MT', 'Montana'),
(38, 223, 'NE', 'Nebraska'),
(39, 223, 'NV', 'Nevada'),
(40, 223, 'NH', 'New Hampshire'),
(41, 223, 'NJ', 'New Jersey'),
(42, 223, 'NM', 'New Mexico'),
(43, 223, 'NY', 'New York'),
(44, 223, 'NC', 'North Carolina'),
(45, 223, 'ND', 'North Dakota'),
(46, 223, 'MP', 'Northern Mariana Islands'),
(47, 223, 'OH', 'Ohio'),
(48, 223, 'OK', 'Oklahoma'),
(49, 223, 'OR', 'Oregon'),
(50, 223, 'PW', 'Palau'),
(51, 223, 'PA', 'Pennsylvania'),
(52, 223, 'PR', 'Puerto Rico'),
(53, 223, 'RI', 'Rhode Island'),
(54, 223, 'SC', 'South Carolina'),
(55, 223, 'SD', 'South Dakota'),
(56, 223, 'TN', 'Tennessee'),
(57, 223, 'TX', 'Texas'),
(58, 223, 'UT', 'Utah'),
(59, 223, 'VT', 'Vermont'),
(60, 223, 'VI', 'Virgin Islands'),
(61, 223, 'VA', 'Virginia'),
(62, 223, 'WA', 'Washington'),
(63, 223, 'WV', 'West Virginia'),
(64, 223, 'WI', 'Wisconsin'),
(65, 223, 'WY', 'Wyoming'),
(66, 38, 'AB', 'Alberta'),
(67, 38, 'BC', 'British Columbia'),
(68, 38, 'MB', 'Manitoba'),
(69, 38, 'NF', 'Newfoundland'),
(70, 38, 'NB', 'New Brunswick'),
(71, 38, 'NS', 'Nova Scotia'),
(72, 38, 'NT', 'Northwest Territories'),
(73, 38, 'NU', 'Nunavut'),
(74, 38, 'ON', 'Ontario'),
(75, 38, 'PE', 'Prince Edward Island'),
(76, 38, 'QC', 'Quebec'),
(77, 38, 'SK', 'Saskatchewan'),
(78, 38, 'YT', 'Yukon Territory'),
(79, 81, 'NDS', 'Niedersachsen'),
(80, 81, 'BAW', 'Baden-Württemberg'),
(81, 81, 'BAY', 'Bayern'),
(82, 81, 'BER', 'Berlin'),
(83, 81, 'BRG', 'Brandenburg'),
(84, 81, 'BRE', 'Bremen'),
(85, 81, 'HAM', 'Hamburg'),
(86, 81, 'HES', 'Hessen'),
(87, 81, 'MEC', 'Mecklenburg-Vorpommern'),
(88, 81, 'NRW', 'Nordrhein-Westfalen'),
(89, 81, 'RHE', 'Rheinland-Pfalz'),
(90, 81, 'SAR', 'Saarland'),
(91, 81, 'SAS', 'Sachsen'),
(92, 81, 'SAC', 'Sachsen-Anhalt'),
(93, 81, 'SCN', 'Schleswig-Holstein'),
(94, 81, 'THE', 'Thüringen'),
(95, 14, 'WI', 'Wien'),
(96, 14, 'NO', 'Niederösterreich'),
(97, 14, 'OO', 'Oberösterreich'),
(98, 14, 'SB', 'Salzburg'),
(99, 14, 'KN', 'Kärnten'),
(100, 14, 'ST', 'Steiermark'),
(101, 14, 'TI', 'Tirol'),
(102, 14, 'BL', 'Burgenland'),
(103, 14, 'VB', 'Voralberg'),
(104, 204, 'AG', 'Aargau'),
(105, 204, 'AI', 'Appenzell Innerrhoden'),
(106, 204, 'AR', 'Appenzell Ausserrhoden'),
(107, 204, 'BE', 'Bern'),
(108, 204, 'BL', 'Basel-Landschaft'),
(109, 204, 'BS', 'Basel-Stadt'),
(110, 204, 'FR', 'Freiburg'),
(111, 204, 'GE', 'Genf'),
(112, 204, 'GL', 'Glarus'),
(113, 204, 'JU', 'Graubünden'),
(114, 204, 'JU', 'Jura'),
(115, 204, 'LU', 'Luzern'),
(116, 204, 'NE', 'Neuenburg'),
(117, 204, 'NW', 'Nidwalden'),
(118, 204, 'OW', 'Obwalden'),
(119, 204, 'SG', 'St. Gallen'),
(120, 204, 'SH', 'Schaffhausen'),
(121, 204, 'SO', 'Solothurn'),
(122, 204, 'SZ', 'Schwyz'),
(123, 204, 'TG', 'Thurgau'),
(124, 204, 'TI', 'Tessin'),
(125, 204, 'UR', 'Uri'),
(126, 204, 'VD', 'Waadt'),
(127, 204, 'VS', 'Wallis'),
(128, 204, 'ZG', 'Zug'),
(129, 204, 'ZH', 'Zürich'),
(130, 195, 'A Coruña', 'A Coruña'),
(131, 195, 'Alava', 'Alava'),
(132, 195, 'Albacete', 'Albacete'),
(133, 195, 'Alicante', 'Alicante'),
(134, 195, 'Almeria', 'Almeria'),
(135, 195, 'Asturias', 'Asturias'),
(136, 195, 'Avila', 'Avila'),
(137, 195, 'Badajoz', 'Badajoz'),
(138, 195, 'Baleares', 'Baleares'),
(139, 195, 'Barcelona', 'Barcelona'),
(140, 195, 'Burgos', 'Burgos'),
(141, 195, 'Caceres', 'Caceres'),
(142, 195, 'Cadiz', 'Cadiz'),
(143, 195, 'Cantabria', 'Cantabria'),
(144, 195, 'Castellon', 'Castellon'),
(145, 195, 'Ceuta', 'Ceuta'),
(146, 195, 'Ciudad Real', 'Ciudad Real'),
(147, 195, 'Cordoba', 'Cordoba'),
(148, 195, 'Cuenca', 'Cuenca'),
(149, 195, 'Girona', 'Girona'),
(150, 195, 'Granada', 'Granada'),
(151, 195, 'Guadalajara', 'Guadalajara'),
(152, 195, 'Guipuzcoa', 'Guipuzcoa'),
(153, 195, 'Huelva', 'Huelva'),
(154, 195, 'Huesca', 'Huesca'),
(155, 195, 'Jaen', 'Jaen'),
(156, 195, 'La Rioja', 'La Rioja'),
(157, 195, 'Las Palmas', 'Las Palmas'),
(158, 195, 'Leon', 'Leon'),
(159, 195, 'Lleida', 'Lleida'),
(160, 195, 'Lugo', 'Lugo'),
(161, 195, 'Madrid', 'Madrid'),
(162, 195, 'Malaga', 'Malaga'),
(163, 195, 'Melilla', 'Melilla'),
(164, 195, 'Murcia', 'Murcia'),
(165, 195, 'Navarra', 'Navarra'),
(166, 195, 'Ourense', 'Ourense'),
(167, 195, 'Palencia', 'Palencia'),
(168, 195, 'Pontevedra', 'Pontevedra'),
(169, 195, 'Salamanca', 'Salamanca'),
(170, 195, 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 195, 'Segovia', 'Segovia'),
(172, 195, 'Sevilla', 'Sevilla'),
(173, 195, 'Soria', 'Soria'),
(174, 195, 'Tarragona', 'Tarragona'),
(175, 195, 'Teruel', 'Teruel'),
(176, 195, 'Toledo', 'Toledo'),
(177, 195, 'Valencia', 'Valencia'),
(178, 195, 'Valladolid', 'Valladolid'),
(179, 195, 'Vizcaya', 'Vizcaya'),
(180, 195, 'Zamora', 'Zamora'),
(181, 195, 'Zaragoza', 'Zaragoza');

-- --------------------------------------------------------

--
-- Table structure for table `zones_to_geo_zones`
--

DROP TABLE IF EXISTS `zones_to_geo_zones`;
CREATE TABLE IF NOT EXISTS `zones_to_geo_zones` (
  `association_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `geo_zone_id` int(11) DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`association_id`),
  KEY `idx_zones_to_geo_zones_country_id` (`zone_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zones_to_geo_zones`
--

INSERT INTO `zones_to_geo_zones` (`association_id`, `zone_country_id`, `zone_id`, `geo_zone_id`, `last_modified`, `date_added`) VALUES
(1, 223, 18, 1, NULL, '2014-06-30 14:38:22');