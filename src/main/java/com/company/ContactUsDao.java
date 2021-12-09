package com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import com.company.DbConnection;

public class ContactUsDao {	
	
	public int saveRequest(String name, String email, String message) {
		int numberOfRowsAffected = 0;
		Connection connection = null;
		try {
			connection = DbConnection.getConnection();
			PreparedStatement statementQuery = connection.prepareStatement("INSERT INTO requests(name,email,message)VALUES(?,?,?)");
			statementQuery.setString(1,name);
			statementQuery.setString(2,email);
			statementQuery.setString(3,message);
		    numberOfRowsAffected = statementQuery.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return numberOfRowsAffected;
	}
}
