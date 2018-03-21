package com.eResorts;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionPool{

public ConnectionPool() {
super();
}
private static Connection con=null;
public static Connection getConnection()
{
try
{
Class.forName("com.mysql.jdbc.Driver");
con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/eZest", "root", "root");
//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
//con = java.sql.DriverManager.getConnection("jdbc:odbc:eZest","root","root");

if (con != null) {
System.out.println("Connection Pool Database Connection Success");
}
}catch(final ClassNotFoundException cfe)
{

}catch(final SQLException se)
{

}

return con;
}


}


