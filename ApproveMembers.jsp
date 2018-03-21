
<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class="SC">
<h4 align=center>Approve Members here</h4>

<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select userid,membertype from userprofile where approve = 0";
			rs = stmt.executeQuery(Query);
			%>
						<table align="center" width="60%">
							<tr class=row_title>
							<th align="left">UserId</th><th align="left">Member Type</th><th align="center">Click</th>
							</tr>
					<%
			int rCount=0;
			while(rs.next())
			{
					%>
					<tr class= <%=(rCount%2!=0)? "row_even" : "row_odd"%>>
						<td align=center><%=rs.getString(1)%></td>
						<td align=center><%=rs.getString(2)%></td>
						<td align=center><a href="approving.jsp?id=<%=rs.getString(1)%>">Details</a></td>
						
					</tr>
					<%
				rCount++;
			}
			if( rCount == 0)	{%><h3 align=center>Sorry No records Found</h3><% }
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
</BODY>

</PRE>