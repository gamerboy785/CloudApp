$(document).ready(function(){
	
	var bookRoomID;
	
	function removeUser(userID)
	{
		$.ajax({
			
			url:'RemoveUserServlet',
			type:'POST',
			datatype:'json',
			data:{"userID":userID},
			success:function(data)
			{
				if(!data.isSuccess) {
					alert("Couldnot delete user, server is down !")
					return;
				}
				$("#modal_msg").html("The user has successfully been deleted from the database.");
				$("#remove_modal").modal('show');
			}
			
		});
		window.location.href = "https://guarded-stream-37896.herokuapp.com/removeUsers.jsp"
		return false;
	}
	
	$("#removeBtn1").click(function(){
		
		var userID = parseInt($("#user1").text());
		removeUser(userID);		
	});
	
	$("#removeBtn2").click(function(){
		
		var userID = parseInt($("#user2").text());
		removeUser(userID);		
	});

	$("#removeBtn3").click(function(){
	
		var userID = parseInt($("#user3").text());
		removeUser(userID);	
	});

	$("#removeBtn4").click(function(){
	
		var userID = parseInt($("#user4").text());
		removeUser(userID);
	
	});
	
});