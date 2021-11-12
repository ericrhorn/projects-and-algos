<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style1css.css"/>
<meta charset="UTF-8">
<title>Welcome</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div id="nav">
	<div class="link">
		<a href="/home">view local events</a>
	</div>
	<div class="link">
		<a href="/register">register</a>
	</div>
</div>
<h2>Welcome to Event Central!</h2>
<div id="wrapper">
	<section class="login">
	<div>
	<h4>Log in</h4>
	<p><c:out value="${error}"/></p>
	<form action="/login" method="post">
		<p>
			<label for="email" for="email">Email</label>
	        <input type="text" id="email" name="email"/>
		</p>
		<p>
			<label for="password" for="password">Password</label>
	        <input type="password" id="password" name="password"/>
		</p>
		<div>
		<button>Login</button>
		</div>
	</form>
	</div>
	</section>
	<section class="description">
		<p>Create events or add events in your area to the database</p>
		<p>See which of your friends are attending</p>
	</section>
</div>
</body>
</html>