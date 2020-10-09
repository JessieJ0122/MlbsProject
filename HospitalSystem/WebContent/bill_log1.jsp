<%@ page import="java.sql.*" import="databaseconnection.*"%>
<%
	String pass = null, uid = null;
try {
	String a = request.getParameter("uid");
	String b = request.getParameter("pass");
	String name = null, sid = null, tr = "registered";

	Connection con = databasecon.getconnection();
	Statement st = con.createStatement();

	String sss =  "select * from bill where userid='"+a+"' && pass='"+b+"' && authorize='"+tr+"'";

	ResultSet rs = st.executeQuery(sss);
	if (rs.next()) {
		try {
	Connection con1 = databasecon.getconnection();
	Statement st1 = con1.createStatement();

	String sss1 = "select * from bill where userid='" + a + "' && pass='" + b + "'";

	ResultSet rs1 = st1.executeQuery(sss1);
	while (rs1.next()) {
		name = rs1.getString("name");
		//cname = rs1.getString("cname");

		//pass=rs1.getString("password");
		sid=rs1.getString("uid");
	}
	session.setAttribute("sname", name);
	//session.setAttribute("scname", cname);
	//session.setAttribute("pass",pass);
	session.setAttribute("sid",sid);
		} catch (Exception e2) {
	out.println(e2.getMessage());
		}
		response.sendRedirect("bill_home.jsp");
	} else {
		response.sendRedirect("bill_log.jsp?message=fail");
	}
} catch (Exception e1) {
	out.println(e1.getMessage());
}
%>