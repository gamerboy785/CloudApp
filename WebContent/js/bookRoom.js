
$(document).ready(function(){
	
	var bookRoomID;
	
	function getPrice(roomID)
	{
		$.ajax({
			
			url:'GetPriceServlet',
			type:'POST',
			datatype:'json',
			data:{"roomID":roomID},
			success:function(data)
			{
				if(data.roomPrice == 0) {
					alert("Couldnot get roomPrice, server is down !")
					return;
				}
				$("#modal_msg").html("The price of the room is " + data.roomPrice + " " + "PKR" + " " + "per day.");
				$("#price_modal").modal('show');
			}
			
		});
	}
	
	
	function sleep()
	{
		;
	}
	
	function bookRoom()
	{
		var startDate = $("#datepicker").val();
		var endDate = $("#datepicker2").val();
		
		var userBookingCount = $("#bookingCount").val();

		if(userBookingCount >= 3)
		{
			$("#book_msg").removeClass("text-success");			
			$("#book_msg").addClass("text-danger");
			$("#book_msg").html("*you have exceeded your booking limit.");
			return false;
		}
		//else lets book room
		
		$("#process_booking").removeClass("hidden");
		
		setTimeout(sleep,4000);
		
		var dateParts = startDate.split("/");
		var month = dateParts[0];
		var day = dateParts[1];
		var year = dateParts[2];
		
		var dateParts2 = endDate.split("/");
		var month2 = dateParts2[0];
		var day2 = dateParts2[1];
		var year2 = dateParts2[2];
		
		$.ajax({
			
			url: 'BookRoomServlet',
			type: 'POST',
			datatype: 'json',
			data: {"bookRoomID":bookRoomID,"month":month,"day":day,"year":year,"month2":month2,"day2":day2,"year2":year2},
			success: function(data){

				$("#process_booking").addClass("hidden");

				if(data.isBooked)
				{
					$("#book_msg").removeClass("text-danger");
					$("#book_msg").addClass("text-success");
					$("#book_msg").html("Congratulations, we have booked the room for you");
				}
				else
				{
					$("#book_msg").removeClass("text-success");
					$("#book_msg").addClass("text-danger");
					$("#book_msg").html("*room is unavailable during specified date");

				}
				
			}
			
		});
		
		return false;

	}
	
	$("#priceBtn1").click(function(){
		
		var roomID = parseInt($("#room1").text());
		getPrice(roomID);
		
	});
	
	$("#priceBtn2").click(function(){
		
		var roomID = parseInt($("#room2").text());
		getPrice(roomID);
		
	});

	$("#priceBtn3").click(function(){
	
		var roomID = parseInt($("#room3").text());
		getPrice(roomID);
	
	});

	$("#priceBtn4").click(function(){
	
		var roomID = parseInt($("#room4").text());
		getPrice(roomID);
	
	});
	
	$("#bookBtn1").click(function(){
		
		bookRoomID = parseInt($("#room1").text());
		bookBtn = 1;
		$("#book_msg").html("");	
		$("#book_modal").modal('show');
		
	});
	
	$("#bookBtn2").click(function(){
		
		bookRoomID = parseInt($("#room2").text());
		$("#book_msg").html("");		
		$("#book_modal").modal('show');

		
	});

	$("#bookBtn3").click(function(){
	
		bookRoomID = parseInt($("#room3").text());
		$("#book_msg").html("");
		$("#book_modal").modal('show');

		
	});

	$("#bookBtn4").click(function(){
	
		bookRoomID = parseInt($("#room4").text());
		$("#book_msg").html("");
		$("#book_modal").modal('show');


	});
	
	$("#getBooking").click(function(){
		
		$("#book_msg").html("");
		var startDate = $("#datepicker").val();
		var endDate = $("#datepicker2").val();

		if(startDate == "MM/DD/YYYY" || endDate == "MM/DD/YYYY")
		{

			$("#book_msg").removeClass("text-success");
			$("#book_msg").addClass("text-danger");
			$("#book_msg").html("*please select a date");
			return;
		}

		
		startDate = $("#datepicker").datepicker("getDate");
		endDate = $("#datepicker2").datepicker("getDate");
		
		
		if(endDate - startDate < 1*86400*1000)
		{
			$("#book_msg").removeClass("text-success");
			$("#book_msg").addClass("text-danger");
			$("#book_msg").html("*endDate must be greater than startDate");
			return;
		}
		bookRoom();
		
	});
	
});