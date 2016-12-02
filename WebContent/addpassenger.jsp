<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Passenger</title>
<link href="css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script>

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
				<a class="navbar-brand" href="index.jsp"><i><strong>Pulse</strong></i></a>
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
		<hr>
		<br>
		<div class="col-md-8 col-md-offset-2">

			<p>Use this form to capture the passenger's details</p>

			<%
				if (request.getAttribute("errors") != null) {
			%>
			<div class="alert alert-danger text-center" role="alert">
				Ensure you fill all the passenger fields.</div>
			<%
				}
			%>
			<form action="AddPassenger" class="form-horizontal" method="POST">
				<table class="table table-striped">

					<div class="form-group">
						<label class="col-sm-2 control-label">First Name</label>

						<div class="col-sm-6">
							<input name="firstName" type="text" class="form-control"
								placeholder="Passenger's First Name"
								value='<%=request.getAttribute("firstName")%>'>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">Last Name</label>

						<div class="col-sm-6">
							<input name="lastName" type="text" class="form-control"
								placeholder="Passenger's Last Name"
								value='<%=request.getAttribute("lastName")%>'>
						</div>
					</div>

					<div>

						<button id="btnSubmit" type="submit"
							class="btn btn-primary col-md-6">Add to Queue</button>
						<button id="btnCancel" type="reset"
							class="btn btn-danger  col-md-3 col-md-offset-1">Cancel</button>

					</div>
				</table>
			</form>
		</div>

	</div>
</body>
</html>