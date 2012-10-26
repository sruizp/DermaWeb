package com.tdigital.dermaweb.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tdigital.dermaweb.bean.User;
import com.tdigital.dermaweb.service.UserManager;
import com.tdigital.dermaweb.util.MD5;
import com.tdigital.dermaweb.web.form.LoginForm;
import com.tdigital.dermaweb.web.validator.LoginValidator;


@Controller
@RequestMapping(value="/login.htm")
public class LoginController {
	
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());
    
	@Autowired
	private UserManager userManager;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
        binder.setValidator(new LoginValidator());
    }

	@RequestMapping(method = RequestMethod.POST)
	//public String onSubmit(@ModelAttribute AlumnoForm alumnoForm, BindingResult result)
	public String onSubmit(@Validated LoginForm loginForm, BindingResult result, HttpServletResponse response)
	{
        String sUser = loginForm.getUser();
        logger.info("User trying login '" + sUser + "'");
          
		if(result.hasErrors()){
			return "login";
		}

        List<User> users = this.userManager.getUsers(); 

        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("users", users);
        
        //Check if the users is in the system
		String passFormEnc = MD5.digest(loginForm.getPassword());
        boolean userFound = false;
        boolean passOk = true;
        
        Iterator iter = users.iterator();
        while (iter.hasNext() && !userFound) {
        	User userAux = (User)iter.next();
        	logger.info("User: "+userAux);
        	
        	if (userAux.getUser().equals(sUser)) {
        		userFound = true;
        		logger.info("User FOUND......");
        		
				if (!passFormEnc.equals(userAux.getPassword())) {
					passOk = false;
				}
        	}
        }
        
        if (userFound) {   	
        	if (passOk) {
	        	logger.info("Returning from LoginController view to login.htm" );
	        	return "redirect:/init.htm";
        	}
        	else {
            	myModel.put("loginError", "Password incorrecta");
            	logger.info("Login ERROR (Password).....");
            	return "login";
        	}
        }     
        
        else {
        	myModel.put("loginError", "Usuario no encontrado");
        	logger.info("Login ERROR (User).....");
        	return "login";
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    protected LoginForm formBackingObject(HttpServletRequest request) throws ServletException {
        logger.info("FormBacking...");
    	LoginForm login = new LoginForm();
        login.setUser("administrador");
        login.setPassword("1qaz1");
        return login;
    }
    
    
	@ExceptionHandler(Exception.class)
	public ModelAndView Exception(Exception e , HttpServletRequest request){
		logger.info("EXCEPTION :"+e.getMessage());
		return new ModelAndView("error");
	}


}
