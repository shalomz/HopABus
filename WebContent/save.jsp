<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />

<sql:update dataSource="${snapshot}" var="result">
 insert into Daily values (?,?,?,?,?) 
<sql:param value="${param.id}"></sql:param>
<sql:param value="${param.BusID}"></sql:param>
<sql:param value="${param.customerName}"></sql:param>
<sql:param value="${param.departure_time}"></sql:param>
<sql:param value="${param.seat_number}"></sql:param>

</sql:update>
</head>
<body>
	<c:if test="${result>=1}">
		<font size="5" color='green'> Congratulations ! Data deleted
			successfully.</font>
		<a href="admin.jsp">Go Home</a>
		<c:redirect url="unbook.jsp" />
	</c:if>
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>