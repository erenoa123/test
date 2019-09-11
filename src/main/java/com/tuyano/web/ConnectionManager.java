package com.tuyano.web;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {


	public static Connection getConnection() throws URISyntaxException,SQLException {

	    URI dbUri = new URI(System.getenv("DATABASE_URL"));

	    String username = dbUri.getUserInfo().split(":")[0];
	    String password = dbUri.getUserInfo().split(":")[1];
	    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + dbUri.getPath();

	    return DriverManager.getConnection(dbUrl, username, password);

	}

//	public static void main(String[] args) throws URISyntaxException,SQLException {
//		Connection con =getConnection();
//		Statement smt = con.createStatement();
//		ResultSet rs = smt.executeQuery("select * from test");
//
//		while(rs.next()) {
//			String s = "id=" + rs.getString("id")+",name="+rs.getString("name");
//			System.out.println(s);
//		}
//		smt.close();
//		con.close();
//		System.out.println("END");
//
//	}

}
