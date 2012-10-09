package es.tid.ehealth.dermaweb.service;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class Login {

    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    private String user;
    private String password;
    
    
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

    
    

}