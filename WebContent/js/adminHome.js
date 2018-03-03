$(document).ready(function(){
	
	var count = 0;
	$("#toggleButton").click(function(e){
		
		count++;
		e.preventDefault();
		$("#wrapper").toggleClass("menuDisplayed");
		if(count % 2 != 0){
			$("#heading").css("margin-left","115px");
		}
		else
			$("#heading").css("margin-left","95px");			
			
	});
	
	
});