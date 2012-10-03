###################################################################################################################################
#                                                                COLABOR@	      						                                      #
###################################################################################################################################

##########################
#TRUNCATE de las Tablas  #
##########################

TRUNCATE TABLE Datos_Demograficos;

TRUNCATE TABLE Perfil;

TRUNCATE TABLE Operacion;

TRUNCATE TABLE Usuario;

TRUNCATE TABLE Imagen_Contacto;

TRUNCATE TABLE Subperfil;

TRUNCATE TABLE Subperfil_has_Operacion;

TRUNCATE TABLE Usuario_has_Subperfil;


#######################
#Perfiles             #
#######################

INSERT INTO Perfil (idPerfil, Nombre, Descripcion) VALUES (1, "Administrador", "Permiso total");
INSERT INTO Perfil (idPerfil, Nombre, Descripcion) VALUES (2, "Usuario", "Usuario con permisos totales excepto de admnistración");


#####################
#Operacion    			#
#####################

#Pendientes de Revisar las operaciones 

#INSERT INTO Operacion (idOperacion, Nombre, idPerfil, idNivel_Servicio, Descripcion, Tipo, Padre, Imagen, ActionName, Posicion, Menu, idPestanna) 
#	VALUES (1, "menu_administracion", 2, 0, "Administración", 1, 0, "icono_administracion_24.png", "", 1, 1, 0);
	
#INSERT INTO Operacion (idOperacion, Nombre, idPerfil, idNivel_Servicio, Descripcion, Tipo, Padre, Imagen, ActionName, Posicion, Menu, idPestanna) 
#	VALUES (12, "menu_configuracion", 3, 0, "Configuración", 1, 0, "icono_configuracion_24.png", "", 2, 1, 0);	
	
#INSERT INTO Operacion (idOperacion, Nombre, idPerfil, idNivel_Servicio, Descripcion, Tipo, Padre, Imagen, ActionName, Posicion, Menu, idPestanna)
#	VALUES (11, "menu_conferencias", 3, 0, "Conferencias", 1, 0, "icono_conferencias_24.png", "", 3, 1, 0);
	
#INSERT INTO Operacion (idOperacion, Nombre, idPerfil, idNivel_Servicio, Descripcion, Tipo, Padre, Imagen, ActionName, Posicion, Menu, idPestanna) 
#	VALUES (13, "menu_correspondencia", 3, 0, "Correspondencia", 1, 0, "icono_correspondencia_24.png", "", 4, 1, 0);	


#####################
#Usuario	        #
#####################

#administrador: administrador / 1qaz1
INSERT INTO Usuario (idPerfil, Usuario, Contrasenna, Nombre, Apellidos, Correo, Telefono, Movil, Observaciones) 
	VALUES (1, "administrador", "ce3aaa756a3f31fc3a3474ddda3c8b11", "Administrador", NULL, NULL, NULL, NULL, "Usuario Administrador");


#usuario avanzado: usuario / 1qaz3
INSERT INTO Usuario (idPerfil, Usuario, Contrasenna, Nombre, Apellidos, Correo, Telefono, Movil, Observaciones) 
	VALUES (2 , "usuario", "595f9efecfc361e4bf2000bb65cc3832", "Usuario", NULL, NULL, NULL, NULL, "Usuario");


###########################################################################################################
#									ALTER TABLES														  #
###########################################################################################################

#inicializar la secuencia de la tabla Usuario a partir de 10 (siguiente en insertar 11)
ALTER TABLE Usuario AUTO_INCREMENT = 11;

