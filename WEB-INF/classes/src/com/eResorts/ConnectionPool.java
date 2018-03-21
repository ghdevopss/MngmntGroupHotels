/**
 * 
 */
package com.eResorts;
import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionPool  {

 public ConnectionPool() {
	super();
 }
 private static Connection con=null;
 public static Connection getConnection()
 {
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/eResorts", "root", "admin");
		if (con != null) {
			System.out.println("Connection Pool Database Connection Success");
		}
	}
	catch(final ClassNotFoundException cfe)
	{
		
	}catch(final SQLException se)
	{
		System.out.println(se.getMessage());
	}
	return con;
	}
}

