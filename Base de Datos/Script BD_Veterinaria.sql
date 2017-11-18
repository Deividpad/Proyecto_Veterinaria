-- MySQL Script generated by MySQL Workbench
-- 11/17/17 21:50:07
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bdveterinaria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdveterinaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdveterinaria` DEFAULT CHARACTER SET utf8 ;
USE `bdveterinaria` ;

-- -----------------------------------------------------
-- Table `bdveterinaria`.`Propietario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Propietario` (
  `idPropietario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Documento` BIGINT NOT NULL,
  `Nombres` VARCHAR(60) NOT NULL,
  `Apellidos` VARCHAR(60) NOT NULL,
  `Genero` ENUM('Femenino', 'Masculino') NOT NULL,
  `Telefono` BIGINT NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(120) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Estado` ENUM('Activo', 'Inactivo') NOT NULL,
  PRIMARY KEY (`idPropietario`),
  UNIQUE INDEX `idPersona_UNIQUE` (`idPropietario` ASC),
  UNIQUE INDEX `Documento_UNIQUE` (`Documento` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdveterinaria`.`Mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Mascota` (
  `idMascotas` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(60) NOT NULL,
  `Foto` VARCHAR(200) NOT NULL,
  `Peso` FLOAT NOT NULL,
  `Talla` FLOAT NOT NULL,
  `Especie` ENUM('Canino', 'Felino') NOT NULL,
  `Raza` VARCHAR(45) NOT NULL,
  `Sexo` ENUM('Hembra', 'Macho') NOT NULL,
  `FechaNacimiento` DATE NOT NULL,
  `Alimentacion` TEXT NOT NULL,
  `Medicamentos` VARCHAR(45) NULL,
  `Propietario` INT UNSIGNED NOT NULL,
  `Observaciones` TEXT NULL,
  `Estado` ENUM('Activa', 'Inactiva') NOT NULL,
  PRIMARY KEY (`idMascotas`),
  INDEX `fk_Mascotas_Persona1_idx` (`Propietario` ASC),
  CONSTRAINT `fk_Mascotas_Persona1`
    FOREIGN KEY (`Propietario`)
    REFERENCES `bdveterinaria`.`Propietario` (`idPropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdveterinaria`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Persona` (
  `idVeterinario` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Documento` BIGINT NOT NULL,
  `Nombres` VARCHAR(60) NOT NULL,
  `Apellidos` VARCHAR(60) NOT NULL,
  `Genero` ENUM('Femenino', 'Masculino') NOT NULL,
  `Telefono` BIGINT NOT NULL,
  `Correo` VARCHAR(100) NOT NULL,
  `Direccion` VARCHAR(120) NOT NULL,
  `Ciudad` VARCHAR(45) NOT NULL,
  `Perfil` VARCHAR(45) NOT NULL,
  `Especialidad` VARCHAR(45) NULL,
  `Foto` VARCHAR(200) NOT NULL,
  `Contrasena` VARCHAR(60) NOT NULL,
  `Estado` ENUM('Activo', 'Inactivo') NOT NULL,
  PRIMARY KEY (`idVeterinario`),
  UNIQUE INDEX `idPersona_UNIQUE` (`idVeterinario` ASC),
  UNIQUE INDEX `Documento_UNIQUE` (`Documento` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdveterinaria`.`Citas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Citas` (
  `idCitas_Medicas` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Entrada` DATETIME NOT NULL,
  `Fecha_Salida` DATETIME NOT NULL,
  `Tipo` ENUM('Programada', 'Urgencia') NOT NULL,
  `Mascota` INT NOT NULL,
  `Veterinario` INT UNSIGNED NOT NULL,
  `Estado` ENUM('Programada', 'Atendida', 'Cancelada') NOT NULL,
  PRIMARY KEY (`idCitas_Medicas`),
  INDEX `fk_Citas_Mascota1_idx` (`Mascota` ASC),
  INDEX `fk_Citas_Veterinario1_idx` (`Veterinario` ASC),
  CONSTRAINT `fk_Citas_Mascota1`
    FOREIGN KEY (`Mascota`)
    REFERENCES `bdveterinaria`.`Mascota` (`idMascotas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Citas_Veterinario1`
    FOREIGN KEY (`Veterinario`)
    REFERENCES `bdveterinaria`.`Persona` (`idVeterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdveterinaria`.`Hospitalizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Hospitalizacion` (
  `idHospitalizacion` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Salida` DATETIME NULL,
  `Proposito` TEXT NOT NULL,
  `Diagnostico` VARCHAR(45) NOT NULL,
  `Observaciones` VARCHAR(45) NOT NULL,
  `Mascota` INT NOT NULL,
  `Citas` INT NOT NULL,
  PRIMARY KEY (`idHospitalizacion`),
  INDEX `fk_Hospitalizacion_Mascota1_idx` (`Mascota` ASC),
  INDEX `fk_Hospitalizacion_Citas1_idx` (`Citas` ASC),
  CONSTRAINT `fk_Hospitalizacion_Mascota1`
    FOREIGN KEY (`Mascota`)
    REFERENCES `bdveterinaria`.`Mascota` (`idMascotas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hospitalizacion_Citas1`
    FOREIGN KEY (`Citas`)
    REFERENCES `bdveterinaria`.`Citas` (`idCitas_Medicas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdveterinaria`.`Medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Medicamentos` (
  `idMedicamento` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(40) NOT NULL,
  `Laboratorio` VARCHAR(45) NOT NULL,
  `Lote` VARCHAR(45) NOT NULL,
  `Fecha` DATE NOT NULL,
  `Veterinario` INT UNSIGNED NOT NULL,
  `Hospitalizacion` INT NULL,
  `Citas` INT NULL,
  PRIMARY KEY (`idMedicamento`),
  INDEX `fk_Medicamentos_Hospitalizacion1_idx` (`Hospitalizacion` ASC),
  INDEX `fk_Medicamentos_Veterinario1_idx` (`Veterinario` ASC),
  INDEX `fk_Medicamentos_Citas1_idx` (`Citas` ASC),
  CONSTRAINT `fk_Medicamentos_Hospitalizacion1`
    FOREIGN KEY (`Hospitalizacion`)
    REFERENCES `bdveterinaria`.`Hospitalizacion` (`idHospitalizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamentos_Veterinario1`
    FOREIGN KEY (`Veterinario`)
    REFERENCES `bdveterinaria`.`Persona` (`idVeterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medicamentos_Citas1`
    FOREIGN KEY (`Citas`)
    REFERENCES `bdveterinaria`.`Citas` (`idCitas_Medicas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bdveterinaria`.`Observaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdveterinaria`.`Observaciones` (
  `idObservaciones` INT NOT NULL AUTO_INCREMENT,
  `Observacion_Diaria` TEXT NOT NULL,
  `Hospitalizacion` INT NOT NULL,
  `Veterinario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idObservaciones`),
  INDEX `fk_Observaciones_Hospitalizacion1_idx` (`Hospitalizacion` ASC),
  INDEX `fk_Observaciones_Veterinario1_idx` (`Veterinario` ASC),
  CONSTRAINT `fk_Observaciones_Hospitalizacion1`
    FOREIGN KEY (`Hospitalizacion`)
    REFERENCES `bdveterinaria`.`Hospitalizacion` (`idHospitalizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Observaciones_Veterinario1`
    FOREIGN KEY (`Veterinario`)
    REFERENCES `bdveterinaria`.`Persona` (`idVeterinario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
