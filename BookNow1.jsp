<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String UserID=request.getParameter("UserID");
String RoomID=request.getParameter("RoomID");
String LocationName=request.getParameter("LocationName");
String MemberType=request.getParameter("MemberType");
String RoomRent=request.getParameter("RoomRent");
String From=request.getParameter("From");
String FromDate=request.getParameter("From");
String To=request.getParameter("To");
String ToDate=request.getParameter("To");
String ResortID=request.getParameter("ResortID");
int NoOfRoomsAvailable=0;
int NoOfRooms=0;

%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h3 align=center>Book Now</h3>
<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	String BookingStatus="Booked";
	String BookingID="";
	MyFunctions MF = new MyFunctions();
	BookingID= MF.genNextID("bookingsinfo","BookingID","B0");
	Date DtBooked = new Date(System.currentTimeMillis());

	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query1="select * from bookingsinfo,roomsinfo where roomsinfo.RoomID=bookingsinfo.RoomID and BookingStatus='Booked' and bookingsinfo.From <='"+FromDate+"' and bookingsinfo.To>='"+FromDate+"' and bookingsinfo.From <='"+ToDate+"' and bookingsinfo.To<='"+ToDate+"' and roomsinfo.RoomID='"+RoomID+"' ";
			System.out.println(Query1);
			rs1 = stmt.executeQuery(Query1);
		     if((rs1.next()))
			 {  
			 %><P align=center><h3 align=center>Room not available between <%=FromDate%> to <%=ToDate%></h3></P>
 				 <P align=center><A HREF="ReserveRooms0.jsp">Back</A></P>
				<% 
			 }else{
			String Query = "Insert into bookingsinfo values('"+BookingID+"','"+ResortID+"','"+RoomID+"','"+LocationName+"','"+UserID+"','"+MemberType+"','"+RoomRent+"','"+From+"','"+To+"','"+BookingStatus+"')";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
		
			if( result > 0)	{
			stmt1 =  con.createStatement();
			String Query3 = "Select NoOfRooms,NoOfRoomsAvailable from resortsinfo where ResortID='"+ResortID+"'"; 
			System.out.println(Query3);
			rs = stmt.executeQuery(Query3);
			}
		    if(rs!=null){

				String Query4="update userprofile set AmountDeposited=AmountDeposited-"+RoomRent+" where UserID='"+UserID+"'";
				System.out.println(Query4);
				stmt.executeUpdate(Query4);
			
			%><P align=center><h3 align=center>Booking details added sucessfully</h3></P>
				<P align=center><A HREF="ReserveRooms0.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="ReserveRooms0.jsp">Back</A></P>
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
