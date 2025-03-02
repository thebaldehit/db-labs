-- MySQL Script generated by MySQL Workbench
-- Sun 05 Nov 2023 02:19:32 PM EET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`action` ;

CREATE TABLE IF NOT EXISTS `mydb`.`action` (
  `craeted_at` DATETIME NOT NULL,
  `state_id` INT NOT NULL,
  `media_request_id` INT NOT NULL,
  `source_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`state_id`, `media_request_id`, `source_id`, `user_id`),
  INDEX `fk_action_media_request1_idx` (`media_request_id` ASC) VISIBLE,
  INDEX `fk_action_source1_idx` (`source_id` ASC) VISIBLE,
  INDEX `fk_action_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_action_state1`
    FOREIGN KEY (`state_id`)
    REFERENCES `mydb`.`state` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_media_request1`
    FOREIGN KEY (`media_request_id`)
    REFERENCES `mydb`.`media_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_source1`
    FOREIGN KEY (`source_id`)
    REFERENCES `mydb`.`source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_action_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`based_on`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`based_on` ;

CREATE TABLE IF NOT EXISTS `mydb`.`based_on` (
  `source_id` INT NOT NULL,
  `media_request_id` INT NOT NULL,
  PRIMARY KEY (`source_id`, `media_request_id`),
  INDEX `fk_source_has_media_request_media_request1_idx` (`media_request_id` ASC) VISIBLE,
  INDEX `fk_source_has_media_request_source1_idx` (`source_id` ASC) VISIBLE,
  CONSTRAINT `fk_source_has_media_request_source1`
    FOREIGN KEY (`source_id`)
    REFERENCES `mydb`.`source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_source_has_media_request_media_request1`
    FOREIGN KEY (`media_request_id`)
    REFERENCES `mydb`.`media_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`feedback`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`feedback` ;

CREATE TABLE IF NOT EXISTS `mydb`.`feedback` (
  `id` INT NOT NULL,
  `body` VARCHAR(255) NULL,
  `rating` FLOAT NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `media_request_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `media_request_id`),
  INDEX `fk_Feedback_MediaRequest1_idx` (`media_request_id` ASC) VISIBLE,
  INDEX `fk_Feedback_User1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_Feedback_MediaRequest1`
    FOREIGN KEY (`media_request_id`)
    REFERENCES `mydb`.`media_request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feedback_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`label`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`label` ;

CREATE TABLE IF NOT EXISTS `mydb`.`label` (
  `tag_id` INT NOT NULL,
  `source_id` INT NOT NULL,
  PRIMARY KEY (`tag_id`, `source_id`),
  INDEX `fk_tag_has_source_source1_idx` (`source_id` ASC) VISIBLE,
  INDEX `fk_tag_has_source_tag1_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_tag_has_source_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `mydb`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_has_source_source1`
    FOREIGN KEY (`source_id`)
    REFERENCES `mydb`.`source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`media_request`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`media_request` ;

CREATE TABLE IF NOT EXISTS `mydb`.`media_request` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  `keywords` VARCHAR(255) NULL,
  `type` VARCHAR(255) NOT NULL,
  `created_at` DATETIME NOT NULL,
  `updated_at` DATETIME NOT NULL,
  `user_id` INT NOT NULL,
  `source_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`, `source_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`permission` ;

CREATE TABLE IF NOT EXISTS `mydb`.`permission` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`role` ;

CREATE TABLE IF NOT EXISTS `mydb`.`role` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`role_has_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`role_has_permission` ;

CREATE TABLE IF NOT EXISTS `mydb`.`role_has_permission` (
  `role_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`role_id`, `permission_id`),
  INDEX `fk_Role_has_Permission_Permission1_idx` (`permission_id` ASC) VISIBLE,
  INDEX `fk_Role_has_Permission_Role1_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_Role_has_Permission_Role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Role_has_Permission_Permission1`
    FOREIGN KEY (`permission_id`)
    REFERENCES `mydb`.`permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`source`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`source` ;

CREATE TABLE IF NOT EXISTS `mydb`.`source` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `url` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`state` ;

CREATE TABLE IF NOT EXISTS `mydb`.`state` (
  `id` INT NOT NULL,
  `display_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tag` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tag` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`id`, `role_id`),
  INDEX `fk_User_Role1_idx` (`role_id` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  CONSTRAINT `fk_User_Role1`
    FOREIGN KEY (`role_id`)
    REFERENCES `mydb`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (1, 'user.delete');
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (2, 'user.role.promote');
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (3, 'media.find');
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (4, 'media.create');
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (5, 'media.delete');
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (6, 'media.edit');
INSERT INTO `mydb`.`permission` (`id`, `name`) VALUES (7, 'media.feedback.add');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`role`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`role` (`id`, `name`, `description`) VALUES (1, 'User', 'An ordinary user of the system');
INSERT INTO `mydb`.`role` (`id`, `name`, `description`) VALUES (2, 'TechnicalExpert', 'Specialist in technical issues');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`role_has_permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 1);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 2);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (1, 3);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 3);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (1, 4);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 4);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (1, 5);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 5);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (1, 6);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 6);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (1, 7);
INSERT INTO `mydb`.`role_has_permission` (`role_id`, `permission_id`) VALUES (2, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`state`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`state` (`id`, `display_name`) VALUES (1, 'Subscribe');
INSERT INTO `mydb`.`state` (`id`, `display_name`) VALUES (2, 'Unsubscribe');
INSERT INTO `mydb`.`state` (`id`, `display_name`) VALUES (3, 'Quarantine');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (1, 'Sport');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (2, 'Science and Technology');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (3, 'Entertainment');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (4, 'Fashion and Style');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (5, 'Music');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (6, 'Food and Cooking');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (7, 'Tourism');
INSERT INTO `mydb`.`tag` (`id`, `name`) VALUES (8, 'Movies and Television');

COMMIT;