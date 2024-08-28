<%@ page import="com.dto.Student"%>
<%@ page import="com.dao.StudentDao"%>
<%@ page import="com.jsp.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Update Student Record</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #e0f7fa; /* Light blue background color */
        margin: 0;
        padding: 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    fieldset {
        border: 1px solid #007BFF;
        border-radius: 10px;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        width: 100%;
        max-width: 500px;
    }

    legend {
        color: #007BFF;
        font-size: 1.5em;
        padding: 0 10px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        color: #333;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="tel"],
    input[type="number"],
    input[type="date"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus,
    input[type="tel"]:focus,
    input[type="number"]:focus,
    input[type="date"]:focus {
        border-color: #007BFF;
        box-shadow: 0 0 8px rgba(0,123,255,0.3);
    }

    input[type="radio"] {
        margin-right: 5px;
    }

    input[type="submit"],
    input[type="reset"] {
        padding: 10px;
        border: none;
        border-radius: 5px;
        color: #fff;
        background-color: #007BFF;
        cursor: pointer;
        margin-right: 5px;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    input[type="submit"]:hover,
    input[type="reset"]:hover {
        background-color: #0056b3;
        transform: scale(1.05);
    }

    button {
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        color: #fff;
        background-color: #FF5722;
        cursor: pointer;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    button:hover {
        background-color: #e64a19;
        transform: scale(1.05);
    }

    a {
        text-decoration: none;
    }
</style>
<script>
    function validateForm() {
        var form = document.querySelector('form');
        var inputs = form.querySelectorAll('input');
        var valid = true;

        inputs.forEach(function(input) {
            if (input.type !== 'submit' && input.type !== 'reset' && input.value.trim() === '') {
                alert('Please fill out all required fields.');
                valid = false;
                return;
            }
        });

        return valid;
    }
</script>
</head>
<body>

<% 
    HttpSession hs = request.getSession();
    Admin admin = (Admin) hs.getAttribute("admin");
    if (admin != null) {
        int id = Integer.parseInt(request.getParameter("id"));
        StudentDao dao = new StudentDao();
        Student s = dao.findStudentByid(id);
%>
    <fieldset>
        <legend>Update Record</legend>
        <form action="update" onsubmit="return validateForm()">
            <label>Id:</label>
            <input type="text" name="id" value="<%= s.getId() %>" readonly><br>
            <label>Username:</label>
            <input type="text" name="name" value="<%= s.getName() %>"><br>
            <label>Email:</label>
            <input type="email" name="email" value="<%= s.getEmail() %>"><br>
            <label>Password:</label>
            <input type="password" name="pass" value="<%= s.getPassword() %>"><br>
            <label>Phone:</label>
            <input type="tel" name="phone" value="<%= s.getPhone() %>"><br>
            <label>Gender:</label>
            <input type="radio" name="gen" value="Male" <%= s.getGender().equals("Male") ? "checked" : "" %>>Male
            <input type="radio" name="gen" value="Female" <%= s.getGender().equals("Female") ? "checked" : "" %>>Female
            <input type="radio" name="gen" value="Others" <%= s.getGender().equals("Others") ? "checked" : "" %>>Others<br>
            <label>Age:</label>
            <input type="number" name="age" value="<%= s.getAge() %>"><br>
            <label>DOB:</label>
            <input type="date" name="dob" value="<%= s.getDob() %>"><br>
            <input type="submit" value="Update">
            <input type="reset" value="Cancel">
        </form>
    </fieldset><br>
    <a href="logout"><button>Logout</button></a>
<% 
    } else {
        response.getWriter().print("<h1>Login First</h1>");
        request.getRequestDispatcher("login.html").include(request, response);
    } 
%>

</body>
</html>
