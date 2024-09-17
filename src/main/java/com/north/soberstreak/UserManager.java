package com.north.soberstreak;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserManager {

    /**
     * Checks if a username or email already exists in the database.
     * @param username the username to check.
     * @param email the email to check.
     * @return true if either the username or email exists, false otherwise.
     * @throws SQLException if any database errors occur.
     */
    public boolean isUserExists(String username, String email) throws SQLException {
        try (Connection connection = DatabaseUtil.getConnection()) {
            String checkQuery = "SELECT COUNT(*) FROM users WHERE username = ? OR email = ?";
            try (PreparedStatement checkStmt = connection.prepareStatement(checkQuery)) {
                checkStmt.setString(1, username);
                checkStmt.setString(2, email);
                try (ResultSet rs = checkStmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt(1) > 0; // Returns true if a match is found
                    }
                }
            }
        }
        return false;
    }

    /**
     * Creates a new user by inserting the user's details into the database.
     * @param username the username.
     * @param name the user's name.
     * @param password the password.
     * @param email the email.
     * @throws SQLException if any database errors occur.
     */
    public void createUser(String username, String name, String password, String email) throws SQLException {
        try (Connection connection = DatabaseUtil.getConnection()) {
            String insertQuery = "INSERT INTO users (username, name, password, email, sobriety_date, amount_per_day, validated) "
                               + "VALUES (?, ?, MD5(?), ?, CURDATE(), 0, 1)";
            try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
                insertStmt.setString(1, username);
                insertStmt.setString(2, name);
                insertStmt.setString(3, password); // MD5 hash for password
                insertStmt.setString(4, email);
                insertStmt.executeUpdate();
            }
        }
    }
}
