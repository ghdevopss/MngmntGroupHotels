<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,com.eResorts.MyFunctions"%>
<%			String Condition = "LocationName";
%>

<HTML>
<HEAD>
<TITLE>View Rooms</TITLE>
    <LINK href="styles.css" type="text/css" rel="stylesheet">
<SCRIPT LANGUAGE="JavaScript">
	<!--
		function validate(){
			var frm = document.forms(0);
			var ResortID = frm.ResortID.value;
			if(ResortID!=""){
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
<FORM Name='Rooms' Id="Rooms" method="Post" onsubmit="return validate();" action="ViewRooms1.jsp" >
		<TABLE align=center width="30%">
		<TR class="row_title">
			<TD colspan=2 align=center><B><CENTER>Choose Location</CENTER></B></TD>
				<TR class="row_even">
			<TH>Location Name</TH>
			<TD><INPUT TYPE="hidden" NAME="LName" value=""><SELECT NAME="ResortID">
			<OPTION Value="">Select</OPTION>

<%
	try{
			Connection con=null;
			ResultSet rs=null;
			Statement stmt=null;
			String[] ConValues = new String[2000];
			String[] IDValues = new String[2000];

			int ConCount=0,i=0;
			String Query1="";con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			if(Condition.trim().equalsIgnoreCase("undefined")){
				System.out.println("in if");
				Query1 = "Select * from resortsinfo";
			}
			else{
				System.out.println("in else");
				Query1 = "Select "+Condition+",ResortID from resortsinfo";
			}
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			System.out.println(rs);
			int rCount=0;
				while(rs.next()){
					String x = rs.getString(1);
					String ResortID=rs.getString(2);
					System.out.println(ResortID);
					ConValues[i]=x;
					IDValues[i]=ResortID;

					%><OPTION Value=<%=IDValues[i]%>><%=ConValues[i]%></OPTION><%
					i++;
				}
		}catch(Exception e){%><%=e%><%}
%>
		<TR><TH align=center colspan=2><INPUT TYPE="submit" value='ViewRooms'></TH></TR>
	</TABLE>
	</FORM>
	</BODY>

</HTML>
