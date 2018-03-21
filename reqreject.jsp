<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%
String UserID=request.getParameter("UserID");
%>
<HEAD>
<HTML>
<HEAD>
<TITLE>Welcome</TITLE>
    <LINK href="styles.css" type="text/css" rel="stylesheet">

</HEAD>

<BODY Class='SC'>
<P align=center><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'> 
Sorry! <%=UserID%> your account has been rejected  </Font></P><br>
<P align=center><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'> 
  </Font></P>
<P align=center><U><FONT SIZE="5" COLOR="#AA2504" face='monotype corsiva'> 
admin@ezest.com </Font></U></P>
<P align=center><A href ="Login.jsp">Back</A></P>



</BODY>


</HTML>
