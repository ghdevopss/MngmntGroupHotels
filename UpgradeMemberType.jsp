<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
 <% 
String UserID=(String)session.getAttribute("UserID");
UserID = (session.getAttribute("UserID")==null) ? "Null" : (String)session.getAttribute("UserID"); 
String AmountDeposited="";

if(UserID.equals("Null"))
{
	session.invalidate();
	%>
	<!--<H5 align=center><IMG SRC="Images/error.gif" WIDTH="17" HEIGHT="13" BORDER=0 ALT="">Session time out...Please login again</H5>-->
	<script language=javascript>
		location.replace('sessiontimeout.html');
	</script>
	<% 
}
else{
%>
<HEAD>
	<script LANGUAGE="Javascript" SRC="Images/validate.js"></script>

	
	<LINK href="styles.css" type="text/css" rel="stylesheet">
 <script LANGUAGE="Javascript" SRC="Images/calender.js"></script>
 <script LANGUAGE="Javascript" SRC="">

function validate()
	{		var frm = document.forms(0);
				MemberFee();
	}
 function MemberFee(){
			frm = document.forms(0);
			T= frm.MemberType.value;
			//alert(T);
			if(T=="Gold"){
				
			Amount=5000;
			}else if(T=="Platinum"){
				
			Amount=5000;
			}
			
			//alert(Amount);
			frm.AmountDeposited.value =Amount;
			
		}
		</Script>
</HEAD>
<BODY class="SC">

<h3 align=center>Details of <%=UserID%></h2>
<FORM Name="EditDetails" ACTION="UpgradeMemberType1.jsp?AmountDeposited=<%=AmountDeposited%>" OnSubmit="return validate()" >
<%

	Connection con=null;
	ResultSet rs=null;
	Statement stmt=null;
	try{
			con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			String Query = "Select * from userprofile where UserID='"+UserID+"'";
			System.out.println(Query);
			rs = stmt.executeQuery(Query);
			
			}
			catch(Exception e){
			%><%=e%><%
		}
			

	
if(rs!=null)
{
			%>
	<!--Displaying the table header-->

	<br>
<!--	<DIV STYLE="overflow:scroll;width:650px; height:400px;">-->

	
<%
int DisRow1=0;
			while(rs.next())
			{	String MemberType=rs.getString(10);
				AmountDeposited=rs.getString(11);
				session.setAttribute("ADeposited",AmountDeposited);
				DisRow1++;
				%>
<%if(MemberType.equals("Platinum")){%>
		<TD class=row_odd>
		<h3 align=center>No further upgrades for Platinum type of Members</h3>
		</TD>						<center><input type=button value=close onclick="window.close();"></center>
				<%}else{%>
		<table align=center border=0  width="60%">
		 <TR class="row_title">
		<Td align=left colspan=2><FONT COLOR="#00549A" size=3>Member Type</FONT></td>
		</TR>
		 
		 <tr class=row_even><td align=Left style="background-color:#F4E6C4" ><b>Previous Type</b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><Input type=text name="PreviousMemberType" value="<%=MemberType%>" readonly></font></td></tr>
		<tr class=row_even><td align=Left style="background-color:#F4E6C4" ><b>Member Type</b></td><%if(MemberType.equals("Gold")){%>
<TD class=row_odd>&nbsp;&nbsp;<select name=MemberType>
				<option value="Platinum">Platinum</option>
				
				</select></TD>
				
				<%}else if(MemberType.equals("Silver")){%>
		<TD class=row_odd>&nbsp;&nbsp;<select name=MemberType>
				<option value="Gold">Gold</option>
				<option value="Platinum">Platinum</option>
				
				</select></TD>
			<%}%>	
	
	 <tr class=row_even><td align=Left style="background-color:#F4E6C4" ><b>AmountDeposited </b></td>
		 <td align=Left style="background-color:#F8EDD6"><font  color="black"><Input type=text name="AmountDeposited" value="<%=AmountDeposited%>" readonly></font></td></tr>
		
		
		<TR>
		<TH><INPUT TYPE="submit" value='UpGrade' ></TH>
		<TH><INPUT TYPE="reset" value='Clear' ></TH></TR>
		</table>	
		<%}%>

	<%
	}
	rs.close();

	if(DisRow1==0)
{
	/*To write to the server if the resultset is null*/
	%>
		<CENTER>
			<tr><th colspan=6>No Records found</th></tr>
		</CENTER>
	<%}
}

%>


</table>

</FORM>
</BODY>
</HTML>
<%
}
%>
