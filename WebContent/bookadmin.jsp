<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>

<sql:setDataSource var="busDetails" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:query dataSource="${busDetails}" var="result">
 select * from AvailableBuses where BusID = ?
<sql:param value="${param.BusID}"></sql:param>
</sql:query>
<sql:query dataSource="${busDetails}" var="results">
 select * from Users
</sql:query>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/npm.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/timeout.js"></script>
<title>Reserve Seat</title>
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
	<br>
	<%
				if (request.getAttribute("error") != null) {
			%>

			<div
				class="alert alert-danger alert-dismissible fade in text-center"
				role="alert">
				<button type="button" class="close" data-dismiss="alert"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				Oops, looks like that seat has already been taken
			</div>
			<%
				}
			%>
	<form action="AdminSaveTransaction" class="form-horizontal" method="POST">
		<table class="table table-striped">
			<c:forEach var="row" items="${result.rows}">
				<div class="form-group">
					<label class="col-sm-2 control-label">Bus ID</label>
					<div class="col-sm-6">
						<input name="BusID" type="text" class="form-control"
							value="${param.BusID}" readonly>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">FROM</label>

					<div class="col-sm-6">
						<input name="origin" type="text" class="form-control"
							placeholder="First Name" value="${row.origin}" readonly>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">DESTINATION</label>

					<div class="col-sm-6">
						<input name="destination" type="text" class="form-control"
							placeholder="Last Name" value="${row.destination}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Departure Time</label>

					<div class="col-sm-6">
						<input name="time" type="text" class="form-control"
							placeholder="Departure Time" value="${row.time}" readonly>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Customer Name</label>

					<div class="col-sm-6">
						<input name="customerName" type="text" class="form-control"
							placeholder="Customer's Full Name" required>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Seat Number</label>

					<div class="col-sm-6">
						<input name="seatNumber" type="text" class="form-control"
							placeholder="Preferred Seat Number" required>
					</div>
				</div>
				<div>

					<button id="btnSubmit" type="submit"
						class="btn btn-lg btn-success col-sm-offset-3">Book</button>
					<a href="adminindex.jsp" class="btn btn-lg btn-danger">Go back</a> <a
						href="transactioncomplete.jsp" class="btn btn-lg btn-info">Generate Receipt</a>
				</div>

			</c:forEach>
			<%-- <c:forEach var="row" items="${results.rows}">
			<div class="form-group">
					<label class="col-sm-2 control-label">UserName</label>

					<div class="col-sm-6">
						<input name="fare" type="text" class="form-control"
							placeholder="Fare" value="${row.userName}" readonly>
					</div>
				</div>
			</c:forEach> --%>
		</table>
	</form>


</div>

</body>
</html>