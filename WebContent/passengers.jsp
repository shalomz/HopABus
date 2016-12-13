<%@ page session="true" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />


<sql:query dataSource="${snapshot}" var="result">
SELECT * from Transactions order by time_of_transaction;
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
<title>Passengers | Queue</title>
<%
	response.setIntHeader("Refresh", 10);
%>


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

	<div class="container">
		<h2 class="sub-header pull-left">
			These are the passengers
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
					<th>Transaction ID</th>
					<th>Bus ID</th>
					<th>Customer Name</th>
					<th>Time of Transaction</th>
					<th>Departure Time</th>
					<th>Seat NO.</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach var="transaction" items="${result.rows}">
					<tr>
						<td><c:out value="${transaction.id}" /></td>
						<td><c:out value="${transaction.BusID}" /></td>
						<td><c:out value="${transaction.customerName}" /></td>
						<td><c:out value="${transaction.time_of_transaction}" /></td>
						<td><c:out value="${transaction.departure_time}" /></td>
						<td><c:out value="${transaction.seat_number}" /></td>
						<td><a class="btn btn-danger btn-sm"
							href="javascript:confirmGo('Sure to dequeue this passenger?','unbook.jsp?id=<c:out value="${transaction.id}"/>')">Unbook</a></td>
					</tr>
				</c:forEach>
			</tbody>
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