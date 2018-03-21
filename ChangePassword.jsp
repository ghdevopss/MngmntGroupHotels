<HTML>

<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<head>
<LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
</head>

<body Class="SC">
<center>

<FONT FACE="Century Gothic">

<!--Declaration of varaibles-->

<%! String errormsg ;%>
<%! String disluserid ;%>
<%! String dislpwd ;%>
<%! String dislnewpwd ;%>
    

<% 
   /*Retreiving user id and password*/

    disluserid = request.getParameter("UserID");
    if(disluserid == null)
    disluserid = "";
    dislpwd = request.getParameter("Password");
    if(dislpwd == null)
    dislpwd = "";
	dislnewpwd = request.getParameter("newPassword");
	if(dislnewpwd == null)
	dislnewpwd="";
	//System.out.println(disluserid+dislnewpwd+dislpwd);

%>

<%

/*Declaration of variables*/

Connection con=null;
Statement stmt=null;
ResultSet rs=null;

String UserID,Password;

try
{

	/*Getting the connection variable from session*/

	con = com.eResorts.ConnectionPool.getConnection();
	stmt =  con.createStatement();

	String Query = "SELECT * from Login where UserID = \'"+disluserid+
		"\' and Password =\'"+dislpwd+"\'";
	//System.out.println(Query);
	rs = stmt.executeQuery(Query);
		
}
catch(Exception e)
{
	System.out.println("Exception"+e);
}
/* If user provides valid username & password then update the new password to database*/
if(rs!=null)
{
String UpdateQuery = 
"Update Login set Password = \'"+dislnewpwd+"\' where UserID= \'"+disluserid+"\' and Password=\'"+dislpwd+"\'";
//System.out.println(UpdateQuery);
	int rowsAffected=stmt.executeUpdate(UpdateQuery);		
	//System.out.println("Rows Affected = " + rowsAffected);
if(rowsAffected==1)
	{%>
	<br><br><br>
		<H3 align="center" style="background-color:#F8F0DE"> Password Updated Successfully</H3>
	<BR>
    <center>
		<A href="WelcomeUser.jsp"> Home </A>
	</center>

	<%}
/* If user provides invalid password or username*/
else{%>
	<script>
		for(i=1;i<=6;i++) document.write("<br>");
	</script>
		<H3 align="center" style="background-color:#F8F0DE">UserName/Password Invalid Please Try again </H3>
	<BR>
	<center>
		<A href="ChangePassword1.jsp"> Back </A>
	</center>
<%
}
}
%>


<FONT size="2" color="blue" FACE="Century Gothic">

</BODY>
</HTML>




