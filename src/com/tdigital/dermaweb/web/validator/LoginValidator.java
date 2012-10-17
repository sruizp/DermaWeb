package com.tdigital.dermaweb.web.validator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tdigital.dermaweb.web.form.LoginForm;


public class LoginValidator implements Validator {
	
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

	public boolean supports(Class aClass) {
		return LoginForm.class.equals(aClass);
	}
 
	public void validate(Object obj, Errors errors) {
		
		logger.info("VALIDATE...");
		LoginForm login = (LoginForm) obj;
		
		logger.info("User: '"+login.getUser()+"'");
		logger.info("Password: '"+login.getPassword()+"'");
 
		//Field not empty
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "user", "field.required", "Inserte el usuario");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "field.required", "Inserte la contraseña");
	
		if (!errors.hasFieldErrors("user") && login.getUser().length() > 16) {
			logger.info("User not admin...");
			errors.rejectValue("user", "size.user", "Usuario máximo de 16 caracteres");
		}
		else if (!errors.hasFieldErrors("password") && login.getPassword().length() > 16) {
			logger.info("Password not admin...");
			errors.rejectValue("password", "size.password", "Contraseña máximo de 16 caracteres");
		 }
	}

}
