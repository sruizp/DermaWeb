package com.tdigital.dermaweb.service;

import java.io.Serializable;
import java.util.List;

import com.tdigital.dermaweb.bean.User;



public interface UserManager extends Serializable{

    
    public List<User> getUsers();
    
}