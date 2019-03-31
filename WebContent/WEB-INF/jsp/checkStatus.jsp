<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ page
	import="java.util.*,com.quinnox.customercomplaint.pojo.*,java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
 response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0); 

if(application.getAttribute("accountId")==null)
  response.sendRedirect("index.jsp");

%>
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
<script
  src="https://code.jquery.com/jquery-3.3.1.js"></script>
<style type="text/css">
.shadow {
	border: 1px solid black;
}
 .tab{
height:100%;
   width:600px; 
    word-wrap: break-word 
} 
.hvr:hover{
    color: #000000;
}
</style>
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
<input type="text" class="hidden" name="hidden" style="display: none;">
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".navbar-inverse-collapse"> <i
					class="icon-reorder shaded"></i></a><a class="brand" href="Home1">Funds
					Bank </a>
				<div class="nav-collapse collapse navbar-inverse-collapse">

					<ul class="nav pull-right">
<li class="switc" style="background: #003172;"><!-- <label class="switch">
  											<input type="checkbox" class="dark">
  											<span class="slider round"></span>
									</label> -->
						<div class="onoffswitch">
    <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox dark" id="myonoffswitch">
    <label class="onoffswitch-label" for="myonoffswitch">
        <span class="onoffswitch-inner"></span>
        <span class="onoffswitch-switch"></span>
    </label>
</div>
						
						</li>
						<li><a href="#">Support </a></li>
						<li class="nav-user dropdown"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> Hello <%=application.getAttribute("name")%>
								<img src="images/user.png" class="nav-avatar" /> <b
								class="caret"></b>
						</a>
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
									Funds<i class="fa fa-info-circle pull-right info" data-toggle="tooltip" title="Your personal funds can be seen."></i></a></li>
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
							<div class="btn-box-row row-fluid" align="center">
								<!-- shadow -->
								<form action="Check" method="post">
									<table class=" table-responsive">
										<tr>
											<th colspan="2"><h2 class="cs">Check Status</h2></th>
										</tr>
										<tr>
											<th align="left">Complaint Id:</th>
											<td><i
									id="info" class="fa fa-info-circle pull-right info"
									data-toggle="tooltip"
									title="You can only see the complaints lodged by you." style="color: white;"></i><input type="number" id="complaintId" name="comId" required style="background: transparent;border: none;border-bottom: 1px solid #fff;"></td>
											
										</tr>
										<tr>
											<td colspan="2" align="center"><input type="submit"
												name="Submit"></td>
										</tr>
									</table>
								</form>
								<br> <br>
								<%-- ${description} --%>
								<%-- <%${description} %> --%>
								<%if (application.getAttribute("list")!=null)
									{
										List customerPojo=(List)application.getAttribute("list");
									Iterator it=customerPojo.iterator();
									while(it.hasNext()){
										Object obj[]=(Object[])it.next();
									%> 
									<div>
								<table class="table table-hover"><!-- table table-hover -->

									<tr class="hvr">
										<th >Complaint Id</th>
										<th >Description</th>
										<th >Status</th>
									</tr>
									<tr class="hvr">
										<td ><%-- ${complaintId} --%><%out.println(obj[0]);%></td>
										<td ><div class="tab"><%-- ${description} --%><%out.println(obj[1]);%></div></td>
										<td ><%-- ${status} --%><%out.println(obj[2]);%></td>
									</tr>
									<% }}else {
										%>
									<tr>
										 <td colspan='4'>No data found</td>
									</tr>
									 <%
										}
									%> 
								</table>
								<%application.setAttribute("list", null); %>
								</div>
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
<script type="text/javascript">
/* $(".dark").change(function() {
$("body").toggleClass("darkMode");
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
	<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="scripts/jquery-ui-1.10.1.custom.min.js"
		type="text/javascript"></script>
	<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

</body>
</html>