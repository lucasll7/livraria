-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema livraria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livraria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livraria` DEFAULT CHARACTER SET utf8 ;
USE `livraria` ;

-- -----------------------------------------------------
-- Table `livraria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`fisica` (
  `idfisica` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(40) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `endereco` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `id_cli_fisica` INT NOT NULL,
  PRIMARY KEY (`idfisica`),
  INDEX `fk_cli_fisica1_idx` (`id_cli_fisica` ASC) VISIBLE,
  CONSTRAINT `fk_cli_fisica1`
    FOREIGN KEY (`id_cli_fisica`)
    REFERENCES `livraria`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`juridica` (
  `idjuridica` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `endereco` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `id_cli_juridica` INT NOT NULL,
  PRIMARY KEY (`idjuridica`),
  INDEX `fk_id_cli_jurid_idx` (`id_cli_juridica` ASC) VISIBLE,
  CONSTRAINT `fk_id_cli_jurid`
    FOREIGN KEY (`id_cli_juridica`)
    REFERENCES `livraria`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`livros` (
  `idlivros` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `autor` VARCHAR(45) NOT NULL,
  `assunto` VARCHAR(45) NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`idlivros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`editora` (
  `ideditora` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(11) NOT NULL,
  `endereco` VARCHAR(80) NOT NULL,
  `telefone` VARCHAR(11) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`ideditora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`compra` (
  `idcompra` INT NOT NULL AUTO_INCREMENT,
  `id_cli_compra` INT NOT NULL,
  `id_livro_vende` INT NOT NULL,
  PRIMARY KEY (`idcompra`),
  INDEX `fk_id_cli_compra_idx` (`id_cli_compra` ASC) VISIBLE,
  INDEX `fk_id_livro_vende_idx` (`id_livro_vende` ASC) VISIBLE,
  CONSTRAINT `fk_id_cli_compra`
    FOREIGN KEY (`id_cli_compra`)
    REFERENCES `livraria`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_livro_vende`
    FOREIGN KEY (`id_livro_vende`)
    REFERENCES `livraria`.`livros` (`idlivros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livraria`.`fornece`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`fornece` (
  `idfornece` INT NOT NULL AUTO_INCREMENT,
  `id_fornece` INT NOT NULL,
  `id_recebe` INT NOT NULL,
  PRIMARY KEY (`idfornece`),
  INDEX `fk_id_recebe_idx` (`id_recebe` ASC) VISIBLE,
  INDEX `fk_id_fornece_idx` (`id_fornece` ASC) VISIBLE,
  CONSTRAINT `fk_id_fornece`
    FOREIGN KEY (`id_fornece`)
    REFERENCES `livraria`.`editora` (`ideditora`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_id_recebe`
    FOREIGN KEY (`id_recebe`)
    REFERENCES `livraria`.`livros` (`idlivros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
