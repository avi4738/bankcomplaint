<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	 <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css"> 
	<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
		<!-- <div><h3>Login to Funds Bank</h3></div> -->
			<div class="wrap-login100" style="padding: 100px 90px 50px 85px;">
				
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/bitcoin2.jpg" alt="IMG">
				</div>

				<form class="login100-form validate-form" action="new">
					
					<span class="login100-form-title">
						Member Login
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="number" name="accountId" placeholder="Account Id">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-user" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<!-- <button class="login100-form-btn">
							Login
						</button> -->
						<input type="submit" value="Login" class="login100-form-btn">
		                <div style="color:red">${error}</div>
					</div>

					
				</form>
			</div>
		</div>
	</div>
	
	

	<script type="text/javascript">
	localStorage.clear();
	var d1 = new Date();
	var hours=d1.getHours();
	localStorage.setItem("key", d1.getHours());
	if(hours>=16){
		localStorage.setItem("checked", true);
	}
	
	</script>
	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script src="js/main.js"></script> 

</body>
</html>