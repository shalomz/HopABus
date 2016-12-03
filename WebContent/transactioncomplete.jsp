<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page session="true"%>

<sql:setDataSource var="busDetails" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost/Bus" user="root" password=" " />


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Complete Transaction</title>

</head>
<body>
<font size="5" color='green'> 
			successfully.</font>
		<a href="index.jsp">Go Home</a>
</body>
</html>