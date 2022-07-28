-- MySQL Script generated by MySQL Workbench
-- Thu Jul 28 11:02:01 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_pi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_pi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_pi` DEFAULT CHARACTER SET utf8 ;
USE `db_pi` ;

-- -----------------------------------------------------
-- Table `db_pi`.`tb_temas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pi`.`tb_temas` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_pi`.`tb_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pi`.`tb_usuarios` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `foto` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_pi`.`tb_postagens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_pi`.`tb_postagens` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `texto` VARCHAR(1000) NOT NULL,
  `data` DATETIME NULL,
  `foto` VARCHAR(255) NULL,
  `comentario` VARCHAR(255) NULL,
  `tema_id` BIGINT NOT NULL,
  `usuario_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_postagens_tb_temas_idx` (`tema_id` ASC) VISIBLE,
  INDEX `fk_tb_postagens_tb_usuarios1_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_postagens_tb_temas`
    FOREIGN KEY (`tema_id`)
    REFERENCES `db_pi`.`tb_temas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_postagens_tb_usuarios1`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `db_pi`.`tb_usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
