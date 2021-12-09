<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact us</title>
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
			width:30vw;
			height: max-content;
			box-shadow : 0 0 11px rgba(0,0,0,0.1);
			border-radius: 1vh;
			display: grid;
			justify-content: center;
			align-items: center;
			overflow : hidden;
			
	}
	
	.container-header{
		padding : 1vh 2vw;
		
	}
	
	
	
	.form{
		width : 30vw;	
		display: grid;
		grid-template-columns : repeat(1, 1fr);
		background :white;
	}
	
	.form-input{
		width : 25vw;
		margin: 2vw;
		display: grid;
		grid-template-columns : repeat(1, 1fr);
		gap : 0.5vh;
	}
	
	.form-input input{
		font-family: san-serif;
		font-size: 20px;
		width : 25vw;
		height: 5vh;
		box-shadow : 0 0 5px rgb(0 0 200 /30%);
		border : 1px solid gray;
		
		
	}
	.form-input em{
		font-family:sans-serif;
		font-size: 14px;
		color : red;
	
	}
	.form-input textarea{
		font-family: san-serif;
		font-size: 20px;
	}
	
	.form-input input[type="submit"],button{
		font-family: "Audiowide", sans-serif;
		justify-self: center;
		padding : 1vh;
		margin:1vh;
		background: rgb(0 0 0/15%);
		border :none;
		border-radius : 5px;
		outline : none; 
		font-size : Large;
	}
	
	.form-input button a{
		text-decoration: none;
		color:black;
	}
	.form-input label>sup{
		color: red;
	}
</style>

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
						<input type="text" name="name" required/>
					</div>
					<div class="form-input">
						<label for="email" class="form-label">E-mail<sup>*</sup></label>
						<input type="text" name="email" required/>
						<em>Please enter working email id</em>
					</div>
					<div class="form-input">
						<label for="message" class="form-label">Message<sup>*</sup></label>
						<textarea type="text"  rows="5" cols="30" name="message" required></textarea>
					</div>
					<div class="form-input">
						<input type="submit" name="SUBMIT" />
						<button><a href="./login">Admin login</a></button>
					</div>
				
				</form>
	  		</div>
	</div>
</body>
</html>