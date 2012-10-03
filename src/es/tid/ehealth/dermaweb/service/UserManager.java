package es.tid.ehealth.dermaweb.service;

import java.io.Serializable;
import java.util.List;

import es.tid.ehealth.dermaweb.domain.User;


public interface UserManager extends Serializable{

    
    public List<User> getUsers();
    
}