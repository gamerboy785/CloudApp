<%@ page errorPage="error.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "models.*"  %>
<%@ page import = "db.*" %>
<%@ page import = "java.util.*" %>
  
<!DOCTYPE html >
<html>
<head>
	<title>thenewboston</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href = "css/sidebar.css" type = "text/css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/jquery-ui.theme.css">
<!--     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 -->     
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script>
	 $( function() {
		  $( "#datepicker" ).datepicker({ minDate: +0, maxDate: "+1M" });
 	 })
 	 
 	  $( function() {
		  $( "#datepicker2" ).datepicker({ minDate: +0, maxDate: "+1M" });
 	 })
 	 
 	 
	</script>
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
	<%
		
		ArrayList<Room> rooms = DBHandler.shared.getRooms();
		int noOfPages = (rooms.size()/4);
		if(rooms.size() > (noOfPages *4))
			noOfPages++;
		
		int s = 0;
		int pageNo = 0;
		
		if(session.getAttribute("pageNo")!= null)
		{	s = Integer.parseInt((String)session.getAttribute("pageNo"));
			pageNo = s;
			s--;
			s = s*4;
		}
	%>
	
	<jsp:useBean id="user" class = "models.User" scope = "session"></jsp:useBean>	
	<div id="wrapper" class = "menuDisplayed">
	
	  <div id="sidebar-wrapper2">
            <ul class="sidebar-nav">
               <li><a href="https://guarded-stream-37896.herokuapp.com/customerHome.jsp" class = "btn" role = "button">Home</a></li>
               <li><a href="https://guarded-stream-37896.herokuapp.com/bookRooms.jsp" class = "btn" role = "button" style = "background-color:#006699">Book Room</a></li> 
			   <li><a href="https://guarded-stream-37896.herokuapp.com/reviews.jsp" class = "btn" role = "button">Reviews Section</a></li>  
<!--           
     <li><a href="http://localhost:8080/WebProject/customSearch.jsp" class = "btn" role = "button">Custom Search</a></li> 
 -->         
