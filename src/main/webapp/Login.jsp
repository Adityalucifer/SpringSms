<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #e0f7fa; /* Light blue background color */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        animation: fadeIn 1s ease-in-out;
    }

    fieldset {
        border: 1px solid #ccc;
        border-radius: 10px; /* Rounded corners */
        padding: 20px;
        background-color: #ffffff;
        width: 300px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        text-align: center;
        transform: translateY(-30px);
        opacity: 0;
        animation: fadeInUp 0.6s forwards 0.3s;
    }

    legend {
        font-weight: bold;
        font-size: 1.6em;
        margin-bottom: 10px;
        color: #007BFF;
        text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
    }

    label {
        display: block;
        margin-bottom: 5px;
        color: #333;
    }

    input[type="text"],
    input[type="password"] {
        width: calc(100% - 22px);
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #007BFF;
        box-shadow: 0 0 8px rgba(0,123,255,0.3);
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

    .error {
        color: red;
        font-size: 0.9em;
        margin-top: 10px;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(30px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<script>
    function validateForm(event) {
        var username = document.getElementsByName('name')[0].value;
        var password = document.getElementsByName('pass')[0].value;
        var error = document.getElementById('error-message');
        
        // Clear previous error message
        error.textContent = '';

        if (!username || !password) {
            error.textContent = 'Both fields are required.';
            event.preventDefault(); // Prevent form submission
        }
    }
</script>
</head>
<body>

<fieldset>
    <legend>Login</legend>
    <form action="login" onsubmit="validateForm(event)">
        <div>
            <label for="username">Username:</label>
            <input type="text" id="username" name="name" placeholder="Enter your username">
        </div>
        <div>
            <label for="password">Password:</label>
            <input type="password" id="password" name="pass" placeholder="Enter your password">
        </div>
        <div>
            <input type="submit" value="Login">
            <input type="reset" value="Cancel">
        </div>
        <div id="error-message" class="error"></div>
    </form>
</fieldset>

</body>
</html>
