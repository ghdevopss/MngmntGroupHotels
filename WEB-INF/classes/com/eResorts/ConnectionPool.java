/**
 * 
 */
package com.eResorts;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
public class ConnectionPool  {
	static Properties props=new  Properties();
	static String url=null,username=null,password=null;
 public ConnectionPool() throws IOException {
	super();
	}
  private static Connection con=null;
public static Connection getConnection() throws IOException
 {
	try
	{
		props.load(ConnectionPool.class.getResourceAsStream("database.properties"));
		url=props.getProperty("url");
		username=props.getProperty("username");
		password=props.getProperty("password");
        Class.forName("com.mysql.jdbc.Driver");
		con = java.sql.DriverManager.getConnection(url,username,password);
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

