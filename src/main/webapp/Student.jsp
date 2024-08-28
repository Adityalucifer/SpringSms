<%@ page import="com.dto.Student"%>
<%@ page import="java.util.List"%>
<%@ page import="com.dao.StudentDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #e0f7fa; /* Light blue background color */
        margin: 0;
        padding: 20px;
        text-align: center; /* Center text alignment for the whole body */
    }

    .success-message {
        color: green;
        font-size: 1.5em;
        margin: 20px auto;
        padding: 10px;
        background-color: #d0f0c0; /* Light green background */
        border-radius: 5px;
        display: inline-block;
        animation: slideIn 1s ease-in-out, fadeOut 1s 5s forwards;
    }

    @keyframes slideIn {
        from {
            transform: translateY(-100%);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    @keyframes fadeOut {
        from {
            opacity: 1;
        }
        to {
            opacity: 0;
            transform: translateY(-50%);
        }
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        margin-top: 20px;
    }

    table, th, td {
        border: 1px solid #007BFF;
    }

    th, td {
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #007BFF;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    button {
        padding: 5px 10px;
        border: none;
        border-radius: 5px;
        color: white;
        background-color: #007BFF;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #0056b3;
    }

    a {
        text-decoration: none;
    }

    .logout-button {
        background-color: #FF5722; /* Orange color for logout */
    }

    .logout-button:hover {
        background-color: #e64a19;
    }
</style>
<script>
    function confirmDelete(event) {
        var confirmed = confirm('Are you sure you want to delete this record?');
        if (!confirmed) {
            event.preventDefault(); // Prevent link navigation if not confirmed
        }
    }
</script>
</head>
<body>

<% 
    // Display success message if available
    String successMessage = (String) request.getAttribute("successMessage");
    if (successMessage != null) {
%>
    <div class="success-message"><%= successMessage %></div>
<% } %>

<h1>Student Details</h1>

<table>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Password</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>Delete</th>
        <th>Update</th>
    </tr>
    <% 
    StudentDao dao = new StudentDao();
    List<Student> list = dao.findAll();
    for (Student s : list) {
    %>
    <tr>
        <td><%= s.getName() %></td>
        <td><%= s.getEmail() %></td>
        <td><%= s.getPassword() %></td>
        <td><%= s.getGender() %></td>
        <td><%= s.getPhone() %></td>
        <td><a href="delete?id=<%= s.getId() %>" onclick="confirmDelete(event)"><button>DELETE</button></a></td>
        <td><a href="Update.jsp?id=<%= s.getId() %>"><button>UPDATE</button></a></td>
    </tr>
    <% } %>
</table>

<a href="logout"><button class="logout-button">Logout</button></a>

</body>
</html>
