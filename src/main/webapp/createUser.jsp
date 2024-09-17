<%@ page import="com.north.soberstreak.UserManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create User</title>
</head>
<body>

<%
    // Get form data



    Enumeration<String> parameterNames = request.getParameterNames();
    while (parameterNames.hasMoreElements()) {
        String paramName = parameterNames.nextElement();
        String paramValue = request.getParameter(paramName);
        System.out.println("paramName: " + paramName + " [" + paramValue + "]");
    }


    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    System.out.println("username: " + username);
    System.out.println("name: " + name);
    System.out.println("password: " + password);
    System.out.println("email: " + email);


    UserManager userManager = new UserManager();
    boolean hasErrors = false;
    String errorMessage = "";

    try {
        // Check if the username or email already exists
        if (userManager.isUserExists(username, email)) {
            hasErrors = true;
            errorMessage = "The username or email is already registered.";
        } else {
            // Create the new user
            userManager.createUser(username, name, password, email);
        }
    } catch (SQLException e) {
        hasErrors = true;
        errorMessage = "Database error occurred: " + e.getMessage();
    }

    if (hasErrors) {
%>
        <h1>Error</h1>
        <p><%= errorMessage %></p>
        <a href="create.htm">Go back to the form</a>
<%
    } else {
%>
        <h1>Account Created Successfully!</h1>
        <p>Welcome, <%= name %>! Your account has been created.</p>
        <a href="/">Go to Home</a>
<%
    }
%>

</body>
</html>
