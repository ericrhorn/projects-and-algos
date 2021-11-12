<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style1css.css"/>
<meta charset="UTF-8">
<title>Event Details</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div id="nav">
	<div class="link">
		<a href="/logout">Logout</a>
	</div>
	<div class="link">
		<a href="/home">View all Events</a>
	</div>
	<div class="link">
		<a href="/dashboard">Dashboard</a>
	</div>
</div>
<h2>${event.newEvent}</h2>
<p>Location: ${event.location}</p>
<p>Date: ${event.getEvent_dateFormatted()}</p>
<p>Description:</p>
<textarea rows="5" cols="35">${event.description}</textarea>
<h3>Friends attending this event</h3>
<c:forEach items="${event.userLikes}" var="whoLikes">
<ul>
	<li>${whoLikes.name}</li>
</ul>
</c:forEach>
</body>
</html>