package com.company;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class RequestsDao {

		public void allRequestsList() {
			List requestsList = new ArrayList();
			
			Connection connection;
			try {
				connection = DbConnection.getConnection();
				Statement statement = connection.createStatement();
				ResultSet resultSet = statement.executeQuery("SELECT * FROM requests");
				while(resultSet.next()){
					System.out.println(resultSet.getString("name"));
				}
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}
