<%@page import="com.jsp.hibernate.cms.entity.Contact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="Navbar.jsp" %>
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

.formContaint input[type="text"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    transition: border-color 0.3s, box-shadow 0.3s;
}

.formContaint input[type="text"]:hover {
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

</style>

</head>
<body>
	<% 
	int contactId = Integer.parseInt(request.getParameter("contactId"));
	User user = (User) session.getAttribute("user");
	List<Contact> contacts = user.getContacts();
	%>
	
	<div class="mainContainer">
		<h1 class="formHead">Update Contact</h1>
		<form action="updateContact" method="post" class="formContaint">
			<% for(Contact contact : contacts){
			if(contact.getContactId() == contactId) {%>
			<input type="hidden" value="<%= contactId %>" name="contactId"
				required> 
			<input type="text" value="<%= contact.getContactName() %>" name="contactName"
				required> 
			<input type="text"
				value="<%= contact.getContactNumber() %>" name="contactNumber" required> 
			<%} %>
			<%} %>
			<input
				type="submit" value="Update Contact">
		</form>
	</div>
</body>
</html>