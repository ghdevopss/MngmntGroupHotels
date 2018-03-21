<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String LocationImage = (String)session.getAttribute("filename");

%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h3 align=center>Add New Location</h3>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String LocationID="";
	MyFunctions MF = new MyFunctions();
	LocationID= MF.genNextID("accommodation","LocationID","L00");

	String LocationName = request.getParameter("LocationName");	
	String LocationDesc = request.getParameter("LocationDesc");	
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
		
			String Query = "Insert into accommodation values('"+LocationID+"','"+LocationName+"','"+LocationImage+"','"+LocationDesc+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><h3 align=center>Location details added sucessfully</h3></P>
				<P align=center><A HREF="AddAccommodation0.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="AddAccommodation0.jsp">Back</A></P>
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
