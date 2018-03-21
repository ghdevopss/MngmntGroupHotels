<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");
String Auth="";
%>
<%	

UserID = (session.getAttribute("UserID")==null) ? "Null" : (String)session.getAttribute("UserID"); 

if(UserID.equals("Null"))
{
	session.invalidate();
	%>
	<!--<H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">Session time out...Please login again</H5>-->
	<script language=javascript>
		location.replace('myHome.html');
	</script>
	<% 
}
else{
%>
<HTML>
<head>
		<LINK href="styles.css" type="text/css" rel="stylesheet">
		<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>


<BODY  Class=Grad><%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	String Password = request.getParameter("Password");
	session.setAttribute("UserID",UserID);
	int flag=0;
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			stmt1 =  con.createStatement();
			String Query = "select * from login where UserID = '"+UserID+"'";
			System.out.println(Query);
			rs = stmt.executeQuery(Query);
			System.out.println(rs);
			if(rs.next())	
			{
			Auth=rs.getString(3);
			session.setAttribute("Auth",new Integer(Auth));
	        	 flag=1;

			
			 if(Auth.equals("0")){
				//Show Admin Menu
				%>
				  <jsp:forward page="AdminHome.jsp"/>
				<%
			 }else if(Auth.equals("1")){
				//Show user Menu
				%>
				  <jsp:forward page="UserHome.jsp"/>
				  
				<%
			 }
			}
			else
			{
			 flag=0;
			 
			 %>
				  <jsp:forward page="Login.jsp"/>
					
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

<%
}
%>