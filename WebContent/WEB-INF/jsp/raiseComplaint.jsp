<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home</title>
<link type="text/css" href="css/bootstrap.min.css" rel="stylesheet">
<link type="text/css" href="css/bootstrap-responsive.min.css"
	rel="stylesheet">
<link type="text/css" href="css/home.css" rel="stylesheet">
<link type="text/css" href="css/font-awesome.css" rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style type="text/css">
.shadow {
	border: 1px solid black;
}

.transparent {
	background: transparent;
	border: none;
	border-bottom: 1px solid #fff;
}
</style>


<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (application.getAttribute("accountId") == null)
		response.sendRedirect("index.jsp");
%>


</head>
<script>
function onReady() {

	let checked = localStorage.getItem("checked");
	
	if(checked == "true"){
		$("#myonoffswitch").prop("checked", true);
    	$("body").addClass("darkMode");
		$(".navbar").addClass("darkMode");
    }
    else if(checked == "false"){
    	$("#myonoffswitch").prop("checked", false);
    	$("body").removeClass("darkMode");
		$(".navbar").removeClass("darkMode");
    }
	
	var cVal = $("#myonoffswitch").prop("checked");
}

	$(document).ready(function(){
		onReady();
	});
</script>

<body>
	<div>
		<input type="text" class="hidden" name="hidden" style="display: none;">
	</div>
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".navbar-inverse-collapse"> <i
					class="icon-reorder shaded"></i></a><a class="brand" href="Home1">Funds
					Bank </a>
				<div class="nav-collapse collapse navbar-inverse-collapse">

					<ul class="nav pull-right">
						<li class="switc" style="background: #003172;">
							<!-- <label class="switch">
  											<input type="checkbox" class="dark">
  											<span class="slider round"></span>
									</label> -->

							<div class="onoffswitch">
								<form><input type="checkbox" name="onoffswitch"
									class="onoffswitch-checkbox dark" id="myonoffswitch"> <label
									class="onoffswitch-label" for="myonoffswitch"> <span
									class="onoffswitch-inner"></span> <span
									class="onoffswitch-switch"></span>
								</label></form>
							</div>


						</li>
						<li><a href="#">Support </a></li>
						<li class="nav-user dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> Hello <%=application.getAttribute("name")%>
								<img src="images/user.png" class="nav-avatar" /> <b
								class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Your Profile</a></li>
								<li><a href="#">Edit Profile</a></li>
								<li><a href="#">Account Settings</a></li>
								<li><a href="logout">Logout</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
		</div>
		<!-- /navbar-inner -->
	</div>
	<!-- /navbar -->
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="span3">
					<div class="sidebar">
						<ul class="widget widget-menu unstyled">
							<li class="active"><a href="Home1"><i
									class="menu-icon icon-dashboard"></i>Home </a></li>
							<li><a href="#"><i class="menu-icon icon-bullhorn"></i>Allowances</a></li>
							<li><a href="#"><i class="menu-icon icon-money"></i>Check
									Funds<i class="fa fa-info-circle pull-right info"
									data-toggle="tooltip" title="Your personal funds can be seen."></i></a></li>
							<li><a class="collapsed" data-toggle="collapse"
								href="#togglePages"><i class="menu-icon icon-cog"> </i><i
									class="icon-chevron-down pull-right"></i><i
									class="icon-chevron-up pull-right"> </i>Complaint</a>
								<ul id="togglePages" class="collapse unstyled">
									<li><a href="raise1"><i class="icon-inbox"></i>Raise
											Complaint</a></li>
									<li><a href="checkStatus1"><i class="icon-inbox"></i>Check
											Status</a></li>
								</ul></li>
						</ul>

					</div>
					<!--/.sidebar-->
				</div>
				<!--/.span3-->
				<div class="span9">
					<div class="content">
						<div class="btn-controls">
							<div class="btn-box-row row-fluid " align="center">
								<!-- shadow -->
								<form action="raiseComplaint" method="post">
									<table class="table-responsive">
										<tr>
											<th colspan="2"><h2 class="ccrf">Customer Complaint
													Request Form</h2></th>
										</tr>
										<tr>
											<th align="left">Account Id:<span style="color: red;">*</span></th>
											<td><label id="accountId"><%=application.getAttribute("accountId")%></label></td>
										</tr>
										<tr>
											<th align="left">Branch Code:<span style="color: red;">*</span></th>
											<td><input type="text" name="branchCode" id="branchCode"
												required
												style="background: transparent; border: none; border-bottom: 1px solid #fff;">
											</td>
										</tr>
										<tr>
											<th align="left">Email Id:<span style="color: red;">*</span></th>
											<td><input type="email" name="email"
												onblur="validateEmail(this);" required
												style="background: transparent; border: none; border-bottom: 1px solid #fff;">
											</td>
										</tr>



										<tr>
											<th align="left">Complaint Category:<span
												style="color: red;">*</span></th>
											<td><select required class="custom-select"
												name="category" id="category"
												style="background: #3d6ba7; border: none; border-bottom: 1px solid #fff;">
													<option selected disabled="disabled" value="">Select
														complaint category</option>
													<option value="Internet Banking">Internet Banking</option>
													<option value="General Banking">General Banking</option>
													<option value="Others">Others</option>
											</select></td>
										</tr>
										<tr>
											<th align="left">Description:<span style="color: red;">*</span></th>
											<td><textarea rows="3" cols="3" id="description"
													name="description" required
													style="background: transparent; border: none; border-bottom: 1px solid #fff;"></textarea>
											</td>
										</tr>
										<tr>
											<td colspan="2" align="center"><input type="submit"
												name="Submit"></td>
										</tr>
									</table>
								</form>
								<%-- <form:form action="complaint" method="POST">
									<table class="table-responsive">
									<tr><th colspan="3"><h2>Customer Complaint Request Form</h2></th></tr>
									<tr><th align="left">Account Id:</th>
										<td><form:label path="accountId" ><%=application.getAttribute("accountId")%></form:label></td>
										<td></td></tr>
									<tr><th ><form:label path="branchCode">Branch Code</form:label><span style="color: red;">*</span></th>
										<td><form:input path="branchCode"/></td>
										 <td><form:errors path="branchCode"/></td></tr>
										 <tr><th ><form:label path="email">Branch Code</form:label><span style="color: red;">*</span></th>
										<td><form:input path="email"/></td>
										 <td><form:errors path="email"/></td></tr>
									
										<tr>
											<th><form:label path="category">Complaint Category</form:label><span style="color: red;">*</span></th>
											<td><form:select class="custom-select" path="category">
													<option selected disabled="disabled">Select complaint category</option>
													<option value="1">Internet Banking</option>
													<option value="2">General Banking</option>
													<option value="3">Others</option>
											</form:select></td>
											<td><form:errors path="category"/> </td>
										</tr>
										<tr><th><form:label path="description">Description</form:label><span style="color: red;">*</span></th>
										<td><form:textarea path="description" rows="3" cols="3"/></td>
										<td><form:errors path="description"/> </td> </tr> 
									<tr><td colspan="3" align="center"><input type="submit" name="Submit"></td></tr>
								</table>
								</form:form> --%>
							</div>

							<!--/#btn-controls-->

						</div>
						<!--/.content-->
					</div>
					<!--/.span9-->
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.wrapper-->
	</div>


	<div class="modal fade" tabindex="-1" role="dialog" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">Complaint Registered Successfully!</h4>
				</div>
				<div class="modal-body">
					<p>
						Ur complaint id is <b><%=application.getAttribute("complaintID")%></b>
					</p>
				</div>
				<div class="modal-body">
					<a href="checkStatus.jsp">Check Status</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
						href="raiseComplaint.jsp">Raise Complaint</a>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script type="text/javascript">
		function validateEmail(emailField) {
			var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

			if (reg.test(emailField.value) == false) {
				alert('Invalid Email Address');
				return false;
			}

			return true;

		}
	</script>

	<script type="text/javascript">
/* 		$(".dark").change(function() {

			$("body").toggleClass("darkMode");
			$(".ccrf").toggleClass("darkMode");
			$(".navbar").toggleClass("darkMode");

		}); */
		
		$(document).ready(function(){
	        $('.dark').click(function(){
	        	if($(this).prop("checked") == true){
	            	$("body").addClass("darkMode");
	    			$(".navbar").addClass("darkMode");
	    		
	    			localStorage.setItem("checked", true);
	            }
	            else if($(this).prop("checked") == false){
	            	$("body").removeClass("darkMode");
	    			$(".navbar").removeClass("darkMode");
	    		
	    			localStorage.setItem("checked", false);
	            }
	        });
	    });
		
	</script>
	<script type="text/javascript">
$('#myForm').on('submit', function(e){
	  $('#myModal').modal('show');
	  e.preventDefault();
	});
	</script>

	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>