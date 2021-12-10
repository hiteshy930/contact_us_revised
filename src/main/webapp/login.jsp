<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="./css/login.css">
</head>
<body>
	<div class="container">
		<div class="container-header">
			<h1>Login</h1>
			<p>Please enter your credentials</p>
		</div>
		
		<div class="form">
			<form action="./login" method="post">
				<div class="form-input">
					<label for="email" class="form-label">E-mail<sup>*</sup></label> <input
						type="text" name="email" required />
				</div>
				<div class="form-input">
					<label for="password" class="form-label">Password<sup>*</sup></label>
					<input type="password" name="password" required />
				</div>
				<div class="form-input">

					<button type="submit">Login</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>