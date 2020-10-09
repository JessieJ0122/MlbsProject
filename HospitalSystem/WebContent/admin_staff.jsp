<%@ page  import="java.sql.*" import="databaseconnection.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1" />
<title>Auction Fraud</title>
<link href="style.css" rel="stylesheet" media="all" type="text/css" />
</head>

<body>
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
        <li><a href="admin_home.jsp">Manage patients</a></li>
		<li><a href="admin_staff.jsp" class="active">Staff</a></li>
		<li><a href="admin_payment.jsp">Bills</a></li>
		<li><a href="admin_test.jsp">Testings</a></li>
		 <li><a href="index.html">Logout</a></li>
		 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        <strong><font color="#FFFFFF" size="+1">Welcome:</font><font color="#FF0000" size="+1">ADMIN</font></strong> 
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
              &nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#FF3300" size="+1" face="Georgia, Times New Roman, Times, serif">Laboratory Staff</font></strong> <br> <br> <br> 
              <form name="f" action="off_search.jsp" method="post" onsubmit="return valid()">
                <table bgcolor="#FFFFFF" width="700" border="0">
                  <tr> 
                    <td colspan="2" align="center"><font size="2"><b> 
                     
                      </b></font></td>
                  </tr>
                  <tr bgcolor="#E4E4F1"> 
                    <td align="center"><font color="#110022"><strong>Staff ID</strong></font></td>
     
                    <td align="center"><font color="#110022"><strong>User Name</strong></font></td>
                 	<td align="center"><font color="#110022"><strong>User ID</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Email</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Date</strong></font></td>
               
                    <td align="center"><font color="#110022"><strong>Authorize</strong></font></td>
                  </tr>
                  <%
			
			
			
			String pname=null,pid=null,userid=null,email=null,date=null,authorize=null;
ResultSet rs=null;
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from lab";
		rs =st.executeQuery(qry);
	while(rs.next())
	{
	pid=rs.getString("uid");
	pname=rs.getString("name");
	userid = rs.getString("userid");
	email = rs.getString("email");
	date = rs.getString("date");
	authorize = rs.getString("authorize");
	
 %>
                  <tr bgcolor="#FFFFCC"> 
                    <td align="center"> <strong><font color="#6300C6"> <%=pid%> 
                      </font></strong></td>
    
                    <td align="center"><strong><font color="#6300C6"> <%=pname%> 
                      </font></strong></td>
                    
                    <td align="center"><strong><font color="#6300C6"> <%=userid%> 
                      </font></strong></td>
                      
                    <td align="center"><strong><font color="#6300C6"> <%=email%> 
                      </font></strong></td>
                      
                      <td align="center"><strong><font color="#6300C6"> <%=date%> 
                      </font></strong></td>
                      
 
                     <%
                     	if(authorize.charAt(0)=='r'){
                     		
                     %>
                     	<td align="center"><strong><font color="#6300C6"> <%=authorize%> 
                      </font></strong></td>
                     <% 
                     	}else{
                     %>
                     	<td align="center"><a href="auth_lab.jsp?<%=pid%>"><font color="#FF0000" size="+1">Authorize<strong> 
                      </strong></font></a></td>
                     <%
                 
                     	}
                     %>
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
          <tr bgcolor="#CC3300"> 
            <td width="610" bgcolor="#FBF7E1" valign="top"> <br> <br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;<strong><font color="#FF3300" size="+1" face="Georgia, Times New Roman, Times, serif">Payment Staff</font></strong> <br> <br> <br> 
              <form name="f" action="off_search.jsp" method="post" onsubmit="return valid()">
                <table bgcolor="#FFFFFF" width="700" border="0">
                  <tr> 
                    <td colspan="2" align="center"><font size="2"><b> 
                     
                      </b></font></td>
                  </tr>
                  <tr bgcolor="#E4E4F1"> 
                    <td align="center"><font color="#110022"><strong>Staff ID</strong></font></td>
     
                    <td align="center"><font color="#110022"><strong>User Name</strong></font></td>
                 	<td align="center"><font color="#110022"><strong>User ID</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Email</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Date</strong></font></td>
               
                    <td align="center"><font color="#110022"><strong>Authorize</strong></font></td>
                  </tr>
                  <%
			
			
			
			
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from bill";
		rs =st.executeQuery(qry);
	while(rs.next())
	{
	pid=rs.getString("uid");
	pname=rs.getString("name");
	userid = rs.getString("userid");
	email = rs.getString("email");
	date = rs.getString("date");
	authorize = rs.getString("authorize");
	
 %>
                  <tr bgcolor="#FFFFCC"> 
                    <td align="center"> <strong><font color="#6300C6"> <%=pid%> 
                      </font></strong></td>
    
                    <td align="center"><strong><font color="#6300C6"> <%=pname%> 
                      </font></strong></td>
                    
                    <td align="center"><strong><font color="#6300C6"> <%=userid%> 
                      </font></strong></td>
                      
                    <td align="center"><strong><font color="#6300C6"> <%=email%> 
                      </font></strong></td>
                      
                      <td align="center"><strong><font color="#6300C6"> <%=date%> 
                      </font></strong></td>
                      
 
                     <%
                     	if(authorize.charAt(0)=='r'){
                     		
                     %>
                     	<td align="center"><strong><font color="#6300C6"> <%=authorize%> 
                      </font></strong></td>
                     <% 
                     	}else{
                     %>
                     	<td align="center"><a href="auth_bill.jsp?<%=pid%>"><font color="#FF0000" size="+1">Authorize<strong> 
                      </strong></font></a></td>
                     <%
                 
                     	}
                     %>
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
