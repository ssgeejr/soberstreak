<%@ page import="com.north.soberstreak.UserLogin" %>
<%@ page import="com.north.soberstreak.ActiveUserItem" %>
<%@ page import="com.north.soberstreak.Milestone" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Sober Streak</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>

<%
    // Retrieve the username and password from the request
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    System.out.println("Username: " + username);
    System.out.println("Password: " + password);
    // Attempt to validate the user
    ActiveUserItem activeUser = null;
    try {
        activeUser = UserLogin.validateUser(username, password);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    if (activeUser != null) {
%>
    <div class="welcome-message">
        <h1>Welcome, <%= activeUser.getName() %>!</h1>
        <p>You have <strong><%= activeUser.getDaysSober() %></strong> days sober and have saved <strong>$<%= activeUser.getAmountSaved() %></strong> dollars.</p>
    </div>

    <div class="milestones">
        <h2>Your Milestones:</h2>
        <%
        System.out.println("................");
         activeUser.getMilestones()


        %>

    </div>
<%
    } else {
        out.println("<p>Invalid username or password.</p>");
    }
%>

</body>
</html>
