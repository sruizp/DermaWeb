###################################################################
#     CARGA MÍNIMA DE LAS TABLAS RELACIONADAS CON TELEDERMA       #
###################################################################

##########################
#TRUNCATE de las Tablas  #
##########################

TRUNCATE TABLE Pestanna_Telederma;

TRUNCATE TABLE Operacion_Telederma;

TRUNCATE TABLE Subperfil_has_Operacion_Telederma;

TRUNCATE TABLE Paciente_Derma;

TRUNCATE TABLE Lesion_Tumoral;

TRUNCATE TABLE Morfologia;

TRUNCATE TABLE Tipo_Morfologia;

TRUNCATE TABLE Morfologia_has_Tipo_Morfologia;

TRUNCATE TABLE Tipo_Lesion_Elemental;

TRUNCATE TABLE Lesion;

TRUNCATE TABLE Lesion_has_Tipo_Lesion_Elemental;

TRUNCATE TABLE Tipo_Sintomatologia_Especifica;

TRUNCATE TABLE Sintomatologia;

TRUNCATE TABLE Centro_Derivacion;

TRUNCATE TABLE Priorizacion;

TRUNCATE TABLE Diagnostico;

TRUNCATE TABLE Informe_Derma;

TRUNCATE TABLE Citacion;

TRUNCATE TABLE Estado_Episodio;

TRUNCATE TABLE Episodio;

TRUNCATE TABLE Episodio_has_Localizaciones;

TRUNCATE TABLE Episodio_has_Sintomatologia;

TRUNCATE TABLE Familia_Diagnostico;

TRUNCATE TABLE Tipo_Diagnostico;


############################################### TABLAS DEL MODELO GENERAL DE COLABOR@ ###############################################

#########################
#Subperfil       	      #
#########################
INSERT INTO Subperfil (idSubperfil, Nombre, Descripcion) VALUES (1, "medico_cabecera_telederma", "Medico de Cabecera de Teledermatología");
INSERT INTO Subperfil (idSubperfil, Nombre, Descripcion) VALUES (2, "teledermatologo", "Teledermatologo");	
INSERT INTO Subperfil (idSubperfil, Nombre, Descripcion) VALUES (3, "administrativo_telederma", "Administrativo de Teledermatología");	
INSERT INTO Subperfil (idSubperfil, Nombre, Descripcion) VALUES (4, "dermatologo_presencial", "Dermatologo Presencial");
INSERT INTO Subperfil (idSubperfil, Nombre, Descripcion) VALUES (8, "administrativo_telederma_cap", "Administrativo dermatología del CAP");
INSERT INTO Subperfil (idSubperfil, Nombre, Descripcion) VALUES (9, "dermatologo_presencial_cap", "Dermatologo Presencial del CAP");


############################
#Usuario_has_subperfil     #
############################

INSERT INTO Usuario_has_Subperfil(idUsuario,idSubperfil) VALUES (1,1);
INSERT INTO Usuario_has_Subperfil(idUsuario,idSubperfil) VALUES (2,1);


############################
#Subperfil_has_Operacion   #
############################

#Pendiente de revisar las operaciones

#Medico de cabecera
#INSERT INTO Subperfil_has_Operacion (idSubperfil, idOperacion) VALUES (1, 32);
#....



#########################
#Pestanna_Telederma	    #
#########################

INSERT INTO Pestanna_Telederma (idPestanna_Telederma, Nombre, Descripcion) VALUES (1,"ficha_dermatologica_tab_datos_demograficos","Pestaña de datos demográficos");
INSERT INTO Pestanna_Telederma (idPestanna_Telederma, Nombre, Descripcion) VALUES (2,"ficha_dermatologica_tab_datos_clinicos","Pestaña de datos clínicos");
INSERT INTO Pestanna_Telederma (idPestanna_Telederma, Nombre, Descripcion) VALUES (3,"ficha_dermatologica_tab_episodios_dermatologicos","Pestaña con los episodios dermatológicos");
INSERT INTO Pestanna_Telederma (idPestanna_Telederma, Nombre, Descripcion) VALUES (4,"ficha_dermatologica_tab_nuevo_episodio","Pestaña con el nuevo episodio dermatológico");
INSERT INTO Pestanna_Telederma (idPestanna_Telederma, Nombre, Descripcion) VALUES (5,"ficha_dermatologica_tab_derivacion","Pestaña con la derivación del paciente");
INSERT INTO Pestanna_Telederma (idPestanna_Telederma, Nombre, Descripcion) VALUES (6,"ficha_dermatologica_tab_citacion_paciente","Pestaña con la citación del paciente");


