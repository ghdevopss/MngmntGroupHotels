<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<%
String LocationName = (String)request.getParameter("LocationName");
	
%>	
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class='SC'>
<h3 align=center>Resort Details at <%=LocationName%></h3>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
		
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from resortsinfo where LocationName='"+LocationName+"'";
			System.out.println(Query);
			rs=stmt.executeQuery(Query);
			
			%>
			<table align="center" width="45%">
			<%
			int rCount=0;
			while(rs.next())
			{
			LocationName=rs.getString(2);
			String ResortImage=rs.getString(3);
			String NoOfRooms=rs.getString(4);
			String NoOfRoomsAvailable=rs.getString(5);
			String Restaurant=rs.getString(6);
			String Swimmingpool=rs.getString(7);
			String GamesRoom=rs.getString(8);
			String Casino=rs.getString(9);
			String YogaandMeditation=rs.getString(10);
			String SteamBath=rs.getString(11);
			String GymandHealthCenter=rs.getString(12);
			

		%>
			
			<th align="center"><Img src="Images/Photos/<%=ResortImage%>"></th>
			</Table><table align=center width=45%>
			<TR class= "row_even">
			<td align="left" colspan=3><B>Total Rooms:</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=NoOfRooms%></td></tr>
			<TR class= "row_even">
			<td align="left" colspan=3><B>Rooms <I></I>Avialable:</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=NoOfRoomsAvailable%></td></tr>
			<TR class= "row_odd">
			<td align="left" colspan=1><B>Other Facilities:</B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td colspan=2><%if(Restaurant.equals("Yes"))%><%
{%><B>Restaurant<br></B><%}else{%>
			<%}%>
			<%if(Swimmingpool.equals("Yes"))%><%
{%><B>Swimmingpool<br></B><%}else{%>
			<%}%>
			<%if(GamesRoom.equals("Yes"))%><%
{%><B>Games Room<br></B><%}else{%>
			<%}%>
			<%if(Casino.equals("Yes"))%><%
{%><B>Casino<br></B><%}else{%>
			<%}%>
			<%if(YogaandMeditation.equals("Yes"))%><%
{%><B>Yoga & Meditation<br></B><%}else{%>
			<%}%>
<%if(SteamBath.equals("Yes"))%><%
{%><B>SteamBath<br></B><%}else{%>
			<%}%>
			<%if(GymandHealthCenter.equals("Yes"))%><%
{%><B>Gym & HealthCenter<br></B><%}else{%>
			<%}%>

		<%
				rCount++;
			}
			
			if( rCount == 0)	{%><P align=center><h6 align=center>Sorry No records Found</h6><% }
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
</table>
</BODY>