<!--            	   <li><a href="http://localhost:9090/WebProject/changePassword.jsp" class = "btn" role = "button">Change Password</a></li>          		          
 -->            </ul>     
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
					<%-- <img src = <%=user.getProfileImage() %> alt = "profilePic" width = "100px" height = "100px" /> --%>
				</p>
					</div>
				
				
				
           	 	
		</nav>
       
		<%-- <input id = "bookingCount" type = "hidden" value ="<%=MyDBHandler.userBookingCount(user.get_id()) %>" />  --%>
        
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
 		

    		<div class = "container" style = "padding-left: 100px; padding-right:130px">
 				<div class = "col-md-12" style = "background-color:white">
 					<h1 style = "background-color:black; color:white"> Room</h1>
 					
 					<div class = "col-md-6" style = "height:950px; background-color:#eeeeee; padding-bottom:100px;">
 						<%for(int i = s,j=0;i<rooms.size() && i<(s+2);i++,j++){ %>
 							<img src = "<%=rooms.get(i).getRoomImage()%>" height = 150px width = 300px style = "margin:20px" />
 							<table class = "table table-condensed" style = "background-color:white; width:320px; padding:20px; margin-left:15px" >
 								<tr>
 									<th>
 										roomID
 									</th>
 									<td id = "room<%=j+1%>">
 										<%=rooms.get(i).get_id() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										roomType
 									</th>
 									<td id = "type<%=j+1%>">
 										<%=rooms.get(i).getRoomType() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										balcony
 									</th>
 									<td id = "balcony<%=j+1%>">
 										<%=rooms.get(i).getBalcony() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										coolingSystem
 									</th>
 									<td id = "coolingSystem<%=j+1%>">
 										<%=rooms.get(i).getCoolingSystem() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										setBox
 									</th>
 									<td id = "setBox<%=j+1%>">
 										<%=rooms.get(i).getSetBox() %>
 									</td>
 								</tr>
 							</table>
 							<button id = "priceBtn<%=j+1 %>" class = "btn btn-success" style = "margin-left:15px">Get Price</button>
 							
 							<button id = "bookBtn<%=j+1 %>" class = "btn btn-info" style = "margin-left:15px">Book Room</button>
 							<br>
 							<%} %>
 		
 					</div>
 					
 				<div class = "col-md-6" style = "height:950px; background-color:#eeeeee; margin-bottom:20px;">
 						<%for(int i = s+2,j=2;i<rooms.size() && i<(s+4);i++,j++){ %>
 							<img src = "<%=rooms.get(i).getRoomImage()%>" height = 150px width = 300px style = "margin:20px" />
 							<table class = "table table-condensed" style = "background-color:white; width:320px; padding:20px; margin-left:15px" >
 								<tr>
 									<th>
 										roomID
 									</th>
 									<td id = "room<%=j+1%>">
 										<%=rooms.get(i).get_id() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										roomType
 									</th>
 									<td id = "type<%=j+1%>">
 										<%=rooms.get(i).getRoomType() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										balcony
 									</th>
 									<td id = "balcony<%=j+1%>">
 										<%=rooms.get(i).getBalcony() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										coolingSystem
 									</th>
 									<td id = "coolingSystem<%=j+1%>">
 										<%=rooms.get(i).getCoolingSystem() %>
 									</td>
 								</tr>
 								<tr>
 									<th>
 										setBox
 									</th>
 									<td id = "setBox<%=j+1%>">
 										<%=rooms.get(i).getSetBox() %>
 									</td>
 								</tr>
 							</table>
 							<button id = "priceBtn<%=j+1 %>" class = "btn btn-success" style = "margin-left:15px">Get Price</button>
 							<button id = "bookBtn<%=j+1 %>" class = "btn btn-info" style = "margin-left:15px">Book Room</button>
 							<br>
 							<%} %>
 					</div>
 				</div>
 			</div>
 					<div class = "col-md-11">
						<div style = "text-align:center;">
							<ul class = "pagination">
						
								<% for(int i = 1;i<=noOfPages;i++){%>
									<%if(i==pageNo){ %>	
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
   
   
    <div class = "modal fade" id = "price_modal">
			<div class = "modal-dialog">
				<div class = "modal-content">
					<!-- header -->
					<div class = "modal-header" style = "background:#006699;">
						<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
						<h1 style = "color:white;">Room Price</h1>
					</div>
				
				<!-- body -->
					<div class = "modal-body">
						<h4 id = "modal_msg"></h4>
					</div>
				
				<!-- footer -->
					<div class = "modal-footer">
						<button class = "btn btn-info" data-dismiss = "modal" data-target = "#price_modal">Close</button>
					</div>
				
			</div>
		</div>
	</div>
   
   <div class = "modal fade" id = "book_modal">
			<div class = "modal-dialog">
				<div class = "modal-content">
					<!-- header -->
					<div class = "modal-header" style = "background:#006699;">
						<button type = "button" class = "close" data-dismiss = "modal">&times;</button>
						<h1 style = "color:white;">Book Room</h1>
					</div>
				
				<!-- body -->
					<div class = "modal-body">
						<p>Book from: <input type="text" id="datepicker" value = "MM/DD/YYYY" />
						&nbsp &nbsp
						Book till: <input type = "text" id = "datepicker2" value = "MM/DD/YYYY" />
						&nbsp
						<button id = "getBooking" class = "btn btn-success">Book</button>
						</p>
						<div id = "book_msg" >
							
						</div>
						<div id = "process_booking" class = "hidden">
							<p> Please wait while your booking is processed <img src = "images/ajax-loader.gif" style = "height:70px; width:70px" />
							</p>
						</div>
					</div>
				
				<!-- footer -->
					<div class = "modal-footer">
						<button class = "btn btn-info" data-dismiss = "modal" data-target = "#book_modal">Close</button>
					</div>
				
			</div>
		</div>
	</div>
   	
   	  <script src = "js/home.js" type = "text/javascript"></script>
      <script src = "js/bookRoom.js" type = "text/javascript"></script>   
      <script>
      	function foo(pageNo)
      	{
      		$.ajax({
      			
      			url:'SetPageNoServlet',
      			type:'POST',
      			datatype:'json',
      			data:{"pageNo":pageNo},
      			success: function(){
      				
      				window.location.href = "https://guarded-stream-37896.herokuapp.com/bookRooms2.jsp";
      				
      			}
      			
      		});
      	}
      	
      </script>
</body>
</html>