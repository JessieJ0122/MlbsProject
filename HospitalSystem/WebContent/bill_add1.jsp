<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>treasure warehouse</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript">

</script>
</head>

<body>

<%
java.util.Date now = new java.util.Date();
	String DATE_FORMAT1 = "dd/MM/yyyy hh:mm:ss a";
	SimpleDateFormat sdf1 = new SimpleDateFormat(DATE_FORMAT1);
    String strDateNew1 = sdf1.format(now);
	String billid = (String)session.getAttribute("sid");
	String billname = (String)session.getAttribute("sname");
Connection con=null;


PreparedStatement psmt1=null;

String uid = request.getParameter("uid");
String uname = request.getParameter("uname");
String tname = request.getParameter("tname");
String tresult = request.getParameter("tresult");

try{
con=databasecon.getconnection();


psmt1=con.prepareStatement("insert into payment(uid,uname,billid,billname,date,name,amount,status) values(?,?,?,?,?,?,?,?)");
psmt1.setString(1,uid);
psmt1.setString(2,uname);
psmt1.setString(3,billid);
psmt1.setString(4,billname);
psmt1.setString(5,strDateNew1);
psmt1.setString(6,tname);
psmt1.setString(7,tresult);
psmt1.setString(8, "unpaid");

psmt1.executeUpdate();
String msg= "bill_add.jsp?uid="+uid+"&uname="+uname+"&message=success";
response.sendRedirect(msg);

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

</body>
</html>