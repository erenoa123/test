<%@page contentType="text/html; charset=Windows-31J"%>
<%@page import="com.tuyano.web.ConnectionManager, java.sql.*"%>
<%@page import="com.tuyano.web.ConnectionManager, java.net.*"%>
<html>
	<head>
		<title>Sample Index</title>
	</head>
	<body>
		<h1>Hello World! kurihara!!!</h1>
		<%= new java.util.Date().toString() %><br>

		<%

		try{
			String dataDate[] =  null;
			int dataFCnt[] =null;
			int dataSCnt[] =null;
			Connection con = ConnectionManager.getConnection();
			Statement smt = con.createStatement();
			ResultSet rs = smt.executeQuery("select * from kintore");
			int j =0;
			while(rs.next()) {
				dataDate[j] = rs.getString("date");
				out.println(dataDate[j]);
				j++;
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