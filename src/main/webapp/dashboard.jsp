<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.RequestsDao, com.models.Request, java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="./css/dashboard.css">
</head>
<body>
	<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		
		boolean loggedIn = false;
		
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("id")) {
				loggedIn = true;
			}
		}
	
		if (!loggedIn) {
			response.sendRedirect("./login");
		}
	%>

	<button class="logout-btn">
		<a href="./logout">Logout</a>
	</button>

	<div class="container">
		<div class="container-header">
			<h3>Active requests</h3>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>Sr.no</th>
					<th>Name</th>
					<th>Email</th>
					<th>Message</th>
					<th>Active</th>
				</tr>
			</thead>
			<tbody>
				<%
				RequestsDao activeRequestDao = new RequestsDao();
				List<Request> activeRequestList = activeRequestDao.getActiveRequests();
				int lineNumber = 1;
				for (Request requestData : activeRequestList) {
				%>
				<tr>
					<td><%=lineNumber%></td>
					<td><%=requestData.getName()%></td>
					<td><%=requestData.getEmail()%></td>
					<td><%=requestData.getMessage()%></td>
					<td><form action="./dashboard" method="post">
							<button class="button-div" name="archiveButton"
								value="<%=requestData.getId()%>">Archive</button>
						</form></td>
				</tr>
				<%
				lineNumber = lineNumber + 1;
				}
				%>
			</tbody>
		</table>
	</div>

	<div class="container">
		<div class="container-header">
			<h3>Archived requests</h3>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>Sr.no</th>
					<th>Name</th>
					<th>Email</th>
					<th>Message</th>
					<th>Archive</th>
				</tr>
			</thead>
			<tbody>
				<%
				RequestsDao archivedRequestDao = new RequestsDao();
				List<Request> archivedRequestList = archivedRequestDao.getArchivedRequests();
				int serialNumber = 1;
				for (Request requestData : archivedRequestList) {
				%>
				<tr>
					<td><%=serialNumber%></td>
					<td><%=requestData.getName()%></td>
					<td><%=requestData.getEmail()%></td>
					<td><%=requestData.getMessage()%></td>
					<td><form action="./dashboard" method="post">
							<button class="button-div" name="activeButton"
								value="<%=requestData.getId()%>">Active</button>
						</form></td>
				</tr>
				<%
				serialNumber = serialNumber + 1;
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>