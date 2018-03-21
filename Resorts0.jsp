<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%			String Condition = "LocationName";
%>

<HTML>
<HEAD>
<TITLE>View Resorts</TITLE>
    <LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
	<!--
		function validate(){
			var frm = document.forms(0);
			var LocationName = frm.LocationName.value;
			if(LocationName!=""){
				return true;
			}else{
				alert("Please select Location Name to proceed");
				return false;
			}
		}
	//-->
	</SCRIPT>
</HEAD>

<BODY Class='SC'>
<HR><br>
<FORM Name='Resorts' Id="Resort" method="Post" onsubmit="return validate();" action="Resorts1.jsp" >
		<TABLE align=center width="30%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Choose Resort Location</CENTER></B></TD>
				<TR class="row_even">
			<TH>Location Name</TH>
			<TD><INPUT TYPE="hidden" NAME="LName" value=""><SELECT NAME="LocationName">
			<OPTION Value="">Select</OPTION>

<%
	try{
			Connection con=null;
			ResultSet rs=null;
			Statement stmt=null;
			String[] ConValues = new String[2000];
			int ConCount=0,i=0;
			String Query1="";con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from accommodation";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+" from accommodation";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			System.out.println(rs);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					ConValues[i]=x;
					%><OPTION Value=<%=ConValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>
		<TR><TH align=center colspan=2><INPUT TYPE="submit" value='ViewResort'></TH></TR>
	</TABLE>
	</FORM>
	</BODY>

</HTML>
