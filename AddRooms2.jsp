<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
	String ResortID = (String)request.getParameter("ResortID");
int NoOfRoomsAvailable=0;
int NoOfRooms=0;
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h3 align=center>Add New Room</h3>
<table align=right>
<TD><A HREF="ViewRooms0.jsp" target="RFrame"><img border="0" name="Rooms" src="Images/ViewRooms0.jpg" onmouseover="document['Rooms'].src='Images/ViewRooms01.jpg'" onmouseout="document['Rooms'].src='Images/ViewRooms0.jpg'" ></A></TD>
</table>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null,stmt1=null,stmt2=null;
	String Sno="";
	MyFunctions MF = new MyFunctions();
	Sno= MF.genNextID("roomsinfo","Sno","");
     String RID=ResortID+Sno;
	 System.out.println(RID);
	String LocationName = request.getParameter("LocationName");	
	String RoomType = request.getParameter("RoomType");	
	String RoomArea = request.getParameter("RoomArea");	
	String DryKitchenette = request.getParameter("DryKitchenette");	
	String SofacumBed = request.getParameter("SofacumBed");
	String DoubleBeds = request.getParameter("DoubleBeds");	
	String Telephone = request.getParameter("Telephone");	
	String Television = request.getParameter("Television");	
	String RoomCharges=request.getParameter("RoomCharges");
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
		
			String Query = "Insert into roomsinfo values('"+Sno+"','"+RID+"','"+ResortID+"','"+LocationName+"','"+RoomType+"','"+RoomArea+"','"+DryKitchenette+"','"+SofacumBed+"','"+DoubleBeds+"','"+Telephone+"','"+Television+"','"+RoomCharges+"')";
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
            stmt2=con.createStatement();
			String Query3 = "Select NoOfRooms,NoOfRoomsAvailable from resortsinfo where ResortID='"+ResortID+"'"; 
			rs = stmt2.executeQuery(Query3);
		    if(rs!=null){
			while(rs.next()){
			NoOfRooms=rs.getInt(1);
			NoOfRoomsAvailable=rs.getInt(2);
			}
			}
			NoOfRooms=NoOfRooms+1;
			NoOfRoomsAvailable=NoOfRoomsAvailable+1;
			stmt1 =  con.createStatement();
			String Query1 = "Update resortsinfo set NoOfRooms='"+NoOfRooms+"',NoOfRoomsAvailable='"+NoOfRoomsAvailable+"' where ResortID='"+ResortID+"'"; 
			int result1 = stmt1.executeUpdate(Query1);

				%><P align=center><h3 align=center>Room details added sucessfully</h3></P>
				<P align=center><A HREF="AddRooms0.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="AddRooms0.jsp">Back</A></P>
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