#########################
#Operacion_Telederma    #
#########################

INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (1,1, "ficha_dermatologica_tab_datos_demograficos", "Datos demográficos", "fichaDermaTabDatosDemograficos", 1);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (2,2, "tab_datos_clinicos_antecedentes_personales", "Datos clínicos con los antecedentes personales", "fichaDermaTabDatosClinicosAntecedentesPersonales", 1);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (3,2, "tab_datos_clinicos_tratamientos", "Datos clínicos con los tratamientos", "fichaDermaTabDatosClinicosTratamientos", 2);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (4,2, "tab_datos_clinicos_antecedentes_familiares", "Datos clínicos con los antecedentes familiares", "fichaDermaTabDatosClinicosAntecedentesFamiliares", 3);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (5,2, "tab_datos_clinicos_ultima_analitica", "Datos clínicos con la última analítica", "fichaDermaTabDatosClinicosUltimaAnalitica", 4);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (6,3, "tab_episodio_localizacion", "Episodios dermatológicos con la localización", "fichaDermaTabEpisodiosLocalizacion", 1);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (7,3, "tab_episodio_descripcion_lesiones", "Episodios dermatológicos con la descripción de las lesiones", "fichaDermaTabEpisodiosDescripcionLesiones", 2);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (8,3, "tab_episodio_sintomatologia", "Episodios dermatológicos con la sintomatología", "fichaDermaTabEpisodiosSintomatologia", 3);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (9,3, "tab_episodio_imagenes", "Episodios dermatológicos con las imágenes", "fichaDermaTabEpisodiosImagenes", 4);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (10,3, "tab_episodio_informes_medico_cabecera", "Episodios dermatológicos con el informe del medico de cabecera", "fichaDermaTabEpisodiosInformesMedicoCabecera", 5);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (12,3, "tab_episodio_diagnostico_sin_imagenes", "Episodios dermatológicos con el diagnóstico sin imágenes", "fichaDermaTabEpisodiosDiagnosticoSinImagenes", 4);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (13,3, "tab_episodio_diagnostico_imagenes_clinicas", "Episodios dermatológicos con el diagnóstico con imagnes clínicas", "fichaDermaTabEpisodiosDiagnosticoImagenesClinicas", 4);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (14,3, "tab_episodio_diagnostico_imagenes_dermatoscopicas", "Episodios dermatológicos con el diagnóstico con imagnes dermatoscópicas", "fichaDermaTabEpisodiosDiagnosticoImagenesDermatoscopicas", 4);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (15,3, "ficha_dermatologica_tab_derivacion", "Episodios dermatológicos con la derivación", "fichaDermaTabEpisodiosDerivacion", 5);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (16,3, "tab_episodio_informes_consulta_teledermatologo", "Episodios dermatológicos con los informes del teledermatólogo", "fichaDermaTabEpisodiosInformesTeledermatologo", 5);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (17,3, "tab_episodio_informes_dermatologo_presencial", "Episodios dermatológicos con los informes", "fichaDermaTabEpisodiosInformesDermatologoPresencial", 5);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (18,4, "tab_nuevo_episodio_localizacion", "Nuevo episodio dermatológico con la localizacion", "fichaDermaTabNuevoEpisodioLocalizacion", 1);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (19,4, "tab_nuevo_episodio_lesiones", "Nuevo episodio dermatológico con las lesiones", "fichaDermaTabNuevoEpisodioLesiones", 2);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (20,4, "tab_nuevo_episodio_sintomatologia", "Nuevo episodio dermatológico con la sintomatología", "fichaDermaTabNuevoEpisodioSintomatologia", 3);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (21,4, "tab_nuevo_episodio_imagenes", "Nuevo episodio dermatológico con las imágenes", "fichaDermaTabNuevoEpisodioImagenes", 4);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (22,4, "tab_nuevo_episodio_informes", "Nuevo episodio dermatológico con el informe", "fichaDermaTabNuevoEpisodioInformes", 5);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (23,5, "ficha_dermatologica_tab_derivacion", "Derivación por el administrativo", "fichaDermaDerivacion", 1);
INSERT INTO Operacion_Telederma (idOperacion_Telederma, idPestanna_Telederma, Nombre, Descripcion, ActionName, Posicion) VALUES (24,6, "ficha_dermatologica_tab_citacion_paciente", "Citación por el administrativo", "fichaDermaCitacion", 1);

