<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*"%>

<HEAD>


	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>
<BODY class=Grad>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt4=null;
	String UserID = (String)session.getAttribute("UserID");
	System.out.println("-->"+UserID);
	String LocationImage = request.getParameter("LocationImage");	
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt4=con.createStatement();
			String Query4 = "Update accommodation set LocationImage = '"+LocationImage+"' where UserID='"+UserID+"'";
			System.out.println(Query4);
			int result=stmt4.executeUpdate(Query4);
     		System.out.println(Query4);
			if( result > 0)	{
				%>
					<P align=center><FONT COLOR="green" face="Times new roman">
						<!--<I>Your Photo has been updated successfully</I></FONT><BR>-->
						<script>
							alert("Your Photo has been updated successfully");
							window.opener.location.reload();
							window.close();
						</script>
						<!--<INPUT TYPE="Button" class="Button" value="Close" onclick="window.close()">-->
					</P>
				<%
			}else{
				%>
					<P align=center><FONT COLOR="green" face="Times new roman">
						<!--<I>Error: Please upload again</I></FONT><BR>-->
						<script>
							alert("Error: Please try again");
							window.opener.location.reload();
							window.close();
						</script>
						<!--<INPUT TYPE="Button" class="Button" value="Close" onclick="window.close()">-->
					</P>
				<%
			}
			stmt4.close();
			con.close();
		}catch(Exception e){
			stmt4.close();
			con.close();
			%><%=e%><%
		}
	
%>
</BODY>


