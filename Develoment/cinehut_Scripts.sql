-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cinehut
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cinehut
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cinehut` DEFAULT CHARACTER SET utf8 ;
USE `cinehut` ;

-- -----------------------------------------------------
-- Table `cinehut`.`niveles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`niveles` (
  `niveles_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`niveles_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`usuarios` (
  `usuarios_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `contraseña` VARCHAR(50) NOT NULL,
  `id_niveles` INT NOT NULL,
  PRIMARY KEY (`usuarios_id`),
  INDEX `niveles_idx` (`id_niveles` ASC) VISIBLE,
  CONSTRAINT `niveles`
    FOREIGN KEY (`id_niveles`)
    REFERENCES `cinehut`.`niveles` (`niveles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`productos` (
  `productos_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `precio` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`productos_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`peliculas` (
  `peliculas_id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(50) NOT NULL,
  `duracion` INT NOT NULL,
  `clasificacion` CHAR(25) NOT NULL,
  PRIMARY KEY (`peliculas_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`salas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`salas` (
  `salas_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `disponibilidad` INT NOT NULL,
  PRIMARY KEY (`salas_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`funciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`funciones` (
  `funciones_id` INT NOT NULL AUTO_INCREMENT,
  `id_pelicula` INT NOT NULL,
  `id_salas` INT NOT NULL,
  `fecha_hrs` DATETIME NOT NULL,
  PRIMARY KEY (`funciones_id`),
  INDEX `pelicula_id_idx` (`id_pelicula` ASC) VISIBLE,
  INDEX `sala_id_idx` (`id_salas` ASC) VISIBLE,
  CONSTRAINT `pelicula_id`
    FOREIGN KEY (`id_pelicula`)
    REFERENCES `cinehut`.`peliculas` (`peliculas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `salas_id`
    FOREIGN KEY (`id_salas`)
    REFERENCES `cinehut`.`salas` (`salas_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`combos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`combos` (
  `combos_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `precio` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`combos_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cinehut`.`boletos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cinehut`.`boletos` (
  `boletos_id` INT NOT NULL AUTO_INCREMENT,
  `id_funciones` INT NOT NULL,
  `num_asiento` INT NOT NULL,
  `precio` DECIMAL(7,2) NOT NULL,
  PRIMARY KEY (`boletos_id`),
  INDEX `funciones_id_idx` (`id_funciones` ASC) VISIBLE,
  CONSTRAINT `funciones_id`
    FOREIGN KEY (`id_funciones`)
    REFERENCES `cinehut`.`funciones` (`funciones_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
