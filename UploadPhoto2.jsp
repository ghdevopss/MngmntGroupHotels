<%@ page language="java" %>
<%@ page session="true" %>
<%@ page import="java.sql.*,java.io.*,java.util.Random,java.util.Enumeration"%>
<%@ page import="com.eResorts.MultipartRequest"%>
<%	
String UserID = (String)session.getAttribute("UserID");
String Location = application.getRealPath(request.getServletPath());
String dirpath = Location.substring(0,Location.lastIndexOf("\\"));
String FPath = dirpath+"\\Images\\"+"\\Photos";
%>
<link rel="STYLESHEET" type="text/css" href="styles.css">
<SCRIPT LANGUAGE="JavaScript">
<!--
//-->
</SCRIPT>
<BODY  Class=Grad>
<%
		try{

			MultipartRequest multi =
						new MultipartRequest(request,FPath,5 * 1024 * 1024);
			Enumeration params = multi.getParameterNames();

			while( params.hasMoreElements() ){
				String name = (String)params.nextElement();
				String value = multi.getParameter(name);
			}

%>

			<!--show which files we recvd-->

<%			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements() ){
				String name = (String)files.nextElement();
				String filename = multi.getFilesystemName(name);
				String type = multi.getContentType(name);
				System.out.println(filename);
				File f = multi.getFile(name);
				session.setAttribute("filename",filename);

%>
				<!--name:   <%=name%>-->
				<BR><BR><BR><BR><BR><BR><BR>
				<SCRIPT LANGUAGE="JavaScript">
				<!--
					window.close();
				//-->
				</SCRIPT>
				
				<center><B>Uploaded Successfully!</B></center>
				
<%	
                           

			}
		}
		catch(IOException e){
			%>
			<pre>
			<script>
					window.alert('Error in Uploading. Please try again!');
			</script>	
			<%=e%>
			</PRE>
			<%
		}

%>
</body></html>


