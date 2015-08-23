CREATE TABLE IF NOT EXISTS `report` (
  `key` VARCHAR(16),
  `start_year` INT(12),
  `end_year` INT(12),
primary KEY (`key`));

CREATE TABLE IF NOT EXISTS `annual_breakdown` (
  `year` INT(12),
  `category` ENUM("GROSS_INCOME", "FEDERAL_TAXES", "STATE_TAXES", "DONATIONS", "INVESTMENTS", "CASH_GROWTH"),
  `value` INT(12),
primary KEY (`year`, `category`));

CREATE TABLE IF NOT EXISTS `investment_category` (
  `key` VARCHAR(16),
  `name` VARCHAR(64),
  `rank` INT(12),
  `type` ENUM("RETIREMENT", "LIQUID"),
primary KEY (`key`));

CREATE TABLE IF NOT EXISTS `investment_target` (
  `category_key` VARCHAR(16),
  `percent` INT(12),
primary KEY (`category_key`));

CREATE TABLE IF NOT EXISTS `investments` (
  `year` INT(12),
  `month` INT(12),
  `category_key` VARCHAR(16),
  `value` INT(12),
primary KEY (`month`, `year`, `category_key`));
