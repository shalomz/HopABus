<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-2.2.3.min.js"></script>
<script src="js/npm.js"></script>
<link href="bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<script src="js/bootstrap.min.js"></script>
<script src="js/timeout.js"></script>
<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<title>Insert title here</title>
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
				<a class="navbar-brand" href="admin.jsp"><i><strong>HopABus!</strong></i></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse"></div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<div class="row">
		<%
			if (request.getAttribute("error") != null) {
		%>

		<div class="alert alert-danger alert-dismissible fade in text-center"
			role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			There was an error broadcasting that message. Please try again
		</div>
		<%
			}
		%>

		<%
			if (request.getAttribute("message") != null) {
		%>

		<div class="alert alert-success alert-dismissible fade in text-center"
			role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			Broadcast sent successfully!
		</div>
		<%
			}
		%>
		<div class="container">
			<div class="col-md-6 col-sm-offset-2">
				<form action="SaveNotification" method="POST">

					<div class="form-group">
						<input type="text" class="form-control" name="subject"
							placeholder="Subject" required>
					</div>
					<div>
						<textarea class="textarea form-control" rows="5"
							placeholder="Type Broadcast Message" name="content" required></textarea>
					</div>
					<div class="box-footer clearfix">
						<button type="submit" class="pull-right btn btn-default">
							Send <i class="fa fa-arrow-circle-right"></i>
						</button>
					</div>
				</form>


			</div>
		</div>
		<script type="text/javascript"
			src="bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
</body>
</html>