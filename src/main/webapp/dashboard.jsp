<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.company.RequestsDao, com.company.Request, java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Audiowide">
<style type="text/css">
* {
	font-family: "Audiowide", sans-serif;
}

body {
	/* background-image : linear-gradient(to bottom right, cyan, blue); */
	background: rgb(0 0 0/ 5%);
	height: 97.8vh;
	background-repeat: no-repeat;
	display: grid;
	justify-content: space-evenly;
	grid-auto-flow: column;
	align-items: start;
}

.container {
	width: 45vw;
	height: max-content;
	box-shadow: 0 0 11px rgba(0, 0, 0, 0.1);
	margin-top: 10vh;
	border-radius: 1vh;
	display: grid;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

.container-header {
	padding: 2vh 2vw;
}

.table {
	width: 45vw;
	background: white;
	text-align: left;
}

tbody {
	max-height: 45vh;
	overflow: auto;
}

.table td, th {
	padding: 0.5vh 0.5vw;
	box-shadow: 0 0 5px rgb(0 0 0/ 15%);
	font-family: serif;
	font-size: 18px;
}

.button-div {
	display: grid;
	justify-content: end;
	justify-items: stretch;
	grid-auto-flow: column;
	margin: 0.5vw;
}

.button-div, .logout-btn {
	padding: 1vh;
	background: rgb(0 0 0/ 15%);
	border: none;
	border-radius: 5px;
	outline: none;
	font-size: small;
}

.logout-btn {
	position: absolute;
	right: 3vh;
	top: 3vh;
}

.logout-btn a {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<%
	Cookie[] cookies = request.getCookies();
	boolean loggedIn = false;
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
			<h4>Active requests</h4>

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
				lineNumber++;
				}
				%>

			</tbody>
		</table>

	</div>
	<div class="container">
		<div class="container-header">
			<h4>Archived requests</h4>

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
				serialNumber++;
				}
				%>

			</tbody>
		</table>

	</div>
</body>
</html>