<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:query dataSource="${snapshot}" var="result">
SELECT * from AvailableBuses where origin = ? and destination = ? and time = ? and category = ?
<sql:param value="${param.origin}"></sql:param>
<sql:param value="${param.destination}"></sql:param>
<sql:param value="${param.time}"></sql:param>
<sql:param value="${param.category}"></sql:param>
</sql:query>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">

<title>Available Buses Matching your Query</title>
</head>
<body>
<div class="table-responsive col-sm-8 col-sm-offset-2">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Bus ID</th>
					<th>Origin</th>
					<th>Destination</th>
					<th>Departure Time</th>
					<th>Bus Category</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="bus" items="${result.rows}">
					<tr>

						<td><c:out value="${bus.BusID}"/></td>
						<td><c:out value="${bus.origin}" /></td>
						<td><c:out value="${bus.destination}" /></td>
						<td><c:out value="${bus.time}" /></td>
						<td><c:out value="${bus.category}" /></td>

					</tr>
				</c:forEach>
		</table>
		</div>
</body>
</html>