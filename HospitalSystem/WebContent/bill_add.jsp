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
        <li><a href="bill_home.jsp" class="active">All Patients</a></li>
        <li><a href="bill_pay.jsp" >All Payment</a></li>
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
              Patients</font></strong> <br> <br> <br> 
              <form name="s" action="bill_add1.jsp" method="get"">
                <table align="left" cellpadding="5" cellspacing="5" width="300">
                  <tr> 
                    <td colspan="2" align="center"><font size="2"><b> 
                      <%
                                                       String message=request.getParameter("message");
                                                       if(message!=null && message.equalsIgnoreCase("success"))
                                                       {
                                                               out.println("<font color='red' size='+1'><blink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Generated Payment Result Successfully !</blink></font>");
                                                       }
                                               %>
                      </b></font></td>
                  </tr>
                  <%
                  	String uid = request.getParameter("uid");
                  	String uname = request.getParameter("uname");
                  	java.util.Date now = new java.util.Date();
               	 	String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
               	 	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
                    String strDateNew1 = sdf1.format(now);
                  %>
                  <tr> 
                    <td><font face="Courier New" size="+1"><strong>Patient ID</strong></font></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="uid" readonly="readonly" value="<%=uid %>" id="b"></td>
					<td></td>
                  </tr>
                  <tr> 
                    <td><font face="Courier New" size="+1"><strong>Patient Name</strong></font></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="uname" readonly="readonly" value="<%=uname %>" id="b"></td>
                    <td></td>
                  </tr>
                  <tr> 
                    <td><font face="Courier New" size="+1"><strong>Payment Name</strong></font></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="tname" id="b"></td>
                  </tr>
             
                  <tr> 
                    <td><font face="Courier New" size="+1"><strong>Amount</strong></font></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="tresult"  id="b"></td>
                  </tr>
        
                  <tr> 
                    <td><font face="Courier New" size="+1"><strong>Date</strong></font></td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="date"  id="b" value="<%=strDateNew1%>"></td>
                  </tr>
                  <tr> 
                    <td><input type="reset" name="r" value="clear" class="btn"></td>
                    <td><input type="submit" name="s" value="submit" class="btn" ></td>
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
