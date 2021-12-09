package com.company;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class RequestsDao {
		
		

	public List<Request> getArchivedRequests() {
		
		List<Request> archivedRequestList = new ArrayList<>();
		
		Connection connection;
		try {
			connection = DbConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM requests where status = 0");
			while(resultSet.next()){
				Request request = new Request();
				request.setId(resultSet.getInt("id"));
				request.setName(resultSet.getString("name"));
				request.setEmail(resultSet.getString("email"));
				request.setMessage(resultSet.getString("message"));
				request.setStatus(resultSet.getBoolean("status"));
				
				archivedRequestList.add(request);
				
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(archivedRequestList);
		return archivedRequestList;
	}	
	
	public List<Request> getActiveRequests() {
		
		List<Request> activeRequestList = new ArrayList<>();
		
		Connection connection;
		try {
			connection = DbConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery("SELECT * FROM requests where status = 1");
			while(resultSet.next()){
				Request request = new Request();
				request.setId(resultSet.getInt("id"));
				request.setName(resultSet.getString("name"));
				request.setEmail(resultSet.getString("email"));
				request.setMessage(resultSet.getString("message"));
				request.setStatus(resultSet.getBoolean("status"));
				
				activeRequestList.add(request);
				
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return activeRequestList;
	}
}