######################################
#Subperfil_has_Operacion_Telederma   #
######################################

INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 1);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 2);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 3);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 4);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 5);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 6);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 7);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 8);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 9);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 10);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 18);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 19);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 20);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 21);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (1, 22);

INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 1);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 2);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 3);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 4);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 5);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 6);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 7);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 8);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 9);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 12);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 13);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 14);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 15);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (2, 16);

INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (3, 1);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (3, 23);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (3, 24);

INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 1);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 2);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 3);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 4);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 5);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 6);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 7);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 8);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 9);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (4, 17);

INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (8, 1);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (8, 23);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (8, 24);


INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 1);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 2);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 3);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 4);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 5);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 6);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 7);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 8);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 9);
INSERT INTO Subperfil_has_Operacion_Telederma (idSubperfil, idOperacion_Telederma) VALUES (9, 17);



########################
#Estado_Episodio       #
########################     

INSERT INTO Estado_Episodio (idEstado_Episodio, Nombre, Descripcion) VALUES (1, "ficha_dermatologica_episodio_pendiente_derivacion", "Episodio pendiente de ser derivado por el teledermatologo");
INSERT INTO Estado_Episodio (idEstado_Episodio, Nombre, Descripcion) VALUES (2, "ficha_dermatologica_episodio_pendiente_citacion", "Episodio pendiente de citación por el administrativo");
INSERT INTO Estado_Episodio (idEstado_Episodio, Nombre, Descripcion) VALUES (3, "ficha_dermatologica_episodio_pendiente_diagnostico_dermatologo_presencial", "Episodio pendiente de diagnóstico por el dermatólogo presencial");
INSERT INTO Estado_Episodio (idEstado_Episodio, Nombre, Descripcion) VALUES (4, "ficha_dermatologica_episodio_finalizado", "Episodio finalizado");

#########################
#Tipo_Lesion_Elemental  #
#########################

INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (1, "ficha_dermatologica_lesion_elemental_macula", "Macula");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (2, "ficha_dermatologica_lesion_elemental_habon", "Habón");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (3, "ficha_dermatologica_lesion_elemental_vesicula", "Vesícula");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (4, "ficha_dermatologica_lesion_elemental_costra", "Costra");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (5, "ficha_dermatologica_lesion_elemental_papula", "Pápula");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (6, "ficha_dermatologica_lesion_elemental_nodulo", "Nódulo");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (7, "ficha_dermatologica_lesion_elemental_pustula", "Pústula");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (8, "ficha_dermatologica_lesion_elemental_placa", "Placa");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (9, "ficha_dermatologica_lesion_elemental_quiste", "Quiste");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (10, "ficha_dermatologica_lesion_elemental_escama", "Escama");
INSERT INTO Tipo_Lesion_Elemental (idTipo_Lesion_Elemental, Nombre, Descripcion) VALUES (11, "ficha_dermatologica_lesion_elemental_otras", "Otros");


######################
#Tipo_Morfologia	   #
######################

INSERT INTO Tipo_Morfologia (idTipo_Morfologia, Nombre, Descripcion) VALUES (1, "ficha_dermatologica_morfologia_anular", "Anular");
INSERT INTO Tipo_Morfologia (idTipo_Morfologia, Nombre, Descripcion) VALUES (2, "ficha_dermatologica_morfologia_lineal", "Lineal");
INSERT INTO Tipo_Morfologia (idTipo_Morfologia, Nombre, Descripcion) VALUES (3, "ficha_dermatologica_morfologia_reticulada", "Reticulada");
INSERT INTO Tipo_Morfologia (idTipo_Morfologia, Nombre, Descripcion) VALUES (4, "ficha_dermatologica_morfologia_confluente", "Confluente");


##################################
#Tipo_Sintomatologia_Especifica  #
##################################

