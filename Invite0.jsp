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
			    if(ChkMandatoryField(frm.From,'From')==false) return false;
			    if(ChkMandatoryField(frm.To,'To')==false) return false;
			   
		}
</script>

<BODY  Class="SC">
<h3 align=center>Invite A Guest</h3>
<FORM NAME="RegUser" ACTION="Invite1.jsp" OnSubmit="return validate()">
	
 <center>
 <TABLE width="40%" class="notepad">
		<TR class="row_title">
		  <TH align="center" colspan=3><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>Invite your friends to eZest </FONT></TH>
		</TR>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>From</FONT><FONT COLOR="red">*</FONT></TD>
		  <TD colspan=2 align=left><Input type=text name='From' value='<%=UserID%>'></TD></tr>
		  <tr class=row_even><TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>To<FONT COLOR="red">*</FONT></TD>
		  <TD align=left><textarea name='To' ROWS="10" COLS="20"value='' ></textarea></TD>
		  <td><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'><B>Enter the Email IDs of friends you wish to invite<br>Use commas to seperate email ids</B></Font></td>
		  </tr>
  		  <tr class=row_odd>
		<TH  colspan=2><INPUT TYPE="submit" value='Invite'></TH>
		<TH  colspan=2><INPUT TYPE="reset" value='Clear' ></TH></TR>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>