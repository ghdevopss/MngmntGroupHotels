<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.*,java.util.Vector,java.util.StringTokenizer" %>
<%String UserID=(String)session.getAttribute("UserID");
	String ResortID = (String)request.getParameter("ResortID");
	session.setAttribute("ResortID",ResortID);
String LocationName="";
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
			    if(ChkMandatoryField(frm.ResortID,'ResortID')==false) return false;
				if(ChkMandatoryField(frm.LocationName,'Location Name')==false) return false;
			   if(ChkMandatoryField(frm.RoomType,'RoomType')==false) return false;
			   if(ChkMandatoryField(frm.RoomArea,'RoomArea')==false) return false;
			   if(ChkMandatoryField(frm.DryKitchenette,'DryKitchenette')==false) return false;
			   if(ChkMandatoryField(frm.SofacumBed,'SofacumBed')==false) return false;
			    if(ChkMandatoryField(frm.DoubleBeds,'DoubleBeds')==false) return false;
			    if(ChkMandatoryField(frm.Telephone,'Telephone')==false) return false;
			    if(ChkMandatoryField(frm.Television,'Television')==false) return false;
			    		  
			 if(ChkMandatoryField(frm.RoomCharges,'RoomCharges')==false) return false;
		}
		

</script>

<BODY  Class="SC">
<h3 align=center>Add New Room</h3>
<table align=right>
<TD><A HREF="ViewRooms0.jsp" target="RFrame"><img border="0" name="Rooms" src="Images/ViewRooms0.jpg" onmouseover="document['Rooms'].src='Images/ViewRooms01.jpg'" onmouseout="document['Rooms'].src='Images/ViewRooms0.jpg'" ></A></TD>
</table>

<FORM NAME="Resorts" ACTION="AddRooms2.jsp" OnSubmit="return validate()">
	
 <center>
 <TABLE width="40%" align=center>
		<TR class="row_title">
		  <TH align="center" colspan=2><FONT SIZE="4" COLOR="#AA2504" face='monotype corsiva'>Add New Room</FONT></TH>
		</TR>
		<Input type=hidden name=UserID value='<%=UserID%>'>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>ResortID  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='ResortID' value='<%=ResortID%>'></TD></tr>
		
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Location Name </FONT><FONT COLOR="red">*</FONT></TD>
		  <%
	try{
			Connection con=null;
			ResultSet rs=null;
			Statement stmt=null;
			String Query1="";con = com.eResorts.ConnectionPool.getConnection();
			stmt =  con.createStatement();
			
				System.out.println("in else");
				Query1 = "Select LocationName from resortsinfo where ResortID='"+ResortID+"' ";
			
			String str="";
			System.out.println(Query1);
			rs = stmt.executeQuery(Query1);
			System.out.println(rs);
			int rCount=0;if(rs!=null){
				while(rs.next()){
					LocationName = rs.getString(1);
				}}
		}catch(Exception e){%><%=e%><%}
%>
		  <TD><Input type=text name='LocationName' value='<%=LocationName%>'></TD></tr>
		 
		
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Room Type  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="RoomType">
				<option value="StudioApartment">StudioApartment</option>
				<option value="SingleBedRoomApartment">SingleBedRoomApartment</option>
				<option value="DoubleBedRoomApartment">DoubleBedRoomApartment</option>
				</select></TD></tr>
				<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>RoomArea  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='RoomArea' value=''>sqft</TD></tr>
		
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>DryKitchenette  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="DryKitchenette">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>SofacumBed  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="SofacumBed">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>DoubleBeds  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="DoubleBeds">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select></TD></tr>
		<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Telephone  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Telephone">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select></TD></tr>
		<tr class=row_even>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>Television  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD><select name="Television">
				<option value="Yes">Yes</option>
				<option value="No">No</option>
				</select></TD></tr>
			<tr class=row_odd>
		  <TD align="left"><FONT SIZE="2" COLOR="#AA2504" face='monotype corsiva'>RoomCharges  </FONT><FONT COLOR="red">*</FONT></TD>
		  <TD ><Input type=text name='RoomCharges' value=''>Rs</TD></tr>
			
  		  <tr class=row_even>
		<TH  ><INPUT TYPE="submit" value='AddRoom'></TH>
		<TH  ><INPUT TYPE="reset" value='Clear' ></TH></TR>
		</TABLE>
</FORM>
</BODY>
</HEAD>
</HTML>