package es.tid.ehealth.dermaweb.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import es.tid.ehealth.dermaweb.bean.User;

public class LoginValidator implements Validator {
	
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

	public boolean supports(Class aClass) {
		return Login.class.equals(aClass);
	}
 
	public void validate(Object obj, Errors errors) {
		
		logger.info("VALIDATE...");
		Login login = (Login) obj;
		
		logger.info("User: "+login.getUser());
		logger.info("Password: "+login.getPassword());
 
		//Field not empty
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user", "field.required", "Inserte el usuario");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "field.required", "Inserte la contraseña");
		
		
		if (!login.getUser().equals("admin")) {
			errors.rejectValue("user", "unknown.user", "Unknown User");
		}
		else if (!login.getPassword().equals("admin")) {
			errors.rejectValue("password", "wrong.password", "Wrong Password");
		 }  

	
	}

}
