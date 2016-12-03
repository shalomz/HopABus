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

<title>Reserve Seat</title>
</head>
<body>
	<br>
	<form action="SaveTransaction" class="form-horizontal" method="POST">
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
					<label class="col-sm-2 control-label">Class</label>

					<div class="col-sm-6">
						<input name="category" type="text" class="form-control"
							placeholder="Class" value="${row.category}" readonly>
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-2 control-label">Fare (KSHs)</label>

					<div class="col-sm-6">
						<input name="fare" type="text" class="form-control"
							placeholder="Fare" value="${row.fare}" readonly>
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
					<a href="index.jsp" class="btn btn-lg btn-danger">Go back</a> <a
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




</body>
</html>