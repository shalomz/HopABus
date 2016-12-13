<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


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
<title>Notifications</title>
</head>
<body>
<%
	if (session.getAttribute("user")==null){
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
				<a class="navbar-brand" href="index.jsp"><i><strong>HopABus!</strong></i></a>
			</div>
			
		</div>
	</nav>
<br>
<br>


	<div class="page-header">
		<h1 class="text-center">Notifications</h1>
	</div>
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<c:forEach var="row" items="${result.rows}">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h2 class="panel-title">
							<c:out value="${row.subject}" />
							<p class="pull-right">
								- Sent on <i><c:out value="${row.time}" /></i>
							</p>
						</h2>
					</div>
					<div class="panel-body">
						<c:out value="${row.content}" />
					</div>
				</div>
			</c:forEach>
		</div>

	</div>




</body>
</html>