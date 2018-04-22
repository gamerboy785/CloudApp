$(document).ready(function(){
	
	function isValidInput() {
		if($("#comment_text").val() == "") {
			return false;
		}
		return true;
	}
	
	$("#comment_form").submit(function(){
		
		document.getElementById("comment_response").innerHTML = "";
		if(!isValidInput) {
			$("#comment_response").removeClass("text-success");
			$("#comment_response").addClass("text-danger");
			document.getElementById("comment_response").innerHTML = "*Invalid input. please make sure the comment section is not blank and rating is between 1-5.";
			return false;
		}
		
		$.ajax({
			
			url:'AddReviewServlet',
			type:'POST',
			datatype:'json',
			data: $("#comment_form").serialize(),
			success:function(data){
				if(data.isAdded)
				{
					$("#comment_response").removeClass("text-danger");
					$("#comment_response").addClass("text-success");
					document.getElementById("comment_response").innerHTML = "Congratulations, your comment and review have been added.";
					
				}
				else
				{
					$("#comment_response").removeClass("text-success");
					$("#comment_response").addClass("text-danger");
					document.getElementById("comment_response").innerHTML = "*An unexpected error occurred, please try again.";
					$("#review_modal").modal('hide');
					window.location.href = "https://guarded-stream-37896.herokuapp.com/reviews.jsp";
				}
			}
			
		});
		return false;
	});
	
});
