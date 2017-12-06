-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: May 09, 2014 at 02:47 AM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Database: `tbb_reservation`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `app_log`
-- 

CREATE TABLE `app_log` (
  `id_app_log` int(11) NOT NULL auto_increment,
  `al_url` varchar(255) NOT NULL,
  `al_user` varchar(255) NOT NULL,
  `al_ip_address` varchar(20) NOT NULL,
  `al_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_app_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `app_log`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_category_product`
-- 

CREATE TABLE `tbb_category_product` (
  `id_cat_product` int(11) NOT NULL auto_increment,
  `cp_code` varchar(255) NOT NULL,
  `cp_name` varchar(255) NOT NULL,
  `cp_hide_status` enum('yes','no') NOT NULL default 'no',
  `cp_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `cp_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_cat_product`),
  UNIQUE KEY `cp_code` (`cp_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- 
-- Dumping data for table `tbb_category_product`
-- 

INSERT INTO `tbb_category_product` VALUES (4, 'PM', 'Puri Magic', 'no', '2014-05-05 16:23:44', 'surya');
INSERT INTO `tbb_category_product` VALUES (5, 'VS', 'Vulcanic Basalt Stone', 'no', '2014-05-05 16:23:58', 'surya');
INSERT INTO `tbb_category_product` VALUES (6, 'BS', 'Body Scrub', 'no', '2014-05-05 16:24:06', 'surya');
INSERT INTO `tbb_category_product` VALUES (7, 'BM', 'Body Masker', 'no', '2014-05-05 16:24:13', 'surya');
INSERT INTO `tbb_category_product` VALUES (8, 'Wine', 'Imperial Red Wine', 'no', '2014-05-05 16:24:32', 'surya');
INSERT INTO `tbb_category_product` VALUES (9, 'Mud', 'Dead Sea Mud', 'no', '2014-05-05 16:24:45', 'surya');
INSERT INTO `tbb_category_product` VALUES (10, 'Sauna', 'Sauna', 'no', '2014-05-05 16:52:12', 'surya');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_category_room`
-- 

CREATE TABLE `tbb_category_room` (
  `id_cat_room` int(11) NOT NULL auto_increment,
  `cat_code` varchar(255) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_hide_status` enum('yes','no') NOT NULL default 'no',
  `cat_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `cat_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_cat_room`),
  UNIQUE KEY `cat_code` (`cat_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- 
-- Dumping data for table `tbb_category_room`
-- 

INSERT INTO `tbb_category_room` VALUES (5, 'RM01', 'Single Room', 'no', '2014-05-05 15:06:41', 'surya');
INSERT INTO `tbb_category_room` VALUES (6, 'RM02', 'Couple Room', 'no', '2014-05-05 15:06:54', 'surya');
INSERT INTO `tbb_category_room` VALUES (7, 'RM03', 'Couple Room 2 Bathub', 'no', '2014-05-05 15:07:10', 'surya');
INSERT INTO `tbb_category_room` VALUES (8, 'RM02a', 'Couple Room a', 'yes', '2014-05-06 15:53:25', 'admin');
INSERT INTO `tbb_category_room` VALUES (9, 'RM02b', 'Couple Room b', 'yes', '2014-05-06 15:53:44', 'admin');
INSERT INTO `tbb_category_room` VALUES (10, 'RM03a', 'Couple Room 2 Bathub a', 'yes', '2014-05-06 15:54:38', 'admin');
INSERT INTO `tbb_category_room` VALUES (11, 'RM03b', 'Couple Room 2 Bathub b', 'yes', '2014-05-06 15:55:08', 'admin');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_instant_reservation`
-- 

CREATE TABLE `tbb_instant_reservation` (
  `id_instant_rsv` int(11) NOT NULL auto_increment,
  `ins_rsv_code` varchar(255) NOT NULL,
  `ins_rsv_date` date NOT NULL,
  `ins_rsv_agent` varchar(255) NOT NULL,
  `ins_rsv_travel` varchar(255) NOT NULL,
  `ins_rsv_pax` int(11) NOT NULL,
  `ins_rsv_status` enum('open','void','paid','closed') NOT NULL default 'open',
  `ins_rsv_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ins_rsv_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_instant_rsv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_instant_reservation`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_instant_rsv_bill`
-- 

CREATE TABLE `tbb_instant_rsv_bill` (
  `id_ins_rsv_bill` int(11) NOT NULL auto_increment,
  `irb_pay_code` varchar(255) NOT NULL,
  `irb_res_code` varchar(255) NOT NULL,
  `irb_quantity` int(11) NOT NULL,
  `irb_total` decimal(20,3) NOT NULL,
  `irb_total_rp` decimal(20,2) NOT NULL,
  `irb_payment_type` varchar(255) NOT NULL,
  `irb_payment_type_2` varchar(255) NOT NULL,
  `irb_transaction_by` varchar(255) NOT NULL,
  `irb_status` enum('open','closed') NOT NULL default 'open',
  `irb_convert_status` enum('yes','no') NOT NULL default 'no',
  `irb_promo` varchar(255) NOT NULL,
  `irb_promo_disc` decimal(20,2) NOT NULL,
  `irb_discount` decimal(20,3) NOT NULL,
  `irb_discount_rp` decimal(20,2) NOT NULL,
  `irb_tax` decimal(20,3) NOT NULL,
  `irb_tax_rp` decimal(20,2) NOT NULL,
  `irb_service` decimal(20,2) NOT NULL,
  `irb_service_rp` decimal(20,2) NOT NULL,
  `irb_paid_idr` decimal(20,2) NOT NULL,
  `irb_paid_usd` decimal(20,3) NOT NULL,
  `irb_paid_idr_2` decimal(20,2) NOT NULL,
  `irb_paid_usd_2` decimal(20,3) NOT NULL,
  `irb_rate` decimal(20,2) NOT NULL,
  `irb_phys_idr` decimal(20,2) NOT NULL,
  `irb_phys_usd` decimal(20,3) NOT NULL,
  `irb_note` varchar(255) NOT NULL,
  `irb_isvoid` enum('yes','no') NOT NULL default 'no',
  `irb_paid_date` date NOT NULL,
  `irb_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `irb_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_ins_rsv_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_instant_rsv_bill`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_instant_rsv_pax_detail`
-- 

CREATE TABLE `tbb_instant_rsv_pax_detail` (
  `id_irpd` int(11) NOT NULL auto_increment,
  `irpd_rsv_code` varchar(255) NOT NULL,
  `irpd_product` varchar(255) NOT NULL,
  `irpd_rate` decimal(20,2) NOT NULL,
  `irpd_rate_dollar` decimal(20,2) NOT NULL,
  `irpd_rate_payment` enum('rupiah','dollar') NOT NULL,
  `irpd_quantity` int(11) NOT NULL,
  `irpd_status` enum('open','void','paid','closed') NOT NULL default 'open',
  `irpd_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `irpd_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_irpd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_instant_rsv_pax_detail`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_kurs`
-- 

CREATE TABLE `tbb_kurs` (
  `id_kurs` int(11) NOT NULL auto_increment,
  `kurs_date` date NOT NULL,
  `kurs_value` decimal(10,2) NOT NULL,
  `kurs_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `kurs_update_by` varchar(255) NOT NULL,
  UNIQUE KEY `id_kurs` (`id_kurs`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_kurs`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_nationality`
-- 

CREATE TABLE `tbb_nationality` (
  `id` varchar(2) collate utf8_unicode_ci NOT NULL,
  `name` varchar(64) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 
-- Dumping data for table `tbb_nationality`
-- 

INSERT INTO `tbb_nationality` VALUES ('AD', 'Andorra');
INSERT INTO `tbb_nationality` VALUES ('AE', 'United Arab Emirates');
INSERT INTO `tbb_nationality` VALUES ('AF', 'Afghanistan');
INSERT INTO `tbb_nationality` VALUES ('AG', 'Antigua and Barbuda');
INSERT INTO `tbb_nationality` VALUES ('AI', 'Anguilla');
INSERT INTO `tbb_nationality` VALUES ('AL', 'Albania');
INSERT INTO `tbb_nationality` VALUES ('AM', 'Armenia');
INSERT INTO `tbb_nationality` VALUES ('AN', 'Netherlands Antilles');
INSERT INTO `tbb_nationality` VALUES ('AO', 'Angola');
INSERT INTO `tbb_nationality` VALUES ('AQ', 'Antarctica');
INSERT INTO `tbb_nationality` VALUES ('AR', 'Argentina');
INSERT INTO `tbb_nationality` VALUES ('AS', 'American Samoa');
INSERT INTO `tbb_nationality` VALUES ('AT', 'Austria');
INSERT INTO `tbb_nationality` VALUES ('AU', 'Australia');
INSERT INTO `tbb_nationality` VALUES ('AW', 'Aruba');
INSERT INTO `tbb_nationality` VALUES ('AX', 'Åland Islands');
INSERT INTO `tbb_nationality` VALUES ('AZ', 'Azerbaijan');
INSERT INTO `tbb_nationality` VALUES ('BA', 'Bosnia and Herzegovina');
INSERT INTO `tbb_nationality` VALUES ('BB', 'Barbados');
INSERT INTO `tbb_nationality` VALUES ('BD', 'Bangladesh');
INSERT INTO `tbb_nationality` VALUES ('BE', 'Belgium');
INSERT INTO `tbb_nationality` VALUES ('BF', 'Burkina Faso');
INSERT INTO `tbb_nationality` VALUES ('BG', 'Bulgaria');
INSERT INTO `tbb_nationality` VALUES ('BH', 'Bahrain');
INSERT INTO `tbb_nationality` VALUES ('BI', 'Burundi');
INSERT INTO `tbb_nationality` VALUES ('BJ', 'Benin');
INSERT INTO `tbb_nationality` VALUES ('BL', 'Saint Barthélemy');
INSERT INTO `tbb_nationality` VALUES ('BM', 'Bermuda');
INSERT INTO `tbb_nationality` VALUES ('BN', 'Brunei');
INSERT INTO `tbb_nationality` VALUES ('BO', 'Bolivia');
INSERT INTO `tbb_nationality` VALUES ('BQ', 'British Antarctic Territory');
INSERT INTO `tbb_nationality` VALUES ('BR', 'Brazil');
INSERT INTO `tbb_nationality` VALUES ('BS', 'Bahamas');
INSERT INTO `tbb_nationality` VALUES ('BT', 'Bhutan');
INSERT INTO `tbb_nationality` VALUES ('BV', 'Bouvet Island');
INSERT INTO `tbb_nationality` VALUES ('BW', 'Botswana');
INSERT INTO `tbb_nationality` VALUES ('BY', 'Belarus');
INSERT INTO `tbb_nationality` VALUES ('BZ', 'Belize');
INSERT INTO `tbb_nationality` VALUES ('CA', 'Canada');
INSERT INTO `tbb_nationality` VALUES ('CC', 'Cocos [Keeling] Islands');
INSERT INTO `tbb_nationality` VALUES ('CD', 'Congo - Kinshasa');
INSERT INTO `tbb_nationality` VALUES ('CF', 'Central African Republic');
INSERT INTO `tbb_nationality` VALUES ('CG', 'Congo - Brazzaville');
INSERT INTO `tbb_nationality` VALUES ('CH', 'Switzerland');
INSERT INTO `tbb_nationality` VALUES ('CI', 'Côte d’Ivoire');
INSERT INTO `tbb_nationality` VALUES ('CK', 'Cook Islands');
INSERT INTO `tbb_nationality` VALUES ('CL', 'Chile');
INSERT INTO `tbb_nationality` VALUES ('CM', 'Cameroon');
INSERT INTO `tbb_nationality` VALUES ('CN', 'China');
INSERT INTO `tbb_nationality` VALUES ('CO', 'Colombia');
INSERT INTO `tbb_nationality` VALUES ('CR', 'Costa Rica');
INSERT INTO `tbb_nationality` VALUES ('CS', 'Serbia and Montenegro');
INSERT INTO `tbb_nationality` VALUES ('CT', 'Canton and Enderbury Islands');
INSERT INTO `tbb_nationality` VALUES ('CU', 'Cuba');
INSERT INTO `tbb_nationality` VALUES ('CV', 'Cape Verde');
INSERT INTO `tbb_nationality` VALUES ('CX', 'Christmas Island');
INSERT INTO `tbb_nationality` VALUES ('CY', 'Cyprus');
INSERT INTO `tbb_nationality` VALUES ('CZ', 'Czech Republic');
INSERT INTO `tbb_nationality` VALUES ('DD', 'East Germany');
INSERT INTO `tbb_nationality` VALUES ('DE', 'Germany');
INSERT INTO `tbb_nationality` VALUES ('DJ', 'Djibouti');
INSERT INTO `tbb_nationality` VALUES ('DK', 'Denmark');
INSERT INTO `tbb_nationality` VALUES ('DM', 'Dominica');
INSERT INTO `tbb_nationality` VALUES ('DO', 'Dominican Republic');
INSERT INTO `tbb_nationality` VALUES ('DZ', 'Algeria');
INSERT INTO `tbb_nationality` VALUES ('EC', 'Ecuador');
INSERT INTO `tbb_nationality` VALUES ('EE', 'Estonia');
INSERT INTO `tbb_nationality` VALUES ('EG', 'Egypt');
INSERT INTO `tbb_nationality` VALUES ('EH', 'Western Sahara');
INSERT INTO `tbb_nationality` VALUES ('ER', 'Eritrea');
INSERT INTO `tbb_nationality` VALUES ('ES', 'Spain');
INSERT INTO `tbb_nationality` VALUES ('ET', 'Ethiopia');
INSERT INTO `tbb_nationality` VALUES ('FI', 'Finland');
INSERT INTO `tbb_nationality` VALUES ('FJ', 'Fiji');
INSERT INTO `tbb_nationality` VALUES ('FK', 'Falkland Islands');
INSERT INTO `tbb_nationality` VALUES ('FM', 'Micronesia');
INSERT INTO `tbb_nationality` VALUES ('FO', 'Faroe Islands');
INSERT INTO `tbb_nationality` VALUES ('FQ', 'French Southern and Antarctic Territories');
INSERT INTO `tbb_nationality` VALUES ('FR', 'France');
INSERT INTO `tbb_nationality` VALUES ('FX', 'Metropolitan France');
INSERT INTO `tbb_nationality` VALUES ('GA', 'Gabon');
INSERT INTO `tbb_nationality` VALUES ('GB', 'United Kingdom');
INSERT INTO `tbb_nationality` VALUES ('GD', 'Grenada');
INSERT INTO `tbb_nationality` VALUES ('GE', 'Georgia');
INSERT INTO `tbb_nationality` VALUES ('GF', 'French Guiana');
INSERT INTO `tbb_nationality` VALUES ('GG', 'Guernsey');
INSERT INTO `tbb_nationality` VALUES ('GH', 'Ghana');
INSERT INTO `tbb_nationality` VALUES ('GI', 'Gibraltar');
INSERT INTO `tbb_nationality` VALUES ('GL', 'Greenland');
INSERT INTO `tbb_nationality` VALUES ('GM', 'Gambia');
INSERT INTO `tbb_nationality` VALUES ('GN', 'Guinea');
INSERT INTO `tbb_nationality` VALUES ('GP', 'Guadeloupe');
INSERT INTO `tbb_nationality` VALUES ('GQ', 'Equatorial Guinea');
INSERT INTO `tbb_nationality` VALUES ('GR', 'Greece');
INSERT INTO `tbb_nationality` VALUES ('GS', 'South Georgia and the South Sandwich Islands');
INSERT INTO `tbb_nationality` VALUES ('GT', 'Guatemala');
INSERT INTO `tbb_nationality` VALUES ('GU', 'Guam');
INSERT INTO `tbb_nationality` VALUES ('GW', 'Guinea-Bissau');
INSERT INTO `tbb_nationality` VALUES ('GY', 'Guyana');
INSERT INTO `tbb_nationality` VALUES ('HK', 'Hong Kong SAR China');
INSERT INTO `tbb_nationality` VALUES ('HM', 'Heard Island and McDonald Islands');
INSERT INTO `tbb_nationality` VALUES ('HN', 'Honduras');
INSERT INTO `tbb_nationality` VALUES ('HR', 'Croatia');
INSERT INTO `tbb_nationality` VALUES ('HT', 'Haiti');
INSERT INTO `tbb_nationality` VALUES ('HU', 'Hungary');
INSERT INTO `tbb_nationality` VALUES ('ID', 'Indonesia');
INSERT INTO `tbb_nationality` VALUES ('IE', 'Ireland');
INSERT INTO `tbb_nationality` VALUES ('IL', 'Israel');
INSERT INTO `tbb_nationality` VALUES ('IM', 'Isle of Man');
INSERT INTO `tbb_nationality` VALUES ('IN', 'India');
INSERT INTO `tbb_nationality` VALUES ('IO', 'British Indian Ocean Territory');
INSERT INTO `tbb_nationality` VALUES ('IQ', 'Iraq');
INSERT INTO `tbb_nationality` VALUES ('IR', 'Iran');
INSERT INTO `tbb_nationality` VALUES ('IS', 'Iceland');
INSERT INTO `tbb_nationality` VALUES ('IT', 'Italy');
INSERT INTO `tbb_nationality` VALUES ('JE', 'Jersey');
INSERT INTO `tbb_nationality` VALUES ('JM', 'Jamaica');
INSERT INTO `tbb_nationality` VALUES ('JO', 'Jordan');
INSERT INTO `tbb_nationality` VALUES ('JP', 'Japan');
INSERT INTO `tbb_nationality` VALUES ('JT', 'Johnston Island');
INSERT INTO `tbb_nationality` VALUES ('KE', 'Kenya');
INSERT INTO `tbb_nationality` VALUES ('KG', 'Kyrgyzstan');
INSERT INTO `tbb_nationality` VALUES ('KH', 'Cambodia');
INSERT INTO `tbb_nationality` VALUES ('KI', 'Kiribati');
INSERT INTO `tbb_nationality` VALUES ('KM', 'Comoros');
INSERT INTO `tbb_nationality` VALUES ('KN', 'Saint Kitts and Nevis');
INSERT INTO `tbb_nationality` VALUES ('KP', 'North Korea');
INSERT INTO `tbb_nationality` VALUES ('KR', 'South Korea');
INSERT INTO `tbb_nationality` VALUES ('KW', 'Kuwait');
INSERT INTO `tbb_nationality` VALUES ('KY', 'Cayman Islands');
INSERT INTO `tbb_nationality` VALUES ('KZ', 'Kazakhstan');
INSERT INTO `tbb_nationality` VALUES ('LA', 'Laos');
INSERT INTO `tbb_nationality` VALUES ('LB', 'Lebanon');
INSERT INTO `tbb_nationality` VALUES ('LC', 'Saint Lucia');
INSERT INTO `tbb_nationality` VALUES ('LI', 'Liechtenstein');
INSERT INTO `tbb_nationality` VALUES ('LK', 'Sri Lanka');
INSERT INTO `tbb_nationality` VALUES ('LR', 'Liberia');
INSERT INTO `tbb_nationality` VALUES ('LS', 'Lesotho');
INSERT INTO `tbb_nationality` VALUES ('LT', 'Lithuania');
INSERT INTO `tbb_nationality` VALUES ('LU', 'Luxembourg');
INSERT INTO `tbb_nationality` VALUES ('LV', 'Latvia');
INSERT INTO `tbb_nationality` VALUES ('LY', 'Libya');
INSERT INTO `tbb_nationality` VALUES ('MA', 'Morocco');
INSERT INTO `tbb_nationality` VALUES ('MC', 'Monaco');
INSERT INTO `tbb_nationality` VALUES ('MD', 'Moldova');
INSERT INTO `tbb_nationality` VALUES ('ME', 'Montenegro');
INSERT INTO `tbb_nationality` VALUES ('MF', 'Saint Martin');
INSERT INTO `tbb_nationality` VALUES ('MG', 'Madagascar');
INSERT INTO `tbb_nationality` VALUES ('MH', 'Marshall Islands');
INSERT INTO `tbb_nationality` VALUES ('MI', 'Midway Islands');
INSERT INTO `tbb_nationality` VALUES ('MK', 'Macedonia');
INSERT INTO `tbb_nationality` VALUES ('ML', 'Mali');
INSERT INTO `tbb_nationality` VALUES ('MM', 'Myanmar [Burma]');
INSERT INTO `tbb_nationality` VALUES ('MN', 'Mongolia');
INSERT INTO `tbb_nationality` VALUES ('MO', 'Macau SAR China');
INSERT INTO `tbb_nationality` VALUES ('MP', 'Northern Mariana Islands');
INSERT INTO `tbb_nationality` VALUES ('MQ', 'Martinique');
INSERT INTO `tbb_nationality` VALUES ('MR', 'Mauritania');
INSERT INTO `tbb_nationality` VALUES ('MS', 'Montserrat');
INSERT INTO `tbb_nationality` VALUES ('MT', 'Malta');
INSERT INTO `tbb_nationality` VALUES ('MU', 'Mauritius');
INSERT INTO `tbb_nationality` VALUES ('MV', 'Maldives');
INSERT INTO `tbb_nationality` VALUES ('MW', 'Malawi');
INSERT INTO `tbb_nationality` VALUES ('MX', 'Mexico');
INSERT INTO `tbb_nationality` VALUES ('MY', 'Malaysia');
INSERT INTO `tbb_nationality` VALUES ('MZ', 'Mozambique');
INSERT INTO `tbb_nationality` VALUES ('NA', 'Namibia');
INSERT INTO `tbb_nationality` VALUES ('NC', 'New Caledonia');
INSERT INTO `tbb_nationality` VALUES ('NE', 'Niger');
INSERT INTO `tbb_nationality` VALUES ('NF', 'Norfolk Island');
INSERT INTO `tbb_nationality` VALUES ('NG', 'Nigeria');
INSERT INTO `tbb_nationality` VALUES ('NI', 'Nicaragua');
INSERT INTO `tbb_nationality` VALUES ('NL', 'Netherlands');
INSERT INTO `tbb_nationality` VALUES ('NO', 'Norway');
INSERT INTO `tbb_nationality` VALUES ('NP', 'Nepal');
INSERT INTO `tbb_nationality` VALUES ('NQ', 'Dronning Maud Land');
INSERT INTO `tbb_nationality` VALUES ('NR', 'Nauru');
INSERT INTO `tbb_nationality` VALUES ('NT', 'Neutral Zone');
INSERT INTO `tbb_nationality` VALUES ('NU', 'Niue');
INSERT INTO `tbb_nationality` VALUES ('NZ', 'New Zealand');
INSERT INTO `tbb_nationality` VALUES ('OM', 'Oman');
INSERT INTO `tbb_nationality` VALUES ('PA', 'Panama');
INSERT INTO `tbb_nationality` VALUES ('PC', 'Pacific Islands Trust Territory');
INSERT INTO `tbb_nationality` VALUES ('PE', 'Peru');
INSERT INTO `tbb_nationality` VALUES ('PF', 'French Polynesia');
INSERT INTO `tbb_nationality` VALUES ('PG', 'Papua New Guinea');
INSERT INTO `tbb_nationality` VALUES ('PH', 'Philippines');
INSERT INTO `tbb_nationality` VALUES ('PK', 'Pakistan');
INSERT INTO `tbb_nationality` VALUES ('PL', 'Poland');
INSERT INTO `tbb_nationality` VALUES ('PM', 'Saint Pierre and Miquelon');
INSERT INTO `tbb_nationality` VALUES ('PN', 'Pitcairn Islands');
INSERT INTO `tbb_nationality` VALUES ('PR', 'Puerto Rico');
INSERT INTO `tbb_nationality` VALUES ('PS', 'Palestinian Territories');
INSERT INTO `tbb_nationality` VALUES ('PT', 'Portugal');
INSERT INTO `tbb_nationality` VALUES ('PU', 'U.S. Miscellaneous Pacific Islands');
INSERT INTO `tbb_nationality` VALUES ('PW', 'Palau');
INSERT INTO `tbb_nationality` VALUES ('PY', 'Paraguay');
INSERT INTO `tbb_nationality` VALUES ('PZ', 'Panama Canal Zone');
INSERT INTO `tbb_nationality` VALUES ('QA', 'Qatar');
INSERT INTO `tbb_nationality` VALUES ('RE', 'Réunion');
INSERT INTO `tbb_nationality` VALUES ('RO', 'Romania');
INSERT INTO `tbb_nationality` VALUES ('RS', 'Serbia');
INSERT INTO `tbb_nationality` VALUES ('RU', 'Russia');
INSERT INTO `tbb_nationality` VALUES ('RW', 'Rwanda');
INSERT INTO `tbb_nationality` VALUES ('SA', 'Saudi Arabia');
INSERT INTO `tbb_nationality` VALUES ('SB', 'Solomon Islands');
INSERT INTO `tbb_nationality` VALUES ('SC', 'Seychelles');
INSERT INTO `tbb_nationality` VALUES ('SD', 'Sudan');
INSERT INTO `tbb_nationality` VALUES ('SE', 'Sweden');
INSERT INTO `tbb_nationality` VALUES ('SG', 'Singapore');
INSERT INTO `tbb_nationality` VALUES ('SH', 'Saint Helena');
INSERT INTO `tbb_nationality` VALUES ('SI', 'Slovenia');
INSERT INTO `tbb_nationality` VALUES ('SJ', 'Svalbard and Jan Mayen');
INSERT INTO `tbb_nationality` VALUES ('SK', 'Slovakia');
INSERT INTO `tbb_nationality` VALUES ('SL', 'Sierra Leone');
INSERT INTO `tbb_nationality` VALUES ('SM', 'San Marino');
INSERT INTO `tbb_nationality` VALUES ('SN', 'Senegal');
INSERT INTO `tbb_nationality` VALUES ('SO', 'Somalia');
INSERT INTO `tbb_nationality` VALUES ('SR', 'Suriname');
INSERT INTO `tbb_nationality` VALUES ('ST', 'São Tomé and Príncipe');
INSERT INTO `tbb_nationality` VALUES ('SU', 'Union of Soviet Socialist Republics');
INSERT INTO `tbb_nationality` VALUES ('SV', 'El Salvador');
INSERT INTO `tbb_nationality` VALUES ('SY', 'Syria');
INSERT INTO `tbb_nationality` VALUES ('SZ', 'Swaziland');
INSERT INTO `tbb_nationality` VALUES ('TC', 'Turks and Caicos Islands');
INSERT INTO `tbb_nationality` VALUES ('TD', 'Chad');
INSERT INTO `tbb_nationality` VALUES ('TF', 'French Southern Territories');
INSERT INTO `tbb_nationality` VALUES ('TG', 'Togo');
INSERT INTO `tbb_nationality` VALUES ('TH', 'Thailand');
INSERT INTO `tbb_nationality` VALUES ('TJ', 'Tajikistan');
INSERT INTO `tbb_nationality` VALUES ('TK', 'Tokelau');
INSERT INTO `tbb_nationality` VALUES ('TL', 'Timor-Leste');
INSERT INTO `tbb_nationality` VALUES ('TM', 'Turkmenistan');
INSERT INTO `tbb_nationality` VALUES ('TN', 'Tunisia');
INSERT INTO `tbb_nationality` VALUES ('TO', 'Tonga');
INSERT INTO `tbb_nationality` VALUES ('TR', 'Turkey');
INSERT INTO `tbb_nationality` VALUES ('TT', 'Trinidad and Tobago');
INSERT INTO `tbb_nationality` VALUES ('TV', 'Tuvalu');
INSERT INTO `tbb_nationality` VALUES ('TW', 'Taiwan');
INSERT INTO `tbb_nationality` VALUES ('TZ', 'Tanzania');
INSERT INTO `tbb_nationality` VALUES ('UA', 'Ukraine');
INSERT INTO `tbb_nationality` VALUES ('UG', 'Uganda');
INSERT INTO `tbb_nationality` VALUES ('UM', 'U.S. Minor Outlying Islands');
INSERT INTO `tbb_nationality` VALUES ('US', 'United States');
INSERT INTO `tbb_nationality` VALUES ('UY', 'Uruguay');
INSERT INTO `tbb_nationality` VALUES ('UZ', 'Uzbekistan');
INSERT INTO `tbb_nationality` VALUES ('VA', 'Vatican City');
INSERT INTO `tbb_nationality` VALUES ('VC', 'Saint Vincent and the Grenadines');
INSERT INTO `tbb_nationality` VALUES ('VD', 'North Vietnam');
INSERT INTO `tbb_nationality` VALUES ('VE', 'Venezuela');
INSERT INTO `tbb_nationality` VALUES ('VG', 'British Virgin Islands');
INSERT INTO `tbb_nationality` VALUES ('VI', 'U.S. Virgin Islands');
INSERT INTO `tbb_nationality` VALUES ('VN', 'Vietnam');
INSERT INTO `tbb_nationality` VALUES ('VU', 'Vanuatu');
INSERT INTO `tbb_nationality` VALUES ('WF', 'Wallis and Futuna');
INSERT INTO `tbb_nationality` VALUES ('WK', 'Wake Island');
INSERT INTO `tbb_nationality` VALUES ('WS', 'Samoa');
INSERT INTO `tbb_nationality` VALUES ('YD', 'People''s Democratic Republic of Yemen');
INSERT INTO `tbb_nationality` VALUES ('YE', 'Yemen');
INSERT INTO `tbb_nationality` VALUES ('YT', 'Mayotte');
INSERT INTO `tbb_nationality` VALUES ('ZA', 'South Africa');
INSERT INTO `tbb_nationality` VALUES ('ZM', 'Zambia');
INSERT INTO `tbb_nationality` VALUES ('ZW', 'Zimbabwe');
INSERT INTO `tbb_nationality` VALUES ('ZZ', 'Unknown or Invalid Region');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_payment_type`
-- 

CREATE TABLE `tbb_payment_type` (
  `id_pay_type` int(11) NOT NULL auto_increment,
  `pay_payment_type` varchar(255) NOT NULL,
  `pay_discount` int(11) NOT NULL,
  `pay_hide_status` enum('yes','no') NOT NULL default 'no',
  `pay_update_by` varchar(255) NOT NULL,
  `pay_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id_pay_type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `tbb_payment_type`
-- 

INSERT INTO `tbb_payment_type` VALUES (1, 'Normal', 0, 'no', 'developer', '2014-05-02 22:07:56');
INSERT INTO `tbb_payment_type` VALUES (4, 'FOC', 100, 'no', 'developer', '2014-05-15 21:48:48');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_product`
-- 

CREATE TABLE `tbb_product` (
  `id_prod` int(11) NOT NULL auto_increment,
  `prod_kategori` varchar(255) NOT NULL,
  `prod_code` varchar(255) NOT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_rate` decimal(20,2) NOT NULL,
  `prod_rate_dollar` decimal(10,2) NOT NULL,
  `prod_hide_status` enum('yes','no') NOT NULL default 'no',
  `prod_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `prod_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_prod`),
  UNIQUE KEY `prod_code` (`prod_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

-- 
-- Dumping data for table `tbb_product`
-- 

INSERT INTO `tbb_product` VALUES (5, 'PM', 'PM75', 'Puri Magic 75 Menit', 120000.00, 40.00, 'no', '2014-05-05 16:36:34', 'surya');
INSERT INTO `tbb_product` VALUES (6, 'PM', 'PM120', 'Puri Magic 120 Menit', 140000.00, 65.00, 'no', '2014-05-05 16:37:53', 'admin');
INSERT INTO `tbb_product` VALUES (7, 'PM', 'PM180', 'Puri Magic 180 Menit', 160000.00, 90.00, 'no', '2014-05-05 16:38:19', 'admin');
INSERT INTO `tbb_product` VALUES (8, 'VS', 'VS75', 'Vulcanic Basalt Stone 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:38:53', 'admin');
INSERT INTO `tbb_product` VALUES (9, 'VS', 'VS120', 'Vulcanic Basalt Stone 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:39:10', 'admin');
INSERT INTO `tbb_product` VALUES (10, 'VS', 'VS180', 'Vulcanic Basalt Stone 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:39:26', 'admin');
INSERT INTO `tbb_product` VALUES (11, 'BS', 'BS SL75', 'Body Scrub Skin Lightening 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:40:21', 'admin');
INSERT INTO `tbb_product` VALUES (12, 'BS', 'BS SL120', 'Body Scrub Skin Lightening 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:40:22', 'admin');
INSERT INTO `tbb_product` VALUES (13, 'BS', 'BS SL180', 'Body Scrub Skin Lightening 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:40:39', 'admin');
INSERT INTO `tbb_product` VALUES (14, 'BS', 'BS AV75', 'Body Scrub Avocado 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:42:09', 'admin');
INSERT INTO `tbb_product` VALUES (15, 'BS', 'BS AV120', 'Body Scrub Avocado 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:42:25', 'admin');
INSERT INTO `tbb_product` VALUES (16, 'BS', 'BS AV180', 'Body Scrub Avocado 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:42:44', 'admin');
INSERT INTO `tbb_product` VALUES (17, 'BS', 'BS KW75', 'Body Scrub Kiwi 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:43:08', 'admin');
INSERT INTO `tbb_product` VALUES (18, 'BS', 'BS KW120', 'Body Scrub Kiwi 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:43:24', 'surya');
INSERT INTO `tbb_product` VALUES (19, 'BS', 'BS KW180', 'Body Scrub Kiwi 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:43:42', 'surya');
INSERT INTO `tbb_product` VALUES (20, 'BS', 'BS ST75', 'Body Scrub Strawberry 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:44:12', 'surya');
INSERT INTO `tbb_product` VALUES (21, 'BS', 'BS ST120', 'Body Scrub Strawberry 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:44:35', 'surya');
INSERT INTO `tbb_product` VALUES (22, 'BS', 'BS ST180', 'Body Scrub Strawberry 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:45:00', 'surya');
INSERT INTO `tbb_product` VALUES (23, 'BS', 'BS CH75', 'Body Scrub Chocolate 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:45:41', 'surya');
INSERT INTO `tbb_product` VALUES (24, 'BS', 'BS CH120', 'Body Scrub Chocolate 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:46:02', 'surya');
INSERT INTO `tbb_product` VALUES (25, 'BS', 'BS CH180', 'Body Scrub Chocolate 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:46:18', 'surya');
INSERT INTO `tbb_product` VALUES (26, 'BS', 'BS CO75', 'Body Scrub Coconut 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:46:44', 'surya');
INSERT INTO `tbb_product` VALUES (27, 'BS', 'BS CO120', 'Body Scrub Coconut 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:47:02', 'surya');
INSERT INTO `tbb_product` VALUES (28, 'BS', 'BS CO180', 'Body Scrub Coconut 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:47:15', 'surya');
INSERT INTO `tbb_product` VALUES (29, 'BM', 'BM AL75', 'Body Masker Aloe Vera 75 Menit', 130000.00, 50.00, 'no', '2014-05-05 16:47:55', 'surya');
INSERT INTO `tbb_product` VALUES (30, 'BM', 'BM AL120', 'Body Masker Aloe Vera 120 Menit', 160000.00, 75.00, 'no', '2014-05-05 16:48:12', 'surya');
INSERT INTO `tbb_product` VALUES (31, 'BM', 'BM AL180', 'Body Masker Aloe Vera 180 Menit', 220000.00, 110.00, 'no', '2014-05-05 16:48:33', 'surya');
INSERT INTO `tbb_product` VALUES (32, 'Wine', 'WINE120', 'Imperial Red Wine 120 Menit', 180000.00, 85.00, 'no', '2014-05-05 16:49:48', 'surya');
INSERT INTO `tbb_product` VALUES (33, 'Wine', 'WINE180', 'Imperial Red Wine 180 Menit', 240000.00, 120.00, 'no', '2014-05-05 16:50:23', 'surya');
INSERT INTO `tbb_product` VALUES (34, 'Mud', 'MUD120', 'Dead Sea Mud 120 Menit', 220000.00, 100.00, 'no', '2014-05-05 16:50:56', 'surya');
INSERT INTO `tbb_product` VALUES (35, 'Mud', 'MUD180', 'Dead Sea Mud 180 Menit', 320000.00, 140.00, 'no', '2014-05-05 16:51:50', 'surya');
INSERT INTO `tbb_product` VALUES (36, 'Sauna', 'Sauna', 'Sauna', 0.00, 30.00, 'no', '2014-05-05 16:52:28', 'surya');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_promo`
-- 

CREATE TABLE `tbb_promo` (
  `id_promo` int(11) NOT NULL auto_increment,
  `prm_code` varchar(255) NOT NULL,
  `prm_name` varchar(255) NOT NULL,
  `prm_rate` decimal(5,2) NOT NULL,
  `prm_nominal` decimal(20,2) NOT NULL,
  `prm_status` enum('open','close') NOT NULL,
  `prm_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `prm_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_promo`),
  UNIQUE KEY `prm_code` (`prm_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_promo`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_reservasi`
-- 

CREATE TABLE `tbb_reservasi` (
  `id_res` int(11) NOT NULL auto_increment,
  `res_code` varchar(255) NOT NULL,
  `res_date` date NOT NULL,
  `res_agent` varchar(255) NOT NULL,
  `res_guide` varchar(255) NOT NULL,
  `res_order_by` varchar(255) NOT NULL,
  `res_pax` int(11) NOT NULL,
  `res_status` enum('open','void','paid') NOT NULL default 'open',
  `res_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `res_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_res`),
  UNIQUE KEY `res_code` (`res_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_reservasi`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_reservasi_pax_detail`
-- 

CREATE TABLE `tbb_reservasi_pax_detail` (
  `id_rpd` int(11) NOT NULL auto_increment,
  `rpd_res_id` varchar(255) NOT NULL,
  `rpd_product` varchar(255) NOT NULL,
  `rpd_room` varchar(255) NOT NULL,
  `rpd_therapist` varchar(255) NOT NULL,
  `rpd_nationality` varchar(3) NOT NULL,
  `rpd_gender` enum('Male','Female') NOT NULL,
  `rpd_rate` decimal(20,2) NOT NULL,
  `rpd_rate_dollar` decimal(10,2) NOT NULL,
  `rpd_rate_payment` enum('dollar','rupiah') NOT NULL default 'rupiah',
  `rpd_start_on` time NOT NULL,
  `rpd_end_on` time NOT NULL,
  `rpd_quantity` int(11) NOT NULL,
  `rpd_status` enum('open','void','paid') NOT NULL default 'open',
  `rpd_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `rpd_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_rpd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_reservasi_pax_detail`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_reservation_bill`
-- 

CREATE TABLE `tbb_reservation_bill` (
  `id_res_bill` int(11) NOT NULL auto_increment,
  `rb_pay_code` varchar(255) NOT NULL,
  `rb_res_code` varchar(255) NOT NULL,
  `rb_quantity` int(11) NOT NULL,
  `rb_total` decimal(20,3) NOT NULL,
  `rb_total_rp` decimal(20,2) NOT NULL,
  `rb_payment_type` varchar(255) NOT NULL,
  `rb_payment_type_2` varchar(255) NOT NULL,
  `rb_transaction_by` varchar(255) NOT NULL,
  `rb_status` enum('open','closed') NOT NULL default 'open',
  `rb_convert_status` enum('yes','no') NOT NULL default 'no',
  `rb_promo` varchar(255) NOT NULL,
  `rb_promo_disc` decimal(20,2) NOT NULL,
  `rb_discount` decimal(20,3) NOT NULL,
  `rb_discount_rp` decimal(20,2) NOT NULL,
  `rb_tax` decimal(20,3) NOT NULL,
  `rb_tax_rp` decimal(20,2) NOT NULL,
  `rb_service` decimal(20,2) NOT NULL,
  `rb_service_rp` decimal(20,2) NOT NULL,
  `rb_paid_idr` decimal(20,2) NOT NULL,
  `rb_paid_usd` decimal(20,3) NOT NULL,
  `rb_paid_idr_2` decimal(20,2) NOT NULL,
  `rb_paid_usd_2` decimal(20,3) NOT NULL,
  `rb_rate` decimal(20,2) NOT NULL,
  `rb_phys_idr` decimal(20,2) NOT NULL,
  `rb_phys_usd` decimal(20,3) NOT NULL,
  `rb_isvoid` enum('yes','no') NOT NULL default 'no',
  `rb_paid_date` date NOT NULL,
  `rb_instant_pay` varchar(255) NOT NULL,
  `rb_note` varchar(255) NOT NULL,
  `rb_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `rb_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_res_bill`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_reservation_bill`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_room`
-- 

CREATE TABLE `tbb_room` (
  `id` int(11) NOT NULL auto_increment,
  `room_name` varchar(255) NOT NULL,
  `room_category` varchar(255) NOT NULL,
  `room_status` enum('open','book','close') NOT NULL default 'open',
  `room_hide_status` enum('yes','no') NOT NULL default 'no',
  `room_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `room_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `room_name` (`room_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=185 ;

-- 
-- Dumping data for table `tbb_room`
-- 

INSERT INTO `tbb_room` VALUES (6, '302', 'RM01', 'close', 'no', '2014-05-05 15:10:43', 'surya');
INSERT INTO `tbb_room` VALUES (7, '303', 'RM01', 'open', 'no', '2014-05-05 15:10:47', 'surya');
INSERT INTO `tbb_room` VALUES (8, '304', 'RM01', 'open', 'no', '2014-05-05 15:10:50', 'surya');
INSERT INTO `tbb_room` VALUES (9, '305', 'RM01', 'open', 'no', '2014-05-05 15:10:52', 'surya');
INSERT INTO `tbb_room` VALUES (10, '306', 'RM01', 'open', 'no', '2014-05-05 15:10:55', 'surya');
INSERT INTO `tbb_room` VALUES (11, '307', 'RM01', 'open', 'no', '2014-05-05 15:10:58', 'surya');
INSERT INTO `tbb_room` VALUES (12, '308', 'RM01', 'open', 'no', '2014-05-05 15:11:01', 'surya');
INSERT INTO `tbb_room` VALUES (13, '309', 'RM01', 'open', 'no', '2014-05-05 15:11:03', 'surya');
INSERT INTO `tbb_room` VALUES (14, '310', 'RM01', 'open', 'no', '2014-05-05 15:11:06', 'surya');
INSERT INTO `tbb_room` VALUES (15, '311', 'RM01', 'open', 'no', '2014-05-05 15:11:08', 'surya');
INSERT INTO `tbb_room` VALUES (16, '312', 'RM01', 'open', 'no', '2014-05-05 15:11:11', 'surya');
INSERT INTO `tbb_room` VALUES (17, '313', 'RM01', 'open', 'no', '2014-05-05 15:11:16', 'surya');
INSERT INTO `tbb_room` VALUES (18, '314', 'RM01', 'open', 'no', '2014-05-05 15:11:19', 'surya');
INSERT INTO `tbb_room` VALUES (19, '315', 'RM01', 'open', 'no', '2014-05-05 15:11:21', 'surya');
INSERT INTO `tbb_room` VALUES (20, '316', 'RM01', 'open', 'no', '2014-05-05 15:11:24', 'surya');
INSERT INTO `tbb_room` VALUES (21, '317', 'RM01', 'open', 'no', '2014-05-05 15:11:26', 'surya');
INSERT INTO `tbb_room` VALUES (22, '318', 'RM01', 'open', 'no', '2014-05-05 15:11:29', 'surya');
INSERT INTO `tbb_room` VALUES (23, '319', 'RM01', 'open', 'no', '2014-05-05 15:12:16', 'surya');
INSERT INTO `tbb_room` VALUES (24, '320', 'RM01', 'open', 'no', '2014-05-05 15:12:19', 'surya');
INSERT INTO `tbb_room` VALUES (25, '321', 'RM01', 'open', 'no', '2014-05-05 15:12:21', 'surya');
INSERT INTO `tbb_room` VALUES (26, '322', 'RM01', 'open', 'no', '2014-05-05 15:12:30', 'surya');
INSERT INTO `tbb_room` VALUES (27, '323', 'RM01', 'open', 'no', '2014-05-05 15:12:33', 'surya');
INSERT INTO `tbb_room` VALUES (28, '324', 'RM01', 'open', 'no', '2014-05-05 15:12:36', 'surya');
INSERT INTO `tbb_room` VALUES (29, '325', 'RM01', 'open', 'no', '2014-05-05 15:12:38', 'surya');
INSERT INTO `tbb_room` VALUES (30, '326', 'RM01', 'open', 'no', '2014-05-05 15:12:41', 'surya');
INSERT INTO `tbb_room` VALUES (31, '327', 'RM01', 'open', 'no', '2014-05-05 15:12:43', 'surya');
INSERT INTO `tbb_room` VALUES (32, '328', 'RM01', 'open', 'no', '2014-05-05 15:12:46', 'surya');
INSERT INTO `tbb_room` VALUES (33, '329', 'RM01', 'open', 'no', '2014-05-05 15:12:49', 'surya');
INSERT INTO `tbb_room` VALUES (34, '330', 'RM01', 'open', 'no', '2014-05-05 15:12:52', 'surya');
INSERT INTO `tbb_room` VALUES (35, '331', 'RM01', 'open', 'no', '2014-05-05 15:13:45', 'surya');
INSERT INTO `tbb_room` VALUES (36, '332', 'RM01', 'open', 'no', '2014-05-05 15:13:48', 'surya');
INSERT INTO `tbb_room` VALUES (37, '333', 'RM01', 'open', 'no', '2014-05-05 15:13:51', 'surya');
INSERT INTO `tbb_room` VALUES (38, '334', 'RM01', 'open', 'no', '2014-05-05 15:13:58', 'surya');
INSERT INTO `tbb_room` VALUES (39, '335', 'RM01', 'open', 'no', '2014-05-05 15:14:01', 'surya');
INSERT INTO `tbb_room` VALUES (40, '336', 'RM01', 'open', 'no', '2014-05-05 15:14:04', 'surya');
INSERT INTO `tbb_room` VALUES (41, '337', 'RM01', 'open', 'no', '2014-05-05 15:14:06', 'surya');
INSERT INTO `tbb_room` VALUES (42, '338', 'RM01', 'open', 'no', '2014-05-05 15:14:09', 'surya');
INSERT INTO `tbb_room` VALUES (43, '339', 'RM01', 'open', 'no', '2014-05-05 15:14:11', 'surya');
INSERT INTO `tbb_room` VALUES (44, '341', 'RM01', 'open', 'no', '2014-05-05 15:14:14', 'surya');
INSERT INTO `tbb_room` VALUES (45, '342', 'RM01', 'open', 'no', '2014-05-05 15:14:20', 'surya');
INSERT INTO `tbb_room` VALUES (46, '343a', 'RM03', 'open', 'no', '2014-05-05 15:14:28', 'surya');
INSERT INTO `tbb_room` VALUES (47, '344a', 'RM03', 'open', 'no', '2014-05-05 15:16:02', 'surya');
INSERT INTO `tbb_room` VALUES (48, '345a', 'RM03', 'open', 'no', '2014-05-05 15:16:06', 'surya');
INSERT INTO `tbb_room` VALUES (49, '346a', 'RM03', 'open', 'no', '2014-05-05 15:16:09', 'surya');
INSERT INTO `tbb_room` VALUES (50, '347a', 'RM03', 'open', 'no', '2014-05-05 15:16:11', 'surya');
INSERT INTO `tbb_room` VALUES (51, '348a', 'RM03', 'open', 'no', '2014-05-05 15:16:14', 'surya');
INSERT INTO `tbb_room` VALUES (52, '349a', 'RM03', 'open', 'no', '2014-05-05 15:16:17', 'surya');
INSERT INTO `tbb_room` VALUES (53, '350a', 'RM03', 'open', 'no', '2014-05-05 15:16:20', 'surya');
INSERT INTO `tbb_room` VALUES (54, '351a', 'RM03', 'open', 'no', '2014-05-05 15:18:15', 'surya');
INSERT INTO `tbb_room` VALUES (55, '352a', 'RM03', 'open', 'no', '2014-05-05 15:18:19', 'surya');
INSERT INTO `tbb_room` VALUES (56, '353a', 'RM03', 'open', 'no', '2014-05-05 15:18:33', 'surya');
INSERT INTO `tbb_room` VALUES (57, '354a', 'RM03', 'open', 'no', '2014-05-05 15:18:36', 'surya');
INSERT INTO `tbb_room` VALUES (58, '355a', 'RM03', 'open', 'no', '2014-05-05 15:18:39', 'surya');
INSERT INTO `tbb_room` VALUES (59, '356a', 'RM03', 'open', 'no', '2014-05-05 15:18:42', 'surya');
INSERT INTO `tbb_room` VALUES (60, '357a', 'RM03', 'open', 'no', '2014-05-05 15:18:46', 'surya');
INSERT INTO `tbb_room` VALUES (61, '358a', 'RM03', 'open', 'no', '2014-05-05 15:18:50', 'surya');
INSERT INTO `tbb_room` VALUES (62, '359a', 'RM03', 'open', 'no', '2014-05-05 15:18:53', 'surya');
INSERT INTO `tbb_room` VALUES (63, '360', 'RM01', 'open', 'no', '2014-05-05 15:18:56', 'surya');
INSERT INTO `tbb_room` VALUES (64, '365', 'RM01', 'open', 'no', '2014-05-05 15:18:59', 'surya');
INSERT INTO `tbb_room` VALUES (65, '366', 'RM01', 'open', 'no', '2014-05-05 15:19:04', 'surya');
INSERT INTO `tbb_room` VALUES (66, '367', 'RM01', 'open', 'no', '2014-05-05 15:20:02', 'surya');
INSERT INTO `tbb_room` VALUES (67, '368', 'RM01', 'open', 'no', '2014-05-05 15:20:05', 'surya');
INSERT INTO `tbb_room` VALUES (68, '369', 'RM01', 'open', 'no', '2014-05-05 15:20:08', 'surya');
INSERT INTO `tbb_room` VALUES (69, '370', 'RM01', 'open', 'no', '2014-05-05 15:20:11', 'surya');
INSERT INTO `tbb_room` VALUES (70, '371', 'RM01', 'open', 'no', '2014-05-05 15:20:14', 'surya');
INSERT INTO `tbb_room` VALUES (71, '372', 'RM01', 'open', 'no', '2014-05-05 15:20:18', 'surya');
INSERT INTO `tbb_room` VALUES (72, '373', 'RM01', 'open', 'no', '2014-05-05 15:20:21', 'surya');
INSERT INTO `tbb_room` VALUES (73, '374', 'RM01', 'open', 'no', '2014-05-05 15:20:24', 'surya');
INSERT INTO `tbb_room` VALUES (74, '375', 'RM01', 'open', 'no', '2014-05-05 15:20:27', 'surya');
INSERT INTO `tbb_room` VALUES (75, '376', 'RM01', 'open', 'no', '2014-05-05 15:20:29', 'surya');
INSERT INTO `tbb_room` VALUES (76, '377', 'RM01', 'open', 'no', '2014-05-05 15:20:32', 'surya');
INSERT INTO `tbb_room` VALUES (77, '378', 'RM01', 'open', 'no', '2014-05-05 15:20:35', 'surya');
INSERT INTO `tbb_room` VALUES (78, '379', 'RM01', 'open', 'no', '2014-05-05 15:20:38', 'surya');
INSERT INTO `tbb_room` VALUES (79, '380', 'RM01', 'open', 'no', '2014-05-05 15:20:42', 'surya');
INSERT INTO `tbb_room` VALUES (80, '381', 'RM01', 'open', 'no', '2014-05-05 15:20:45', 'surya');
INSERT INTO `tbb_room` VALUES (81, '382', 'RM01', 'open', 'no', '2014-05-05 15:20:48', 'surya');
INSERT INTO `tbb_room` VALUES (82, '383', 'RM01', 'open', 'no', '2014-05-05 15:20:51', 'surya');
INSERT INTO `tbb_room` VALUES (83, '384', 'RM01', 'open', 'no', '2014-05-05 15:20:54', 'surya');
INSERT INTO `tbb_room` VALUES (84, '385', 'RM01', 'open', 'no', '2014-05-05 15:20:56', 'surya');
INSERT INTO `tbb_room` VALUES (85, '386', 'RM01', 'open', 'no', '2014-05-05 15:20:58', 'surya');
INSERT INTO `tbb_room` VALUES (86, '387', 'RM01', 'open', 'no', '2014-05-05 15:21:02', 'surya');
INSERT INTO `tbb_room` VALUES (87, '388', 'RM01', 'open', 'no', '2014-05-05 15:21:07', 'surya');
INSERT INTO `tbb_room` VALUES (88, '389', 'RM01', 'open', 'no', '2014-05-05 15:21:09', 'surya');
INSERT INTO `tbb_room` VALUES (89, '390', 'RM01', 'open', 'no', '2014-05-05 15:21:12', 'surya');
INSERT INTO `tbb_room` VALUES (90, '391', 'RM01', 'open', 'no', '2014-05-05 15:21:15', 'surya');
INSERT INTO `tbb_room` VALUES (91, '392', 'RM01', 'open', 'no', '2014-05-05 15:21:17', 'surya');
INSERT INTO `tbb_room` VALUES (92, '101a', 'RM02', 'open', 'no', '2014-05-05 15:21:56', 'surya');
INSERT INTO `tbb_room` VALUES (93, '102a', 'RM02', 'open', 'no', '2014-05-05 15:22:00', 'surya');
INSERT INTO `tbb_room` VALUES (94, '103a', 'RM02', 'open', 'no', '2014-05-05 15:22:14', 'surya');
INSERT INTO `tbb_room` VALUES (95, '104a', 'RM02', 'open', 'no', '2014-05-05 15:22:18', 'surya');
INSERT INTO `tbb_room` VALUES (96, '105a', 'RM02', 'open', 'no', '2014-05-05 15:22:22', 'surya');
INSERT INTO `tbb_room` VALUES (97, '106a', 'RM02', 'open', 'no', '2014-05-05 15:22:25', 'surya');
INSERT INTO `tbb_room` VALUES (98, '107a', 'RM02', 'open', 'no', '2014-05-05 15:22:29', 'surya');
INSERT INTO `tbb_room` VALUES (99, '108a', 'RM02', 'open', 'no', '2014-05-05 15:22:33', 'surya');
INSERT INTO `tbb_room` VALUES (100, '109a', 'RM02', 'open', 'no', '2014-05-05 15:22:37', 'surya');
INSERT INTO `tbb_room` VALUES (101, '110a', 'RM02', 'open', 'no', '2014-05-05 15:22:41', 'surya');
INSERT INTO `tbb_room` VALUES (102, '111a', 'RM02', 'open', 'no', '2014-05-05 15:22:46', 'surya');
INSERT INTO `tbb_room` VALUES (103, '112a', 'RM02', 'open', 'no', '2014-05-05 15:23:00', 'surya');
INSERT INTO `tbb_room` VALUES (104, '113a', 'RM02', 'open', 'no', '2014-05-05 15:23:04', 'surya');
INSERT INTO `tbb_room` VALUES (105, '114a', 'RM02', 'open', 'no', '2014-05-05 15:23:08', 'surya');
INSERT INTO `tbb_room` VALUES (106, '115a', 'RM02', 'open', 'no', '2014-05-05 15:23:13', 'surya');
INSERT INTO `tbb_room` VALUES (107, '116a', 'RM02', 'open', 'no', '2014-05-05 15:23:19', 'surya');
INSERT INTO `tbb_room` VALUES (108, '201a', 'RM02', 'open', 'no', '2014-05-05 15:23:25', 'surya');
INSERT INTO `tbb_room` VALUES (109, '202a', 'RM02', 'open', 'no', '2014-05-05 15:23:30', 'surya');
INSERT INTO `tbb_room` VALUES (110, '203a', 'RM02', 'open', 'no', '2014-05-05 15:23:33', 'surya');
INSERT INTO `tbb_room` VALUES (111, '204a', 'RM02', 'open', 'no', '2014-05-05 15:23:37', 'surya');
INSERT INTO `tbb_room` VALUES (112, '205a', 'RM02', 'open', 'no', '2014-05-05 15:23:41', 'surya');
INSERT INTO `tbb_room` VALUES (113, '206a', 'RM02', 'open', 'no', '2014-05-05 15:23:44', 'surya');
INSERT INTO `tbb_room` VALUES (114, '207a', 'RM02', 'open', 'no', '2014-05-05 15:23:49', 'surya');
INSERT INTO `tbb_room` VALUES (115, '208a', 'RM02', 'open', 'no', '2014-05-05 15:23:57', 'surya');
INSERT INTO `tbb_room` VALUES (116, '209a', 'RM02', 'open', 'no', '2014-05-05 15:24:00', 'surya');
INSERT INTO `tbb_room` VALUES (117, '210a', 'RM02', 'open', 'no', '2014-05-05 15:24:04', 'surya');
INSERT INTO `tbb_room` VALUES (118, '211a', 'RM02', 'open', 'no', '2014-05-05 15:24:08', 'surya');
INSERT INTO `tbb_room` VALUES (119, '212a', 'RM02', 'open', 'no', '2014-05-05 15:24:12', 'surya');
INSERT INTO `tbb_room` VALUES (120, '213a', 'RM02', 'open', 'no', '2014-05-05 15:24:15', 'surya');
INSERT INTO `tbb_room` VALUES (121, '214a', 'RM02', 'open', 'no', '2014-05-05 15:24:22', 'surya');
INSERT INTO `tbb_room` VALUES (122, '215a', 'RM02', 'open', 'no', '2014-05-05 15:24:26', 'surya');
INSERT INTO `tbb_room` VALUES (123, '361a', 'RM03', 'open', 'no', '2014-05-05 15:28:14', 'surya');
INSERT INTO `tbb_room` VALUES (124, '362a', 'RM03', 'open', 'no', '2014-05-05 15:28:23', 'surya');
INSERT INTO `tbb_room` VALUES (125, '363a', 'RM03', 'open', 'no', '2014-05-05 15:28:43', 'surya');
INSERT INTO `tbb_room` VALUES (126, '364a', 'RM03', 'open', 'no', '2014-05-05 15:28:48', 'surya');
INSERT INTO `tbb_room` VALUES (127, '301a', 'RM02', 'open', 'no', '2014-05-05 15:29:15', 'surya');
INSERT INTO `tbb_room` VALUES (130, '101b', 'RM02', 'open', 'no', '2014-05-06 16:19:14', 'admin');
INSERT INTO `tbb_room` VALUES (131, '102b', 'RM02', 'open', 'no', '2014-05-06 16:19:18', 'admin');
INSERT INTO `tbb_room` VALUES (132, '103b', 'RM02', 'open', 'no', '2014-05-06 16:19:23', 'admin');
INSERT INTO `tbb_room` VALUES (133, '104b', 'RM02', 'open', 'no', '2014-05-06 16:19:31', 'admin');
INSERT INTO `tbb_room` VALUES (134, '105b', 'RM02', 'open', 'no', '2014-05-06 16:19:36', 'admin');
INSERT INTO `tbb_room` VALUES (135, '106b', 'RM02', 'open', 'no', '2014-05-06 16:19:40', 'admin');
INSERT INTO `tbb_room` VALUES (136, '107b', 'RM02', 'open', 'no', '2014-05-06 16:19:49', 'admin');
INSERT INTO `tbb_room` VALUES (137, '108b', 'RM02', 'open', 'no', '2014-05-06 16:20:00', 'admin');
INSERT INTO `tbb_room` VALUES (138, '109b', 'RM02', 'open', 'no', '2014-05-06 16:20:09', 'admin');
INSERT INTO `tbb_room` VALUES (139, '110b', 'RM02', 'open', 'no', '2014-05-06 16:20:16', 'admin');
INSERT INTO `tbb_room` VALUES (140, '111b', 'RM02', 'open', 'no', '2014-05-06 16:20:23', 'admin');
INSERT INTO `tbb_room` VALUES (141, '112b', 'RM02', 'open', 'no', '2014-05-06 16:20:30', 'admin');
INSERT INTO `tbb_room` VALUES (142, '113b', 'RM02', 'open', 'no', '2014-05-06 16:20:35', 'admin');
INSERT INTO `tbb_room` VALUES (143, '114b', 'RM02', 'open', 'no', '2014-05-06 16:20:41', 'admin');
INSERT INTO `tbb_room` VALUES (144, '115b', 'RM02', 'open', 'no', '2014-05-06 16:20:47', 'admin');
INSERT INTO `tbb_room` VALUES (145, '116b', 'RM02', 'open', 'no', '2014-05-06 16:20:56', 'admin');
INSERT INTO `tbb_room` VALUES (147, '201b', 'RM02', 'open', 'no', '2014-05-06 16:25:16', 'admin');
INSERT INTO `tbb_room` VALUES (148, '202b', 'RM02', 'open', 'no', '2014-05-06 16:25:20', 'admin');
INSERT INTO `tbb_room` VALUES (149, '203b', 'RM02', 'open', 'no', '2014-05-06 16:25:24', 'admin');
INSERT INTO `tbb_room` VALUES (150, '204b', 'RM02', 'open', 'no', '2014-05-06 16:25:28', 'admin');
INSERT INTO `tbb_room` VALUES (151, '205b', 'RM02', 'open', 'no', '2014-05-06 16:25:32', 'admin');
INSERT INTO `tbb_room` VALUES (152, '206b', 'RM02', 'open', 'no', '2014-05-06 16:25:36', 'admin');
INSERT INTO `tbb_room` VALUES (153, '207b', 'RM02', 'open', 'no', '2014-05-06 16:25:40', 'admin');
INSERT INTO `tbb_room` VALUES (154, '208b', 'RM02', 'open', 'no', '2014-05-06 16:25:44', 'admin');
INSERT INTO `tbb_room` VALUES (155, '209b', 'RM02', 'open', 'no', '2014-05-06 16:25:48', 'admin');
INSERT INTO `tbb_room` VALUES (156, '210b', 'RM02', 'open', 'no', '2014-05-06 16:25:52', 'admin');
INSERT INTO `tbb_room` VALUES (157, '211b', 'RM02', 'open', 'no', '2014-05-06 16:25:56', 'admin');
INSERT INTO `tbb_room` VALUES (158, '212b', 'RM02', 'open', 'no', '2014-05-06 16:26:02', 'admin');
INSERT INTO `tbb_room` VALUES (159, '213b', 'RM02', 'open', 'no', '2014-05-06 16:26:07', 'admin');
INSERT INTO `tbb_room` VALUES (160, '214b', 'RM02', 'open', 'no', '2014-05-06 16:26:11', 'admin');
INSERT INTO `tbb_room` VALUES (161, '215b', 'RM02', 'open', 'no', '2014-05-06 16:26:15', 'admin');
INSERT INTO `tbb_room` VALUES (162, '301b', 'RM02', 'open', 'no', '2014-05-06 16:26:58', 'admin');
INSERT INTO `tbb_room` VALUES (163, '343b', 'RM03', 'open', 'no', '2014-05-06 16:28:06', 'admin');
INSERT INTO `tbb_room` VALUES (164, '344b', 'RM03', 'open', 'no', '2014-05-06 16:28:13', 'admin');
INSERT INTO `tbb_room` VALUES (165, '345b', 'RM03', 'open', 'no', '2014-05-06 16:28:25', 'admin');
INSERT INTO `tbb_room` VALUES (166, '346b', 'RM03', 'open', 'no', '2014-05-06 16:28:30', 'admin');
INSERT INTO `tbb_room` VALUES (167, '347b', 'RM03', 'open', 'no', '2014-05-06 16:28:51', 'admin');
INSERT INTO `tbb_room` VALUES (168, '348b', 'RM03', 'open', 'no', '2014-05-06 16:28:57', 'admin');
INSERT INTO `tbb_room` VALUES (169, '349b', 'RM03', 'open', 'no', '2014-05-06 16:29:07', 'admin');
INSERT INTO `tbb_room` VALUES (170, '350b', 'RM03', 'open', 'no', '2014-05-06 16:29:22', 'admin');
INSERT INTO `tbb_room` VALUES (171, '351b', 'RM03', 'open', 'no', '2014-05-06 16:29:29', 'admin');
INSERT INTO `tbb_room` VALUES (172, '352b', 'RM03', 'open', 'no', '2014-05-06 16:29:33', 'admin');
INSERT INTO `tbb_room` VALUES (173, '353b', 'RM03', 'open', 'no', '2014-05-06 16:29:38', 'admin');
INSERT INTO `tbb_room` VALUES (174, '354b', 'RM03', 'open', 'no', '2014-05-06 16:29:42', 'admin');
INSERT INTO `tbb_room` VALUES (175, '355b', 'RM03', 'open', 'no', '2014-05-06 16:29:46', 'admin');
INSERT INTO `tbb_room` VALUES (176, '356b', 'RM03', 'open', 'no', '2014-05-06 16:29:49', 'admin');
INSERT INTO `tbb_room` VALUES (177, '357b', 'RM03', 'open', 'no', '2014-05-06 16:29:54', 'admin');
INSERT INTO `tbb_room` VALUES (178, '358b', 'RM03', 'open', 'no', '2014-05-06 16:29:58', 'admin');
INSERT INTO `tbb_room` VALUES (179, '359b', 'RM03', 'open', 'no', '2014-05-06 16:30:02', 'admin');
INSERT INTO `tbb_room` VALUES (180, '360b', 'RM03', 'open', 'no', '2014-05-06 16:30:07', 'admin');
INSERT INTO `tbb_room` VALUES (181, '361b', 'RM03', 'open', 'no', '2014-05-06 16:30:11', 'admin');
INSERT INTO `tbb_room` VALUES (182, '362b', 'RM03', 'open', 'no', '2014-05-06 16:30:21', 'admin');
INSERT INTO `tbb_room` VALUES (183, '363b', 'RM03', 'open', 'no', '2014-05-06 16:30:25', 'admin');
INSERT INTO `tbb_room` VALUES (184, '364b', 'RM03', 'open', 'no', '2014-05-06 16:30:29', 'admin');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_room_available`
-- 

CREATE TABLE `tbb_room_available` (
  `id_rav` int(11) NOT NULL auto_increment,
  `rav_room_name` varchar(255) NOT NULL,
  `rav_id_rpd` int(11) NOT NULL,
  `rav_status` varchar(255) NOT NULL,
  `rav_start` time NOT NULL,
  `rav_end` time NOT NULL,
  `rav_book_date` date NOT NULL,
  `rav_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `rav_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_rav`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_room_available`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_therapist`
-- 

CREATE TABLE `tbb_therapist` (
  `id_therapist` int(11) NOT NULL auto_increment,
  `thr_code` varchar(255) NOT NULL,
  `thr_name` varchar(255) NOT NULL,
  `thr_status` enum('open','close') NOT NULL default 'open',
  `thr_hide_status` enum('yes','no') NOT NULL default 'no',
  `thr_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `thr_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_therapist`),
  UNIQUE KEY `thr_code` (`thr_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=99 ;

-- 
-- Dumping data for table `tbb_therapist`
-- 

INSERT INTO `tbb_therapist` VALUES (6, 'PA01', 'Juju Junengsih', 'open', 'no', '2014-05-05 15:35:59', 'surya');
INSERT INTO `tbb_therapist` VALUES (7, 'PA11', 'Raminah', 'open', 'no', '2014-05-05 15:36:10', 'surya');
INSERT INTO `tbb_therapist` VALUES (8, 'PA12', 'Sri Muningsih', 'open', 'no', '2014-05-05 15:52:27', 'surya');
INSERT INTO `tbb_therapist` VALUES (9, 'PA15', 'Eka Harianti', 'open', 'no', '2014-05-05 15:52:53', 'surya');
INSERT INTO `tbb_therapist` VALUES (10, 'PA17', 'Watriah', 'open', 'no', '2014-05-05 15:53:07', 'surya');
INSERT INTO `tbb_therapist` VALUES (11, 'PA23', 'Misnah', 'open', 'no', '2014-05-05 15:53:24', 'surya');
INSERT INTO `tbb_therapist` VALUES (12, 'PA32', 'Sunengsih', 'open', 'no', '2014-05-05 15:56:04', 'surya');
INSERT INTO `tbb_therapist` VALUES (13, 'PA37', 'Tital Mulyani', 'open', 'no', '2014-05-05 16:04:35', 'surya');
INSERT INTO `tbb_therapist` VALUES (14, 'PA49', 'Ipah', 'open', 'no', '2014-05-05 16:04:46', 'surya');
INSERT INTO `tbb_therapist` VALUES (15, 'PA50', 'Eci', 'open', 'no', '2014-05-05 16:04:56', 'surya');
INSERT INTO `tbb_therapist` VALUES (16, 'PA57', 'Tuti Maesopa', 'open', 'no', '2014-05-05 16:05:20', 'surya');
INSERT INTO `tbb_therapist` VALUES (17, 'PA59', 'Kokom', 'open', 'no', '2014-05-05 16:05:35', 'surya');
INSERT INTO `tbb_therapist` VALUES (18, 'PA60', 'Taluwih', 'open', 'no', '2014-05-05 16:05:46', 'surya');
INSERT INTO `tbb_therapist` VALUES (19, 'PA61', 'Jumaroh', 'open', 'no', '2014-05-05 16:05:57', 'surya');
INSERT INTO `tbb_therapist` VALUES (20, 'PA62', 'Sumitri', 'open', 'no', '2014-05-05 16:06:11', 'surya');
INSERT INTO `tbb_therapist` VALUES (21, 'PA64', 'Dede Deanita', 'open', 'no', '2014-05-05 16:06:25', 'surya');
INSERT INTO `tbb_therapist` VALUES (22, 'PA65', 'Warleni', 'open', 'no', '2014-05-05 16:06:34', 'surya');
INSERT INTO `tbb_therapist` VALUES (23, 'PA81', 'Cucu Nurlaela', 'open', 'no', '2014-05-05 16:06:52', 'surya');
INSERT INTO `tbb_therapist` VALUES (24, 'PA83', 'Karwinah', 'open', 'no', '2014-05-05 16:07:05', 'surya');
INSERT INTO `tbb_therapist` VALUES (25, 'PA85', 'Yeni Astuti', 'open', 'no', '2014-05-05 16:07:23', 'surya');
INSERT INTO `tbb_therapist` VALUES (26, 'PB06', 'Rohenah', 'open', 'no', '2014-05-05 16:07:33', 'surya');
INSERT INTO `tbb_therapist` VALUES (27, 'PB08', 'Epon Siti Hadijah', 'open', 'no', '2014-05-05 16:07:47', 'surya');
INSERT INTO `tbb_therapist` VALUES (28, 'PB15', 'Carkem', 'open', 'no', '2014-05-05 16:07:56', 'surya');
INSERT INTO `tbb_therapist` VALUES (29, 'PB29', 'Lin Barokah', 'open', 'no', '2014-05-05 16:08:08', 'surya');
INSERT INTO `tbb_therapist` VALUES (30, 'PB31', 'Misni', 'open', 'no', '2014-05-05 16:08:16', 'surya');
INSERT INTO `tbb_therapist` VALUES (31, 'PB32', 'Tita', 'open', 'no', '2014-05-05 16:08:26', 'surya');
INSERT INTO `tbb_therapist` VALUES (32, 'PB34', 'Rohanah', 'open', 'no', '2014-05-05 16:08:35', 'surya');
INSERT INTO `tbb_therapist` VALUES (33, 'PB35', 'Toniah', 'open', 'no', '2014-05-05 16:08:55', 'surya');
INSERT INTO `tbb_therapist` VALUES (34, 'PB52', 'Lia Susanti', 'open', 'no', '2014-05-05 16:09:04', 'surya');
INSERT INTO `tbb_therapist` VALUES (35, 'PB65', 'Kadek Ayu Meliana Dewi', 'open', 'no', '2014-05-05 16:09:21', 'surya');
INSERT INTO `tbb_therapist` VALUES (36, 'PB75', 'Siti Maesaroh', 'open', 'no', '2014-05-05 16:09:32', 'surya');
INSERT INTO `tbb_therapist` VALUES (37, 'PB94', 'Erni Hianti', 'open', 'no', '2014-05-05 16:09:45', 'surya');
INSERT INTO `tbb_therapist` VALUES (38, 'PB97', 'Nengsih', 'open', 'no', '2014-05-05 16:10:02', 'surya');
INSERT INTO `tbb_therapist` VALUES (39, 'PC02', 'Ni Ketut Sutiaharyani', 'open', 'no', '2014-05-05 16:10:31', 'surya');
INSERT INTO `tbb_therapist` VALUES (40, 'PC07', 'Asih', 'open', 'no', '2014-05-05 16:11:06', 'surya');
INSERT INTO `tbb_therapist` VALUES (41, 'PC14', 'Kasturi', 'open', 'no', '2014-05-05 16:11:15', 'surya');
INSERT INTO `tbb_therapist` VALUES (42, 'PC15', 'Endang', 'open', 'no', '2014-05-05 16:11:22', 'surya');
INSERT INTO `tbb_therapist` VALUES (43, 'PC17', 'Sawinah', 'open', 'no', '2014-05-05 16:11:31', 'surya');
INSERT INTO `tbb_therapist` VALUES (44, 'PC18', 'Nurul Hamidah', 'open', 'no', '2014-05-05 16:11:43', 'surya');
INSERT INTO `tbb_therapist` VALUES (45, 'PC19', 'Desi Melinda', 'open', 'no', '2014-05-05 16:11:53', 'surya');
INSERT INTO `tbb_therapist` VALUES (46, 'PC21', 'Fitri Nur Indah', 'open', 'no', '2014-05-05 16:12:06', 'surya');
INSERT INTO `tbb_therapist` VALUES (47, 'PC23', 'Ghina Fitri Y.', 'open', 'no', '2014-05-05 16:12:22', 'surya');
INSERT INTO `tbb_therapist` VALUES (48, 'PC25', 'Anisa', 'open', 'no', '2014-05-05 16:12:39', 'surya');
INSERT INTO `tbb_therapist` VALUES (49, 'PC27', 'Rusti', 'open', 'no', '2014-05-05 16:12:51', 'surya');
INSERT INTO `tbb_therapist` VALUES (50, 'PC29', 'Ima Nurasiyah', 'open', 'no', '2014-05-05 16:13:03', 'surya');
INSERT INTO `tbb_therapist` VALUES (51, 'PC30', 'Ai Nuraeni', 'open', 'no', '2014-05-05 16:13:13', 'surya');
INSERT INTO `tbb_therapist` VALUES (52, 'PC31', 'Ida Fatihatun', 'open', 'no', '2014-05-05 16:13:26', 'surya');
INSERT INTO `tbb_therapist` VALUES (53, 'PC32', 'Ena Mulyani', 'open', 'no', '2014-05-05 16:13:43', 'surya');
INSERT INTO `tbb_therapist` VALUES (54, 'PC33', 'Unasih', 'open', 'no', '2014-05-05 16:13:51', 'surya');
INSERT INTO `tbb_therapist` VALUES (55, 'PC34', 'Roatina', 'open', 'no', '2014-05-05 16:14:00', 'surya');
INSERT INTO `tbb_therapist` VALUES (56, 'PC38', 'Neneng', 'open', 'no', '2014-05-05 16:14:09', 'surya');
INSERT INTO `tbb_therapist` VALUES (57, 'PC39', 'Sugini', 'open', 'no', '2014-05-05 16:14:33', 'surya');
INSERT INTO `tbb_therapist` VALUES (58, 'PC43', 'Nasiroh', 'open', 'no', '2014-05-05 16:14:43', 'surya');
INSERT INTO `tbb_therapist` VALUES (59, 'PC45', 'Tasiah', 'open', 'no', '2014-05-05 16:14:53', 'surya');
INSERT INTO `tbb_therapist` VALUES (60, 'PC46', 'Sunemi', 'open', 'no', '2014-05-05 16:15:03', 'surya');
INSERT INTO `tbb_therapist` VALUES (61, 'PC47', 'Kasiri', 'open', 'no', '2014-05-05 16:15:12', 'surya');
INSERT INTO `tbb_therapist` VALUES (62, 'PC48', 'Titi Handayani', 'open', 'no', '2014-05-05 16:15:24', 'surya');
INSERT INTO `tbb_therapist` VALUES (63, 'PC49', 'Sri Yanti', 'open', 'no', '2014-05-05 16:15:36', 'surya');
INSERT INTO `tbb_therapist` VALUES (64, 'PC50', 'Wanti', 'open', 'no', '2014-05-05 16:15:50', 'surya');
INSERT INTO `tbb_therapist` VALUES (65, 'PC51', 'Mayu Nurasihyah', 'open', 'no', '2014-05-05 16:16:06', 'surya');
INSERT INTO `tbb_therapist` VALUES (66, 'PC52', 'Taryunah', 'open', 'no', '2014-05-05 16:16:17', 'surya');
INSERT INTO `tbb_therapist` VALUES (67, 'PC53', 'Eka Yulia Putri', 'open', 'no', '2014-05-05 16:16:31', 'surya');
INSERT INTO `tbb_therapist` VALUES (68, 'PC54', 'Sri Yanti', 'open', 'no', '2014-05-05 16:17:17', 'surya');
INSERT INTO `tbb_therapist` VALUES (69, 'PC55', 'Dewi Sri', 'open', 'no', '2014-05-05 16:17:26', 'surya');
INSERT INTO `tbb_therapist` VALUES (70, 'PC57', 'Suparni', 'open', 'no', '2014-05-05 16:17:35', 'surya');
INSERT INTO `tbb_therapist` VALUES (71, 'PC58', 'Putri Sari', 'open', 'no', '2014-05-05 16:17:44', 'surya');
INSERT INTO `tbb_therapist` VALUES (72, 'PC60', 'Mustika', 'open', 'no', '2014-05-05 16:17:53', 'surya');
INSERT INTO `tbb_therapist` VALUES (73, 'PC61', 'Feni Amiyati', 'open', 'no', '2014-05-05 16:18:07', 'surya');
INSERT INTO `tbb_therapist` VALUES (74, 'PC62', 'Usilawati', 'open', 'no', '2014-05-05 16:18:17', 'surya');
INSERT INTO `tbb_therapist` VALUES (75, 'PC63', 'Heriyah', 'open', 'no', '2014-05-05 16:18:28', 'surya');
INSERT INTO `tbb_therapist` VALUES (76, 'PC64', 'Erni', 'open', 'no', '2014-05-05 16:18:36', 'surya');
INSERT INTO `tbb_therapist` VALUES (77, 'PC67', 'Adah', 'open', 'no', '2014-05-05 16:18:44', 'surya');
INSERT INTO `tbb_therapist` VALUES (78, 'PC68', 'Nur Adilla ', 'open', 'no', '2014-05-05 16:18:55', 'surya');
INSERT INTO `tbb_therapist` VALUES (79, 'PC69', 'Cah Linda', 'open', 'no', '2014-05-05 16:19:12', 'surya');
INSERT INTO `tbb_therapist` VALUES (80, 'PC70', 'Anisa', 'open', 'no', '2014-05-05 16:19:19', 'surya');
INSERT INTO `tbb_therapist` VALUES (81, 'PC71', 'Amelia Sari', 'open', 'no', '2014-05-05 16:19:29', 'surya');
INSERT INTO `tbb_therapist` VALUES (82, 'PC72', 'Nurati BT. Kasmin', 'open', 'no', '2014-05-05 16:19:44', 'surya');
INSERT INTO `tbb_therapist` VALUES (83, 'PC73', 'Ida Farida', 'open', 'no', '2014-05-05 16:19:55', 'surya');
INSERT INTO `tbb_therapist` VALUES (84, 'PC74', 'Rina Bela Citra', 'open', 'no', '2014-05-05 16:20:09', 'surya');
INSERT INTO `tbb_therapist` VALUES (85, 'PC75', 'Aam Aminah', 'open', 'no', '2014-05-05 16:20:22', 'surya');
INSERT INTO `tbb_therapist` VALUES (86, 'PC76', 'Anisah', 'open', 'no', '2014-05-05 16:20:35', 'surya');
INSERT INTO `tbb_therapist` VALUES (87, 'PC77', 'Yulinda', 'open', 'no', '2014-05-05 16:20:42', 'surya');
INSERT INTO `tbb_therapist` VALUES (88, 'PC78', 'Juhani', 'open', 'no', '2014-05-05 16:20:51', 'surya');
INSERT INTO `tbb_therapist` VALUES (89, 'PC79', 'Teti Widia Astuti', 'open', 'no', '2014-05-05 16:21:06', 'surya');
INSERT INTO `tbb_therapist` VALUES (90, 'PC80', 'Yus Maryani', 'open', 'no', '2014-05-05 16:21:17', 'surya');
INSERT INTO `tbb_therapist` VALUES (91, 'PC81', 'Tini Kartini', 'open', 'no', '2014-05-05 16:21:29', 'surya');
INSERT INTO `tbb_therapist` VALUES (92, 'PC82', 'Ipur Purlina', 'open', 'no', '2014-05-05 16:21:40', 'surya');
INSERT INTO `tbb_therapist` VALUES (93, 'PC83', 'Turerih', 'open', 'no', '2014-05-05 16:21:57', 'surya');
INSERT INTO `tbb_therapist` VALUES (94, 'PC84', 'Wati', 'open', 'no', '2014-05-05 16:22:09', 'surya');
INSERT INTO `tbb_therapist` VALUES (95, 'PC85', 'Lia Adila', 'open', 'no', '2014-05-05 16:22:30', 'surya');
INSERT INTO `tbb_therapist` VALUES (96, 'PC86', 'Ratini', 'open', 'no', '2014-05-05 16:22:44', 'surya');
INSERT INTO `tbb_therapist` VALUES (97, 'PC87', 'Yanti Risahayu', 'open', 'no', '2014-05-05 16:22:59', 'surya');
INSERT INTO `tbb_therapist` VALUES (98, 'PC88', 'Kharisma', 'open', 'no', '2014-05-05 16:23:09', 'surya');

-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_therapist_workhour`
-- 

CREATE TABLE `tbb_therapist_workhour` (
  `id_thr_whour` int(11) NOT NULL auto_increment,
  `thw_code` varchar(255) NOT NULL,
  `thw_date` date NOT NULL,
  `thw_id_rpd` int(11) NOT NULL,
  `thw_start_time` time NOT NULL,
  `thw_end_time` time NOT NULL,
  `thw_isvoid` enum('yes','no') NOT NULL default 'no',
  `thw_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `thw_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_thr_whour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tbb_therapist_workhour`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tbb_travel`
-- 

CREATE TABLE `tbb_travel` (
  `id_travel` int(11) NOT NULL auto_increment,
  `trv_code` varchar(255) NOT NULL,
  `trv_name` varchar(255) NOT NULL,
  `trv_address` varchar(255) NOT NULL,
  `trv_phone` varchar(255) NOT NULL,
  `trv_mail` varchar(255) NOT NULL,
  `trv_hide_status` enum('yes','no') NOT NULL default 'no',
  `trv_update_on` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `trv_update_by` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_travel`),
  UNIQUE KEY `trv_code` (`trv_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=142 ;

-- 
-- Dumping data for table `tbb_travel`
-- 

INSERT INTO `tbb_travel` VALUES (3, 'TR001', 'Other', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-05 16:54:23', 'surya');
INSERT INTO `tbb_travel` VALUES (4, 'TR002', 'Bali Nami Tour', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:31:41', 'admin');
INSERT INTO `tbb_travel` VALUES (5, 'TR003', 'PT. Antar Budaya Cakrawala (ABC Tour)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:32:14', 'admin');
INSERT INTO `tbb_travel` VALUES (6, 'TR004', 'Bali Charajan Tour & Travel', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:32:33', 'admin');
INSERT INTO `tbb_travel` VALUES (7, 'TR005', 'Prima Indo Wisata', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:32:56', 'admin');
INSERT INTO `tbb_travel` VALUES (8, 'TR006', 'PT. Bali Travelindo Tours & Travel', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:33:17', 'admin');
INSERT INTO `tbb_travel` VALUES (9, 'TR007', 'Pt. Mitra Global Holiday (MG Holiday)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:33:39', 'admin');
INSERT INTO `tbb_travel` VALUES (10, 'TR008', 'Eka Jaya Bali Wisata', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:34:00', 'admin');
INSERT INTO `tbb_travel` VALUES (11, 'TR009', 'Pt. PD Tour', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:34:26', 'admin');
INSERT INTO `tbb_travel` VALUES (12, 'TR010', 'Bali Kami Tours & Weddings', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:35:30', 'admin');
INSERT INTO `tbb_travel` VALUES (13, 'TR011', 'PT. Alam Bidadari Semesta ', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:35:59', 'admin');
INSERT INTO `tbb_travel` VALUES (14, 'TR012', 'Discover Bali', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:37:04', 'admin');
INSERT INTO `tbb_travel` VALUES (15, 'TR013', 'Aero Travel ', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:41:49', 'admin');
INSERT INTO `tbb_travel` VALUES (16, 'TR014', 'PT. Oleg Bali International (OBI Tour)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:42:30', 'admin');
INSERT INTO `tbb_travel` VALUES (17, 'TR015', 'WINDYS BALI TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:43:42', 'admin');
INSERT INTO `tbb_travel` VALUES (18, 'TR016', 'Kirana Bali Wisata', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:45:09', 'admin');
INSERT INTO `tbb_travel` VALUES (19, 'TR017', 'PT. Matahari Korin', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:45:48', 'admin');
INSERT INTO `tbb_travel` VALUES (20, 'TR018', 'WL PERKASA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:46:18', 'admin');
INSERT INTO `tbb_travel` VALUES (21, 'TR019', 'I Planner', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:46:52', 'admin');
INSERT INTO `tbb_travel` VALUES (22, 'TR020', 'PT Bali Megah Wisata ( BMW Tours)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:47:31', 'admin');
INSERT INTO `tbb_travel` VALUES (23, 'TR021', 'PT. Gajah Bali Wisata', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:48:00', 'admin');
INSERT INTO `tbb_travel` VALUES (24, 'TR022', 'Nusa Raya Tour', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:48:22', 'admin');
INSERT INTO `tbb_travel` VALUES (25, 'TR023', 'Bali Alle Vous Tours', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:49:26', 'admin');
INSERT INTO `tbb_travel` VALUES (26, 'TR024', 'Bali Tamasya', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:49:54', 'admin');
INSERT INTO `tbb_travel` VALUES (27, 'TR025', 'PT. Mustika Dewata Tour& Travel', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:50:32', 'admin');
INSERT INTO `tbb_travel` VALUES (28, 'TR026', 'Bhara Tours Bali', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 15:51:01', 'admin');
INSERT INTO `tbb_travel` VALUES (29, 'TR027', 'ABBEY TRAVELINDO', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:14:23', 'admin');
INSERT INTO `tbb_travel` VALUES (30, 'TR028', 'ACCESS ASIA HOLIDAY', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:15:02', 'admin');
INSERT INTO `tbb_travel` VALUES (31, 'TR029', 'ALLSTAR BALI WISATA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:15:25', 'admin');
INSERT INTO `tbb_travel` VALUES (32, 'TR030', 'ARDA BALI TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:15:45', 'admin');
INSERT INTO `tbb_travel` VALUES (33, 'TR031', 'ASTINA TOURS', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:16:10', 'admin');
INSERT INTO `tbb_travel` VALUES (34, 'TR032', 'BAHAGIA DEWATA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:16:45', 'admin');
INSERT INTO `tbb_travel` VALUES (35, 'TR033', 'BALI AGA VILLA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:17:08', 'admin');
INSERT INTO `tbb_travel` VALUES (36, 'TR034', 'BALI AMAZING TOUR (PT TAMASYA BALI MANDIRI)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:17:32', 'admin');
INSERT INTO `tbb_travel` VALUES (37, 'TR035', 'BALI ASIA WISATA ( ASIA TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:17:55', 'admin');
INSERT INTO `tbb_travel` VALUES (38, 'TR036', 'BALI CATURWIDYA WISATA ( BALIWISATA TOUR & TRAVEL )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:18:26', 'admin');
INSERT INTO `tbb_travel` VALUES (39, 'TR037', 'BALI DISCOVERY TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:19:32', 'admin');
INSERT INTO `tbb_travel` VALUES (40, 'TR038', 'BALI DUTA EXPRESS', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:19:49', 'admin');
INSERT INTO `tbb_travel` VALUES (41, 'TR039', 'BALI PESONA INT''L TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:20:56', 'admin');
INSERT INTO `tbb_travel` VALUES (42, 'TR040', 'BALI ROA MANDIRI ( KALOKA TOUR&TRAVEL)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:21:34', 'admin');
INSERT INTO `tbb_travel` VALUES (43, 'TR041', 'BALI SINAR MENTARI TOURS & TRAVEL ( BALI SUNSHINE TOURS )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:22:23', 'admin');
INSERT INTO `tbb_travel` VALUES (44, 'TR042', 'BALI TOURS & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:22:56', 'admin');
INSERT INTO `tbb_travel` VALUES (45, 'TR043', 'BALI UNIK TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:23:23', 'admin');
INSERT INTO `tbb_travel` VALUES (46, 'TR044', 'BALISARI TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:23:45', 'admin');
INSERT INTO `tbb_travel` VALUES (47, 'TR045', 'BIMATAMA TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:24:27', 'admin');
INSERT INTO `tbb_travel` VALUES (48, 'TR046', 'BLUE SWAN BALI TOURS & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:25:13', 'admin');
INSERT INTO `tbb_travel` VALUES (49, 'TR047', 'BORN VACATION INDONESIA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:26:19', 'admin');
INSERT INTO `tbb_travel` VALUES (50, 'TR048', 'CAKRAWALA DEWATA INDAH ( CDI TRAVEL )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:26:41', 'admin');
INSERT INTO `tbb_travel` VALUES (51, 'TR049', 'CAMPUHAN AGUNG ( CAPUNG)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:29:25', 'admin');
INSERT INTO `tbb_travel` VALUES (52, 'TR050', 'CHINA AIRLINES', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:29:56', 'admin');
INSERT INTO `tbb_travel` VALUES (53, 'TR051', 'CIPTA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:30:16', 'admin');
INSERT INTO `tbb_travel` VALUES (54, 'TR052', 'CV BALI NICHO TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:30:42', 'admin');
INSERT INTO `tbb_travel` VALUES (55, 'TR053', 'D BEST HOLIDAY TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:31:09', 'admin');
INSERT INTO `tbb_travel` VALUES (56, 'TR054', 'DARMA BALI WISATA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:31:36', 'admin');
INSERT INTO `tbb_travel` VALUES (57, 'TR055', 'DIONI TRAVEL & TRANSPORT SERVICE', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:31:59', 'admin');
INSERT INTO `tbb_travel` VALUES (58, 'TR056', 'DISCOVERY & VISION TOUR ( DNV TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:33:56', 'admin');
INSERT INTO `tbb_travel` VALUES (59, 'TR057', 'DRAGON TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:34:34', 'admin');
INSERT INTO `tbb_travel` VALUES (60, 'TR058', 'DWIDAYA WORLD WIDE ( DWIDAYA TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:35:55', 'admin');
INSERT INTO `tbb_travel` VALUES (61, 'TR059', 'EFATA TOURS BALI', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:36:18', 'admin');
INSERT INTO `tbb_travel` VALUES (62, 'TR060', 'EXCELLENT HOLIDAY', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:36:51', 'admin');
INSERT INTO `tbb_travel` VALUES (63, 'TR061', 'EXPLORASI NUSANTARA TOUR & TRAVEL ( NEXPLORER )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:37:35', 'admin');
INSERT INTO `tbb_travel` VALUES (64, 'TR062', 'FAFORITE BALI TOUR & ORGANIZER', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:38:08', 'admin');
INSERT INTO `tbb_travel` VALUES (65, 'TR063', 'GARBERA HOLIDAY', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:38:37', 'admin');
INSERT INTO `tbb_travel` VALUES (66, 'TR064', 'GOLDEN PALACE RESTAURANT', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:39:29', 'admin');
INSERT INTO `tbb_travel` VALUES (67, 'TR065', 'GRAHA WISATA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:39:47', 'admin');
INSERT INTO `tbb_travel` VALUES (68, 'TR066', 'GREAT DAY HOLIDAY TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:40:13', 'admin');
INSERT INTO `tbb_travel` VALUES (69, 'TR067', 'HAPPY BALI TOURS & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:40:52', 'admin');
INSERT INTO `tbb_travel` VALUES (70, 'TR068', 'HAPPY TRAILS', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:42:10', 'admin');
INSERT INTO `tbb_travel` VALUES (71, 'TR069', 'HIRO-CHAN TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:42:35', 'admin');
INSERT INTO `tbb_travel` VALUES (72, 'TR070', 'IL BALI ( KOREA MARKET )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:43:02', 'admin');
INSERT INTO `tbb_travel` VALUES (73, 'TR071', 'INDONESIA & TOUR TRANSPORT', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:43:19', 'admin');
INSERT INTO `tbb_travel` VALUES (74, 'TR072', 'INDONESIA ELEGANT TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:43:36', 'admin');
INSERT INTO `tbb_travel` VALUES (75, 'TR073', 'INDOPLAN HOLIDAY ASRI ( INDOPLAN HOLIDAYS BALI )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:43:53', 'admin');
INSERT INTO `tbb_travel` VALUES (76, 'TR074', 'INTERCRUISES SHORESIDE & PORT SERVICES', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:44:14', 'admin');
INSERT INTO `tbb_travel` VALUES (77, 'TR075', 'JATAYU BALI TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:44:36', 'admin');
INSERT INTO `tbb_travel` VALUES (78, 'TR076', 'JETWINGS INTERNATIONAL GROUP', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:44:56', 'admin');
INSERT INTO `tbb_travel` VALUES (79, 'TR077', 'JTB INDONESIA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:45:14', 'admin');
INSERT INTO `tbb_travel` VALUES (80, 'TR078', 'KHRISNA TOHPATI PERDANA ( KTP TOUR & TRAVEL)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:45:32', 'admin');
INSERT INTO `tbb_travel` VALUES (81, 'TR079', 'KREASI ACTIVE INDONESIA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:45:58', 'admin');
INSERT INTO `tbb_travel` VALUES (82, 'TR080', 'KRISTAL HOLIDAYS', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:46:47', 'admin');
INSERT INTO `tbb_travel` VALUES (83, 'TR081', 'LION MAS DINAMIKA EXPRESS TOUR & TRAVEL SERVICE ( LION TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:47:06', 'admin');
INSERT INTO `tbb_travel` VALUES (84, 'TR082', 'LUCKY HOLIDAYA TOUR & TRAVEL ( LUCKY TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:47:34', 'admin');
INSERT INTO `tbb_travel` VALUES (85, 'TR083', 'M TOUR BALI (KOREA MARKET)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:47:52', 'admin');
INSERT INTO `tbb_travel` VALUES (86, 'TR084', 'MANUMADI WISATA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:48:11', 'admin');
INSERT INTO `tbb_travel` VALUES (87, 'TR085', 'MATTA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:48:59', 'admin');
INSERT INTO `tbb_travel` VALUES (88, 'TR086', 'MILLENIUM INDO WISATA ( MILLENIUM TOURS )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:49:16', 'admin');
INSERT INTO `tbb_travel` VALUES (89, 'TR087', 'MODERNIKA CITRA WISATA ( MODERN TOURS )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:49:38', 'admin');
INSERT INTO `tbb_travel` VALUES (90, 'TR088', 'NAYA BALI CIPTA KREASI', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:49:54', 'admin');
INSERT INTO `tbb_travel` VALUES (91, 'TR089', 'NEVER NEVER LAND IN BALI', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:50:12', 'admin');
INSERT INTO `tbb_travel` VALUES (92, 'TR090', 'NEW FIVESTAR BALI TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:50:40', 'admin');
INSERT INTO `tbb_travel` VALUES (93, 'TR091', 'OBY TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:51:02', 'admin');
INSERT INTO `tbb_travel` VALUES (94, 'TR092', 'PALAPA WISATA INDONESIA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:51:21', 'admin');
INSERT INTO `tbb_travel` VALUES (95, 'TR093', 'PALMMAS HOLIDAYS TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:51:38', 'admin');
INSERT INTO `tbb_travel` VALUES (96, 'TR094', 'PAN BRIGHT TRAVEL SERVICE', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:51:55', 'admin');
INSERT INTO `tbb_travel` VALUES (97, 'TR095', 'PANORAMA TOURS INDONESIA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:52:49', 'admin');
INSERT INTO `tbb_travel` VALUES (98, 'TR096', 'PARAMITHA IDOLA WISATA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:53:09', 'admin');
INSERT INTO `tbb_travel` VALUES (99, 'TR097', 'PLUS PRIORITY', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:53:26', 'admin');
INSERT INTO `tbb_travel` VALUES (100, 'TR098', 'POLOW INDONESIA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:53:57', 'admin');
INSERT INTO `tbb_travel` VALUES (101, 'TR099', 'PRIMA VIJAYA INDAH TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:54:21', 'admin');
INSERT INTO `tbb_travel` VALUES (102, 'TR100', 'PROBALI PANDU WISATA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:54:38', 'admin');
INSERT INTO `tbb_travel` VALUES (103, 'TR101', 'PT ABADI BALI WISATA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:54:56', 'admin');
INSERT INTO `tbb_travel` VALUES (104, 'TR102', 'PT BALI BULAN TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:55:12', 'admin');
INSERT INTO `tbb_travel` VALUES (105, 'TR103', 'PT BALI CAHAYA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:55:40', 'admin');
INSERT INTO `tbb_travel` VALUES (106, 'TR104', 'PT BALI SASANA TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:55:56', 'admin');
INSERT INTO `tbb_travel` VALUES (107, 'TR105', 'PT BAYU BUANA Tbk. Branch Office Kuta', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:56:12', 'admin');
INSERT INTO `tbb_travel` VALUES (108, 'TR106', 'PT BET OBAJA INTERNATIONAL ( OBAJA TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:56:30', 'admin');
INSERT INTO `tbb_travel` VALUES (109, 'TR107', 'PT DOEL SUMBANG', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:56:47', 'admin');
INSERT INTO `tbb_travel` VALUES (110, 'TR108', 'PT GOLDEN RAMA EXPRESS TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:57:08', 'admin');
INSERT INTO `tbb_travel` VALUES (111, 'TR109', 'PT HIS BALI TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:57:29', 'admin');
INSERT INTO `tbb_travel` VALUES (112, 'TR110', 'PT INDO BALI ( I.B ) TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:57:46', 'admin');
INSERT INTO `tbb_travel` VALUES (113, 'TR111', 'PT INTAN KURNIA BALI ( ESCORT BALI )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:58:03', 'admin');
INSERT INTO `tbb_travel` VALUES (114, 'TR112', 'PT JALAK BALI LESTARI TRAVEL SERVICE ( JBL TRAVEL )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:58:19', 'admin');
INSERT INTO `tbb_travel` VALUES (115, 'TR113', 'PT KAYA CAHAYA PERMATA WISATA ( KAYABALI TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:58:37', 'admin');
INSERT INTO `tbb_travel` VALUES (116, 'TR114', 'PT KOREAN TRAVEL INDONESIA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:58:53', 'admin');
INSERT INTO `tbb_travel` VALUES (117, 'TR115', 'PT MANDIRI ANUGERAH SEJATI TRAVEL ( MAS TRAVEL )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:59:08', 'admin');
INSERT INTO `tbb_travel` VALUES (118, 'TR116', 'PT NUANSA WISATA PRIMA NUSANTARA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:59:22', 'admin');
INSERT INTO `tbb_travel` VALUES (119, 'TR117', 'PT PENJOR BALI WISATA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:59:37', 'admin');
INSERT INTO `tbb_travel` VALUES (120, 'TR118', 'PT SARI GUMI BALI TOUR ( SARI TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 17:59:57', 'admin');
INSERT INTO `tbb_travel` VALUES (121, 'TR119', 'PT SINAR WAHANA TOUR & TRAVEL ( FOUR SEASON TOUR & TRAVEL )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:00:16', 'admin');
INSERT INTO `tbb_travel` VALUES (122, 'TR120', 'PT STAR CEMERLANG WISATA (STAR TOUR)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:00:34', 'admin');
INSERT INTO `tbb_travel` VALUES (123, 'TR121', 'PT WAHANA WIRA WISATA', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:00:50', 'admin');
INSERT INTO `tbb_travel` VALUES (124, 'TR122', 'PT WISATA DEWA TOUR & TRAVEL SERVICES (WITA TOUR)', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:01:16', 'admin');
INSERT INTO `tbb_travel` VALUES (125, 'TR123', 'PT WL PERKASA TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:01:33', 'admin');
INSERT INTO `tbb_travel` VALUES (126, 'TR124', 'PT YES ABADI WISATA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:01:53', 'admin');
INSERT INTO `tbb_travel` VALUES (127, 'TR125', 'PT. INTI TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:02:14', 'admin');
INSERT INTO `tbb_travel` VALUES (128, 'TR126', 'RAMADUTA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:02:30', 'admin');
INSERT INTO `tbb_travel` VALUES (129, 'TR127', 'REFRESH TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:02:47', 'admin');
INSERT INTO `tbb_travel` VALUES (130, 'TR128', 'RINTISWISATA UTAMA TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:03:04', 'admin');
INSERT INTO `tbb_travel` VALUES (131, 'TR129', 'SHILLA TOUR CABANG BALI', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:03:26', 'admin');
INSERT INTO `tbb_travel` VALUES (132, 'TR130', 'SKT BALI', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:03:46', 'admin');
INSERT INTO `tbb_travel` VALUES (133, 'TR131', 'SMAILING TOURS AND TRAVEL SERVICE', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:03:59', 'admin');
INSERT INTO `tbb_travel` VALUES (134, 'TR132', 'SPIRIT TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:04:15', 'admin');
INSERT INTO `tbb_travel` VALUES (135, 'TR133', 'SUN BOUTIQUE HOTEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:04:44', 'admin');
INSERT INTO `tbb_travel` VALUES (136, 'TR134', 'SURYAJAYA BALI TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:05:00', 'admin');
INSERT INTO `tbb_travel` VALUES (137, 'TR135', 'TMS TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:05:17', 'admin');
INSERT INTO `tbb_travel` VALUES (138, 'TR136', 'UNIVERSAL BALI TOUR & TRAVEL', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:05:41', 'admin');
INSERT INTO `tbb_travel` VALUES (139, 'TR137', 'VALENCIA INTAN PERMATA ( VIP TOUR )', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:05:58', 'admin');
INSERT INTO `tbb_travel` VALUES (140, 'TR138', 'VARIA TOURS', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:06:30', 'admin');
INSERT INTO `tbb_travel` VALUES (141, 'TR139', 'VAYA TOUR', 'Jl.', '0361', 'email@gmail.com', 'no', '2014-05-06 18:06:48', 'admin');

-- --------------------------------------------------------

-- 
-- Table structure for table `url_app`
-- 

CREATE TABLE `url_app` (
  `id_url_app` int(11) NOT NULL auto_increment,
  `url_app` varchar(255) NOT NULL,
  `url_ip_address` varchar(255) NOT NULL,
  `url_encode` varchar(255) NOT NULL,
  `url_ver_code` varchar(255) NOT NULL,
  `url_verification_end` varchar(255) NOT NULL,
  PRIMARY KEY  (`id_url_app`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `url_app`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `user_reservasi`
-- 

CREATE TABLE `user_reservasi` (
  `id_user` int(11) NOT NULL auto_increment,
  `ur_password` varchar(255) NOT NULL,
  `ur_nama` varchar(100) NOT NULL,
  `ur_email` varchar(100) NOT NULL,
  `ur_level` varchar(255) character set latin1 collate latin1_general_ci NOT NULL,
  `ur_telpon` varchar(20) default NULL,
  `ur_logon` varchar(255) default '0',
  `ur_username` varchar(30) default NULL,
  `ur_position` varchar(255) NOT NULL,
  `ur_approved` enum('yes','no') NOT NULL default 'no',
  `ur_approve_by` varchar(255) default NULL,
  PRIMARY KEY  (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `user_reservasi`
-- 

