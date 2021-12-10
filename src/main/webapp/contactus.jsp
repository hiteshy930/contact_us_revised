<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact us</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Audiowide">
<link rel="stylesheet" href="./css/contactus.css">

</head>
<body>
	<div class="container">
		<div class="container-header">
			<h1>Contact Us</h1>
			<p>Please fill this form in a decent manner</p>
		</div>
		
		<div class="form">
			<form action="./contactus" method="post">
				<div class="form-input">
					<label for="name" class="form-label">Full Name<sup>*</sup></label>
					<input type="text" name="name" required />
				</div>
				<div class="form-input">
					<label for="email" class="form-label">E-mail<sup>*</sup></label> <input
						type="text" name="email" required /> <em>Please enter
						working email id</em>
				</div>
				<div class="form-input">
					<label for="message" class="form-label">Message<sup>*</sup></label>
					<textarea type="text" rows="5" cols="30" name="message" required></textarea>
				</div>
				<div class="form-input">
					<input type="submit" name="SUBMIT" />
					<button>
						<a href="./login">Admin login</a>
					</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>