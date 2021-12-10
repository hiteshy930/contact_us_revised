package com.models;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {
	private final static String url = "jdbc:postgresql://localhost:5432/contactus";
	private final static String username = "postgres";
	private final static String password = "hitesh123";

	public static Connection getConnection() throws SQLException, ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		return DriverManager.getConnection(url, username, password);
	}
}
