-- 
-- TABLAS DE LA Base de datos `COLABORA` referentes a la parte de Teledermatología
-- 
--

CREATE TABLE Pestanna_Telederma (
  idPestanna_Telederma INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(32) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idPestanna_Telederma)
)
TYPE=InnoDB;

CREATE TABLE Operacion_Telederma (
  idOperacion_Telederma INTEGER(10) UNSIGNED NOT NULL,
  idPestanna_Telederma INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(32) NULL,
  Descripcion VARCHAR(255) NULL,
  ActionName VARCHAR(32) NULL,
  Posicion INTEGER UNSIGNED NULL,
  PRIMARY KEY(idOperacion_Telederma),
  FOREIGN KEY(idPestanna_Telederma)
    REFERENCES Pestanna_Telederma(idPestanna_Telederma)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Subperfil_has_Operacion_Telederma (
  idSubperfil INTEGER(10) UNSIGNED NOT NULL,
  idOperacion_Telederma INTEGER(10) UNSIGNED NOT NULL,
  PRIMARY KEY(idSubperfil, idOperacion_Telederma),
  FOREIGN KEY(idSubperfil)
    REFERENCES Subperfil(idSubperfil)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idOperacion_Telederma)
    REFERENCES Operacion_Telederma(idOperacion_Telederma)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;


CREATE TABLE Paciente_Derma (
  idDatos_Demograficos INTEGER(10) UNSIGNED NOT NULL,
  CIP VARCHAR(16) NOT NULL,
  Antecedentes VARCHAR(255) NULL,
  PRIMARY KEY(idDatos_Demograficos),
  FOREIGN KEY(idDatos_Demograficos)
    REFERENCES Datos_Demograficos(idDatos_Demograficos)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;


CREATE TABLE Lesion_Tumoral (
  idLesion_Tumoral INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Asimetrica INTEGER UNSIGNED NULL,
  Bordes INTEGER UNSIGNED NULL,
  Tamanno INTEGER UNSIGNED NULL,
  NumColores INTEGER UNSIGNED NULL,
  DescColores VARCHAR(255) NULL,
  PRIMARY KEY(idLesion_Tumoral)
)
TYPE=InnoDB;

CREATE TABLE Morfologia (
  idMorfologia INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Tamanno INTEGER UNSIGNED NULL,
  DescripcionAdicional VARCHAR(255) NULL,
  PRIMARY KEY(idMorfologia)
)
TYPE=InnoDB;

CREATE TABLE Tipo_Morfologia (
  idTipo_Morfologia INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(64) NOT NULL,
  Descripcion VARCHAR(255) NOT NULL,
  PRIMARY KEY(idTipo_Morfologia)
)
TYPE=InnoDB;

CREATE TABLE Morfologia_has_Tipo_Morfologia (
  idMorfologia INTEGER(10) UNSIGNED NOT NULL,
  idTipo_Morfologia INTEGER(10) UNSIGNED NOT NULL,
  PRIMARY KEY(idMorfologia, idTipo_Morfologia),
  FOREIGN KEY(idMorfologia)
    REFERENCES Morfologia(idMorfologia)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipo_Morfologia)
    REFERENCES Tipo_Morfologia(idTipo_Morfologia)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Tipo_Lesion_Elemental (
  idTipo_Lesion_Elemental INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idTipo_Lesion_Elemental)
)
TYPE=InnoDB;

CREATE TABLE Lesion (
  idLesion INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idMorfologia INTEGER(10) UNSIGNED NULL,
  idLesion_Tumoral INTEGER(10) UNSIGNED NULL,
  TiempoEvolucion VARCHAR(255) NULL,
  PRIMARY KEY(idLesion),
  FOREIGN KEY(idLesion_Tumoral)
    REFERENCES Lesion_Tumoral(idLesion_Tumoral)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idMorfologia)
    REFERENCES Morfologia(idMorfologia)
      ON DELETE SET NULL
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Lesion_has_Tipo_Lesion_Elemental (
  idLesion INTEGER(10) UNSIGNED NOT NULL,
  idTipo_Lesion_Elemental INTEGER(10) UNSIGNED NOT NULL,
  ComentarioOtros VARCHAR(255) NULL,
  PRIMARY KEY(idLesion, idTipo_Lesion_Elemental),
  FOREIGN KEY(idLesion)
    REFERENCES Lesion(idLesion)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipo_Lesion_Elemental)
    REFERENCES Tipo_Lesion_Elemental(idTipo_Lesion_Elemental)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;


CREATE TABLE Tipo_Sintomatologia_Especifica (
  idTipo_Sintomatologia_Especifica INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idTipo_Sintomatologia_Especifica)
)
TYPE=InnoDB;

