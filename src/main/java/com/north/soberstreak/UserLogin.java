package com.north.soberstreak;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class UserLogin {

    private static DataSource dataSource;

    // Initialize the data source using JNDI lookup
    static {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/soberstreakdc");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    // Method to validate credentials and return an ActiveUserItem object
    public static ActiveUserItem validateUser(String username, String password) throws SQLException {
        // Obtain a connection from the data source
        try (Connection connection = dataSource.getConnection()) {

            // Query to check if the user exists with the provided username and password
            /*
            String query = "SELECT name, sobriety_date, amount_per_day FROM users WHERE username = ? AND password = MD5(?) AND validated = 1";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
             */

            ResultSet rs = stmt.executeQuery();

            // If user is found, proceed to calculate sobriety stats
            if (rs.next()) {
                String name = rs.getString("name");
                LocalDate sobrietyDate = rs.getDate("sobriety_date").toLocalDate();
                double amountPerDay = rs.getDouble("amount_per_day");

                // Calculate days sober
                LocalDate today = LocalDate.now();
                long daysSober = ChronoUnit.DAYS.between(sobrietyDate, today);

                // Calculate amount saved
                double amountSaved = amountPerDay * daysSober;

                // Fetch milestones
                List<Milestone> milestones = fetchMilestones(connection);

                // Return ActiveUserItem object with user data
                return new ActiveUserItem(username, name, daysSober, amountSaved, milestones);
            }

            // If no valid user is found, return null
            return null;
        }
    }

    // Method to fetch milestones from the database
    private static List<Milestone> fetchMilestones(Connection connection) throws SQLException {
        String query = "SELECT milestone_days, milestone_message, image_url FROM milestones ORDER BY milestone_days ASC";
        PreparedStatement stmt = connection.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        List<Milestone> milestones = new ArrayList<>();
        while (rs.next()) {
            int milestoneDays = rs.getInt("milestone_days");
            String milestoneMessage = rs.getString("milestone_message");
            String imageUrl = rs.getString("image_url");
            milestones.add(new Milestone(milestoneDays, milestoneMessage, imageUrl));
        }
        return milestones;
    }
}
