<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>

<sql:setDataSource var="passNotification" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:query dataSource="${passNotification}" var="result">
 select * from Notifi order by time desc 
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script src="js/jquery-2.2.3.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<script src="js/timeout.js"></script>



<title>HopABus | Home</title>
</head>
<body>
	<%
		if (session.getAttribute("user") == null
				|| session.getAttribute("admin") == null) {
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
				<a class="navbar-brand" href="index.jsp"><i><strong>HopABus!</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<form class='navbar-form navbar-right' method='POST' action='Login'>
					<div class='form-group'>
						<input type='text' class='form-control' name='username'
							placeholder='Username' required/>
					</div>
					<div class='form-group'>
						<input type='password' class='form-control' name='password'
							placeholder='Password' required/>
					</div>
					<button type='submit' class='btn btn-default'>Login</button>

				</form>


			</div>
		</div>
	</nav>
	<%
		}
	%>
	<%
		if (session.getAttribute("user") != null) {
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
				<a class="navbar-brand" href="index.jsp"><i><strong>HopABus!</strong></i></a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false"><i class="fa fa-envelope"></i> <span
						class="label label-success">4</span><span class="badge"></span></a>
					<ul class="dropdown-menu list-group">
						<li role="presentation" class="active"><a href="#">Notifications</a></li>
						<c:forEach var="row" items="${result.rows}">
							<li><a href="allnotifications.jsp">

									<h4>
										<c:out value="${row.subject}" />
										<small><i class="fa fa-clock-o"></i> Yesterday</small>
									</h4>
									
							</a></li>

						</c:forEach>
					 <li class="footer"><a href="allnotifications.jsp">See All Messages</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<%
		}
	%>

	<div class="container">
		<div class="page-header text-center">
			<br>
			<h1>Select Origin, Destination, Bus Type and Time of travel</h1>
		</div>
		<div class="row">
			<%
				if (request.getAttribute("errors") != null) {
			%>

			<div class="alert alert-danger alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				No bus matching your query is available at the moment.Try checking
				another combination
			</div>
			<%
				}
			%>

			<%
				if (request.getAttribute("message") != null) {
			%>

			<div
				class="alert alert-success alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				Successfuly reserved
			</div>
			<%
				}
			%>
			<%
				if (request.getAttribute("wrong") != null) {
			%>

			<div class="alert alert-danger alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				Wrong User name and password combination. Try Again
			</div>
			<%
				}
			%>
			<form action="ShowAvailableBuses" method="POST">
				<div class="col-md-4">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Where are you?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="origin" id="origin" required>
									<option>Egerton</option>
									<option>Njoro</option>
									<option>Town</option>
								</select>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Where are you headed to?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="destination" id="destination"
									required>
									<option>Njoro</option>
									<option>Town</option>
									<option>Egerton</option>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Preferred travel time?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="time" id="time" required>
									<option>08:00 AM</option>
									<option>10:00 AM</option>
									<option>12:00 PM</option>
									<option>02:00 PM</option>
									<option>04:00 PM</option>
									<option>06:00 PM</option>
								</select>
							</div>
						</div>
					</div>
				</div>


				<div>

					<button id="btnSubmit" type="submit"
						class="btn btn-success col-md-8 center col-md-offset-2">Search</button>


				</div>

			</form>
		</div>
		<br>
		<h1 class="text-center">Instructions</h1>
		<ul class="text-center">1. Select where you want to travel from
			(Origin)
		</ul>
		<ul class="text-center">2. Select where you want to travel to
			(Destination)
		</ul>
		<ul class="text-center">3. Select Time you want of travel
			(Departure Time)
		</ul>
	</div>
	<div>
		<p class="lead text-center">
			<strong>Registered Users can enjoy some privileges</strong>
		</p>
	</div>


</body>
</html>