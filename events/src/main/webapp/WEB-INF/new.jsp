<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style1css.css"/>
<meta charset="UTF-8">
<title>New Event</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div id="nav">
	<div class="link">
		<a href="/logout">Logout</a>
	</div>
	<div class="link">
		<a href="/dashboard">Dashboard</a>
	</div>
</div>
<h2>Add a New Event</h2>
<p><form:errors path="event.*"/></p>
<form:form action="/events/new" method="post" modelAttribute="event">
	<P>
		<form:label path="newEvent">Event Name:</form:label>
		<form:input path="newEvent"/>
		<form:input type="hidden" path="user" value="${user.id}"/>
	</P>
	<P>
		<form:label path = "event_date">Event Date:</form:label>
		<form:input type = "date" path = "event_date"/>
		<form:input type="hidden" path="user" value="${user.id}"/>
	</P>
	<P>
		<form:label path="location">Location:</form:label>
		<form:input path="location"/>
		<form:input type="hidden" path="user" value="${user.id}"/>
	</P>
	<P>
		<form:label path="cost">Cost:</form:label>
		<form:input path="cost"/>
		<form:input type="hidden" path="user" value="${user.id}"/>
	</P>
	<P>
		<form:label path="description">Description:</form:label>
		<form:textarea path="description" rows="5" cols="35"/>
		<form:input type="hidden" path="user" value="${user.id}"/>
	</P>
	<button>Add Event</button>
</form:form>
</body>
</html>