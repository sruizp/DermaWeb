package com.tdigital.dermaweb.service;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.tdigital.dermaweb.bean.User;
import com.tdigital.dermaweb.db.UserDao;



public class UserDBManager implements UserManager {
	
	 /** Logger for this class and subclasses */
    protected final Log logger = LogFactory.getLog(getClass());

    // private List<Product> products;
    private UserDao userDao;
    
    
    public UserDBManager () {
    	userDao = new UserDao();
    }


	public List<User> getUsers() {	
		return userDao.getUserList();
	}
	
	
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
	

}
