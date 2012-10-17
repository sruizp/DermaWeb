package com.tdigital.dermaweb.util;

import java.security.*;


public class MD5 {
	
	private static final String DEFAULT_KEY = "MD5MD5";
	
    public static String digest(String data) {
    	return digest(data, DEFAULT_KEY);
    }
	
    public static String digest(String data, String key) {
        try{
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(data.getBytes());

            byte[] result =  md5.digest(key.getBytes());
            StringBuffer sb = new StringBuffer();
            for(int i=0; i<result.length; i++){
                //Obtenemos el string correspondiente al byte
                String s = Integer.toHexString(result[i]);
                int length = s.length();
                if(length >= 2) {
                    sb.append(s.substring(length-2, length));
                } else {
                    sb.append("0");
                    sb.append(s);
                }
            }
            return sb.toString();
        }
        catch(NoSuchAlgorithmException e){
            return null;
        }
    }
    
}





