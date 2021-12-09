<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.company.DbConnection" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Audiowide">
<style type="text/css">
	

*{
	font-family: "Audiowide", sans-serif;
}

body{
	/* background-image : linear-gradient(to bottom right, cyan, blue); */
	background : rgb(0 0 0 /5%);
	height : 97.8vh;
	background-repeat: no-repeat;
	display: grid;
	justify-content: center;
	align-items: center;
}

.container{
		width:60vw;
		height: max-content;
		box-shadow : 0 0 11px rgba(0,0,0,0.1);
		border-radius: 1vh;
		display: grid;
		justify-content: center;
		align-items: center;
		overflow : hidden;
		
}

.container-header{
	
	padding : 2vh 2vw;
	
}

.table{

	width : 60vw;
	background :white;
	text-align: left;
	
	
}

tbody{
	max-height : 50vh;
	overflow: auto;
}

.table td,th{
	padding : 0.5vh 0.5vw;
	box-shadow: 0 0 5px rgb(0 0 0 /15%);
	font-family: serif;
	font-size : 18px;
}

.button-div{
	display: grid;
	justify-content: end;
	justify-items:stretch;
    grid-auto-flow: column;
	margin : 0.5vw;
}

.button-div button, .logout-btn {
	
	padding : 1vh;
	background: rgb(0 0 0/15%);
	border :none;
	border-radius : 5px;
	outline : none; 
	font-size : Large;

}


.logout-btn {
	position : absolute;
	right: 45vh;
	top: 20vh;
	
}

.logout-btn a{
	text-decoration:none;
	color:black;
	
}



	
</style>
</head>
<body>
	<%-- <% response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); %> --%>
	<% Cookie [] cookies = request.getCookies();
		boolean loggedIn = false;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("id")){
				loggedIn = true;
			}
		}
		
		if(!loggedIn){
			response.sendRedirect("../login/");
		}
	%>
	
	<button class="logout-btn"><a href="../logout">Logout</a></button>
	<div class="container">
			<div class="container-header">
				<h1>Requests</h1>
				<p>Check the list for all requests</p>
			</div>
		
			<table class="table">
				 		<thead>
				 			<tr>
				 				<th>Name</th>
				 				<th>Email</th>
				 				<th>Message</th>
				 				<th>Archive</th>
				 			</tr>
				 		</thead>
				 		<tbody>
				 			<% Connection connection = DbConnection.getConnection();
								Statement statement = connection.createStatement();
								ResultSet result = statement.executeQuery("SELECT * FROM requests");
								while(result.next()){ %>
				 			<tr>
				 				<td><%= result.getString("name")%></td>
				 				<td><%= result.getString("email")%></td>
				 				<td><%= result.getString("message")%></td>
				 				<td><input type="checkbox" <% if(result.getInt("archive")==1) {out.print("checked");} %>/></td>
				 			</tr>
				 			<%} %>
				 			
				 		</tbody>
				 </table>
				 
			<div class="button-div">	
				<button>Save</button>
			</div>	 
	</div>
</body>
</html>