CREATE TABLE Sintomatologia (
  idSintomatologia INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idTipo_Sintomatologia_Especifica INTEGER(10) UNSIGNED NOT NULL,
  PRIMARY KEY(idSintomatologia),
  FOREIGN KEY(idTipo_Sintomatologia_Especifica)
    REFERENCES Tipo_Sintomatologia_Especifica(idTipo_Sintomatologia_Especifica)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Centro_Derivacion (
  idCentro_Derivacion INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idCentro_Derivacion)
)
TYPE=InnoDB;

CREATE TABLE Priorizacion (
  idPriorizacion INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idPriorizacion)
)
TYPE=InnoDB;


CREATE TABLE Familia_Diagnostico (
  idFamilia_Diagnostico INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idFamilia_Diagnostico)
)
TYPE=InnoDB;

CREATE TABLE Tipo_Diagnostico (
  idTipo_Diagnostico INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idFamilia_Diagnostico INTEGER(10) UNSIGNED NOT NULL,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idTipo_Diagnostico),
  FOREIGN KEY(idFamilia_Diagnostico)
    REFERENCES Familia_Diagnostico(idFamilia_Diagnostico)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Diagnostico (
  idDiagnostico INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  DiagnosticoMayor VARCHAR(255) NULL,
  DiagnosticoIntermedio VARCHAR(255) NULL,
  DiagnosticoMenor VARCHAR(255) NULL,
  idCentro_Derivacion INTEGER(10) UNSIGNED NOT NULL,
  idPriorizacion INTEGER(10) UNSIGNED NOT NULL,
  idTipo_DiagnosticoMayor INTEGER(10) UNSIGNED NULL,
  idTipo_DiagnosticoMedio INTEGER(10) UNSIGNED NULL,
  idTipo_DiagnosticoMenor INTEGER(10) UNSIGNED NULL,      
  PRIMARY KEY(idDiagnostico),
  FOREIGN KEY(idPriorizacion)
    REFERENCES Priorizacion(idPriorizacion)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idCentro_Derivacion)
    REFERENCES Centro_Derivacion(idCentro_Derivacion)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipo_DiagnosticoMayor)
    REFERENCES Tipo_Diagnostico(idTipo_Diagnostico)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipo_DiagnosticoMedio)
    REFERENCES Tipo_Diagnostico(idTipo_Diagnostico)
      ON DELETE SET NULL
      ON UPDATE CASCADE,   
  FOREIGN KEY(idTipo_DiagnosticoMenor)
    REFERENCES Tipo_Diagnostico(idTipo_Diagnostico)
      ON DELETE SET NULL
      ON UPDATE CASCADE                     
)
TYPE=InnoDB;


CREATE TABLE Informe_Derma (
  idInforme_Derma INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idDiagnosticoID INTEGER(10) UNSIGNED,
  idDiagnosticoIC INTEGER(10) UNSIGNED,
  idDiagnosticoSI INTEGER(10) UNSIGNED,
  DerivacionAdicional VARCHAR(512) NULL,
  Subperfil INTEGER UNSIGNED NULL,
  Tratamiento  VARCHAR(512) NULL,
  idMedico INTEGER(10) UNSIGNED NULL,
  PRIMARY KEY(idInforme_Derma),
  FOREIGN KEY(idDiagnosticoID)
    REFERENCES Diagnostico(idDiagnostico)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idDiagnosticoIC)
    REFERENCES Diagnostico(idDiagnostico)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idDiagnosticoSI)
    REFERENCES Diagnostico(idDiagnostico)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Citacion (
  idCitacion INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Fecha datetime NOT NULL,
  Lugar VARCHAR(64) NULL,
  Sala VARCHAR(32) NULL,
  Puerta VARCHAR(32) NULL,
  Doctor VARCHAR(128) NULL,
  PRIMARY KEY(idCitacion)
)
TYPE=InnoDB;

