-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ToyProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ToyProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ToyProject` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ToyProject` ;

-- -----------------------------------------------------
-- Table `ToyProject`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToyProject`.`user` (
  `userid` VARCHAR(45) NOT NULL,
  `userpwd` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `useremail` VARCHAR(320) NULL,
  `joindate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `status` ENUM('Y', 'N') NULL DEFAULT 'Y' COMMENT '계정 사용 여부',
  PRIMARY KEY (`userid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ToyProject`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToyProject`.`board` (
  `articleno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `content` TEXT NULL,
  `userid` VARCHAR(45) NULL,
  `regtime` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`articleno`),
  INDEX `userid_idx` (`userid` ASC) VISIBLE,
  CONSTRAINT `userid`
    FOREIGN KEY (`userid`)
    REFERENCES `ToyProject`.`user` (`userid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ToyProject`.`board_file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ToyProject`.`board_file` (
  `articleno` INT NOT NULL,
  `savefolder` VARCHAR(45) NULL DEFAULT NULL,
  `originfile` VARCHAR(50) NULL DEFAULT NULL,
  `savefile` VARCHAR(50) NULL DEFAULT NULL,
  INDEX `articleno_idx` (`articleno` ASC) VISIBLE,
  CONSTRAINT `articleno`
    FOREIGN KEY (`articleno`)
    REFERENCES `ToyProject`.`board` (`articleno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '게시판 사진파일';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
