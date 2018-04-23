<%@ page errorPage="error.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "db.*" %>  
<%@ page import = "models.*" %>    
<%@ page import = "java.util.*" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Customer Reviews</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href = "css/sidebar.css" type = "text/css">
    <link rel="stylesheet" href = "css/home.css" type = "text/css">    
    <link rel="stylesheet" href = "css/awesome-font.css" type = "text/css">     
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/removeComments.js"></script>
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
	<% 
		DBHandler.restartConnection();
		ArrayList<Review> reviews = DBHandler.shared.getReviews();
		int noOfPages = (reviews.size()/6);
		if(reviews.size() > (noOfPages *6))
			noOfPages++;
		int s = 0;
		ArrayList<Integer> ratings = DBHandler.shared.getRatingCounter();
	%>
	<jsp:useBean id="user" class = "models.User" scope = "session"></jsp:useBean>	
	<div id="wrapper" class = "menuDisplayed">
        <!-- Sidebar -->
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li ><a href="https://guarded-stream-37896.herokuapp.com/adminHome.jsp" class = "btn"  role = "button">Home</a></li>
                <li ><a href="https://guarded-stream-37896.herokuapp.com/addRoom.jsp" class = "btn" role = "button">Add Room</a></li>
            	<li><a href="https://guarded-stream-37896.herokuapp.com/viewRooms.jsp" class = "btn" role = "button">View Rooms</a></li>  
			   	<li><a href="https://guarded-stream-37896.herokuapp.com/removeUsers.jsp" class = "btn" role = "button">Users Section</a></li>          	 	
			   	<li><a href="https://guarded-stream-37896.herokuapp.com/removeComments.jsp" class = "btn" style = "background-color:#006699" role = "button">Comments Section</a></li>          	 	
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
 				<div class = "col-sm-1">
 				</div>
 			<div class = "container" style = "padding-left: 10%; padding-right:10%">
 				<!-- Add icon library -->
					<span class="heading">Customer Ratings</span>
					<%if(DBHandler.shared.getAverageRating() > 0){%> 
						<span class="fa fa-star checked"></span>
					<%} else {%>
						<span class="fa fa-star"></span>
					<%} %>
					<%if(DBHandler.shared.getAverageRating() > 1){%> 
						<span class="fa fa-star checked"></span>
					<%} else {%>
						<span class="fa fa-star"></span>
					<%} %>
					<%if(DBHandler.shared.getAverageRating() > 2){%> 
						<span class="fa fa-star checked"></span>
					<%} else {%>
						<span class="fa fa-star"></span>
					<%} %>
					<%if(DBHandler.shared.getAverageRating() > 3){%> 
						<span class="fa fa-star checked"></span>
					<%} else {%>
						<span class="fa fa-star"></span>
					<%} %>
					<%if(DBHandler.shared.getAverageRating() > 4){%> 
						<span class="fa fa-star checked"></span>
					<%} else {%>
						<span class="fa fa-star"></span>
					<%} %>
					<p><%=DBHandler.shared.getAverageRating() %> average based on <%=DBHandler.shared.getTotalRatings() %> reviews.</p>
					<hr style="border:3px solid #f1f1f1">
					
					<div class="row">
					  <div class="side">
					    <div>5 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-5" style = "<%="width:" + ratings.get(0) + "%;"  %>" ></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div><%=ratings.get(0) %></div>
					  </div>
					  <div class="side">
					    <div>4 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-4" style = "<%="width:" + ratings.get(1) + "%;"  %>"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div><%=ratings.get(1) %></div>
					  </div>
					  <div class="side">
					    <div>3 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-3" style = "<%="width:" + ratings.get(2) + "%;"  %>"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div><%=ratings.get(2) %></div>
					  </div>
					  <div class="side">
					    <div>2 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-2" style = "<%="width:" + ratings.get(3) + "%;"  %>"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div><%=ratings.get(3) %></div>
					  </div>
					  <div class="side">
					    <div>1 star</div>
					  </div>
					  <div class="middle">
					    <div class="bar-container">
					      <div class="bar-1" style = "<%="width:" + ratings.get(4) + "%;"  %>"></div>
					    </div>
					  </div>
					  <div class="side right">
					    <div><%=ratings.get(4) %></div>
					  </div>
					</div>
 			</div>	
 			<br>
 			<div id = "heading" class = "col-md-10" style = "background-color:#006699; color:white; margin-left:10%;" >
   				<div class = "container-fluid">
   					<h2 style = "color:white;">Comments Section !!!</h2>
   				</div>
        	</div>
        		<br>
        		<br>
 			<div class = "container" style = "padding-left: 8%; padding-right:8%; color: #006699" >
 				<% for(int i = s,j=0;i<reviews.size() && i<(s+6);i++,j++) { %>
 					<blockquote class="w3-panel w3-leftbar w3-light-grey">
					  <p class="w3-large">
					  <i>"<%=reviews.get(i).getComment()%>"</i></p>
					  <p><%=reviews.get(i).getFullname() %></p>
					  <footer style = "float:right;">
							<cite><%=reviews.get(i).getDateCreated() %></cite>
						</footer>
					</blockquote>
					<input type = "text" id = "comment<%=j+1%>" value = "<%=reviews.get(i).getId()%>" />
					<button id = "removeBtn<%=j+1%>" class = "btn btn-danger">Delete Comment</button>
 				<br>
 				<%}%>
 				<br>	
 			</div>	
 			<div class = "col-md-11">
						<div style = "text-align:center;">
							<ul class = "pagination">
						
								<% for(int i = 1;i<=noOfPages;i++){%>
									<%if(i==1){ %>	
									<li class = "active"><a href="#" onclick = "foo('<%=i%>')"><%=i %></a></li>
								<% }else {%>
									<li><a href="#" onclick = "foo('<%=i%>')"><%=i %></a></li>									
								<% }%>
							<%}%>						
							</ul>
						</div>
					</div>
 		</div>
 	</div>
 	<script>
      	function foo(pageNo)
      	{
      		$.ajax({
      			
      			url:'SetPageNoServlet',
      			type:'POST',
      			datatype:'json',
      			data:{"pageNo":pageNo},
      			success: function(){
      				
      				window.location.href = "https://guarded-stream-37896.herokuapp.com/removeComments2.jsp";
      				
      			}
      			
      		});
      	}
      	
      </script>
</body>
</html>