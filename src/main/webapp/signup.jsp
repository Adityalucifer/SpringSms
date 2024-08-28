<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Signup Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #e0f7fa; /* Light blue background color */
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        animation: fadeIn 1s ease-in-out;
    }

    .success-message {
        color: green;
        font-size: 1.5em;
        text-align: center;
        position: fixed; /* Fixed position to stay at the top */
        top: 20px; /* Space from the top */
        width: 100%;
        animation: slideInTop 1s ease-in-out, moveUp 1s 5s forwards; /* Animation to slide in and move up */
    }

    @keyframes slideInTop {
        from {
            transform: translateY(-50px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    @keyframes moveUp {
        from {
            transform: translateY(0);
            opacity: 1;
        }
        to {
            transform: translateY(-100px);
            opacity: 0;
        }
    }

    h1 {
        color: green;
        text-align: center;
        margin-bottom: 20px;
        animation: slideIn 1s ease-out;
    }

    form {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        width: 300px;
        animation: fadeInUp 1s ease-in-out;
    }

    fieldset {
        border: 1px solid #007BFF;
        border-radius: 10px;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
    }

    legend {
        color: #007BFF;
        font-size: 1.2em;
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
    input[type="date"]:focus {
        border-color: #007BFF;
        box-shadow: 0 0 8px rgba(0,123,255,0.3);
    }

    .gender-group {
        display: flex;
        justify-content: space-between;
        margin-bottom: 10px;
    }

    .gender-group input[type="radio"] {
        margin-right: 10px; /* Space between radio button and label */
    }

    .gender-group label {
        margin: 0; /* Remove margin to align labels with radio buttons */
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
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }

    @keyframes slideIn {
        from {
            transform: translateY(-20px);
            opacity: 0;
        }
        to {
            transform: translateY(0);
            opacity: 1;
        }
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>
<script>
    function validateForm(event) {
        var name = document.getElementsByName('name')[0].value;
        var email = document.getElementsByName('email')[0].value;
        var pass = document.getElementsByName('pass')[0].value;
        var age = document.getElementsByName('age')[0].value;
        var phone = document.getElementsByName('phone')[0].value;
        var error = document.getElementById('error-message');
        var valid = true;
        
        // Clear previous error message
        error.textContent = '';

        if (!name || !email || !pass || !age || !phone) {
            error.textContent = 'All fields are required.';
            valid = false;
        }

        if (!valid) {
            event.preventDefault(); // Prevent form submission
        }
    }

    // Function to hide the success message after 5 seconds
    function hideSuccessMessage() {
        setTimeout(function() {
            var message = document.querySelector('.success-message');
            if (message) {
                message.style.display = 'none';
            }
        }, 5000);
    }

    // Call the hide function on page load
    window.onload = hideSuccessMessage;
</script>
</head>
<body>

<h1>Signup Page</h1>

<!-- Signup Form -->
<form action="signup" onsubmit="validateForm(event)">
    <fieldset>
        <legend>Signup Information</legend>
        <div>
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" required>
        </div>
        <div>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" required>
        </div>
        <div>
            <label for="pass">Password:</label>
            <input type="password" id="pass" name="pass" placeholder="Enter your password" required>
        </div>
        <div class="gender-group">
            <label>Gender:</label>
            <div>
                <input type="radio" id="male" value="male" name="gen"> <label for="male">Male</label>
            </div>
            <div>
                <input type="radio" id="female" value="female" name="gen"> <label for="female">Female</label>
            </div>
        </div>
        <div>
            <label for="age">Age:</label>
            <input type="text" id="age" name="age" placeholder="Enter your age" required>
        </div>
        <div>
            <label for="dob">DOB:</label>
            <input type="date" id="dob" name="dob" required>
        </div>
        <div>
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" required>
        </div>
        <div>
            <input type="submit" value="Submit">
            <input type="reset" value="Cancel">
        </div>
        <div id="error-message" class="error"></div>
    </fieldset>
</form>

</body>
</html>
