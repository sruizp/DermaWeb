package com.tdigital.dermaweb.db;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tdigital.dermaweb.bean.User;
import com.tdigital.dermaweb.db.mysql.DBConnection;
import com.tdigital.dermaweb.db.mysql.DBRecord;
import com.tdigital.dermaweb.db.mysql.DBResult;



public class UserDao extends DBConnection {
	
	protected final Log log = LogFactory.getLog(getClass());
	

	public List<User> getUserList() {		
		
		ArrayList<User> res = new ArrayList<User>();
	
	    DBResult result = null;
	    DBRecord record = null;
	      
	    try {
	        StringBuffer sql = new StringBuffer("SELECT ");
	    	sql.append("idUsuario, Usuario, Contrasenna, ");
		    sql.append("Nombre, Apellidos, Correo, Telefono, Movil, "); 
		    sql.append("Observaciones ");	    
		    sql.append("FROM Usuario ");
		    sql.append("WHERE Contrasenna <> '' ");
	    
		    sql.append("ORDER BY Apellidos, Nombre");
		    
	        log.info(sql.toString());

	        result = this.stringSelect(sql.toString());
	        for (int i = 0; i < result.getSize(); i++) {
	        	record = result.getDBRecord(i);
	        	User u = new User();
	        	u.setUserByDBRecord(record);
	        	res.add(u);
	        }
	        
	    }
	    catch (Exception ex) {
	        log.error(ex.getMessage(), ex);	  
	    }
	      
	    return res;
	}

}

