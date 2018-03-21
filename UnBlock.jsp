<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String UserID=request.getParameter("UserID");
String RegID=request.getParameter("RegID");
%>
<HEAD>


	<script LANGUAGE="Javascript" SRC="validate.js"></script>


	<LINK href="styles.css" type="text/css" rel="stylesheet">
		

</HEAD>
<BODY class="SC">
<h3 align=center>Block User </h3>

<%

	Connection con=null;
	ResultSet rs=null,rs1=null;
	Statement stmt=null,stmt1=null;
	int res=0,result=0;
     String MemberType="";
	 float AmountDeposited=0;
	try{
		
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query1 = "Select AmountDeposited from userprofile where UserID='"+UserID+"' and RegID='"+RegID+"' and MemberType='Blocked'";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			if(rs.next()){
			AmountDeposited=rs.getFloat(1);
			System.out.println(AmountDeposited);
			}
			if(AmountDeposited==5000){
			MemberType="Silver";
			}else if(AmountDeposited==10000){
						MemberType="Gold";

			}else if(AmountDeposited==15000){
			MemberType="Platinum";
			}
			String Query = "Update userprofile set MemberType='"+MemberType+"' where UserID='"+UserID+"' and RegID='"+RegID+"'";
			System.out.println(Query);
			result = stmt.executeUpdate(Query);
			
			
			if( result > 0)	{
			
			
			%><P align=center><h3 align=center>User UnBlocked sucessfully</h3></P>
				<P align=center><A HREF="ViewBlockedMembers.jsp">Back</A></P>

				<%
			}
			else{
				%><P align=center><h3 align=center>Error in updating..please try again</h3></P>
 				 <P align=center><A HREF="ViewBlockedMembers.jsp">Back</A></P>
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
