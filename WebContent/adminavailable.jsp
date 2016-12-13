<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:query dataSource="${snapshot}" var="result">
SELECT * from AvailableBuses where origin = ? and destination = ? and time = ?
<sql:param value="${param.origin}"></sql:param>
	<sql:param value="${param.destination}"></sql:param>
	<sql:param value="${param.time}"></sql:param>
</sql:query>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">

<title>Available Buses Matching your Query</title>
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
	<div class="table-responsive col-sm-8 col-sm-offset-2">
		<table class="table table-striped table-hover">
			<thead>
				<tr>
					<th>Bus ID</th>
					<th>Origin</th>
					<th>Destination</th>
					<th>Departure Time</th>
					<th>Available Seats</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="bus" items="${result.rows}">
					<tr>

						<td><a
							href="bookadmin.jsp?BusID=<c:out value="${bus.BusID}"/>"><c:out
									value="${bus.BusID}" /></a></td>
						<td><c:out value="${bus.origin}" /></td>
						<td><c:out value="${bus.destination}" /></td>
						<td><c:out value="${bus.time}" /></td>
						<td><span class="badge bg-green"><c:out
									value='<%=request.getAttribute("availableSeats")%>' /></span></td>


					</tr>
				</c:forEach>
		</table>
	</div>
</body>
</html>