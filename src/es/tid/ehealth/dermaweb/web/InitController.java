package es.tid.ehealth.dermaweb.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import es.tid.ehealth.dermaweb.service.UserManager;

public class InitController  implements Controller { 

	protected final Log log = LogFactory.getLog(getClass());
	

    private UserManager userManager;
	
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
		String random = String.valueOf((Math.random()*10.0));
	    log.info("TO HELLO page....: "+random);
	    
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("users", this.userManager.getUsers());
	    

        return new ModelAndView("hello", "model", myModel);
	}
	
	
    public void setUserManager(UserManager userManager) {
        this.userManager = userManager;
    }

}
