package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

import com.models.DbConnection;
import com.models.Request;

public class RequestsDao {

	private static final String STATUS = "status";
	private static final String MESSAGE = "message";
	private static final String EMAIL = "email";
	private static final String NAME = "name";
	private static final String ID = "id";

	public List<Request> getArchivedRequests() {
		List<Request> archivedRequestList = new ArrayList<>();
		Connection connection;

		try {
			connection = DbConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.
					executeQuery("SELECT * FROM requests where status = 0");

			while (resultSet.next()) {
				Request request = new Request();
				request.setId(resultSet.getInt(ID));
				request.setName(resultSet.getString(NAME));
				request.setEmail(resultSet.getString(EMAIL));
				request.setMessage(resultSet.getString(MESSAGE));
				request.setStatus(resultSet.getBoolean(STATUS));

				archivedRequestList.add(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return archivedRequestList;
	}

	public List<Request> getActiveRequests() {
		List<Request> activeRequestList = new ArrayList<>();
		Connection connection;

		try {
			connection = DbConnection.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.
					executeQuery("SELECT * FROM requests where status = 1");
			while (resultSet.next()) {
				Request request = new Request();
				
				request.setId(resultSet.getInt(ID));
				request.setName(resultSet.getString(NAME));
				request.setEmail(resultSet.getString(EMAIL));
				request.setMessage(resultSet.getString(MESSAGE));
				request.setStatus(resultSet.getBoolean(STATUS));

				activeRequestList.add(request);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return activeRequestList;
	}

	public int makeRequestArchived(int id) {
		int numberOfRowsAffected = 0;
		Connection connection = null;

		try {
			connection = DbConnection.getConnection();
			PreparedStatement statementQuery = connection
					.prepareStatement("update requests set status = 0 where id = ?");
			statementQuery.setInt(1, id);
			
			numberOfRowsAffected = statementQuery.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return numberOfRowsAffected;
	}

	public int makeRequestActive(int id) {
		int numberOfRowsAffected = 0;
		Connection connection = null;
		
		try {
			connection = DbConnection.getConnection();
			PreparedStatement statementQuery = connection
					.prepareStatement("update requests set status = 1 where id = ?");
			statementQuery.setInt(1, id);
			
			numberOfRowsAffected = statementQuery.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return numberOfRowsAffected;
	}
}
