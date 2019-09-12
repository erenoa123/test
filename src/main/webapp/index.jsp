<%@page contentType="text/html; charset=Windows-31J"%>
<%@page import="com.tuyano.web.ConnectionManager, java.sql.*"%>
<%@page import="com.tuyano.web.ConnectionManager, java.net.*"%>
<html>
	<head>
		<title>Sample Index</title>


	</head>
	<body>
		<h1>Hello World! kurihara!!!</h1>
		<%= new java.util.Date().toString() %>

<%
try{
	Connection con = ConnectionManager.getConnection();
	Statement smt = con.createStatement();
	ResultSet rs = smt.executeQuery("select * from shop");
	while(rs.next()) {
		String s = "id=" + rs.getInt("num")+",name="+rs.getString("name");
		out.println(s);
	}
	smt.close();
	con.close();
}catch(SQLException e){
	e.printStackTrace();
}catch(URISyntaxException e1){
	e1.printStackTrace();
}
%>
	</body>
</html>