CREATE TABLE Estado_Episodio (
  idEstado_Episodio INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(64) NULL,
  Descripcion VARCHAR(255) NULL,
  PRIMARY KEY(idEstado_Episodio)
)
TYPE=InnoDB;

CREATE TABLE Episodio (
  idEpisodio INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idEstado_Episodio INTEGER(10) UNSIGNED NOT NULL,
  idInforme_DermaDP INTEGER(10) UNSIGNED NULL,
  idInforme_DermaTD INTEGER(10) UNSIGNED NULL,
  idInforme_DermaMC INTEGER(10) UNSIGNED NULL,
  idCitacion INTEGER(10) UNSIGNED NULL,
  idLesion INTEGER(10) UNSIGNED NULL,
  idDatos_Demograficos INTEGER(10) UNSIGNED NULL,
  SintomatologiaGeneral VARCHAR(255) NULL,
  ImagenAEA VARCHAR(64) NULL,
  ImagenCF VARCHAR(64) NULL,
  ImagenSF VARCHAR(64) NULL,
  ImagenDerma1x VARCHAR(64) NULL,
  ImagenDerma3x VARCHAR(64) NULL,
  TratamientoSintomas VARCHAR(255) NULL,
  Sexo VARCHAR(1) NULL,
  UnidadOrigen VARCHAR(255) NULL,
  Fecha datetime NOT NULL,
  FechaApertura datetime NULL,
  FechaInicioTD datetime NULL,  
  FechaPendienteCita datetime NULL,
  FechaPendienteDerma datetime NULL,
  FechaFinalizacion datetime NULL,
  NoNecesitaCitaTD INTEGER(10) UNSIGNED NULL,
  NoNecesitaCitaDP INTEGER(10) UNSIGNED NULL,
  idMedico INTEGER(10) UNSIGNED NULL,
  PRIMARY KEY(idEpisodio),
  FOREIGN KEY(idDatos_Demograficos)
    REFERENCES Paciente_Derma(idDatos_Demograficos)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idEstado_Episodio)
    REFERENCES Estado_Episodio(idEstado_Episodio)
      ON DELETE CASCADE
      ON UPDATE CASCADE,      
  FOREIGN KEY(idLesion)
    REFERENCES Lesion(idLesion)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idCitacion)
    REFERENCES Citacion(idCitacion)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idInforme_DermaMC)
    REFERENCES Informe_Derma(idInforme_Derma)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idInforme_DermaTD)
    REFERENCES Informe_Derma(idInforme_Derma)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idInforme_DermaDP)
    REFERENCES Informe_Derma(idInforme_Derma)
      ON DELETE SET NULL
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Episodio_has_Localizaciones (
  idEpisodio_has_Localizaciones INTEGER(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  idEpisodio INTEGER(10) UNSIGNED NOT NULL,
  Imagen VARCHAR(255) NULL,
  CoordenadaX INTEGER UNSIGNED NULL,
  CoordenadaY INTEGER UNSIGNED NULL,
  Modelo INTEGER UNSIGNED NULL,
  Rotacion1 FLOAT NULL,
  Rotacion2 FLOAT NULL,
  Rotacion3 FLOAT NULL,
  Rotacion4 FLOAT NULL,
  PRIMARY KEY(idEpisodio_has_Localizaciones),
  FOREIGN KEY(idEpisodio)
    REFERENCES Episodio(idEpisodio)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;

CREATE TABLE Episodio_has_Sintomatologia (
  idEpisodio INTEGER(10) UNSIGNED NOT NULL,
  idSintomatologia INTEGER(10) UNSIGNED NOT NULL,
  ComentarioOtros VARCHAR(255) NULL,
  PRIMARY KEY(idEpisodio, idSintomatologia),
  FOREIGN KEY(idEpisodio)
    REFERENCES Episodio(idEpisodio)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
  FOREIGN KEY(idSintomatologia)
    REFERENCES Sintomatologia(idSintomatologia)
      ON DELETE CASCADE
      ON UPDATE CASCADE
)
TYPE=InnoDB;