package com.company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao {
	
	Connection connection = null;
	public boolean checkUserValidation(String username, String password) {
		boolean isInserted = false;
		try {
			connection = DbConnection.getConnection();
			PreparedStatement statementQuery = connection.prepareStatement("select * from users where email=? and password=?");
			statementQuery.setString(1,username);
			statementQuery.setString(2,password);
			
			ResultSet resultSet = statementQuery.executeQuery();
			isInserted = resultSet.next();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return isInserted;
	}
		
}
