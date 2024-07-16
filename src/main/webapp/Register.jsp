<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="Navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
/* styles.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}

.mainContainer {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
    margin-left: 450px;
    margin-top: 100px;
}

.formHead {
    margin-bottom: 20px;
    font-size: 1.5em;
    color: #333;
}

.formContaint input[type="text"],
.formContaint input[type="email"],
.formContaint input[type="password"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s, box-shadow 0.3s;
}

.formContaint input[type="text"]:hover,
.formContaint input[type="email"]:hover,
.formContaint input[type="password"]:hover {
    border-color: #4CAF50;
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
}

.formContaint input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px;
    width: 100%;
    border-radius: 5px;
    font-size: 1em;
    cursor: pointer;
    transition: background-color 0.3s, box-shadow 0.3s;
}

.formContaint input[type="submit"]:hover {
    background-color: #45a049;
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.5);
}

.message {
    margin-top: 20px;
    color: #f00;
    font-size: 0.9em;
}

</style>

</head>
<body>

	<%
	String message = (String) request.getAttribute("message");
	%>

	<div class="mainContainer">
		<h1 class="formHead">Register User</h1>
		<form action="registerUser" method="post" class="formContaint">
			<input type="text" placeholder="Enter Username" name="username"
				required> 
			<input type="email" placeholder="Enter Email"
				name="userEmail" required> 
			<input type="password"
				placeholder="Enter Password" name="userPassword" required> 
			<input
				type="submit" value="Register">
		</form>
		<h5 class="message">
			<%
			if (message != null) {
			%>
			<%=message%>
			<%
			}
			%>
		</h5>
	</div>
</body>
</html>