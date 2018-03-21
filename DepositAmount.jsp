<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");%>
<HTML>
<head>
		<LINK href="styles.css" type="text/css" rel="stylesheet">
		<script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>
		<script LANGUAGE="Javascript" SRC="Images/AjaxCall.js"></script>

<script LANGUAGE="Javascript" SRC="">
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
			}
		function validate()
		{		var frm = document.forms(0);
			    if(ChkMandatoryField(frm.cardnum,'Credit Card Number')==false) return false;
			    if(ChkMandatoryField(frm.pin,'PIN')==false) return false;
				if(ChkMandatoryField(frm.amount,'Amount')==false) return false;
			   
			   if(!validateNumber(frm.cardnum))
				   {alert("Please enter valid credit card details");return false;}
			   if(!validateNumber(frm.amount))
				   {alert("Enter a valid amount");return false;}
		}
</script>

<BODY  Class="SC">
<h3 align=center>Deposit Amount</h3>
<FORM NAME="DepositAmount" ACTION="DepositAmount1.jsp" OnSubmit="return validate()">
	
 <center>
 <TABLE width="40%" class="notepad">
		<TR class="row_title">
		  <TH align="center" colspan=2><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Provide your Credit Card details </FONT></TH>
		</TR>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Credit Card Number</FONT><FONT COLOR="red">*<td align=left><input type=text name=cardnum></FONT></TD>
		</tr>
		<tr class=row_even><TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>PIN<FONT COLOR="red">*</FONT></TD>
		  <TD align=left><input type=password name=pin></TD>
		</tr>
		<tr class=row_odd><TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Amount<FONT COLOR="red">*</FONT></TD>
		  <TD align=left><input type=text name=amount></TD>
		</tr>
  		<tr class=row_odd>
		<Td><INPUT TYPE="submit" value='Deposit Amount'></Td>
		<Td><INPUT TYPE="button" value='cancel' onclick="history.go(-1)"></Td></TR>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>