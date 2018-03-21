<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<% 
	String UserID=(String)session.getAttribute("UserID");
	String ADeposited=(String)session.getAttribute("ADeposited");
	int  Amount=Integer.parseInt(ADeposited);
	System.out.println(Amount);
	String AmountDeposited=request.getParameter("AmountDeposited");
	Double  PreAmount=Double.parseDouble(AmountDeposited);
		System.out.println(PreAmount);

%>

<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</HEAD>
<BODY class="SC">

<h3 align=center>Details of <%=UserID%></h2>
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	String  MemberType=request.getParameter("MemberType");
	double AmountDeposit=Amount+PreAmount;
	try{
			
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Update userprofile set MemberType = '"+MemberType+"',AmountDeposited = '"+AmountDeposit+"' where UserID='"+UserID+"'";
			System.out.println(Query);
			int result = stmt.executeUpdate(Query);
			if( result > 0)	{
				%><P align=center><h3 align=center>Your Membership Updated sucessfully...</h3>
				<center><input type=button value=close onclick="window.close();"></center>


				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3>
				<A HREF="EditBasicDetails.jsp">Back</A></P>

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
