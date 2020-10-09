<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%@ page import="java.util.Date.*,java.text.SimpleDateFormat.*,java.text.ParseException.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>	

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
String sname=(String)session.getAttribute("sname");
String sid = (String)session.getAttribute("sid");

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
        <li><a href="bill_home.jsp">All Patients</a></li>
        <li><a href="bill_pay.jsp" class="active">All Payment</a></li>
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
              Payments</font></strong> <br> <br> <br> 
              <form name="s" action="bill_add1.jsp" method="get"">
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
                    <td align="center"><font color="#110022"><strong>Payment ID</strong></font></td>
     				<td align="center"><font color="#110022"><strong>User ID</strong></font></td>
                    <td align="center"><font color="#110022"><strong>User Name</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Date</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Payment Name</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Amount</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Status</strong></font></td>
                    <td align="center"><font color="#110022"><strong>Operation</strong></font></td>
                  </tr>
                  <%
			
			
			
			String resid=null,uname=null,uid=null,date=null,name=null,amount=null,status=null;
ResultSet rs=null;
try
{
	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();	

    String qry="select * from payment where billid="+sid;
		rs =st.executeQuery(qry);
	while(rs.next())
	{
	resid=rs.getString("pay_id");
	uid=rs.getString("uid");
	uname=rs.getString("uname");
	name = rs.getString("name");
	amount = rs.getString("amount");
	status = rs.getString("status");
	date = rs.getString("date");
	
 %>
                  <tr bgcolor="#FFFFCC"> 
                    <td align="center"> <strong><font color="#6300C6"> <%=resid%> 
                      </font></strong></td>
    
                    <td align="center"><strong><font color="#6300C6"> <%=uid%> 
                      </font></strong></td>
                    
                    <td align="center"><strong><font color="#6300C6"> <%=uname%> 
                      </font></strong></td>
                      
                    <td align="center"><strong><font color="#6300C6"> <%=date%> 
                      </font></strong></td>
                      
                      <td align="center"><strong><font color="#6300C6"> <%=name%> 
                      </font></strong></td>
                      
                      <td align="center"><strong><font color="#6300C6"> <%=amount%> 
                      </font></strong></td>
                      <td align="center"><strong><font color="#6300C6"> <%=status%> 
                      </font></strong></td>
                      
                    <td align="center"><a href="bill_mod.jsp?resid=<%=resid%>"><strong><font color="#CC0000">Modify</font></strong></a></td>
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
