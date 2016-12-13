<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin | Add Bus to Queue</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<link href="select2/select2.min.css" rel="stylesheet">
<link href="timepicker/bootstrap-timepicker.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="timepicker/bootstrap-timepicker.min.js"></script>
<script type="text/javascript"
	src="datepicker/js/bootstrap-datepicker.js"></script>


<script type="text/javascript" src="js/date_time.js"></script>
</head>
<body>
<%
	if (session.getAttribute("admin")==null){
		System.out.println("No Session Attr");
		response.sendRedirect("index.jsp");
	}
%>
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
	<br>
	<br>
	<div class="container">
		<h2>Use this form to add a bus to today's service</h2>
		<form action="AddBus" class="form-horizontal" method="POST">
			<table class="table table-striped">


				<div class="form-group">
					<label class="col-sm-2 control-label">Bus Registration No.</label>

					<div class="col-sm-6">
						<input name="BusID" type="text" class="form-control"
							placeholder="Bus Reg. Number" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Origin</label>

					<div class="col-sm-6">
						<input name="origin" type="text" class="form-control"
							placeholder="Origin" required>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Destination</label>

					<div class="col-sm-6">
						<input name="destination" type="text" class="form-control"
							placeholder="Destination" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"> Departure Time</label>

					<div class="bootstrap-timepicker">
						<div class="form-group">
							<div class="input-group col-sm-6">
								<input type="text" name="time" class="form-control timepicker">

								<div class="input-group-addon">
									<i class="fa fa-clock-o"></i>
								</div>
							</div>
							<!-- /.input group -->
						</div>
						<!-- /.form group -->
					</div>

					<div>

						<button id="btnSubmit" type="submit"
							class="btn btn-primary col-sm-4">Add Bus</button>
						<button id="btnCancel" type="reset"
							class="btn btn-danger col-md-3 col-md-offset-2">Reset</button>

					</div>
			</table>
		</form>
	</div>
	<script src="select2/select2.full.min.js"></script>
	<script>
		$(function() {
			//Initialize Select2 Elements
			$(".select2").select2();

			//Timepicker
			$(".timepicker").timepicker({
				showInputs : false
			});
		});
	</script>
</body>
</html>