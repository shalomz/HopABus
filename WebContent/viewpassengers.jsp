<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:query dataSource="${snapshot}" var="result">
SELECT * from Transactions where seat_number > 0
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="header.jsp" />
<title>Customers</title>
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
					<li><a href="adminavailable.jsp">Available Buses</a></li>
					<li><a href="#"></a></li>
					<li><a href="#">Profile</a></li>
					<li><a href="#">Help</a></li>
				</ul>

			</div>
		</div>
	</nav>

	<br>
	<br>
	<br>
	<div class="table-responsive col-sm-8 col-sm-offset-2">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Transaction ID</th>
					<th>Transaction Time</th>
					<th>Customer Name</th>
					<th>Bus ID</th>
					<th>Seat Number</th>
					<th>Departure Time</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="customer" items="${result.rows}">
					<tr>

						<td><c:out value="${customer.id}" /></td>
						<td><c:out value="${customer.time_of_transaction}" /></td>
						<td><c:out value="${customer.customerName}" /></td>
						<td><c:out value="${customer.BusID}" /></td>
						<td><c:out value="${customer.seat_number}" /></td>
						<td><c:out value="${customer.departure_time}" /></td>

					</tr>
				</c:forEach>
		</table>
	</div>

</body>
</html>