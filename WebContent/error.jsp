<%@ page isErrorPage="true" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>

	<title>thenewboston</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>

</head>
<body>
	<nav class = "navbar navbar-default">
		<div class = "navbar-header">
			<p class = "navbar-brand">THE NEW BOSTON</p>
		</div>
	</nav>
	<h3>
		Session expired, please wait while we direct you to the login page, or <mark> <a href = "https://guarded-stream-37896.herokuapp.com">click here</a></mark>	
	</h3>
	<div class = "col-md-3">
		<img alt = "ajax-loader" src = "images/ajax-loader.gif" />
	</div>
	
	<script>
		$(document).ready(function(){
			
			function reDirect(){
				
				window.location.href = "https://guarded-stream-37896.herokuapp.com";
			}
			
			setTimeout(reDirect,3000);
		});
	</script>
</body>
</html>