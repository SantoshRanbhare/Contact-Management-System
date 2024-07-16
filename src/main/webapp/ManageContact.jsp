<%@page import="com.jsp.hibernate.cms.entity.Contact"%>
<%@page import="java.util.List"%>
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
	background-color: #f8f9fa;
}

.container {
	width: 80%;
	margin: auto;
	padding: 20px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

thead {
	background-color: #007BFF;
	color: white;
}

thead th {
	padding: 10px;
}

tbody tr:nth-child(even) {
	background-color: #f2f2f2;
}

tbody td {
	padding: 10px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

tbody tr:hover {
	background-color: #e9ecef;
}

.resposeContact {
	color: #007BFF;
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #007BFF;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

.resposeContact:hover {
	background-color: #0056b3;
	color: white;
}
</style>
</head>
<body>
	<%
	User user = (User) request.getAttribute("user");
	List<Contact> contacts = user.getContacts();
	%>

	<%
	String error = (String) request.getAttribute("error");
	%>

	<div class="container">
		<table>
			<thead>
				<tr>
					<th>Contact Name</th>
					<th>Number</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Contact contact : contacts) {
				%>
				<tr>
					<td><%=contact.getContactName()%></td>
					<td><%=contact.getContactNumber()%></td>
					<td><a class="resposeContact"
						href="UpdateContact.jsp?contactId=<%=contact.getContactId()%>">Edit</a></td>
					<td><a class="resposeContact"
						href="deleteContact?contactId=<%=contact.getContactId()%>">Delete</a></td>
				</tr>
				<%
				}
				%>

			</tbody>
		</table>
		<%
		if (error != null) {
		%>
		<%=error%>
		<%
		}
		%>
	</div>
</body>
</html>