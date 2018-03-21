<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class='SC'>
<h3 align=center>Members Details</h3>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
		
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from userprofile where MemberType!='Blocked' and approve=1"; 
			System.out.println(Query);
			rs=stmt.executeQuery(Query);
			
			%>
			<table align="center" width="45%">
			<%
			int rCount=0;
			while(rs.next())
			{
			String RegID=rs.getString(1);
			String UserID=rs.getString(2);
			String FirstName=rs.getString(3);
			String LastName=rs.getString(4);
			String EmailAddress=rs.getString(6);
			String MemberType=rs.getString(10);
			
		
		%>
			<TR class= "row_even">
			<td align="left" colspan=2><B>RegID: </B><%=RegID%></td><td align="left" colspan=2><a href ="Block.jsp?UserID=<%=UserID%>&RegID=<%=RegID%>"><IMG SRC="Images/Block.jpg" WIDTH="113" HEIGHT="26" BORDER="0" ALT=""></a></td></tr>
			
			<TR class= "row_even">
			<td align="left" colspan=2><B>UserID: </B><%=UserID%></td>
			<td align="left" colspan=2><B>MemberType:</B><%=MemberType%></td></tr>
		
			<TR class= "row_even">
			<td align="left" colspan=2><B>FirstName: </B><%=FirstName%></td><td align="left" colspan=2><B>EmailAddress: </B><%=EmailAddress%></td></tr>
						
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
