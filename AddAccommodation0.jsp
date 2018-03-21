<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");
%>
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
			    if(ChkMandatoryField(frm.LocationName,'Location Name')==false) return false;
			    if(ChkMandatoryField(frm.LocationImage,'LocationImage')==false) return false;
			   if(ChkMandatoryField(frm.LocationDesc,'Location Description')==false) return false;
			  
		}
		function fnUpload()
	{
		var userid = document.forms(0).userid;
		fnEmpPopUp('UploadPhoto1.jsp?userid='+userid,80,400);
	}

</script>

<BODY  Class="SC">
<h3 align=center>Add New Location</h3>
<table align=right>
<TD><A HREF="Accommodation0.jsp" target="RFrame"><img border="0" name="Location" src="Images/ViewLocations0.jpg" onmouseover="document['Location'].src='Images/ViewLocation1.jpg'" onmouseout="document['Location'].src='Images/ViewLocations0.jpg'" ></A></TD>
</table>

<FORM NAME="Locations" ACTION="AddAccommodation1.jsp" OnSubmit="return validate()">
	
 <center>
 <TABLE width="30%" class="notepad">
		<TR class="row_title">
		  <TH align="center" colspan=3><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>Add New Location</FONT></TH>
		</TR>
		<Input type=hidden name=UserID value='<%=UserID%>'>
		<tr class=row_odd>
		  <TD align="left" width="40%"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Location Name </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD colspan=2 align=left><Input type=text name='LocationName' value=''></TD></tr>
		  <tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Location Image </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD colspan=2 align=left>		 
		<div id="infodiv"></div><Input type="text" name='PhotoPath' ><INPUT id="FUBtn" name="FUBtn" class= "UploadButton" TYPE="Button" value='Attach PhotoPath' onclick="fnUpload()" class="UploadButton"><br>
		</TR>

		  <tr class=row_odd><TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Location Description<FONT COLOR="red">*</FONT></TD>
		  <TD align=left><textarea name='LocationDesc' ROWS="10" COLS="20"value='' ></textarea></TD>
		  <td><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'><B>Place info about location  here </B></Font></td>
		  </tr>
		
		
  		  <tr class=row_odd>
		<TH  colspan=2><INPUT TYPE="submit" value='AddLocation'></TH>
		<TH  colspan=2><INPUT TYPE="reset" value='Clear' ></TH></TR>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>