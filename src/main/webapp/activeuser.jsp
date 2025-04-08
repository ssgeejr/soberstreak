<%@ page import="com.north.soberstreak.UserLogin" %>
<%@ page import="com.north.soberstreak.ActiveUserItem" %>
<%@ page import="com.north.soberstreak.Milestone" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Welcome to Sober Streak</title>
     <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    // Retrieve the username and password from the request
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    // Attempt to validate the user
    ActiveUserItem activeUser = null;
    try {
        out.println("LOGIN CREDS: " + username + " ** " + password);
        activeUser = UserLogin.validateUser(username, password);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }

    if (activeUser != null) {
%>
<div class="container">
     <h1>Welcome, <%= activeUser.getName() %>!</h1>
    <p>You have <%= activeUser.getDaysSober() %> days sober and have saved <%= activeUser.getAmountSaved() %>.</p>

    <h2>Your Milestones:</h2>
    <ul class="milestones">
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
</div>

</body>
</html>
