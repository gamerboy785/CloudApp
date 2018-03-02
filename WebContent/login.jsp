<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.*" %>
<!DOCTYPE html >
<html>
<head>
	<title>thenewboston</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<style>
		body{   background-image:url(images/img1.jpg);

   				background-repeat:no-repeat;
   				
   				background-size:cover
			}
		.text{color:black;}
	</style>
</head>
<body>
	<nav class = "navbar navbar-default">
		<div class = "container">
			<div class = "navbar-header">
				<p class = "navbar-brand" >THE NEW BOSTON</p>
			</div>
			<div class = "nav navbar-right" style = "color:black;">
				<form id = "userInput">
					<label for = "username">userID:</label>
					<input name = "username" type = "text" id = "username"></input>
					<label for = "password">password:</label>
					<input type = "password" name = "password" id = "password"></input>
					&nbsp &nbsp<input class = "btn btn-danger" type = "submit" value = "Login" />
					<div class = "text-danger" id = "loginError"></div>
				</form>
				<p class = "nav navbar-left">Do not have an account?									
					<button id = "signUpBtn" class = "btn btn-success" data-toggle = "modal" data-target = "#signUpWindow">SignUp</button> 
					<button id = "viewRooms" class = "btn btn-info">View rooms as guest</button>
				</p>
				
			</div>
		</div>
		<div id = "underInput" style = "text-align:right;" >
		</div>
	</nav>
	
	<!-- the modal that will be shown if the user wishes to signup -->
		<div class = "modal fade" id = "signUpWindow">
			<div class = "modal-dialog">
				<div class = "modal-content">
					<!-- header -->
					<div class = "modal-header">
						<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					</div>
				
					<!-- body -->
					<div class = "modal-body">
						<h4 style = "text-align:center">Wilkommen</h4>
						<div style = "text-align:center">
							<img src = "images/img2.jpg" alt = "signUpImage" style = "height:100px; width:100px" />
						</div>
						<br>
						<form id = "signUpForm">
							<label for = "firstName">FirstName:</label>
							<input name = "firstName" type = "text" id = "firstName" />
							<label for = "lastName">LastName:</label>
							<input name = "lastName" type = "text" id = "lastName" />
							<br>
							<br>
							<label for = "gender">Gender: </label>
						 	<input type="radio" name="gender" value="M" checked > Male
  						 	<input type="radio" name="gender" value="F"> Female
  						 	<br>
  						 	<br>
							<label for = "role">Select a role </label>
							<select name = "role">
								<option value = "A" selected >Administrator</option>
								<option value = "M">Manager</option>
								<option value = "C">Customer</option>
							</select>
							<br>
							<br>
							<label for = "new_username">userID:</label>
							<input type = "text" name = "new_username" id = "new_username" />
							<label for = "new_password">password:</label>
							<input type = "password" name = "new_password" id = "new_password" />
							</form>
							<div class = "text-danger" id = "errorMessage" ></div>
							<div id = "registerFeedback" class = "hidden">
								<p>Registering account</p>
								<img src = "images/ajax-loader.gif" height = "50px" width = "50px" />
							</div>
						</div>
				
					<!-- footer -->
					<div class = "modal-footer">
						<button class = "btn btn-primary btn-primary" id = "popUpButton">Create Account</button>
					</div>
				
				</div>
			</div>
		</div>
		
		<div class = "modal fade" id = "signUpConfirmation">
			<div class = "modal-dialog">
				<div class = "modal-content">
					<!-- header -->
					<div class = "modal-header">
						<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
					</div>
				
					<!-- body -->
					<div class = "modal-body" style = "text-align:center">
						<h4 id = "message"></h4>
						<img id = "smiley" src = "" style = "height:300px; width:300px" />
					</div>
				
					<!-- footer -->
					<div class = "modal-footer">
						<button class = "btn btn-primary btn-primary" id = "okButton" data-dismiss = "modal" data-target = "#signUpConfirmation">Ok</button>
					</div>
				
				</div>
			</div>
		</div>
		
	<script src = "js/login.js" type = "text/javascript"></script>
</body>
</html>