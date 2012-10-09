package es.tid.ehealth.dermaweb.bean;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import es.tid.ehealth.dermaweb.db.mysql.DBRecord;

public class User {

	protected final Log log = LogFactory.getLog(getClass());
		
	private int idUser;
	private String user = "";
	private String password = "";	
	private String name = "";
	private String surname = "";
	private String mail = "";
	private String phone = "";
	private String mobile = "";
	
	
	public void setUserByDBRecord(DBRecord rec) throws Exception {
		try {
			this.setIdUser(rec.getIntegerValue("idUsuario").intValue());
			this.setUser(rec.getStringValue(("Usuario")));
			this.setPassword(rec.getStringValue("Contrasenna"));
			this.setName(rec.getStringValue("Nombre"));
			this.setSurname(rec.getStringValue("Apellidos"));
			this.setMail(rec.getStringValue("Correo"));
			this.setPhone(rec.getStringValue("Telefono"));
			this.setMobile(rec.getStringValue("Movil"));
			
		} catch (Exception e) {
			log.error("*** Error al cargar el Usuario de BD...");
			log.error(e.getMessage(), e);
			throw (new Exception ("Error cargando Usuario de BD", e));
		}	
	}
	
	
	public int getIdUser() {
		return idUser;
	}
	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSurname() {
		return surname;
	}
	public void setSurname(String surname) {
		this.surname = surname;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
}
