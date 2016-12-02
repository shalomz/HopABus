<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">



<title>HopABus | Home</title>
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
				<a class="navbar-brand" href="index.jsp"><i><strong>HopABus!</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="AddPassenger">History</a></li>

					<li><a href="#">Help</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search..."
						name="busType">
				</form>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="page-header text-center">
			<h1>Select Origin, Destination, Bus Type and Time of travel</h1>
		</div>
		<div class="row">
			<%
				if (request.getAttribute("errors") != null) {
			%>
			
			<div class="alert alert-danger alert-dismissible text-center" role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-hidden="true">&times;</button>
				<h4>
					<i class="icon fa fa-ban"></i> Alert!
				</h4>
				No buses matching your preference are available for the moment. Try
				again
			</div>
			<%
				}
			%>
			<form action="ShowAvailableBuses" method="POST">
				<div class="col-md-3">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Where are you?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="origin" required>
									<option></option>
									<option>Kitale</option>
									
									<option>option 3</option>
									<option>option 4</option>
									<option>option 5</option>
								</select>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-3">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Where are you headed?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="destination" required>
									<option></option>
									<option>Nairobi</option>
									<option>option 2</option>
									<option>option 3</option>
									<option>option 4</option>
									<option>option 5</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Preferred travel time?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" default="" required name="time">
									<option></option>
									<option>2nd Dec, 8:00 AM</option>
									<option>option 2</option>
									<option>option 3</option>
									<option>option 4</option>
									<option>option 5</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Which Class do you want?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="category" required>
									<option></option>
									<option>First Class</option>
									<option>option 2</option>
									<option>option 3</option>
									<option>option 4</option>
									<option>option 5</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div>

					<button id="btnSubmit" type="submit"
						class="btn btn-primary col-md-8 center col-md-offset-2">Search</button>


				</div>

			</form>
		</div>
	</div>
	<script src="js/bootstrap.min.js"></script>
	
</body>
</html>