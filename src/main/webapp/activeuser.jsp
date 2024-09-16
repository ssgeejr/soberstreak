<%@ page import="com.north.soberstreak.UserLogin" %>
<%@ page import="com.north.soberstreak.ActiveUserItem" %>
<%@ page import="com.north.soberstreak.Milestone" %>
<%@ page import="java.util.Lists" %>
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
     <h1>Welcome, <%= activeUser.getName() %>!</h1>
    <p>You have <%= activeUser.getDaysSober() %> days sober and have saved $<%= activeUser.getAmountSaved() %>.</p>

    <h2>Your Milestones:</h2>
    <ul>
        <%
            // Get the list of milestones and iterate over it
            List<Milestone> milestones = activeUser.getMilestones();
            for (Milestone milestone : milestones) {
        %>
            <li><%= milestone.getMilestoneDays() %> days - <%= milestone.getMilestoneMessage() %></li>
        <%
            } // End for loop
        %>
    </ul>
<%
    } else {
%>
    <p>Invalid login. Please try again.</p>
<%
    }
%>

</body>
</html>
