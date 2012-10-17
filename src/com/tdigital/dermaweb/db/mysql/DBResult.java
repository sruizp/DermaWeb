package com.tdigital.dermaweb.db.mysql;

import java.sql.Blob;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Vector;

public class DBResult implements java.io.Serializable {

	private static final long serialVersionUID = 2274433800296059268L;

	private Vector<DBRecord> records;

	public DBResult() {

	}

	/**
	 * Constructor de DBResult a partir de un ResulSet
	 * 
	 * @param rs
	 *            El objeto Resulset
	 * @throws Exception
	 */
	public DBResult(ResultSet rs) throws Exception {

		ResultSetMetaData metadata;
		DBRecord row;
		String name = null;
		Object obj = null;
		int cols;

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		records = new Vector<DBRecord>();
		try {
			if (rs.getMetaData() != null) {
				metadata = rs.getMetaData();
				cols = metadata.getColumnCount();
				// Recorremos todo el ResulSet creando un DBRecord
				while (rs.next()) {
					row = new DBRecord();
					for (int j = 1; j < cols + 1; j++) {
						name = metadata.getColumnName(j);
						if (name != null) {
							int type = metadata.getColumnType(
									rs.findColumn(name)); 
							
							//System.out.println("TYPE: "+type);
							
							if (type == Types.DATE || type == Types.TIMESTAMP) {
								Date dAux = rs.getDate(name);
								if (!rs.wasNull()) {
									java.util.Date ddate = df.parse(dAux
											+ " " + rs.getTime(name));
									row.addField(name, ddate);
								}
							}
							
							else if (type == Types.LONGVARBINARY || type == Types.BLOB) {
								//System.out.println("DEVELVEMOS UN BLOB EN un RECORD...");
								Blob bImage = rs.getBlob("imagen");
								if (bImage != null) {
									row.addField(name, bImage);
								}
							}
								
							else {
								//System.out.println("NI DATE, NI TIEMSTAMP, NI BLOB....");
								obj = rs.getObject(name);
								if (obj != null) {
									row.addField(name, obj);
								}
							}
						}
					}
					records.add(row);
				}

			}
		}
		catch (SQLException sqle) {
			throw new Exception(" Error. " + sqle.getMessage());
		}
	}

	/**
	 * Devuelve el n�mero de filas del resultado de DBResult
	 * 
	 * @return
	 * @throws DBException
	 */
	public int getSize() throws Exception {
		return records.size();
	}

	/**
	 * Devuelve la fila DBRecord indicado por el �ndice
	 * 
	 * @param index
	 * @return
	 */
	public DBRecord getDBRecord(int index) {
		return (DBRecord) records.get(index);
	}

}
