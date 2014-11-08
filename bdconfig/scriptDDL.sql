SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


-- -----------------------------------------------------
-- Database `sitap´
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `sitap´;


-- -----------------------------------------------------
-- Table `sitap`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `senha` VARCHAR(45) NULL ,
  `dtNascimento` DATE NULL ,
  `foto` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `endereco` VARCHAR(45) NULL ,
  `cep` VARCHAR(45) NULL ,
  `telefone` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `dtCriacao` DATETIME NULL ,
  `dtAtualizacao` DATETIME NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`noticias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Noticias` (
  `idnoticias` INT NOT NULL ,
  `noticiasCurtidas` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idnoticias`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`table1`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`table2`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`table2` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `senha` VARCHAR(45) NULL ,
  `dtNascimento` DATE NULL ,
  `foto` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `endereco` VARCHAR(45) NULL ,
  `cep` VARCHAR(45) NULL ,
  `telefone` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `dtCriacao` DATETIME NULL ,
  `dtAtualizacao` DATETIME NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Noticias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`Noticias` (
  `idnoticias` INT NOT NULL ,
  `noticiasCurtidas` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idnoticias`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`categorias`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`categorias` (
  `idCategorias` INT NOT NULL ,
  PRIMARY KEY (`idCategorias`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `email` VARCHAR(45) NULL ,
  `senha` VARCHAR(45) NULL ,
  `dtNascimento` DATE NULL ,
  `foto` VARCHAR(45) NULL ,
  `cidade` VARCHAR(45) NULL ,
  `estado` VARCHAR(45) NULL ,
  `bairro` VARCHAR(45) NULL ,
  `endereco` VARCHAR(45) NULL ,
  `cep` VARCHAR(45) NULL ,
  `telefone` VARCHAR(45) NULL ,
  `celular` VARCHAR(45) NULL ,
  `dtCriacao` DATETIME NULL ,
  `dtAtualizacao` DATETIME NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`noticia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`noticia` (
  `idnoticias` INT NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(45) NULL ,
  `texto` TEXT NULL ,
  `dtCriacao` DATETIME NULL ,
  `dtAtualizacao` DATETIME NULL ,
  `idusuario` INT NOT NULL ,
  `positivo` INT NULL ,
  `negativo` VARCHAR(45) NULL ,
  PRIMARY KEY (`idnoticias`) ,
  INDEX `fk_noticia_usuario` (`idusuario` ASC) ,
  CONSTRAINT `fk_noticia_usuario`
    FOREIGN KEY (`idusuario` )
    REFERENCES `sitap`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`comentarios`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`comentarios` (
  `idcomentarios` INT NOT NULL AUTO_INCREMENT ,
  `comentario` TEXT NULL ,
  `dtCriacao` DATETIME NULL ,
  `dtAtualizacao` DATETIME NULL ,
  `idusuario` INT NOT NULL ,
  `idnoticias` INT NOT NULL ,
  `positivo` INT NULL ,
  `negativo` INT NULL ,
  PRIMARY KEY (`idcomentarios`) ,
  INDEX `fk_comentarios_usuario1` (`idusuario` ASC) ,
  INDEX `fk_comentarios_noticia1` (`idnoticias` ASC) ,
  CONSTRAINT `fk_comentarios_usuario1`
    FOREIGN KEY (`idusuario` )
    REFERENCES `sitap`.`usuario` (`idusuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_noticia1`
    FOREIGN KEY (`idnoticias` )
    REFERENCES `sitap`.`noticia` (`idnoticias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`Foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`foto` (
  `idfoto` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `url` VARCHAR(45) NULL ,
  `foto_idfoto` INT NOT NULL ,
  `idnoticias` INT NOT NULL ,
  PRIMARY KEY (`idfoto`) ,
  INDEX `fk_foto_noticia1` (`idnoticias` ASC) ,
  CONSTRAINT `fk_foto_noticia1`
    FOREIGN KEY (`idnoticias` )
    REFERENCES `sitap`.`noticia` (`idnoticias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`table3`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`table3` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`categoria`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  PRIMARY KEY (`idcategoria`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`categoria_tem_noticia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`categoria_tem_noticia` (
  `idcategoria` INT NOT NULL ,
  `idnoticias` INT NOT NULL ,
  PRIMARY KEY (`idcategoria`, `idnoticias`) ,
  INDEX `fk_categoria_has_noticia_noticia1` (`idnoticias` ASC) ,
  INDEX `fk_categoria_has_noticia_categoria1` (`idcategoria` ASC) ,
  CONSTRAINT `fk_categoria_has_noticia_categoria1`
    FOREIGN KEY (`idcategoria` )
    REFERENCES `sitap`.`categoria` (`idcategoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria_has_noticia_noticia1`
    FOREIGN KEY (`idnoticias` )
    REFERENCES `sitap`.`noticia` (`idnoticias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`foto`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `sitap`.`foto` (
  `idfoto` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `url` VARCHAR(45) NULL ,
  `foto_idfoto` INT NOT NULL ,
  `idnoticias` INT NOT NULL ,
  PRIMARY KEY (`idfoto`) ,
  INDEX `fk_foto_noticia1` (`idnoticias` ASC) ,
  CONSTRAINT `fk_foto_noticia1`
    FOREIGN KEY (`idnoticias` )
    REFERENCES `sitap`.`noticia` (`idnoticias` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
