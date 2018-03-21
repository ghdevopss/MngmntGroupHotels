<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,com.eResorts.MyFunctions"%>
<%
String UserID = (String)session.getAttribute("UserID");
%>	
<Head>
	<LINK href="styles.css" type="text/css" rel="stylesheet">

		<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<SCRIPT LANGUAGE="JavaScript">

<!--
function Validate()
{
	var Obj = document.calform;
	var retvalue = validatePeriod(document.calform.StartDate,document.calform.EndDate);
	if(retvalue==false){ alert("Start date should not exceed End date"); return retvalue; }
	else { return retvalue; }


return true;
}
//-->
</SCRIPT>

<BODY Class="SC">

<h3 align=center>Payment Details</h3>

<center>

<form name=calform action="MyPayments1.jsp" onsubmit="return Validate()">
<Table width="40%" align=center>
<TR class=row_even>
				<TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>StartDate</Font><FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='StartDate' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>
<TR class=row_even>
				<TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>EndDate</Font><FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='EndDate' value='' readonly><img onkeypress="fnCalendar(this)" id="imgDate" style="CURSOR: hand" onClick="fnCalendar(this);" height="16" src="Images/CalDis.gif" width="16" border="0" name="imgDate" onMouseOver="fnEnableCalLookup(this)" onMouseOut="fnDisableCalLookup(this)" ></TD>
		</TR>

<TR>
<TD align=center><INPUT TYPE="submit" id=SUB Value="Get Results" ></TD>
<TD align=center><INPUT id='RES' TYPE="RESET" onclick="location.reload()"></TD>
</TR>
</TABLE>
</form>
</center>


