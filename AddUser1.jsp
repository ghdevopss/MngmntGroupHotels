<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC=""></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<P align=center><B>Create Administrator Login</B></P>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String user = request.getParameter("user");	
	String password = request.getParameter("password");	
	String auth = request.getParameter("auth");	
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
	
			
			String Query = "Insert into login values('"+user+"','"+password+"','"+auth+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><H3 align="center" style="background-color:#F8F0DE"> <B>Login created successfully</B></H3><%
			}
			else{
				%><H3 align="center" style="background-color:#F8F0DE"> <B>Error in login creation..please try again</B></H3><% 
			}
			stmt.close();
			con.close();
		}catch(SQLException se){
			stmt.close();
			con.close();
			if(se.getErrorCode()==1062){
				%><H3 align="center" style="background-color:#F8F0DE"><B>User <U><%=user%></U> already exists, Please try another id</B></H3><% 
			}else{
				%><H3 align="center" style="background-color:#F8F0DE"><B>Error in login creation..please try again</B></H3><% 
			} 
		}
		catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>
