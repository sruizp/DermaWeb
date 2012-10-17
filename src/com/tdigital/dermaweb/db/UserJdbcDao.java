package com.tdigital.dermaweb.db;

import java.util.ArrayList;
import java.util.List;

import com.tdigital.dermaweb.bean.User;



public class UserJdbcDao {


	public List<User> getUserList() {		
		ArrayList<User> aux = new ArrayList<User>();
		User u1 = new User();
		u1.setName("PEPE");
		User u2 = new User();
		u2.setName("PACO");
		User u3 = new User();
		u3.setName("VENDETA");

		aux.add(u1);
		aux.add(u2);
		aux.add(u3);
		
		return aux;
	}
	
	
	
	
	
	
	
	
    /**private static class UserMapper implements ParameterizedRowMapper<User> {

        public User mapRow(ResultSet rs, int rowNum) throws SQLException {
            User user = new User();
            user.setIdUser(rs.getInt("idUsuario"));
            //the other fields
            return user;
        }
    }**/

}
