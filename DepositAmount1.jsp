<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">


</HEAD>
<BODY class="SC">
<%
String UserID = (String)session.getAttribute("UserID");
String cardnum = request.getParameter("cardnum");
String pin =  request.getParameter("pin");
String amount =  request.getParameter("amount");

//check the pin with the database in the bank

// now transfering funds

try{	
		Connection con=null;
		ResultSet rs=null;
		Statement stmt=null;

		con = com.eResorts.ConnectionPool.getConnection();
		stmt =  con.createStatement();
		String Query1="update userprofile set amountdeposited=amountdeposited+"+amount+" where userid='"+UserID+"'";
		System.out.println(Query1);
		int result = stmt.executeUpdate(Query1);

		if(result>0){out.println("Amount succussfully deposited");}
		else{out.println("error in processing the deposit request");}
stmt.close();
		con.close();
	}
catch(Exception e)
	{
		
		out.println(e);
	}
%>