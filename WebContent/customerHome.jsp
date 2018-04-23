<%@ page errorPage="error.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "models.*"  %>
<%@ page import = "db.*" %>
  
<!DOCTYPE html >
<html>
<head>
	<title>thenewboston</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href = "css/sidebar.css" type = "text/css">
    <link rel="stylesheet" href = "css/home.css" type = "text/css">    
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
                <li><a href="https://guarded-stream-37896.herokuapp.com/customerHome.jsp" class = "btn" style = "background-color:#006699" role = "button">Home</a></li>
                <li><a href="https://guarded-stream-37896.herokuapp.com/bookRooms.jsp" class = "btn" role = "button">Book Room</a></li>
				<li><a href="https://guarded-stream-37896.herokuapp.com/reviews.jsp" class = "btn" role = "button">Reviews Section</a></li>              </ul>     
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
 				<div class = "col-md-7" style = "color:white; background:green;">
 					<h3>Testimonials</h3>
 				</div>
 				<div class = "col-md-7" style = "background:#faebd7">
 					<br>
 					<blockquote>
 						"I rented a room from here once... they have some amazing deals"
 						
 						<footer style = "float:right">
 							<cite>	Emma Watson </cite>
 							<img src = "images/emma.jpg" alt = "person" style = "height:100px; width:80px;" class = "img img-circle" />
 						</footer>
 					</blockquote>
 					
 					<br>
 					<br>
 					<br>
 					<br>
 					<br>
 					<blockquote>
 						"By far the best hotel room booking service in Vegas <3"
 						
 						<footer style = "float:right">
 							<cite>Emma Roberts</cite>
 							<img src = "images/emma2.jpg" alt = "person" style = "height:100px; width:80px;" class = "img img-circle" />
 						</footer>
 					</blockquote>
 					
 					<br>
 				</div>
 				
 				<div class = "col-md-1">
 				</div>
           
           		<div class = "col-md-3 amet-sed">
           			<blockquote class = "my-quote" style = "color:#006699; background:#f0ffff">
           				Now, one thing I tell everyone is learn about hotels. Repeat after me: hotel provides the highest returns, the greatest values and the least risk. 
						<br>
						<footer style = "float:right;">
							<cite>Armstrong Williams</cite>
						</footer>
           			</blockquote>
           		</div>
           
     		 </div>
    	
    		 <div class = "container" style = " padding-left:  100px;">
     		 	<div class = "col-md-7" style = "background:#faebd7">
     		 		<br>
 					<blockquote>
 						"Renting hotel rooms has never been this easy, thankyou THE NEW BOSTON !"
					<br>
 						<footer style = "float:right;">
 							<cite>
 								Wayne Rooney
 							</cite>
							<img class = "img img-circle" src = "images/rooney.jpg" alt = "person" style = " height:100px; width:80px;" />	
 						</footer>
 					</blockquote>
     		 	</div>
     		 	<div class = "col-md-1">
   
     		 	</div>
     		 	<div class = "col-md-3 amet-sed">
     				<blockquote class = "my-quote" style = "color:#006699; background:#f0ffff">
						If you've driven over to the gay section of Las Vegas, it's like a golf course... hotel room values go 'boom!' 
						<br>
						<footer style = "float:right;">
							<cite>Adam Carolla</cite>
						</footer>
           			</blockquote> 		
     		 	</div>
     		 </div>
    
        </div>
           
      </div>
   
      <script src = "js/adminHome.js" type = "text/javascript" >
      
      </script>
      
      
      
</body>
</html>