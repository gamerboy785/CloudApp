$(document).ready(function(){
	
	var roomID;
	
	function checkAvailability()
	{
		
		var startDate = $("#datepicker").val();
		
		var dateParts = startDate.split("/");
		var month = dateParts[0];
		var day = dateParts[1];
		var year = dateParts[2];
		
		
		var endDate = $("#datepicker2").val();
		
		var dateParts = endDate.split("/");
		var month2 = dateParts[0];
		var day2 = dateParts[1];
		var year2 = dateParts[2];
		
		$.ajax({
			
			url:'CheckAvailabilityServlet',
			type:'POST',
			datatype:'json',
			data:{"roomID":roomID,"month":month,"day":day,"year":year,"month2":month2,"day2":day2,"year2":year2},
			success: function(data)
			{
				if(data.isAvail)
				{	
					$("#modal_msg").css('color','green');
					$("#modal_msg").html("The room is available for booking");
				}
				else
				{
					$("#modal_msg").css('color','red');
					$("#modal_msg").html("The room is unavailable for the specified date");
				}
			
			}
			
		});
	}
	
	$("#availBtn1").click(function(){
		
		roomID = parseInt($("#room1").text());
		$("#modal_msg").html("");
		$("#avail_modal").modal('show');
		
	});
	
	$("#availBtn2").click(function(){
		
		roomID = parseInt($("#room2").text());
		$("#modal_msg").html("");
		$("#avail_modal").modal('show');
		});

	$("#availBtn3").click(function(){
	
		roomID = parseInt($("#room3").text());
		$("#modal_msg").html("");
		$("#avail_modal").modal('show');
		
	});

	$("#availBtn4").click(function(){
	
		roomID = parseInt($("#room4").text());
		$("#modal_msg").html("");
		$("#avail_modal").modal('show');
		
	});
	
	$("#checkBtn").click(function(){
		
		$("#modal_msg").html("");
		var startDate = $("#datepicker").val();
		var endDate = $("#datepicker2").val();

		if(startDate == "MM/DD/YYYY" || endDate == "MM/DD/YYYY")
		{

			$("#modal_msg").removeClass("text-success");
			$("#modal_msg").addClass("text-danger");
			$("#modal_msg").html("*please select a date");
			return;
		}

		
		startDate = $("#datepicker").datepicker("getDate");
		endDate = $("#datepicker2").datepicker("getDate");
		
		
		if(endDate - startDate < 1*86400*1000)
		{
			$("#modal_msg").removeClass("text-success");
			$("#modal_msg").addClass("text-danger");
			$("#modal_msg").html("*endDate must be greater than startDate");
			return;
		}
		
		checkAvailability();
		
	});
	
});