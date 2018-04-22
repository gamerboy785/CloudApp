

$(document).ready(function(){
	
	function validatePriceInput()
	{
		
		var price = document.getElementById("roomPrice").value; 
		if(price == "" || price <5000 || price > 25000)
			return false;
		
		var i;
		for(i = 0;i<price.length;i++)
			if(price[i] !=0 && price[i] !=1 && price[i] !=2 && price[i] !=3 && price[i] !=4 && price[i] !=5
					&& price[i] !=6 && price[i] !=7 && price[i] !=8 && price[i] !=9)
				return false;
		
		return true;
	}
	
	var roomID = 0;
	var btnAppID = 0;
	
	$("#btn1").click(function(){
		
		btnAppID = 1;
		roomID = parseInt($("#room1").text());
		document.getElementById("editRoomSuccess").innerHTML = "";
		document.getElementById("editRoomError").innerHTML = "";
		$("#my-modal").modal('show');
		
		
	});
	
	$("#btn2").click(function(){
		
		btnAppID = 2;
		roomID = parseInt($("#room2").text());
		document.getElementById("editRoomSuccess").innerHTML = "";
		document.getElementById("editRoomError").innerHTML = "";
		$("#my-modal").modal('show');
		
		
	});
	
	$("#btn3").click(function(){
		
		btnAppID = 3;
		roomID = parseInt($("#room3").text());
		document.getElementById("editRoomSuccess").innerHTML = "";
		document.getElementById("editRoomError").innerHTML = "";
		$("#my-modal").modal('show');
		
		
	});
	
	$("#btn4").click(function(){
		
		btnAppID = 4;
		roomID = parseInt($("#room4").text());
		document.getElementById("editRoomSuccess").innerHTML = "";
		document.getElementById("editRoomError").innerHTML = "";
		$("#my-modal").modal('show');
		
		
	});
	
	function updateRoomInfo(roomType,roomImage,roomPrice,balcony,coolingSystem,setBox)
	{
		if(btnAppID == 1)
		{
			$("#roomImg1").attr("src",roomImage);
			$("#type1").html(roomType);
			$("#price1").html(roomPrice);
			$("#balcony1").html(balcony);
			$("#coolingSystem1").html(coolingSystem);
			$("#setBox1").html(setBox);
		}
		else if(btnAppID == 2)
		{	
			$("#roomImg2").attr("src",roomImage);
			$("#type2").html(roomType);
			$("#price2").html(roomPrice);
			$("#balcony2").html(balcony);
			$("#coolingSystem2").html(coolingSystem);
			$("#setBox2").html(setBox);
		}
		else if(btnAppID == 3)
		{
			$("#roomImg3").attr("src",roomImage);
			$("#type3").html(roomType);
			$("#price3").html(roomPrice);
			$("#balcony3").html(balcony);
			$("#coolingSystem3").html(coolingSystem);
			$("#setBox3").html(setBox);
		}
		else if(btnAppID == 4)
		{	
			$("#roomImg4").attr("src",roomImage);
			$("#type4").html(roomType);
			$("#price4").html(roomPrice);
			$("#balcony4").html(balcony);
			$("#coolingSystem4").html(coolingSystem);
			$("#setBox4").html(setBox);
		}
	}
	
	function editInfo()
	{
		var roomType = $('input[name=roomType]:checked').val();
		var roomPrice = $("#roomPrice").val();
		var roomImage = $("#roomImage").val();
		var balcony = $('input[name=balcony]:checked').val();
		var coolingSystem = $('input[name=coolingSystem]:checked').val();
		var setBox = $('input[name=setBox]:checked').val();
		$.ajax({
			
			url:'EditRoomServlet',
			type:'POST',
			datatype:'json',
			data: {"roomID":roomID,"roomImage" : roomImage,"roomType":roomType,"roomPrice":roomPrice,"balcony":balcony,"coolingSystem":coolingSystem,"setBox":setBox},
			success:function(data){
				if(data.isEdited)
				{
					document.getElementById("editRoomError").innerHTML = "";
					document.getElementById("editRoomSuccess").innerHTML = "Congratulations, room information edited successfully";
					updateRoomInfo(roomType,roomImage,roomPrice,balcony,coolingSystem,setBox);
				}
				else
				{
					document.getElementById("editRoomSuccess").innerHTML = "";
					document.getElementById("editRoomError").innerHTML = "*An unexpected error occured!";
				}
			}
			
		});
	}
	
	$("#editRoomInput").submit(function(){
		
		if(!validatePriceInput())
		{	
			document.getElementById("editRoomSuccess").innerHTML = "";
			document.getElementById("editRoomError").innerHTML = "*Please enter a valid price between 5000 & 25000";
			return false;
		}
	
		editInfo();
		
		return false;
		
	});

	$("#btnApp1").click(function(){
		
		btnAppID = 1;
		roomID = parseInt($("#room1").text());
		$("#my-modal").modal('show');
		
		
	});

	$("#btnApp2").click(function(){
		
		btnAppID = 2;
		roomID = parseInt($("#room2").text());
		$("#my-modal").modal('show');
		
		
		});
	$("#btnApp3").click(function(){
	
		btnAppID = 3;
		roomID = parseInt($("#room3").text());
		$("#my-modal").modal('show');
	
	
	});

	$("#btnApp4").click(function(){
	
		btnAppID = 4;
		roomID = parseInt($("#room4").text());
		$("#my-modal").modal('show');
	
	
	});

	
});