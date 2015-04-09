-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema partyoffour
-- -----------------------------------------------------
-- Schema used for Party of Four
DROP SCHEMA IF EXISTS `partyoffour` ;

-- -----------------------------------------------------
-- Schema partyoffour
--
-- Schema used for Party of Four
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `partyoffour` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `partyoffour` ;

-- -----------------------------------------------------
-- Table `partyoffour`.`table`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partyoffour`.`table` ;

CREATE TABLE IF NOT EXISTS `partyoffour`.`table` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `partyoffour`.`seat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partyoffour`.`seat` ;

CREATE TABLE IF NOT EXISTS `partyoffour`.`seat` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `table_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seat_table1_idx` (`table_id` ASC),
  CONSTRAINT `fk_seat_table1`
    FOREIGN KEY (`table_id`)
    REFERENCES `partyoffour`.`table` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'maintains customer details';


-- -----------------------------------------------------
-- Table `partyoffour`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partyoffour`.`category` ;

CREATE TABLE IF NOT EXISTS `partyoffour`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `partyoffour`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partyoffour`.`product` ;

CREATE TABLE IF NOT EXISTS `partyoffour`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `amount` DECIMAL(6,2) NOT NULL,
  `description` TINYTEXT NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category_idx` (`category_id` ASC),
  CONSTRAINT `fk_product_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `partyoffour`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `partyoffour`.`customer_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partyoffour`.`customer_order` ;

CREATE TABLE IF NOT EXISTS `partyoffour`.`customer_order` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(6,2) NOT NULL,
  `cookname` VARCHAR(45) NOT NULL,
  `seat_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_order_seat1_idx` (`seat_id` ASC),
  CONSTRAINT `fk_customer_order_seat1`
    FOREIGN KEY (`seat_id`)
    REFERENCES `partyoffour`.`seat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `partyoffour`.`ordered_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `partyoffour`.`ordered_product` ;

CREATE TABLE IF NOT EXISTS `partyoffour`.`ordered_product` (
  `customer_order_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  `quantity` INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`customer_order_id`, `product_id`),
  INDEX `fk_customer_order_has_product_product1_idx` (`product_id` ASC),
  INDEX `fk_customer_order_has_product_customer_order1_idx` (`customer_order_id` ASC),
  CONSTRAINT `fk_ordered_product_customer_order`
    FOREIGN KEY (`customer_order_id`)
    REFERENCES `partyoffour`.`customer_order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordered_product_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `partyoffour`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
