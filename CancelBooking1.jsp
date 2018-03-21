<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String BookingID=request.getParameter("BookingID");
String RoomID=request.getParameter("RoomID");
String ResortID=request.getParameter("ResortID");
String DateOfBooking=request.getParameter("From");
int NoOfRoomsAvailable=0;
int NoOfRooms=0;
String Days=request.getParameter("NoOfDays");
System.out.println(Days);
int NoOfDays=Integer.parseInt(Days);
	Date CancelDate = new Date(System.currentTimeMillis());

%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">
		

</HEAD>
<BODY class="SC">
<h3 align=center>Cancel Booking </h3>

<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
     
	try{
		
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query1="select * from bookingsinfo where RoomID='"+RoomID+"' and BookingID='"+BookingID+"' ";
			System.out.println(Query1);
			rs1 = stmt.executeQuery(Query1);
			while(rs1.next()){
			String From=rs1.getString(8);
			}
		     if(NoOfDays<2)
			 {  
			 %><P align=center><h3 align=center>Before '<%=NoOfDays%>' days Cancellation is  not possible </h3></P>
 				 <P align=center><A HREF="MyBookings.jsp">Back</A></P>
				<% 
			 }else{
			String Query = "Update bookingsinfo set BookingStatus='Canceled' where RoomID='"+RoomID+"' and BookingID='"+BookingID+"' ";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			String Quer="Update userprofile set AmountDeposited=AmountDeposited+(select roomcharges from bookingsinfo where bookingID='"+BookingID+"')*0.9 where UserID=(select UserID from bookingsinfo where bookingID='"+BookingID+"')";
			int result1 = stmt.executeUpdate(Quer);
							
			if( result > 0)	{
			String Query3 = "Select NoOfRooms,NoOfRoomsAvailable from resortsinfo where ResortID='"+ResortID+"'"; 
			System.out.println(Query3);
			rs = stmt.executeQuery(Query3);
			}
			
		    if(rs!=null){
			
			%><P align=center><h3 align=center>Booking canceled sucessfully</h3></P>
				<P align=center><A HREF="MyBookings.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="MyBookings.jsp">Back</A></P>
				<% 
			}
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