INSERT INTO Tipo_Sintomatologia_Especifica (idTipo_Sintomatologia_Especifica, Nombre, Descripcion) VALUES (1, "ficha_dermatologica_sintomatologia_especifica_asintomatico", "Asintomático");
INSERT INTO Tipo_Sintomatologia_Especifica (idTipo_Sintomatologia_Especifica, Nombre, Descripcion) VALUES (2, "ficha_dermatologica_sintomatologia_especifica_dolor", "Dolor");
INSERT INTO Tipo_Sintomatologia_Especifica (idTipo_Sintomatologia_Especifica, Nombre, Descripcion) VALUES (3, "ficha_dermatologica_sintomatologia_especifica_picor", "Picor");
INSERT INTO Tipo_Sintomatologia_Especifica (idTipo_Sintomatologia_Especifica, Nombre, Descripcion) VALUES (4, "ficha_dermatologica_sintomatologia_especifica_quemazon", "Quemazón");
INSERT INTO Tipo_Sintomatologia_Especifica (idTipo_Sintomatologia_Especifica, Nombre, Descripcion) VALUES (5, "ficha_dermatologica_sintomatologia_otros", "Otros");


#####################
#Centro_Derivacion	#
#####################

INSERT INTO Centro_Derivacion (idCentro_Derivacion, Nombre, Descripcion) VALUES (1, "ficha_dermatologica_centro_derivacion_quirofano", "Quirófano del hospital");
INSERT INTO Centro_Derivacion (idCentro_Derivacion, Nombre, Descripcion) VALUES (2, "ficha_dermatologica_centro_derivacion_dermatologo_hospital", "Dermatólogo del hospital");
INSERT INTO Centro_Derivacion (idCentro_Derivacion, Nombre, Descripcion) VALUES (3, "ficha_dermatologica_centro_derivacion_dermatologo_ambulatorio", "Dermatólogo del CAP");
INSERT INTO Centro_Derivacion (idCentro_Derivacion, Nombre, Descripcion) VALUES (4, "ficha_dermatologica_centro_derivacion_quirofano_ambulatorio", "Quirófano del CAP");
INSERT INTO Centro_Derivacion (idCentro_Derivacion, Nombre, Descripcion) VALUES (5, "ficha_dermatologica_centro_derivacion_no_centro", "Sin derivar a dermatólogo");


#####################
#Priorizacion     	#
#####################
	
INSERT INTO Priorizacion (idPriorizacion, Nombre, Descripcion) VALUES (1, "ficha_dermatologica_priorizacion_derivacion_urgente", "Urgente");
INSERT INTO Priorizacion (idPriorizacion, Nombre, Descripcion) VALUES (2, "ficha_dermatologica_priorizacion_derivacion_preferente", "Preferente");
INSERT INTO Priorizacion (idPriorizacion, Nombre, Descripcion) VALUES (3, "ficha_dermatologica_priorizacion_derivacion_ordinaria", "Ordinaria");


#######################
#Familia_Diagnostico 	#
#######################

INSERT INTO Familia_Diagnostico (idFamilia_Diagnostico, Nombre, Descripcion) VALUES (1, "Tumor benigno", "tumor_benigno");
INSERT INTO Familia_Diagnostico (idFamilia_Diagnostico, Nombre, Descripcion) VALUES (2, "Tumor maligno", "tumor_maligno");
INSERT INTO Familia_Diagnostico (idFamilia_Diagnostico, Nombre, Descripcion) VALUES (3, "Tumor premaligno", "infeccion");
INSERT INTO Familia_Diagnostico (idFamilia_Diagnostico, Nombre, Descripcion) VALUES (4, "Infeccion", "infeccion");
INSERT INTO Familia_Diagnostico (idFamilia_Diagnostico, Nombre, Descripcion) VALUES (5, "Inflamacion", "inflamacion");
INSERT INTO Familia_Diagnostico (idFamilia_Diagnostico, Nombre, Descripcion) VALUES (6, "Otros diagnosticos", "otros_diagnosticos");


######################
#Tipo_Diagnostico    #
######################   

