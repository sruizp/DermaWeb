-- 
-- Base de datos: `COLABORA`
-- 
--
-- CREATE DATABASE TELEDERMA;


CREATE TABLE Datos_Demograficos (
  idDatos_Demograficos INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idPaciente VARCHAR(32) NULL,
  Nombre VARCHAR(32) NULL,
  Apellido1 VARCHAR(32) NULL,
  Apellido2 VARCHAR(32) NULL,
  DNI VARCHAR(16) NULL,
  NUHSA VARCHAR(32) NULL,
  TarjetaSanitaria VARCHAR(32) NULL,
  FechaNacimiento DATE NULL,
  Sexo VARCHAR(1) NULL,
  Nacionalidad VARCHAR(32) NULL,
  Domicilio VARCHAR(64) NULL,
  Provincia VARCHAR(32) NULL,
  Localidad VARCHAR(32) NULL,
  CP VARCHAR(16) NULL,
  Movil VARCHAR(16) NULL,
  Telefono VARCHAR(16) NULL,
  Correo VARCHAR(64) NULL,
  NHC VARCHAR(32) NULL,
  Centro VARCHAR(255) NULL,
  PRIMARY KEY(idDatos_Demograficos)
)
TYPE=InnoDB;


CREATE TABLE Perfil (
  idPerfil INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(32) NOT NULL,
  Descripcion VARCHAR(255) NOT NULL,
  PRIMARY KEY(idPerfil)
)
TYPE=InnoDB;


CREATE TABLE Operacion (
  idOperacion INTEGER(10) UNSIGNED NOT NULL,
  idPerfil INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(32) NOT NULL,
  Descripcion VARCHAR(255) NULL,
  Tipo INTEGER UNSIGNED NOT NULL,
  Padre INTEGER UNSIGNED NOT NULL,
  Imagen VARCHAR(64) NULL,
  ActionName VARCHAR(32) BINARY NOT NULL,
  Posicion INTEGER(10) UNSIGNED NULL,
  Menu INTEGER(10) UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY(idOperacion),
  INDEX Operacion_FKIndex1(idPerfil),
  FOREIGN KEY(idPerfil)
    REFERENCES Perfil(idPerfil)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;


CREATE TABLE Usuario (
  idUsuario INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idPerfil INTEGER(10) UNSIGNED NULL,
  Usuario VARCHAR(16) NOT NULL,
  Contrasenna VARCHAR(32) NOT NULL,
  Nombre VARCHAR(32) NULL,
  Apellidos VARCHAR(64) NULL,
  Correo VARCHAR(64) NULL,
  Telefono VARCHAR(16) NULL,
  Movil VARCHAR(16) NULL,
  Observaciones VARCHAR(255) NULL,
  Idioma VARCHAR(5) NULL,
  FechaAlta DATETIME NULL,
  PRIMARY KEY(idUsuario),
  INDEX Usuario_FKIndex1(idPerfil),
  FOREIGN KEY(idPerfil)
    REFERENCES Perfil(idPerfil)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;


CREATE TABLE Imagen_Contacto (
  idUsuario int(10) UNSIGNED NOT NULL,
  Imagen blob,
  Nombre varchar(64) NULL,
  PRIMARY KEY  (idUsuario),
  INDEX Imagen_Contacto_FKIndex1 (idUsuario),
  FOREIGN KEY(idUsuario)
    REFERENCES Usuario(idUsuario)
      ON DELETE CASCADE
      ON UPDATE CASCADE
) 
TYPE=InnoDB;


CREATE TABLE Subperfil (
  idSubperfil INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(32) NOT NULL,
  Descripcion VARCHAR(255) NOT NULL,
  PRIMARY KEY(idSubperfil)
)
TYPE=InnoDB;


CREATE TABLE Subperfil_has_Operacion (
  idSubperfil INTEGER(10) UNSIGNED NOT NULL,
  idOperacion INTEGER(10) UNSIGNED NOT NULL,
  PRIMARY KEY(idSubperfil, idOperacion),
  FOREIGN KEY(idSubperfil)
    REFERENCES Subperfil(idSubperfil)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idOperacion)
    REFERENCES Operacion(idOperacion)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;


CREATE TABLE Usuario_has_Subperfil (
  idUsuario INTEGER(10) UNSIGNED NOT NULL,
  idSubperfil INTEGER(10) UNSIGNED NOT NULL,
  PRIMARY KEY(idUsuario, idSubperfil),
  FOREIGN KEY(idSubperfil)
    REFERENCES Subperfil(idSubperfil)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idUsuario)
    REFERENCES Usuario(idUsuario)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;
