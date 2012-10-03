
##############################################
# Elimina las tablas de Teledermatología     #
##############################################


DROP TABLE Episodio_has_Sintomatologia;
DROP TABLE Episodio_has_Localizaciones;
DROP TABLE Episodio;

DROP TABLE Paciente_Derma;

DROP TABLE Sintomatologia;
DROP TABLE Tipo_Sintomatologia_Especifica;

DROP TABLE Citacion;

DROP TABLE Informe_Derma;
DROP TABLE Diagnostico;
DROP TABLE Tipo_Diagnostico;
DROP TABLE Familia_Diagnostico;
DROP TABLE Priorizacion;
DROP TABLE Centro_Derivacion;

DROP TABLE Estado_Episodio;

DROP TABLE Lesion_has_Tipo_Lesion_Elemental;
DROP TABLE Tipo_Lesion_Elemental;
DROP TABLE Lesion;
DROP TABLE Lesion_Tumoral;
DROP TABLE Morfologia_has_Tipo_Morfologia;
DROP TABLE Tipo_Morfologia;
DROP TABLE Morfologia;

DROP TABLE Subperfil_has_Operacion_Telederma;
DROP TABLE Operacion_Telederma;
DROP TABLE Pestanna_Telederma;