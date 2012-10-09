package es.tid.ehealth.dermaweb.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import es.tid.ehealth.dermaweb.bean.User;
import es.tid.ehealth.dermaweb.service.Login;
import es.tid.ehealth.dermaweb.service.UserManager;

public class LoginController extends SimpleFormController {
	
    /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    private UserManager userManager;

    public ModelAndView onSubmit(Object command)
            throws ServletException {

        String sUser = ((Login) command).getUser();
        logger.info("User trying login '" + sUser + "'");

        List<User> users = this.userManager.getUsers();

       

        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("users", users);
        
        //Check if the users is in the system
        boolean userFound = false;
        Iterator iter = users.iterator();
        while (iter.hasNext() && !userFound) {
        	User userAux = (User)iter.next();
        	if (userAux.getUser().equals(sUser)) {
        		userFound = true;
        		logger.info("User FOUND......");
        	}
        }

        if (userFound) {
        	logger.info("Returning from LoginController view to " + getSuccessView());
        	return new ModelAndView(new RedirectView(getSuccessView()), "model", myModel);
        }
        else {
        	//Must to use the LoginValidator?
        	//Get an error view
        	myModel.put("loginError", "No se ha podido realizar el login");
        	logger.info("Login ERROR.....");
        	return new ModelAndView(new RedirectView(getSuccessView()), "model", myModel);
        }
    }

    protected Login formBackingObject(HttpServletRequest request) throws ServletException {
        Login login = new Login();
        //login.setUser("Inserta usuario");
        //login.setPassword("Inserta contraseña");
        return login;
    }
	
    public void setUserManager(UserManager userManager) {
        this.userManager = userManager;
    }

    public UserManager getUserManager() {
        return userManager;
    }

}
