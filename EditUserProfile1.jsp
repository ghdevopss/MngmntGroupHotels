<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% 
	String UserID=(String)session.getAttribute("UserID");

%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class="SC">

<h3 align=center>Details of <%=UserID%></h2>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String	FirstName=request.getParameter("FirstName");
	String	LastName=request.getParameter("LastName");
	String Age=request.getParameter("Age");
	String	EmailAddress=request.getParameter("EmailAddress");
	String	Address=request.getParameter("Address");
	String  ContactNumber=request.getParameter("ContactNumber");
	String  Occupation=request.getParameter("Occupation");
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Update userprofile set FirstName = '"+FirstName+"',LastName = '"+LastName+"',Age = '"+Age+"',EmailAddress = '"+EmailAddress+"',Address = '"+Address+"',ContactNumber = '"+ContactNumber+"',Occupation = '"+Occupation+"' where UserID='"+UserID+"'";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><h3 align=center>Updated sucessfully</h3>
				<center><input type=button value=close onclick="window.close();"></center>


				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3>
				<A HREF="EditBasicDetails.jsp">Back</A></P>

				<%
			}
			stmt.close();
			con.close();
		}catch(Exception e){
			stmt.close();
			con.close();
			%><%=e%><%
		}
%>
</BODY>
