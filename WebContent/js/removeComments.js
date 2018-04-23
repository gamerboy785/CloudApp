$(document).ready(function(){
	
	function removeComment(commentID)
	{
		$.ajax({
			
			url:'RemoveCommentsServlet',
			type:'POST',
			datatype:'json',
			data:{"commentID":commentID},
			success:function(data)
			{
				if(!data.isSuccess) {
					alert("Couldnot delete comment, server is down !")
					return;
				}else {
					alert("Comment deletion successful.");
					window.location.href = "https://guarded-stream-37896.herokuapp.com/removeComments.jsp";
					return false;
				}
			}
			
		});
		return false;
	}
	
	$("#removeBtn1").click(function(){
		
		var commentID = $("#comment1").val();
		removeComment(commentID);		
	});
	
	$("#removeBtn2").click(function(){
		
		var commentID = $("#comment2").val();
		removeComment(commentID);		
	});
	
	$("#removeBtn3").click(function(){
		
		var commentID = $("#comment3").val();
		removeComment(commentID);		
	});

	$("#removeBtn4").click(function(){
	
		var commentID = $("#comment4").val();
		removeComment(commentID);		
	
	});
	
});