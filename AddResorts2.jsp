<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String ResortImage = (String)session.getAttribute("filename");

%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h3 align=center>Add New Resort</h3>
<table align=right>
<TD><A HREF="ViewResorts0.jsp" target="RFrame"><img border="0" name="Resorts" src="Images/ResortsDetails0.jpg" onmouseover="document['Resorts'].src='Images/ResortsDetails1.jpg'" onmouseout="document['Resorts'].src='Images/ResortsDetails0.jpg'" ></A></TD>
</table>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String ResortID="";
	MyFunctions MF = new MyFunctions();
	ResortID= MF.genNextID("resortsinfo","ResortID","R00");

	String LocationName = request.getParameter("LocationName");	
	String NoOfRooms = request.getParameter("NoOfRooms");	
	String Restaurant = request.getParameter("Restaurant");	
	String Swimmingpool = request.getParameter("Swimmingpool");	
	String GamesRoom = request.getParameter("GamesRoom");	
	String Casino = request.getParameter("Casino");
	String YogaandMeditation = request.getParameter("YogaandMeditation");	
	String SteamBath = request.getParameter("SteamBath");	
	String GymandHealthCenter = request.getParameter("GymandHealthCenter");	
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
		
			String Query = "Insert into resortsinfo values('"+ResortID+"','"+LocationName+"','"+ResortImage+"','"+NoOfRooms+"','"+NoOfRooms+"','"+Restaurant+"','"+Swimmingpool+"','"+GamesRoom+"','"+Casino+"','"+YogaandMeditation+"','"+SteamBath+"','"+GymandHealthCenter+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><h3 align=center>Resort details added sucessfully</h3></P>
				<P align=center><A HREF="AddResorts0.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="AddResorts0.jsp">Back</A></P>
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
