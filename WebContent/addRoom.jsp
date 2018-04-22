<%@ page errorPage="error.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.*" %>    
<%@ page import = "models.*" %>
  
<!DOCTYPE html >
<html>
<head>
	<title>thenewboston</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href = "css/sidebar.css" type = "text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body style = "background:#eeeeee">
	<!-- To prevent storing in cache -->
	<%
		response.setHeader("Cache-Control","no-cache"); //Forces caches to obtain a new copy of the page from the origin server
		response.setHeader("Cache-Control","no-store"); //Directs caches not to store the page under any circumstance
		response.setDateHeader("Expires", 0); //Causes the proxy cache to see the page as "stale"
		response.setHeader("Pragma","no-cache"); //HTTP 1.0 backward compatibility
	%>
	<!--  <% if(session.getAttribute("user") == null)
			throw new Exception();
		  %>
	-->
	<% DBHandler.restartConnection(); %>
	
	<jsp:useBean id="user" class = "models.User" scope = "session"></jsp:useBean>	
	<div id="wrapper" class = "menuDisplayed">

        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li ><a href="https://guarded-stream-37896.herokuapp.com/adminHome.jsp" class = "btn" role = "button">Home</a></li>
                <li ><a href="https://guarded-stream-37896.herokuapp.com/addRoom.jsp" class = "btn" style = "background-color:#006699" role = "button">Add Room</a></li>
     			<li><a href="https://guarded-stream-37896.herokuapp.com/viewRooms.jsp" class = "btn" role = "button">View Rooms</a></li>          	
			   <li><a href="https://guarded-stream-37896.herokuapp.com/removeUsers.jsp" class = "btn" role = "button">Users Section</a></li>          	
            
            </ul>     
        </div>
		
        <!-- Page content -->
        <nav class = "navbar navbar-default">
			<div style = "float:left;">
				<button style = "height:80px; background:#a9a9a9" type = "button" class = "btn" id = "toggleButton" >
  					&#9776;
				</button>
			</div>
			
			 <div style = "float:right;">
               	<form action = "LogOut">
                	<input type = "submit" class = "btn btn-danger" style = "height:80px;" value = "Logout" />
              	</form>
           	 </div>
			<div class = "navbar-header">
				<p class = "navbar-brand">
					THE NEW BOSTON	
					&nbsp
					&nbsp
					Welcome, &nbsp 	
					<jsp:getProperty property="firstName" name="user"/>	
				</p>
			</div>
		</nav>
	
        <div id="page-content-wrapper">
        		<div id = "heading" class = "col-md-10" style = "background-color:#006699; color:white; margin-left:95px;" >
   					<div class = "container-fluid">
   						<h2 style = "color:white;">LAS VEGAS GRAND BUDAPEST HOTEL!</h2>
   						<p style = "color:white;">
   							We guarantee the very best rooms you can find in Las Vegas, after all, what happens in Vegas, stays in Vegas!
   						</p>
   					</div>
   					
        		</div>
       	
  	     	<div class = "row" style = "color:#006699">
        		<div class = "col-md-12">
        			<hr>
        		</div>
        	</div>
        	<div class = "row">
        	<!-- Image slider -->
        	<div class = "col-sm-1">
        	</div>
        	<div class = "col-md-10">
        		<div class = "carousel slider" id = "my-slider" data-ride = "carousel">
        			<!-- dot-nav -->
					<ol class = "carousel-indicators">
						<li data-target = "#my-slider" data-slide-to = "0" class = "active"></li>
						<li data-target = "#my-slider" data-slide-to = "1" ></li>	
						<li data-target = "#my-slider" data-slide-to = "2" ></li>
						<li data-target = "#my-slider" data-slide-to = "3" ></li>
						<li data-target = "#my-slider" data-slide-to = "4" ></li>			
					</ol>
					<!-- main content -->
					
					<div class = "carousel-inner" role = "listbox">
						<div class = "item active" >
							<img alt = "img1" src = "images/room1.jpg" style = "height:300px; width:1200px" />
						</div>
						
						<div class = "item">
							<img alt = "img2" src = "images/room2.jpg" style = " height:300px; width:1200px;" />
						</div>
						
						<div class = "item">
							<img alt = "img3" src = "images/room3.jpg" style = "height:300px; width:1200px;" />
						</div>
					
						<div class = "item">
							<img alt = "img4" src = "images/room4.jpg" style = "height:300px; width:1200px;" />
						</div>
						
						<div class = "item">
							<img alt = "img5" src = "images/room5.jpg" style = "height: 300px; width:1200px;" />
						</div>
						
					</div>	
						
					<!-- left and right -->
					
					<a class = "left carousel-control" href = "#my-slider" role = "button" data-slide = "prev">
						<span class = "glyphicon glyphicon-chevron-left" aria-hidden = "true"></span>
					</a>
					
					<a class = "right carousel-control" href = "#my-slider" role = "button" data-slide = "next">
						<span class = "glyphicon glyphicon-chevron-right" aria-hidden = "true"></span>
					</a>
					
        		</div>
        	</div>
        	</div>
        	<br>
        	<br>
 				<div class = "col-sm-1">
 				</div>
 		
    
    		<div class = "container" style = "padding-left: 100px;">
 				<div class = "col-md-8" style = "background-color:white;">
 					<div style = "background-color:#000000">
 						<h1 style = "color:white">Room Information</h1>
 					</div>
 					<div style = "background-color:#eeeeee; padding:5px; margin-bottom:10px;">	
 						<form id = "addRoomInput">
 							<label for = "roomImage">Room Image Link:</label>
 							<input type = "text" name = "roomImage" maxlength="250" size="92" id = "roomImage" />
 							<br>
 							<label for = "roomType">RoomType: </label>
						 	<input type="radio" name="roomType" value="Single" checked > Single
  						 	<input type="radio" name="roomType" value="Double"> Double  						 	
  						 	<input type="radio" name="roomType" value="Suite"> Suite
  						 	<br>
  						 	<label for = "roomPrice">RoomPrice:</label>
  						 	<input name = "roomPrice" id = "roomPrice" />
  						 	<br>
  						 	<label>Features:</label>
  						 	<br>
  						 	Balcony: <input type = "radio" name = "balcony" value = "Yes" checked />Yes &nbsp  <input type = "radio" name = "balcony" value = "No" />No  
  						 	<br>
  						 	HD SetBox: <input type = "radio" name = "setBox" value = "Yes" checked />Yes &nbsp  <input type = "radio" name = "setBox" value = "No" />No  
  						 	<br>
  						 	Central Cooling System: <input type = "radio" name = "coolingSystem" value = "Yes" checked />Yes &nbsp  <input type = "radio" name = "coolingSystem" value = "No" />No  
  						 	<div class = "text-danger" id = "addRoomError">
  						 	</div>
  						 	<br>
 							<input type = "submit" value = "Add Room" class = "btn btn-success"/>
 							<div class = "text-success" id = "addRoomSuccess">
 							</div>
 						</form> 
 					</div>
 				</div>
     		</div>
    
        </div>
           
      </div>
   
   	
   	  <script src = "js/home.js" type = "text/javascript"></script>
      <script src = "js/addRoom.js" type = "text/javascript" >  
      </script>
      
      
      
</body>
</html>