<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID="";%>

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
		function ChkNumField(F,T){
			var val = F.value;
			if(isNaN(val)==true||val==""){alert("Please enter numbers for "+T);return false;}
		}
		function DoPassWordValidation()
			{
			  var frm = document.forms(0);
			  if(frm.upassword.value != frm.retypepassword.value)
			  {
				alert('The Password and verified password does not match');
				frm.upassword.value='';
				frm.retypepassword.value='';
				return false;
			  }
			  else
			  {
				return true;
			  }
			}
		function ChkEmailField(F,T){
			var val = F.value;
			var pattern = /^[a-zA-Z0-9\_\.]+\@[a-zA-Z\.]+\.([a-z]{2,4})$/;
			if(!(pattern.test(val)==true)){alert("Please enter valid email for "+T);return false;}
		}
		function validate()
		{		var frm = document.forms(0);
				MemberFee();
			    if(ChkMandatoryField(frm.UserID,'User Id')==false) return false;
				var divObj = document.getElementById("nameid");
				var Msg = divObj.innerHTML;
				if(Msg.indexOf("not available")>-1){
					alert("User name not available. Please choose another");
					frm.UserID.value="";
				}
				//not available
				if(ChkMandatoryField(frm.upassword,'password')==false) return false;
			    if(ChkMandatoryField(frm.retypepassword,'Re type password')==false) return false;
			    if(DoPassWordValidation()==false) return false;
				if(ChkMandatoryField(frm.FirstName,'First Name')==false) return false;
			    if(ChkMandatoryField(frm.Age,'Age')==false) return false;
			    if(ChkNumField(frm.Age,'Age')==false) return false;

				if(ChkMandatoryField(frm.EmailAddress,'Email')==false) return false;
			    if(ChkEmailField(frm.EmailAddress,'Email')==false) return false;
				if(ChkMandatoryField(frm.Address,'Address')==false) return false;
			    if(ChkMandatoryField(frm.ContactNumber,'Contact Number')==false) return false;
			    if(ChkMandatoryField(frm.Occupation,'Occupation')==false) return false;
			    if(ChkMandatoryField(frm.MemberType,'Membership Type')==false) return false;
			   	if(ChkMandatoryField(frm.AmountDeposited,'AmountDeposited ')==false) return false;
				if(ChkMandatoryField(frm.cardnum,'cardnum')==false) return false;
				if(ChkMandatoryField(frm.pin,'pin')==false) return false;
				if(ChkNumField(frm.cardnum,'Credit Card Number')==false) return false;
		}
function MemberFee(){
			frm = document.forms(0);
			T= frm.MemberType.value;
			//alert(T);
			if(T=="Silver"){
			Amount=5000;
			
			}else if(T=="Gold"){
				
			Amount=10000;
			}else if(T=="Platinum"){
				
			Amount=15000;
			}
			
			//alert(Amount);
			frm.AmountDeposited.value =Amount;
			
		}

function fnCallChkAvailability(U)
	{
		var UserID = U.value;
		var divObj = document.getElementById("nameid");
		URL = "ChkUser.jsp?UserID="+UserID;
		ajaxFunction(URL,divObj);
	}
	</script>

<BODY  Class="SC">
<h3 align=center>New User Registration</h3>
<table align=right>
<P align=right><A href="Login.jsp"><IMG SRC="Images/Login.jpg" WIDTH="106" HEIGHT="26" BORDER="0" ALT=""></A>
<td><h6>If you are already a member</h6></td>
</table>
<FORM NAME="RegUser" ACTION="Register1.jsp" onsubmit="return validate();">
	
 <center>
 <TABLE width="60%">
	
<TR class="row_title">
	<Td align=center> New User Details<BR></Td>
</TR>
		<TR class=row_even><TH align="left">Choose User Name
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type=text name='UserID' value='' onchange='fnCallChkAvailability(this)'>
		<div id='nameid'></div>
		</TD>
		</TR>
		
		<TR class=row_even><TH align="left">Password
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type='password' name='upassword'  value=''>
		</TR>

		<TR class=row_even><TH align="left">ReType Password
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type='password' name='retypepassword'  value=''>
		</TR>

        <TR class=row_even><TH align="left">First Name
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='FirstName' value=''>
		</TR>

		<TR class=row_even><TH align="left">Last Name</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='LastName' value=''>
		</TR>

		<TR class=row_even><TH align="left">Age</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='Age' value=''>
		</TR>
		<TR class=row_even><TH align="left">Email Address
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='EmailAddress' value=''>
		</TR>
		
		<TR class=row_even><TH align="left">Address
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<textarea name="Address" ></textarea>
		</TR>
		<TR class=row_even><TH align="left">Contact Number
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='ContactNumber' value=''>
		</TR>

		<TR class=row_even><TH align="left">Occupation
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='Occupation' value=''>
		</TR>

		<TR class=row_even><TH align="left">Credit Card Number
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='cardnum' value=''>
		</TR>

		<TR class=row_even><TH align="left">PIN
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="password"  name='pin' value=''>
		</TR>

		<TR class=row_even>
				<TH align="left">MemberType<FONT COLOR="red">*</FONT></TH>
				<TD class=row_odd>&nbsp;&nbsp;<select name=MemberType>
				<option value="Silver">Silver</option>
				<option value="Gold">Gold</option>
				<option value="Platinum">Platinum</option>
				</select></TD>
		</TR>
	    <TR class=row_even><TH align="left">AmountDeposited
		<FONT COLOR="red">*</TH>
		<TD class=row_odd>&nbsp;&nbsp;<Input type="text"  name='AmountDeposited' value='' readonly>
		</TR>
	        <TR>
		<TH><INPUT TYPE="submit" value='Register'></TH>
		<TH><INPUT TYPE="reset" value='Clear'></TH></TR>
		</TABLE>
</FORM>

</BODY>
</HEAD>
</HTML>