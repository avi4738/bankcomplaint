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
  
  <script type="text/javascript">
$(document).ready(function() {
	  var totalRows = $('#tblData').find('tbody tr:has(td)').length;
	  var recordPerPage = 5;
	  var totalPages = Math.ceil(totalRows / recordPerPage);
	  var $pages = $('<div id="pages" width="100%" style="text-align: center;"></div>');
	  for (i = 0; i < totalPages; i++) {
	    $('<span class="pageNumber" style="border:1px solid white;">&nbsp;' + (i + 1) + '</span>').appendTo($pages);
	  }
	  $pages.appendTo('#tblData');

	  /* $('.pageNumber').hover( */
	$('.pageNumber').hover(
	    function() {
	      $(this).addClass('focus');
	    },
	    function() {
	      $(this).removeClass('focus');
	    }
	  );

	 /*  $('table').find('tbody tr:has(td)').hide(); */
	  $('#tblData').find('tbody tr:has(td)').hide();
	  /* var tr = $('table tbody tr:has(td)'); */
	  var tr = $('#tblData tbody tr:has(td)');
	  for (var i = 0; i <= recordPerPage - 1; i++) {
	    $(tr[i]).show();
	  }
	  /* $('span').click(function(event) { */
	$('.pageNumber').click(function(event) {
	    $('#tblData').find('tbody tr:has(td)').hide();
	    var nBegin = ($(this).text() - 1) * recordPerPage;
	    var nEnd = $(this).text() * recordPerPage - 1;
	    for (var i = nBegin; i <= nEnd; i++) {
	      $(tr[i]).show();
	    }
	  });
	});

	
	
</script>
  <style type="text/css">
  
.focus {
  background-color: #fff;
  color: #000;
  cursor: pointer;
  font-weight: bold;
}

 .pageNumber {
  padding: 1px;
}
 
table {
 /*  font-family: arial, sans-serif; */
 /*  border-collapse: collapse; */
  width: 100%;
}

</style>
  
<style type="text/css">
.shadow{
	border:1px solid black;
}
.tab{
/* height:100%; */
 
   width:600px; 
word-wrap: break-word;
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
							class="dropdown-toggle" data-toggle="dropdown"> Hello ${name }<img
								src="images/user.png" class="nav-avatar" /> <b class="caret"></b></a>
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
							<li class="active"><a href="adminHome"><i
									class="menu-icon icon-dashboard"></i>Home </a></li>
							<li><a href="#"><i class="menu-icon icon-bullhorn"></i><i id="info" class="fa fa-info-circle pull-right info" data-toggle="tooltip" title="This section shows your allowances."></i>Allowances</a></li>
							<li><a href="adminComplaint"><i class="menu-icon icon-inbox"> </i>Complaints</a>
								</li>
						</ul>
					
					</div>
					<!--/.sidebar-->
				</div>
				
				
				
				<!--/.span3-->
				<div class="span9">
					<div class="content">
						<div class="btn-controls">
							<div class="btn-box-row row-fluid " align="center">
							 
      						   <div class="table-responsive">
								<table class="table table-hover" border="1" id="tblData" style="display: block;">
									<tr class="hvr"><th>Complaint Id</th>
										<th>Priority</th>
										<th>Description</th>
										<th>Current Status</th>
										</tr>
										
										<%if (application.getAttribute("list12") != null)
									{
										List list=(List)application.getAttribute("list12");
										Iterator it=list.iterator();
										while(it.hasNext()){
											Object obj[]=(Object[])it.next();
									%> 
									<tr class="hvr"><td><%out.println(obj[0]);%></td>
									<td><%out.println(obj[1]);%></td>
									<td><div class="tab"><%out.println(obj[2]);%></div></td>
									<td><%out.println(obj[3]);%></td>
									</tr><%}}%>
									
								</table>
								</div>
							<br><br>
							<!-- shadow -->
							<form action="adminTable" method="post">
								<table class="table-responsive">
									<tr><th colspan="2"><h2 class="ccrf">Enter Complaint Id</h2></th></tr>
									<tr><th align="center">Complaint Id:</th>
										<td><input type="number" id="complaintId" name="complainId" style="background: transparent;border: none;border-bottom: 1px solid #fff;" required></td></tr>
								<!-- </table> -->		
							
						
						
							
								<!-- <table class="table-responsive"> -->
									<tr><th align="center">Change status to:</th>
										<td><select class="custom-select" id="changeStatus" name="changeStatus" required style="background: #3d6ba7;border: none;border-bottom: 1px solid #fff;">
													<option selected disabled="disabled" value="">Select status</option>
													<!-- <option value="Open">Open</option> -->
													<option value="Wip">Work is in progress</option>
													<option value="closed">Closed</option>
											</select>&nbsp;&nbsp;<i
									id="info" class="fa fa-info-circle info"
									data-toggle="tooltip"
									title="Status Flow: Open status can change to WIP and WIP status can change to Closed." style="color: white;"></i>
											</td>
										</tr>
									
									<tr><td colspan="2" align="center"><input type="submit" value="Change status"> </td></tr>
								</table>
								</form>
								
								<br><br>
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