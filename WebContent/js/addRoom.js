
$(document).ready(function(){
	
	function validatePriceInput()
	{
		
		var price = document.getElementById("roomPrice").value; 
		if(price == "" || price < 5000 || price > 25000)
			return false;
		
		var i;
		for(i = 0;i<price.length;i++)
			if(price[i] !=0 && price[i] !=1 && price[i] !=2 && price[i] !=3 && price[i] !=4 && price[i] !=5
					&& price[i] !=6 && price[i] !=7 && price[i] !=8 && price[i] !=9)
				return false;
		
		return true;
	}
	
	function sleep()
	{
		;
	}

	$("#addRoomInput").submit(function(){
		if(!validatePriceInput())
		{	
			document.getElementById("addRoomSuccess").innerHTML = "";
			document.getElementById("addRoomError").innerHTML = "*Please enter a valid price between 5000 & 25000";
			return false;
		}

		//else servlet request going

		document.getElementById("addRoomSuccess").innerHTML = "";
		document.getElementById("addRoomError").innerHTML = "";
		setTimeout(sleep,3000);
		
		$.ajax({
			
			url:'AddRoomServlet',
			type:'POST',
			datatype:'json',
			data: $("#addRoomInput").serialize(),
			success:function(data){
				if(data.isAdded)
				{
					document.getElementById("addRoomError").innerHTML = "";
					document.getElementById("addRoomSuccess").innerHTML = "Congratulations, a new room has been added to the hotel";

				}
				else
				{
					document.getElementById("addRoomSuccess").innerHTML = "";
					document.getElementById("addRoomError").innerHTML = "*An unexpected error occured!";
				}
			}
			
		});
		return false;
	});
	
	
});