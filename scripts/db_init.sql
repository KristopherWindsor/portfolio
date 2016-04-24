DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `key` VARCHAR(64),
  `value` VARCHAR(256),
primary KEY (`key`));

DROP TABLE IF EXISTS `annual_breakdown`;
CREATE TABLE `annual_breakdown` (
  `year` INT(12),
  `category` ENUM("GROSS_INCOME", "FEDERAL_TAXES", "STATE_TAXES", "DONATIONS", "INVESTMENTS", "SOCIAL_SEC"),
  `value` INT(12),
primary KEY (`year`, `category`));

DROP TABLE IF EXISTS `savings`;
CREATE TABLE `savings` (
  `year` INT(12),
  `month` INT(12),
  `value` INT(12),
primary KEY (`month`, `year`));

DROP TABLE IF EXISTS `investment_category`;
CREATE TABLE `investment_category` (
  `key` VARCHAR(16),
  `name` VARCHAR(64),
  `rank` INT(12),
  `icon` VARCHAR(64),
  `description` text,
primary KEY (`key`));

DROP TABLE IF EXISTS `investment_target`;
CREATE TABLE `investment_target` (
  `category_key` VARCHAR(16),
  `percent` INT(12),
primary KEY (`category_key`));

DROP TABLE IF EXISTS `investments`;
CREATE TABLE `investments` (
  `year` INT(12),
  `month` INT(12),
  `category_key` VARCHAR(16),
  `value_no_ret` INT(12),
  `value_ret_pretax` INT(12),
  `value_ret_posttax` INT(12),
primary KEY (`month`, `year`, `category_key`));
