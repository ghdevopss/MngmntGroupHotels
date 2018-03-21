<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String UserID=request.getParameter("id");
String app=request.getParameter("app");
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">
		

</HEAD>
<BODY class="SC">
<h3 align=center>Block User </h3>

<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	int res=0,result=0;
     String MemberType="";
	 float AmountDeposited=0;
	try{
		
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			if(app.equals("approve"))
		{

			String Query1 = "update userprofile set approve = 1 where UserID='"+UserID+"'";
			System.out.println(Query1);
			int r = stmt.executeUpdate(Query1);
			
			}
			else
		{
				String Query1 = "update userprofile set approve = -1 where UserID='"+UserID+"'";
			System.out.println(Query1);
			int r = stmt.executeUpdate(Query1);
			

			}
			stmt.close();
			con.close();
			response.sendRedirect("ApproveMembers.jsp");
			
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>
