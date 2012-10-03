package es.tid.ehealth.dermaweb.db.mysql;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class DBConnection implements Serializable {
	
	private Log log = LogFactory.getLog(getClass());

	private final char SINGLE_QUOTE = '\'';
	private final char SLASH = '\\';

	private boolean transaction = false;
	
	private String url = "jdbc:mysql://leprechaunvm/DERMAWEB?user=htc&password=htc3100";

	private Connection con;
	

	/**
	 * Conectamos a traves de una fuente de datos 
	 * @param sDataSource nombre de la fuente de datos
	 */
	public void setService(String protocolo) {

	}

	public void openConnection() throws Exception {

		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(url);
		} catch (Exception ex) {
			log.info("Error opening connection. " + ex.getMessage());
			throw new Exception("Error opening connection. " + ex.getMessage());
		}
	}

	public void closeConnection() throws Exception {
		try {
			con.close();
		} catch (Exception ex) {
			log.info("Error closing connection. " + ex.getMessage());
			throw new Exception("Error closing connection. " + ex.getMessage());
		}
	}

	public void startTransaction() throws Exception {
		startTransaction(Connection.TRANSACTION_READ_COMMITTED);
	}

	public void startTransaction(int isolationLevel) throws Exception {
		try {
			transaction = true;
			openConnection();
			con.setAutoCommit(false);
		} catch (Exception ex) {
			log.info("Error beginning transaction: " + ex.getMessage());
			throw new Exception("Error beginning connection. "
				+ ex.getMessage());
		}
	}

	public void commitTransaction() throws Exception {
		try {
			transaction = false;
			con.commit();
			con.setAutoCommit(true);
		} catch (Exception ex) {
			throw new Exception("Error finishing connection. "
				+ ex.getMessage());
		} finally {
			closeConnection();
		}
	}

	public void rollbackTransaction() throws Exception {
		try {
			transaction = false;
			con.rollback();
			con.setAutoCommit(true);
		} catch (Exception ex) {
			log.info("Error rollbacking transaction: " + ex.getMessage());
			throw new Exception("Error rollbacking connection. "
				+ ex.getMessage());
		} finally {
			closeConnection();
		}
	}

	
	/**
	 * Determina si hay una trasacci�n iniciada
	 * 
	 * @throws Exception
	 */
	public boolean intoTransaction() {
		return transaction;
	}

	public int stringExecute(String sql) throws Exception {

		int r = -1;
		PreparedStatement pstmt = null;

		synchronized(DBConnection.class){
			try {	
				
				if (!transaction) {	
					openConnection();
					pstmt = con.prepareStatement(sql); 
				}
				else {
					pstmt = con.prepareStatement(sql);
				}
				r = pstmt.executeUpdate();
			} catch (Exception ex) {
				log.info("Error executing sql statement: " + ex.getMessage());
				throw new Exception("Error executing sql statement. " + sql + " "
					+ ex.getMessage());
			} finally {
				try {
					pstmt.close();
				} catch (Exception ex) {};
			}	
		}
		return r;
	}
	
	
	/**
	 * Ejecuta una sentencia SQL de actualizaci�n de la BD.
	 * 
	 * @param sql Sentencia SQL a ejecutar
	 * @return N� de filas afectadas en el caso de ejecutar INSERT, UPDATE o DELETE.
	 * Cero si la sentencia es del tipo SQL DDL.
	 * @throws Exception 
	 */
	public int stringExecuteBin(String sql, int idUsuario, String nombre, byte [] image) throws Exception {

		int r = -1;
		PreparedStatement pstmt = null;

		synchronized(DBConnection.class){
			try {
				if (!transaction) {	
					//Gestionar la conexi�n est�tica
					openConnection();
					pstmt = con.prepareStatement(sql);
				}
				else {
					pstmt = con.prepareStatement(sql);
				}
	
				//SI idUsuario == -1 es que quiero hacer un update en vez de un insert
				if (idUsuario == -1) {
					
	        		pstmt.setString(1, nombre);
	        		//File fFile = new File(file);	
	        		InputStream isImage = new ByteArrayInputStream(image);
	        		pstmt.setBinaryStream(2, isImage, image.length);	
					
				} else {
					
					pstmt.setInt(1, idUsuario);
	        		pstmt.setString(2, nombre);
	        		//File fFile = new File(file);	
	        		InputStream isImage = new ByteArrayInputStream(image);
	        		pstmt.setBinaryStream(3, isImage, image.length);
				}
	        		
	        	r = pstmt.executeUpdate();
	
			} catch (Exception ex) {
				log.info("Error executing sql statement: " + ex.getMessage());
				throw new Exception("Error executing sql statement. " + sql + " "
					+ ex.getMessage());
			} finally {
				try {
					pstmt.close();
				} catch (Exception ex) {}
			}
		}
		return r;
	}
	

	/**
	 * Ejecuta una sentencia SQL de consulta de datos. Este m�todo est�
	 * pensado para ejecutar consultas SQL  por parte del programador.
	 * 
	 * @param sql Sentencia SQL a ejecutar
	 * @return Instancia de DBResult con los resultados
	 * @throws Exception 
	 */
	public DBResult stringSelect(String sql) throws Exception {

		DBResult dbRes = null;
		PreparedStatement pstmt = null;
		
		synchronized(DBConnection.class){
			try {
				if (!transaction) {	
					//Gestionar la conexi�n est�tica
					openConnection();
					pstmt = con.prepareStatement(sql);
				
				}
				else {
					pstmt = con.prepareStatement(sql);
				}
				
				dbRes = new DBResult(pstmt.executeQuery());
			} catch (Exception ex) {
				log.info("Error executing sql select statement: " + sql
					+ " Exception: " + ex, ex);
				throw new Exception("Error executing sql select statement. " + sql
					+ " " + ex.getMessage());
			} finally {
				try {
					pstmt.close();
				} catch (Exception ex) {}
			}
		}
		return dbRes;
	}

	
	public int stringExecute_LastId(String sql) throws Exception {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int autoIncKeyFromFunc = -1;
		
		synchronized(DBConnection.class){
			try {
				if (!transaction) {	
					openConnection();
					pstmt = con.prepareStatement(sql);	
				}
				else {
					pstmt = con.prepareStatement(sql);
				}
				
				pstmt.executeUpdate();
			    rs = pstmt.executeQuery("SELECT LAST_INSERT_ID()");
	
			    if (rs.next()) {
			        autoIncKeyFromFunc = rs.getInt(1);
			    } else {
			    	throw new Exception("Error obteniendo el ID de la fila insertada");
			    }
	
			    rs.close();
				
			} catch (Exception ex) {
				log.info("Error executing sql statement: " + ex.getMessage());
				throw new Exception("Error executing sql statement. " + sql + " "
					+ ex.getMessage());
			} finally {
				try {
					pstmt.close();
				} catch (Exception ex) {}
			}
		}
		return autoIncKeyFromFunc;
	}
		
		
//**************************************************//

	protected String toDBDate(java.util.Date ddate) {
		StringBuffer buf = new StringBuffer();
		//Convertimos la fecha al formato que admite MySQL
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		if (ddate != null) {
			try {
				buf.append(SINGLE_QUOTE);
				buf.append(df.format(ddate));
				buf.append(SINGLE_QUOTE);
				return buf.toString();
			} catch (Exception e) {
				log.info("ERROR de conversi�n: " + e.getMessage());
				return null;
			}
		} else {
			return null;
		}
	}

	protected String toDBString(String sdata) {
		String sRet = null;
		if (sdata != null) {
			sRet = escapaString(sdata);
		}
		return sRet;
	}

	private String escapaString(String text) {
		StringBuffer buf = new StringBuffer();
		char[] data = text.toCharArray();
		buf.append(SINGLE_QUOTE);
		for (int i = 0; i < data.length; i++) {
			if ((data[i] == SINGLE_QUOTE) || (data[i] == SLASH)) {
				buf.append(SLASH).append(data[i]);
			} else {
				buf.append(data[i]);
			}
		}
		buf.append(SINGLE_QUOTE);
		return buf.toString();
	}

}