##TUMOR BENIGNO	 --> IDFMAILIA 1  --> COMIENZA EN ID 1
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (1, 1, "Queratosis seborreica", "702.19");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (2, 1, "Lentigo solar", "692.79");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (3, 1, "Melanosis idiopatica mucosas", "709.09");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (4, 1, "Fibroma blando", "215.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (5, 1, "Dermatofibroma", "216.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (6, 1, "Angioma", "228.01");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (7, 1, "Nevus melanocitico ", "216.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (8, 1, "Nevus melanocitico banal", "216.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (9, 1, "Nevus epidermico", "216.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (10, 1, "Granuloma piogenico", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (11, 1, "Lipoma", "214.1");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (12, 1, "Quiste infundifular", "706.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (13, 1, "Otros quistes", "706.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (14, 1, "Otros tumores benignos", "216.9");

##TUMOR MALIGNO	 --> IDFMAILIA 2  --> COMIENZA EN ID 21
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (21, 2, "Enfermedad de Bowen", "232.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (22, 2, "Carcinoma basocelular", "173.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (23, 2, "Carcinoma escamoso cutaneo", "173.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (24, 2, "Melanoma", "172.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (25, 2, "Metastasis cutanea", "198.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (26, 2, "Otros tumores malignos", "173.9");

##TUMOR PREMALIGNO	--> IDFMAILIA 3  --> COMIENZA EN ID 31
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (31, 3, "Queratosis actinica", "702.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (32, 3, "Nevus displasico", "238.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (33, 3, "Queilitis actinica", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (34, 3, "Leucoplasia", "");

##INFECCION	--> IDFMAILIA 4  --> COMIENZA EN ID 41
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (41, 4, "Impetigo", "684");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (42, 4, "Foliculitis", "704.8");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (43, 4, "Forunculo", "680.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (44, 4, "Erisipela", "035");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (45, 4, "Celulitis", "682.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (46, 4, "Tiña", "110.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (47, 4, "Candidiasis muco-cutanea", "112.3");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (48, 4, "Pitiriasis versicolor", "111.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (49, 4, "Molluscum", "078.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (50, 4, "Verrugas vulgares", " 078.10");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (51, 4, "Condilomas", "078.11");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (52, 4, "Herpes", "054.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (53, 4, "Sifilis primaria", "091.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (54, 4, "Sifilis segundaria", "091.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (55, 4, "Otras infecciones", "686.9");

INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (56, 4, "Escabiosis", "133.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (57, 4, "Leishmaniasis", "085");

##INFLAMACION --> IDFMAILIA 5  --> COMIENZA EN ID 61
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (61, 5, "Acne", "706.1");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (62, 5, "Rosacea", "695.3");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (63, 5, "Psoriasis", "696.1");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (64, 5, "Dermatitis seborreica", "690.10");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (65, 5, "Eccema atopico", "691.8");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (66, 5, "Queratosis folicular", "701.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (67, 5, "Pitiriasis alba", "696.5");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (68, 5, "Dermatitis/Eccema", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (69, 5, "Eccema de contacto", "692.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (70, 5, "Eccema dishidrotico", "705.81");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (71, 5, "Eccema microbiano", "692.89");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (72, 5, "Eccema numular", "692.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (73, 5, "Eccema xerotico", "706.8");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (74, 5, "Xerosis", "706.8");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (75, 5, "Prurigo", "698.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (76, 5, "Urticaria", "708.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (77, 5, "Alopecia areata", "704.01");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (78, 5, "Alopecia cicatricial", "704.09");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (79, 5, "Vitiligo", "709.01");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (80, 5, "Liquen simple cronico", "698.3");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (81, 5, "Liquen plano", "697.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (82, 5, "Liquen escleroso y atrofico", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (83, 5, "Pitiriasis rosada de Gibert", "696.3");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (84, 5, "Eritema multiforme", "695.1");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (85, 5, "Erupcion cutanea medicamentosa", "693.0");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (86, 5, "Picaduras", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (87, 5, "Vasculitis cutanea", "709.1");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (88, 5, "Lupus", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (89, 5, "Esclerodermia", "");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (90, 5, "Otras inflamaciones", "692.9");

##OTROS DIAGNOSTICOS --> IDFMAILIA 6  --> COMIENZA EN ID 101
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (101, 6, "Heloma", "700");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (102, 6, "Alopecia androgenetica", "704.00");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (103, 6, "Alopecia no cicatricial", "704.09");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (104, 6, "Prurito sine materia", "698.9");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (105, 6, "Glosodinia", "529.6");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (106, 6, "Dermatosis facticia", "698.4");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (107, 6, "Genodermatosis", "757.1");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (108, 6, "Melasma", "709.09");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (109, 6, "Xantelasma (o cloasma)", "272.2");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (110, 6, "Amiloidosis cutanea", "277.39");
INSERT INTO Tipo_Diagnostico (idTipo_Diagnostico, idFamilia_Diagnostico, Nombre, Descripcion) VALUES (111, 6, "Otros", "709.8");
