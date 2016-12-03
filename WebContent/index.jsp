<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>

<sql:setDataSource var="busDetails" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:query dataSource="${busDetails}" var="result">
 select * from AvailableBuses 
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/theme.css" rel="stylesheet">
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/npm.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.js"></script>



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
			<br>
			<h1>Select Origin, Destination, Bus Type and Time of travel</h1>
		</div>
		<div class="row">
			<%
				if (request.getAttribute("errors") != null) {
			%>

			<div
				class="alert alert-warning alert-dismissible fade in text-center"
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
				class="alert alert-warning alert-dismissible fade in text-center"
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
			<form action="ShowAvailableBuses" method="POST">
				<div class="col-md-3">

					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title text-center">Where are you?</h3>
						</div>
						<div class="panel-body">
							<div class="form-group">

								<select class="form-control" name="origin" id="origin" required>
									<c:forEach var="row" items="${result.rows}">
										<option origin-id="${row.origin}"><c:out
												value="${row.origin}" /></option>
									</c:forEach>
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

								<select class="form-control" name="destination" id="destination" required>
									<c:forEach var="row" items="${result.rows}">
										<option destination-id="${row.destination}"><c:out
												value="${row.destination}" /></option>
									</c:forEach>
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

								<select class="form-control" name="time" id="time" required>
									<c:forEach var="row" items="${result.rows}">
										<option time-id="${row.time}"><c:out
												value="${row.time}" /></option>
									</c:forEach>
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

								<select class="form-control" name="category" id="category" required>
									<c:forEach var="row" items="${result.rows}">
										<option origin-id="${row.category}"><c:out
												value="${row.category}" /></option>
									</c:forEach>
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
		<ul class="text-center">1. Select where you want to travel from (Origin)</ul>
		<ul class="text-center">2. Select where you want to travel to (Destination)</ul>
		<ul class="text-center">3. Select Time you want of travel (Departure Time)</ul>
		<ul class="text-center">4. Select the bus Category</ul>
	</div>


</body>
</html>