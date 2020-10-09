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


PreparedStatement psmt1=null;

String tname = request.getParameter("tname");
String tresult = request.getParameter("tresult");
String resid = request.getParameter("resid");
String status = request.getParameter("status");
Connection con = null;
try{
con=databasecon.getconnection();
psmt1=con.prepareStatement("update payment set name='"+tname+"',status='"+status+"', amount ='"+tresult+"' where pay_id='"+resid+"'");
psmt1.executeUpdate();
response.sendRedirect("bill_mod.jsp?resid="+resid+"&message=success");

}
catch(Exception ex)
{

out.println("Error in connection : "+ex);

}

%>

</body>
</html>