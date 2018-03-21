<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String BookingID=request.getParameter("BookingID");

String RoomID=request.getParameter("RoomID");
String ResortID=request.getParameter("ResortID");
String BookingStatus=request.getParameter("BookingStatus");
int NoOfRoomsAvailable=0;
int NoOfRooms=0;

%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">
		

</HEAD>
<BODY class="SC">
<h3 align=center>Check In/Check Out </h3>

<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	int res=0,result=0;
     
	try{
		
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			if(BookingStatus.equals("Booked")){
			String Query = "Update bookingsinfo set BookingStatus='CheckedIn' where RoomID='"+RoomID+"' and BookingID='"+BookingID+"' and BookingStatus='Booked' ";
			System.out.println(Query);
			result = stmt.executeUpdate(Query);
			}
			else if(BookingStatus.equals("CheckedIn"))
			{
			String Query = "Update bookingsinfo set BookingStatus='CheckedOut' where RoomID='"+RoomID+"' and BookingID='"+BookingID+"' and BookingStatus='CheckedIn' ";
			System.out.println(Query);
			result = stmt.executeUpdate(Query);
			}
			if( result > 0)	{
			String Query3 = "Select NoOfRooms,NoOfRoomsAvailable from resortsinfo where ResortID='"+ResortID+"'"; 
			System.out.println(Query3);
			rs = stmt.executeQuery(Query3);
			}
			while(rs.next()){
			 NoOfRooms=rs.getInt(1);
			 NoOfRoomsAvailable=rs.getInt(2);
			}
			
			 if(BookingStatus.equals("Booked")){
				 NoOfRoomsAvailable=NoOfRoomsAvailable-1;
				 }
				 else if(BookingStatus.equals("CheckedIn")){
				  NoOfRoomsAvailable=NoOfRoomsAvailable+1;

				 }if(rs!=null){
			stmt1 =  con.createStatement();
			String Query3 = "Update resortsinfo set NoOfRoomsAvailable='"+NoOfRoomsAvailable+"' where ResortID='"+ResortID+"' ";
			System.out.println(Query3);
			res = stmt.executeUpdate(Query3);
			}
		    if(res>0){
			
			%><P align=center><h3 align=center>Updated sucessfully</h3></P>
				<P align=center><A HREF="UserBookings0.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="UserBookings0.jsp">Back</A></P>
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
