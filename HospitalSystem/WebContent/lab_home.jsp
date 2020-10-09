<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title>Hospital</title>
<link href="style.css" rel="stylesheet" media="all" type="text/css" />
</head>

<body>
<% 
String sname=(String)session.getAttribute("labname");
String uid = (String)session.getAttribute("labid");

%>
<div id="wrapper"> 
  <div id="container"> 
    <div id="header"> 
      <div id="logo"><br>
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#FFFFFF" size="+2" face="Georgia, Times New Roman, Times, serif"> 
        Online Hospital <br>
        </font></strong></div></font></strong></div>
    </div>
    <!-- /header -->
    <div id="navbar"> 
      <ul>
        <li><a href="lab_home.jsp" class="active">All Patients</a></li>
        <li><a href="lab_res.jsp" >All Results</a></li>
		 <li><a href="index.html">Logout</a></li>
		 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <strong><font color="#FFFFFF" size="+1">Welcome:</font><font color="#FF0000" size="+1"><%=sname%></font></strong> 
        <!-- <li><a href="#">Admin</a></li>
        <li><a href="#">Link</a></li>
        <li><a href="#">Link</a></li>
        <li><a href="#">Link</a></li>-->
      </ul>
    </div>
    <!-- /navbar -->
    <div id="main"> 
      <div id="intro"> 
        <!-- <div id="sellerpic">
        </div>-->
        <!-- /jakepic -->
        <div id="text"> </div>
        <!-- /text -->
        <table height="350" align="center" width="700">
          <tr bgcolor="#CC3300"> 
            <td width="610" bgcolor="#FBF7E1" valign="top"> <br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#FF3300" size="+1" face="Georgia, Times New Roman, Times, serif">All 
              Patients</font></strong> <br> <br> <br> <form name="f" action="off_search.jsp" method="post" onsubmit="return valid()">
                <table bgcolor="#FFFFFF" width="700" border="0">
                  <tr> 
                    <td colspan="2" align="center"><font size="2"><b> 
                      <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                                                               out.println("<font color='red' size='+1'><blink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Offer Not available !</blink></font>");
                                                       }
													   else if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red' size='+1'><blink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Material Purchased !</blink></font>");
                                                       }
                                               %>
                      </b></font></td>
                  </tr>
                  <tr bgcolor="#E4E4F1"> 
                    <td align="center"><font color="#110022"><strong>Patient Id</strong></font></td>
     
                    <td align="center"><font color="#110022"><strong>User Name</strong></font></td>
                 	<td align="center"><font color="#110022"><strong>Mobile</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Email</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Date</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Type</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Operation</strong></font></td>
                  </tr>
                  <%
			
			
			
			String pname=null,pid=null,mobile=null,email=null,date=null,type=null;
ResultSet rs=null;
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from user";
		rs =st.executeQuery(qry);
	while(rs.next())
	{
	pid=rs.getString("uid");
	pname=rs.getString("name");
	mobile = rs.getString("mobile");
	email = rs.getString("email");
	date = rs.getString("date");
	type = rs.getString("type");
	
 %>
                  <tr bgcolor="#FFFFCC"> 
                    <td align="center"> <strong><font color="#6300C6"> <%=pid%> 
                      </font></strong></td>
    
                    <td align="center"><strong><font color="#6300C6"> <%=pname%> 
                      </font></strong></td>
                    
                    <td align="center"><strong><font color="#6300C6"> <%=mobile%> 
                      </font></strong></td>
                      
                    <td align="center"><strong><font color="#6300C6"> <%=email%> 
                      </font></strong></td>
                      
                      <td align="center"><strong><font color="#6300C6"> <%=date%> 
                      </font></strong></td>
                      
                      <td align="center"><strong><font color="#6300C6"> <%=type%> 
                      </font></strong></td>
                    <td align="center"><a href="lab_add.jsp?uid=<%=pid%>&uname=<%=pname%>"><strong><font color="#CC0000">Add lab result</font></strong></a></td>
                  </tr>
                  <%	  
}
	   }
	   catch(Exception e1)
	   {
	     out.println(e1.getMessage());
	   }
 %>
                </table>
              </form></td>
          </tr>
        </table>
      </div>
      <!-- /intro -->
      <div id="columns-wrapper"> 
        <!-- /form-intro -->
        <!-- /newsletter -->
        <!-- /right -->
        <!-- /left -->
      </div>
      <!-- /columns-wrapper -->
    </div>
    <!-- /main -->
    <div id="footer"> 
      <div id="footer-right">&nbsp;</div>
      <div id="footer-left">&nbsp;</div>
      <br>
      <br>
      <strong><font color="#33CC66">WWW.online.com</font></strong> </div>
    <!-- /footer -->
  </div>
  <!-- /container -->
</div>
<!-- /wrapper -->
</body>
</html>
