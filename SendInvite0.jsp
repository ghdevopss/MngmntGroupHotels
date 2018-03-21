<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%String UserID=(String)session.getAttribute("UserID");
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h3 align=center>View Invitations</h3>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
		
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "select * from invites  where Status ='Invite'";
			System.out.println(Query);
			rs=stmt.executeQuery(Query);
			
			%>
			<table align="center" width="45%">
			<TR class="row_title">
			<Td align=center colspan=10><FONT COLOR="#00549A">Send Invitation</FONT></td>
			</TR>		
			<%
			int rCount=0;
			while(rs.next())
			{
			String Sno=rs.getString(1);
			String From=rs.getString(2);
			String To=rs.getString(3);

			String Status=rs.getString(4);
			
		%>
			
			<TR class= "row_odd">
			<th align="center">Sno</th><td><%=Sno%></td></th>
			<th align=center>From</th><td><%=From%></td></th>
			<th align=center>To</th><td><A HREF="mailto:<%=To%>?subject=Invitation to join in eZest"><%=To%></A></td>
			<td align="center" colspan=4><I><A href ="SendInvite1.jsp?Sno=<%=Sno%>">&nbsp;&nbsp; <img border="0" name="Send" src="Images/Invite.jpg" onmouseover="document['Send'].src='Images/Invite.jpg'" onmouseout="document['Send'].src='Images/Invite.jpg'"></A></I></td>
			</tr>
			
		<%
				rCount++;
			}
			
			if( rCount == 0)	{%><P align=center><FONT SIZE="2" COLOR="#00549A">Sorry No records Found</P><% }
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
