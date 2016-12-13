<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT * from AvailableBuses order by time;
</sql:query>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<script type="text/javascript" src="js/date_time.js"></script>

<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
<title>Available Buses</title>
<%
	response.setIntHeader("Refresh", 10);
%>


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


	<div class="container">
		<h2 class="sub-header pull-left">
			These are the buses you have added
			<h2 class="sub-header pull-right">
				<span id="date_time"></span>
				<script type="text/javascript">
					window.onload = date_time('date_time');
				</script>
			</h2>
		</h2>
	</div>
	<div
		class="table-responsive col-md-8 col-lg-8 col-lg-offset-2 col-md-offset-1">
		<table
			class="table table-responsive table-striped table-hover table-condensed">
			<thead>
				<tr>
					<th>Bus ID</th>
					<th>Origin</th>
					<th>Destination</th>
					<th>Departure Time</th>
				</tr>
			</thead>
			<tbody>

				<c:forEach var="bus" items="${result.rows}">
					<tr>
						<td><c:out value="${bus.BusID}" /></td>
						<td><c:out value="${bus.origin}" /></td>
						<td><c:out value="${bus.destination}" /></td>
						<td><c:out value="${bus.time}" /></td>
						<td><a class="btn btn-danger btn-sm"
							href="javascript:confirmGo('Remove this bus?','removebus.jsp?BusID=<c:out value="${bus.BusID}"/>')">Remove
								Bus</a></td>
					</tr>
				</c:forEach>
		</table>
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

		<script>
			window.jQuery
					|| document
							.write('<script src="js/vendor/jquery-2.2.3.min.js"><\/script>')
		</script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>