<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style1css.css"/>
<meta charset="UTF-8">
<title>Login and Registration</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="nav">
	<a href="/home">view local events</a>
</div>
<div id="wrapper">
	<section class="register">
	<div>
	<p><c:out value="${message}"/></p>
	<p><form:errors path="user.*"/></p>
	<h2>Register</h2>
	<form:form action="/register" method="post" modelAttribute="user">
		<p>
			<form:label path="name">Name:</form:label>
			<form:input path="name"/>
		</p>
		<p>
			<form:label path="email">Email:</form:label>
			<form:input path="email"/>
		</p>
		<p>
			<form:label path="password">Password:</form:label>
			<form:password path="password"/>
		</p>
		<p>
			<form:label path="pWConfirm">PW Confirm:</form:label>
			<form:password path="pWConfirm"/>
		</p>
		<div>
		<button>Register</button>
		</div>
		
	</form:form>
	</div>
	</section>
</div>
</body>
</html>