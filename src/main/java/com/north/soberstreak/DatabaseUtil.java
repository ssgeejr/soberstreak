package com.north.soberstreak;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseUtil {

    private static DataSource dataSource;

    static {
        try {
            // Initialize JNDI context to retrieve the DataSource
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/soberstreakdc");
        } catch (NamingException e) {
            e.printStackTrace();  // Log the exception as needed
            throw new ExceptionInInitializerError("DataSource initialization failed: " + e.getMessage());
        }
    }

    /**
     * Retrieves a connection from the DataSource.
     *
     * @return Connection object
     * @throws SQLException if a database access error occurs
     */
    public static Connection getConnection() throws SQLException {
        if (dataSource != null) {
            return dataSource.getConnection();
        } else {
            throw new SQLException("DataSource not initialized.");
        }
    }
}
