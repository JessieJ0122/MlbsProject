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
String u3=(String)session.getAttribute("u3");
Connection con=null;


PreparedStatement psmt1=null;


String a = request.getParameter("uid");
String x = request.getParameter("un");
String b = request.getParameter("pass");
String d = request.getParameter("eid");
String ff="unregistered";

try{
con=databasecon.getconnection();


psmt1=con.prepareStatement("insert into bill(uid,name,userid,pass,email,date,authorize) values(?,?,?,?,?,?,?)");
psmt1.setString(1,u3);
psmt1.setString(2,x);
psmt1.setString(3,a);
psmt1.setString(4,b);
psmt1.setString(5,d);
psmt1.setString(6,strDateNew1);
psmt1.setString(7,ff);

psmt1.executeUpdate();
response.sendRedirect("bill_signup.jsp?message=success");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

</body>
</html>