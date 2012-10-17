package com.tdigital.dermaweb.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tdigital.dermaweb.service.UserManager;

@Controller
public class InitController {

	protected final Log log = LogFactory.getLog(getClass());
	
	@Autowired
	private UserManager userManager;
	
    @RequestMapping(value="/hello.htm")
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	
		String random = String.valueOf((Math.random()*10.0));
	    log.info("TO HELLO page....: "+random);
	    
        Map<String, Object> myModel = new HashMap<String, Object>();
        myModel.put("users", this.userManager.getUsers());
	    
        return new ModelAndView("hello", "model", myModel);
	}
    
    
	@ExceptionHandler(Exception.class)
	public ModelAndView Exception(Exception e , HttpServletRequest request){

		return new ModelAndView("error");
	}

}
