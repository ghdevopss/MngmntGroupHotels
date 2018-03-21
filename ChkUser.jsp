<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% String UserID = request.getParameter("UserID");
	System.out.println("UserID---"+UserID);
%>
<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class=Grad>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String myUsr="";
	try{
			con = com.eResorts.ConnectionPool.getConnection();
			System.out.println("connection"+con);
			stmt =  con.createStatement();
			String Query = "Select * from Login where UserID='"+UserID+"'";
			rs = stmt.executeQuery(Query);
			int rCount=0;
			while(rs.next())
			{
				myUsr=rs.getString(1);
				rCount++;
			}
			if(rCount>0){
				%><FONT COLOR="#FF3333" face='Times new roman'><I><B>User name not available. Please choose another</B></I></FONT><%
			}else{
				%><FONT COLOR="#B1B1B1" face='Times new roman'><B>User name available</B></FONT><%
			}
			rs.close();
			stmt.close();
			con.close();
		}catch(Exception e){
			rs.close();
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>


