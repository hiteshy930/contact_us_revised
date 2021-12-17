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
	%>
	<%
	
	if (session.getAttribute("username") == null || session.getAttribute("password") == null) {
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
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				
				List<Request> activeRequestList = (List<Request>)request.getAttribute("activeRequests");
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
						</form>
					</td>
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
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Request> archivedRequestList = (List<Request>)request.getAttribute("archivedRequests");
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
						</form>
					</td>
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