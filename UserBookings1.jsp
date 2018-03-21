<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class='SC'>
<h3 align=center>Booking Details</h3>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
		
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from bookingsinfo"; 
			System.out.println(Query);
			rs=stmt.executeQuery(Query);
			
			%>
			<table align="center" width="45%">
			<%
			int rCount=0;
			while(rs.next())
			{
			String BookingID=rs.getString(1);
			String ResortID=rs.getString(2);
			String RoomID=rs.getString(3);
			String LocationName=rs.getString(4);
			String UserID=rs.getString(5);
			String MemberType=rs.getString(6);
			String RoomCharges=rs.getString(7);
			String From=rs.getString(8);
			String To=rs.getString(9);
			String BookingStatus=rs.getString(10);
		
		%>
			<TR class= "row_even">
			<td align="left" colspan=2><B>BookingID: </B><%=BookingID%></td><td align="left" colspan=2><a href ="CheckIn.jsp?ResortID=<%=ResortID%>&RoomID=<%=RoomID%>&RoomCharges=<%=RoomCharges%>&LocationName=<%=LocationName%>"><IMG SRC="Images/CheckIn.jpg" WIDTH="106" HEIGHT="26" BORDER="0" ALT=""></a></td></tr>
			
			<TR class= "row_even">
			<td align="left" colspan=2><B>UserID: </B><%=UserID%></td>
			<td align="left" colspan=2><B>MemberType:</B><%=MemberType%></td></tr>
		
			<TR class= "row_even">
			<td align="left" colspan=2><B>RoomID: </B><%=RoomID%></td><td align="left" colspan=2><B>ResortID: </B><%=ResortID%></td></tr>
				
			
			<TR class= "row_even">
			<td align="left" colspan=2><B>From: </B><%=From%></td>
			<td align="left" colspan=2><B>To: </B><%=To%></td></tr>
		
			<TR class= "row_even">
			<td align="left" colspan=2><B>LocationName: </B>Rs.<%=LocationName%></td>
			<td align="left" colspan=2><B>RoomCharges: </B><%=RoomCharges%></td></tr>
			<TR class= "row_even">
			<td align="left" colspan=4><B>BookingStatus: </B><%=BookingStatus%></td>
			</tr>
			<tr class=row_odd>	
			<th align="left" colspan=4><hr color='#F3E1BC'></th></tr>

			

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
