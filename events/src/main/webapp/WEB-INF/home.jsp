<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style1css.css"/>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
<div id="nav">
	<div class="link">
		<a href="/logout">Logout</a>
	</div>
	<div class="link">
		<a href="/dashboard">Dashboard</a>
	</div>
	<div class="link">
		<a href="/register">Create an Account</a>
	</div>
</div>
<h2>View some local events</h2>
<div>
	<div>
		<h4>Events in your area</h4>
	</div>
	<table>
		<thead>
			<tr>
				<th>Event</th>
				<th>Date</th>
			<!-- 	<th>Time</th> -->
				<th>Location</th>
				<th>Cost</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${allEvents}" var ="events">
			<tr>
				<td>${events.newEvent}</td>
				<td>${events.event_date}</td>
				<td>${events.location}</td>
				<td>$${events.cost}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>