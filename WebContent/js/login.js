$(document).ready(function(){
	
	function validateUsername(username)
	{
		var count = 0;
		var email = username;
		if(email.indexOf("@gmail.com") > 0)
		{
			while(email.indexOf("@") >=0)
			{
				email = email.replace("@","");
				count++;
			}
			if(count == 1)
				return true;
				
			return false;
			
			
		}
		else
			return false;
	}
	
	function validateUsername2(username)
	{
		var email = username;
		
		var x = email.length;
		var index = email.indexOf(".com")+1;
		
		if(x - index == 3)
			return true;
		
		return false;
		
		
			
	}
	
	function validateSignUp()
	{
		var firstName = $("#firstName").val();
		var lastName = $("#lastName").val();
		var newusername = $("#new_username").val();
		var newpassword = $("#new_password").val();
		
		if(firstName == "" || lastName == "" || newusername == "" || newpassword == "")
			return false;
		
		return true;
		
	}
	
	function validateLogin()
	{
		var username = $("#username").val();
		var password = $("#password").val();
		
		if(username == "" || password == "")
			return false;
		
		return true;

	}
	
	function signUp()
	{
		
		$.ajax({
			
			url:'SignUpServlet',
			type:'POST',
			datatype:'json',
			data: $("#signUpForm").serialize(),
			success: function(data){
				
				$("#registerFeedback").addClass("hidden");
				$("#signUpWindow").modal('hide');
				if(data.hasUser)
				{
					$("#message").html("Username already exists or malicious input detected");
				}
				else 
				{
					document.getElementById("message").innerHTML = "Account created successfully";
				}
				var img = document.getElementById("smiley");
				img.src = data.src;
				$("#signUpConfirmation").modal('show');
			}
			
		});
	}
	
	$("#popUpButton").click(function(){
		
		if(!validateSignUp())
		{
			$("#errorMessage").html("*Please fill the missing fields!");
			return false;
		}
		var newusername = $("#new_username").val();
		if(!validateUsername(newusername) ||!validateUsername2(newusername))
		{
			$("#errorMessage").html("Please enter a valid username");
			return false;
		}
		$("#registerFeedback").removeClass("hidden");
		signUp();
		
	});
	
	$("#userInput").submit(function(){
		
		if(!validateLogin())
		{
			$("#loginError").html("*Please fill the missing fields");
			return false;
		}
		var username = $("#username").val();
		if(!validateUsername(username) || !validateUsername2(username))
		{
			$("#loginError").html("*Please enter a valid username");
			return false;
		}
		
		
		$.ajax({
				
			url:'LoginServlet',
			type:'POST',
			datatype:'json',
			data: $("#userInput").serialize(),
			success: function(data){
					
				if(!data.isValid)
				{
					$("#loginError").html("*Incorrect username/password");
						
				}
				else if(data.role == "A")
				{
					 window.location.href = window.location.href + "/adminHome.jsp";
				}
				else
				{
					window.location.href = window.location.href + "/customerHome.jsp";
				}
			}
				
		});
		return false;
	});
	
});