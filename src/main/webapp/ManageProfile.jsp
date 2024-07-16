<%@page import="com.jsp.hibernate.cms.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
body {
    font-family: Arial, sans-serif;
}

.container {
    width: 30%;
    margin: 20px auto;
    padding: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 80px;
}

.profileHead {
    text-align: center;
    margin-bottom: 20px;
    color: black;
}

form {
    display: flex;
    flex-direction: column;
}

input[type="text"],
input[type="email"],
input[type="password"] {
    margin-bottom: 15px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s, box-shadow 0.3s;
    width: 300px;
    margin-left: 5vh;
}

input[type="text"]:hover,
input[type="email"]:hover,
input[type="password"]:hover {
    border-color: #007BFF;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

input[type="submit"] {
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007BFF;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
    width: 20vh;
    margin-left: 22vh;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

.deleteProfile {
    padding: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007BFF;
    color: white;
    cursor: pointer;
    transition: background-color 0.3s;
    display: flex;
    justify-content: center;
    width: 20vh;
    margin-left: 21vh;
}

.deleteProfile:hover{
	background-color: #0056b3;
}


</style>

</head>
<body>
	<% User user = (User)request.getAttribute("user"); %>
	<% String error = (String) request.getAttribute("error"); %>
	<% String deleteError = (String) request.getAttribute("errorWhileDelete"); %>
	<div class="container">
		<form action="updateProfile" method="post">
			<h1 class="profileHead">Manage Profile</h1>
			<input type="hidden" value="<%= user.getUserId() %>" name="userId" readonly>
			<input type="text" value="<%= user.getUsername() %>" name="username" required>
			<input type="email" value="<%= user.getUserEmail() %>" name="userEmail" required>
			<input type="password" value="<%= user.getUserPassword() %>" name="userPassword" required>
			<% if(error != null) { %>
			<%= error %>
			<% } %>
			<input type="submit" value="Update">
			<a href="deleteProfile" class="deleteProfile">Delete Profile</a>
			<% if(error != null) { %>
			<%= deleteError %>
			<% } %>
		</form>
	</div>
</body>
</html>