<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<%@ page import="com.eResorts.*"%>
 <HTML>
    <HEAD>

    <LINK href="styles.css" type="text/css" rel="stylesheet">
    <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
    <script LANGUAGE="Javascript" >
		function ChkMandatoryField(F,T){
			var val= F.value;
			if(val==""){alert(T+" is mandatory");return false;}
		}
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function ChkAlphaNumericField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter alphabets or numbers for "+T);return false;}
		}
		function ChkAlphaField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z ]{1,250})$/;
			if(!(pattern.test(val)==true)){alert("Please enter text for "+T);return false;}
		}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^([a-zA-Z0-9\_\.]{4,25}@[a-zA-Z0-9\_\.]{2,20}.[a-zA-Z\_\.]{2,8})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function ChkDateField(F,T)
		{
			var val = F.value;
		    var pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
		    if(!(pattern.test(val)==true)){alert("Please enter valid date format (yyyy-mm-dd) for "+T);return false;}
		}
		function validate()
		{
			var frm = document.forms(0);
			if(ChkMandatoryField(frm.user,'User Id')==false) return false;
			if(ChkMandatoryField(frm.password,'Password')==false) return false;
		}
	</script>
	</HEAD>
	<Body class=SC><BR><BR><BR><BR><BR>

	<FORM ACTION="AddUser1.jsp" onsubmit="return validate()">
	<TABLE align=center width="40%">
<TR class=row_title ALIGN="center">
	   <TH COLSPAN="2">Create Administrator Login</TH>
</TR>
		<TR class=row_odd>

				<TH align="left"><B>UserName</B><FONT COLOR="red">*</FONT></TH>
				<TD><Input type=text name='user' value=''></TD>
		</TR>
		<TR class=row_even>

				<TH align="left"><B>Password</B><FONT COLOR="red">*</FONT></TH>
				<TD><Input type=password name='password' value=''><Input type=hidden name='auth' value='0'></TD>
		</TR>
		<TR><TH><INPUT TYPE="submit" value='Submit'></TH><TH><INPUT TYPE="reset" value='Clear'></TH></TR>
	</TABLE>
	<H6 align=center>Fields with <FONT SIZE="" COLOR="red">*</FONT> are mandatory </H6>
	</FORM>
	</BODY>

