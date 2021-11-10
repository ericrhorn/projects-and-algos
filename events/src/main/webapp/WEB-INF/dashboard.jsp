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
		<a href="/home">View all Events</a>
	</div>
	<div class="link">
		<a href="/events/new">Add a new event</a>
		
	</div>
</div>
<div>
	<h2>Welcome back, <c:out value="${user.name}"/></h2>
</div>
<div>
	<div>
		<h4>Here are the Events you are Attending</h4>
	</div>
	<table>
		<thead>
			<tr>
				<th>Event</th>
				<th>Date</th>
				<!-- <th>Time</th> -->
				<th>Location</th>
				<th>Cost</th>
				<th>Input</th>
				<th>Can't Make it?</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${allEvents}" var ="events">
		<c:choose>
			<c:when test="${events.userLikes.contains(user)}">
			<tr>
				<td><a href="/events/${events.id}">${events.newEvent}</a></td>
				<td>${events.event_date}</td>
				<td>${events.location}</td>
				<td>$${events.cost}</td>
				<td>
				<c:choose>
				<c:when test="${events.user.id == user.id}">
				<div class="btn">
					<form action="/events/edit/${events.id}">
				    <input type="submit" value="Edit"/>
					</form>
				</div>
				<div class="btn">
					<form action="/delete/${events.id}" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="Delete">
					</form>
				</div>
				</c:when>
				<c:otherwise>
					Can't Delete
				</c:otherwise>
				</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${events.userLikes.contains(user)}">
							<form method="GET" action="unlike/${events.id}">
							<input type="submit" value="Unattend">
							</form>
						</c:when>
						<c:otherwise>
							<form method="GET" action="like/${events.id}">
							<input type="submit" value="Attend">
							</form>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		</c:forEach>
		</tbody>
	</table>
</div>
<div>
	<div>
		<h4>All Events</h4>
	</div>
	<table>
		<thead>
			<tr>
				<th>Created By</th>
				<th>Event</th>
				<th>Date</th>
				<!-- <th>Time</th> -->
				<th>Location</th>
				<th>Cost</th>
				<th>Input</th>
				<th>Want to Go?</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${allEvents}" var ="events">
		
		<c:choose>
		<c:when test="${events.userLikes.contains(user)}">

		</c:when>
		<c:otherwise>
			<tr>
				<td>${events.user.name}</td>
				<td><a href="/events/${events.id}">${events.newEvent}</a></td>
				<td>${events.event_date}</td>
				<td>${events.location}</td>
				<td>$${events.cost}</td>
				<td>
				<c:choose>
				<c:when test="${events.user.id == user.id}">
				<div class="btn">
					<form action="/events/edit/${events.id}">
				    <input type="submit" value="Edit"/>
					</form>
				</div>
				<div class="btn">
					<form action="/delete/${events.id}" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="submit" value="Delete">
					</form>
				</div>
				</c:when>
				<c:otherwise>
					Can't Delete
				</c:otherwise>
				</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${events.userLikes.contains(user)}">
							<form method="GET" action="unlike/${events.id}">
							<input type="submit" value="Unattend">
							</form>
						</c:when>
						<c:otherwise>
							<form method="GET" action="like/${events.id}">
							<input type="submit" value="Attend">
							</form>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>