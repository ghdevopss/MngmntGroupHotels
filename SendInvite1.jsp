<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% 
	String UserID=(String)session.getAttribute("UserID");
	String Sno=request.getParameter("Sno");

%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class="SC">

<h3 align=center>Send Invite</h2>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
		try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Update invites set Status ='Invited' where Sno='"+Sno+"'";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><FONT SIZE="2" COLOR="#00549A"> Invited sucessfully</P>
				<%
			}
			else{
				%><P align=center><FONT SIZE="2" COLOR="#00549A">Error in updating..please try again</P>
				<A HREF="SendInvite0.jsp">Back</A></P>

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
