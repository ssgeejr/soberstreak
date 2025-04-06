<%@ page import="com.north.soberstreak.UserManager" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String message = "";
    String href = "";


    UserManager userManager = new UserManager();
    boolean hasErrors = false;
    String errorMessage = "";

    try {
        // Check if the username or email already exists
        if (userManager.isUserExists(username, email)) {
            hasErrors = true;
            message = "The username or email is already registered.";
        } else {
            // Create the new user
            userManager.createUser(username, name, password, email);
        }
    } catch (SQLException e) {
        hasErrors = true;
        message = "Database error occurred: " + e.getMessage();
    }

    if (hasErrors) {
        message = message + "<br><a href='create.htm'>Create User</a>";
    } else {
        message = "<h1>Account Created Successfully!</h1>";
        message= message + "<p>Welcome, " + name + " Your account has been created.</p>";
        href = "<a href=/>Go to Home</a>";
    }
%>
    <div class="container">
        <div class="input-group">
            <label><%= message %></label>
        </div>

        <div class="input-group">
            <label for="name">Username: <%= username %></label>
        </div>

        <div class="input-group">
            <label for="email">Email Address: <%= email %></label>
        </div>

        <div class="link-group">
            <%= href %>
        </div>
    </div>

</body>
</html>
