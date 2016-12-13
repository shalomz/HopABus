<%@ page session ="true" language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HopABus | Admin</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="js/date_time.js"></script>
</head>
<body>



	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="admin.jsp">HopABus</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Dashboard</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
			</ul>
			
		</div>
	</div>
	</nav>

	<br>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<h3 class="page-header pull-left">
			Dashboard
			<h3 class="page-header pull-right">
				<span id="date_time"></span>
				<script type="text/javascript">
					window.onload = date_time('date_time');
				</script>
			</h3>
		</h3>
	</div>
	<div class="col-sm-12">
	<div class="col-sm-2 ">
	<a
		class="btn btn-primary btn-s, btn-fab btn-raised"
		href="passengers.jsp" title="View Buses">See all passengers</a>
	</div>
	<div class="col-sm-2 s">
	<a
		class="btn btn-primary btn-sm btn-fab btn-raised"
		href="adminindex.jsp" title="View Buses">Book new passenger</a>
	</div>
	<div class="col-sm-2">
	<a
		class="btn btn-primary btn-sm btn-fab btn-raised"
		href="addnotification.jsp" title="Add notification">New Notification</a>
	</div>
	<div class="col-sm-2 ">
	<a
		class="btn btn-primary btn-sm btn-fab btn-raised mdi-content-add "
		href="addedbuses.jsp" title="View Buses">Available Buses</a>
	</div>
	<div class="col-sm-2">
	<a
		class="btn btn-primary btn-sm btn-fab btn-raised"
		href="addbus.jsp" title="Add New Bus">+ New Bus</a>
	</div>
	</div>
</body>
</html>