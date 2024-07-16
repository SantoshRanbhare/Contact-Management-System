<%@page import="com.jsp.hibernate.cms.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
body {
	font-family: Arial, sans-serif;
}

.welcome {
	color : black;
	text-align: center;
	margin-top: 20px;
}

.container {
	width: 50%;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.containerHead {
	text-align: center;
	margin-bottom: 20px;
}

.containerSubject {
	display: flex;
	justify-content: space-around;
}

.containerSubject a {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.containerSubject a:hover {
	border-color: #4CAF50;
	background-color: #45a049;
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
	color: white;
	border-color: #45a049;
}
</style>

</head>
<body>
	<%
	User user = (User) session.getAttribute("user");
	String addContact = user != null ? "AddContact.jsp" : "Login.jsp";
	String manageContact = user != null ? "manageContact" : "Login.jsp";
	String manageProfile = user != null ? "manageProfile" : "Login.jsp";
	%>
	<h1 class="welcome">Welcome Back</h1>

	<div class="container">
		<h1 class="containerHead">Manage Contact</h1>
		<div class="containerSubject">
			<a href=<%=addContact%>>Add Contact</a> 
			<a href=<%=manageContact%>>Manage
				Contact</a> 
			<a href=<%=manageProfile%>>Manage Profile</a>
		</div>
	</div>
</body>
</html>