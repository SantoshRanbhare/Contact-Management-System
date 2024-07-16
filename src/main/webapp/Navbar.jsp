<%@page import="com.jsp.hibernate.cms.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
* {
	margin: 0;
	padding: 0;
}

nav {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	padding: 10px 20px;
}

h1 {
	margin-left: -4px;
	color: white;
}

div a{
	color: white;
	margin: 10px;
	padding: 10px;
	text-decoration: none;
}

nav a:hover {
	background-color: #575757;
	border-radius: 5px;
}
</style>

</head>
<body>
	<% User user2 = (User)session.getAttribute("user"); %>
	<nav>
		<h1>Contact-Management-System</h1>
		<div>
			<% if(user2 == null) { %>
			<a href="Register.jsp">Register</a> 
			<a href="Login.jsp">Login</a>
			<%} else{%>
			<a href="logoutUser">Logout</a>
			<%} %>
		</div>
	</nav>

</body>
</html>