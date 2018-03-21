
<html>
<%@ page language="java" %>
<%@ page session="true" %>
<%@page import="java.sql.*,java.io.*,java.util.Random"%>
<SCRIPT LANGUAGE="JavaScript">
<!--
history.go(+1);

//-->
</SCRIPT>
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">
</head>
<body Class='SC'>

<Title>Admin Menu</Title>
<font face="Times New ROman" color=blue >
<center>




<!--Retreiving user id using Session-->

<% String Userid=(String)session.getAttribute("UserID");%>

	<TABLE align=right>
	<TR>
		<TD><A HREF="AdminHome.jsp" target="RFrame"><img border="0" name="Home" src="Images/Home0.jpg" onmouseover="document['Home'].src='Images/Home01.jpg'" onmouseout="document['Home'].src='Images/Home0.jpg'" ></A></TD>
		
		<TD><A HREF="AddAccommodation0.jsp" target="RFrame"><img border="0" name="Accommodation" src="Images/Accommodation0.jpg" onmouseover="document['Accommodation'].src='Images/Accommodation1.jpg'" onmouseout="document['Accommodation'].src='Images/Accommodation0.jpg'" ></A></TD>
		
		<TD><A HREF="AddResorts0.jsp" target="RFrame"><img border="0" name="Resorts" src="Images/ViewResorts1.jpg" onmouseover="document['Resorts'].src='Images/ViewResorts0.jpg'" onmouseout="document['Resorts'].src='Images/ViewResorts1.jpg'" ></A></TD>

		<TD><A HREF="AddRooms0.jsp" target="RFrame"><img border="0" name="AddRooms" src="Images/AddRooms0.jpg" onmouseover="document['AddRooms'].src='Images/AddRooms01.jpg'" onmouseout="document['AddRooms'].src='Images/AddRooms0.jpg'" ></A></TD>
		
		<TD><A HREF="MemberReviews0.jsp" target="RFrame"><img border="0" name="MemberReviews" src="Images/MemberReviews0.jpg" onmouseover="document['MemberReviews'].src='Images/MemberReviews01.jpg'" onmouseout="document['MemberReviews'].src='Images/MemberReviews0.jpg'" ></A></TD>

		<TD><A HREF="Logout.jsp" target="BodyFrame"><img border="0" name="Logout" src="Images/Logout0.jpg" onmouseover="document['Logout'].src='Images/Logout1.jpg'" onmouseout="document['Logout'].src='Images/Logout0.jpg'" ></A></TD>

		<TD></td>
		
</TR>
</table>

</center>
</font>
</body>
</html>