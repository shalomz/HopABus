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
<jsp:include page = "header.jsp"/>
<title>Customers</title>
</head>
<body>
<jsp:include page = "navbar.jsp"/>
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