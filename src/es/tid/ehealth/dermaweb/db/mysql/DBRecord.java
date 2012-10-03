package es.tid.ehealth.dermaweb.db.mysql;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;



/**
 * Clase DBRecord que encapsula las filas de una tabla de base de datos
 * 
 * @author TID
 * @version 1.0
 */
public class DBRecord implements java.io.Serializable {

	private static final long serialVersionUID = 3068963571150186626L;
	
	private Hashtable<String, Object> values;

	public DBRecord() {
		values = new Hashtable<String, Object>();
	}

	/**
	 * A�ade un valor al campo indicado por sKey
	 * @param key The field name
	 * @param object field value
	 */
	public void addField(String sKey, Object object) {
		values.put(sKey, object);
	}
	

	/**
	 * Devuelve un ArrayList con todos los nombres de los campos del registros
	 * @return
	 */
	public ArrayList<String> getKeys() {
		ArrayList<String> keys = new ArrayList<String>();
		
		Set<String> keySet = values.keySet();
		Iterator<String> it = keySet.iterator();

		//Recorremos toda la lista de atributos de la entidad.
		while (it.hasNext()) {
			String key = it.next();
			keys.add(key);
		}	
		
		return keys;
	}
	
	
	/**
	 * Obtiene el valor del campo como un Object
	 * 
	 * @param key Nombre del campo
	 * @return Un String con el valor
	 */
	public Object getValue(String key) {
		Object obj = values.get(key);
		if (obj == null) {
			return null;
		} else {
			return (Object) obj;
		}
	}
	

	/**
	 * Obtiene el valor del campo como un String
	 * 
	 * @param key Nombre del campo
	 * @return Un String con el valor
	 */
	public String getStringValue(String key) {
		Object obj = values.get(key);
		if (obj == null) {
			return "";
		} else {
			return (String) obj;
		}
	}

	/**
	 * Obtiene el valor del campo como un Integer
	 * 
	 * @param key Nombre del campo
	 * @return Un Integer con el valor
	 */
	public Integer getIntegerValue(String key) {
		Object obj = values.get(key);
		Integer result = null;
		if (obj != null) {
			if (obj instanceof Integer) {
				result = (Integer) obj;
			}
			else if (obj instanceof Long) {
				result = new Integer(((Long) obj).intValue());
			}
		}
		return result;
	}

	/**
	 * Obtiene el valor del campo como un Long
	 * 
	 * @param key Nombre del campo
	 * @return Un Long con el valor
	 */
	public Long getLongValue(String key) {
		Object obj = values.get(key);
		Long result = null;
		if (obj != null && (obj instanceof Long)) {
			result = (Long) obj;
		}
		return result;
	}

	/**
	 * Obtiene el valor del campo como un Float
	 * 
	 * @param key Nombre del campo
	 * @return Un Float con el valor
	 */
	public Float getFloatValue(String key) {
		Object obj = values.get(key);
		Float result = null;
		if (obj != null && (obj instanceof Float)) {
			result = (Float) obj;
		}
		return result;
	}

	/**
	 * Obtiene el valor del campo como un Date
	 * 
	 * @param key Nombre del campo
	 * @return Un Date con el valor
	 */
	public Date getDateValue(String key) {
		Object obj = values.get(key);
		Date result = null;
		if (obj != null && (obj instanceof Date)) {
			result = (Date) obj;
		}
		return result;
	}

	/**
	 * Obtiene el valor del campo como un Boolean
	 * 
	 * @param key Nombre del campo
	 * @return Un Boolean con el valor
	 */
	public Boolean getBoolValue(String key) {
		Object obj = values.get(key);
		Boolean result = null;
//		String strValue;
//		if (obj == null) {
//			return null;
//		} else {
//			strValue = (String) obj;
//			if (strValue.equals("1")) {
//				return Boolean.TRUE;
//			} else if (strValue.equals("0")) {
//				return Boolean.FALSE;
//			} else {
//				return new Boolean(strValue);
//			}
//		}
		if (obj != null && (obj instanceof Boolean)) {
			result = (Boolean) obj;
		}
		return result;
	}
	
	
	 public byte [] getImage(String key) {
		 
		Object obj = values.get(key);
		Blob result = null;

		if (obj != null && (obj instanceof Blob)) {
			result = (Blob) obj;	
		}
		else {
			//System.out.println("No hay imagen en el registro...");
			return null;
		}
		
		try {
			byte [] res = result.getBytes(1, (int)(result.length()));
			return res;
			
		} catch(Exception ex) {
			System.out.println("Error al obtener el BinaryStream de la imagen...");
			ex.printStackTrace();
			return null;
		}

	}
	

	/**
	 * Obtiene el valor del campo como un objeto gen�rico
	 * 
	 * @param key Nombre del campo
	 * @return Un Boolean con el valor
	 * @throws Exception
	 */
	public Object getObjectValue(String key, Object obj) throws Exception {
		Object returnObj = null;
		byte[] b = (byte[]) values.get(key);
		ObjectInputStream ois = null;
		try {
			ClassLoader.getSystemClassLoader().loadClass(
				obj.getClass().getName());
			ois = new ObjectInputStream(new ByteArrayInputStream(b));
			returnObj = ois.readObject();
		} catch (ClassNotFoundException ex2) {
			throw new Exception("Error. Class not found for de-serialization");
		} catch (IOException ex) {
			throw new Exception(
				"Error obteniendo el objeto de la base de datos");
		}
		return returnObj;
	}

	
	@Override
	public String toString() {
		String record = "";
		Iterator<Map.Entry<String, Object>> it = values.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> e = it.next();
			//System.out.println(e.getKey() + " " + e.getValue());
			record += e.getKey() + ": " + e.getValue() + "  ;  ";
		}
		return record;
	}


}

