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
    /*
    static {
        try {
            Context initContext = new InitialContext();
            Context envContext = (Context) initContext.lookup("java:/comp/env");
            dataSource = (DataSource) envContext.lookup("jdbc/soberstreakdc");
            
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	*/
    public UserLogin(){
    	
    }


    // Method to validate credentials and return an ActiveUserItem object
    public static ActiveUserItem validateUser(String username, String password) throws Exception {
        // Obtain a connection from the data source
       Context initContext = new InitialContext();
       Context envContext = (Context) initContext.lookup("java:/comp/env");
       dataSource = (DataSource) envContext.lookup("jdbc/soberstreakdc");

       
//       System.out.println("--------- ActiveUserItem ----------------");
       try (Connection connection = dataSource.getConnection()) {

            // Query to check if the user exists with the provided username and password
            
            String query = "SELECT"
            	    +" u.username as uname,"
            	    +" u.sobriety_date as sdate,"
            	    +" DATEDIFF(CURDATE(), u.sobriety_date) AS days_sober,"
            	    +" m.milestone_message as mmsg,"
            	    +" m.milestone_days as mdays,"
            	    +" m.image_url as mimg,"
            	    +" (DATEDIFF(CURDATE(), u.sobriety_date) * u.amount_per_day) AS money_saved"
            	    +" FROM "
            	    +" users u"
            	    +" JOIN "
            	    +" milestones m"
            	    +" ON "
            	    +" DATEDIFF(CURDATE(), u.sobriety_date) >= m.milestone_days"
            	    +" where u.username = ?"
            	    +" and u.password = MD5(?)"
            	    +" ORDER BY "
            	    +" u.name, m.milestone_days";
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            stmt.setString(2, password);
             

            ResultSet rs = stmt.executeQuery();

            // If user is found, proceed to calculate sobriety stats
            if (rs.next()) {
            	List<Milestone> milestones = new ArrayList<>();
                String name = rs.getString("uname");
                String sobrietyDate = rs.getString("sdate");
                double amountSaved = rs.getDouble("money_saved");
                int daysSober =  rs.getInt("days_sober");
                milestones.add(new Milestone(rs.getInt("mdays"), rs.getString("mmsg"), rs.getString("mimg")));
                while (rs.next()) {
                	milestones.add(new Milestone(rs.getInt("mdays"), rs.getString("mmsg"), rs.getString("mimg")));  
                }
               
//                return new ActiveUserItem("", "", "", 1, 1.1, milestones);
                return new ActiveUserItem(username, name, sobrietyDate, daysSober, amountSaved, milestones);
            }

            // If no valid user is found, return null
            return null;
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    // Method to fetch milestones from the database
//    private static List<Milestone> fetchMilestones(Connection connection, int soberdays) throws SQLException {
//        String query = "SELECT milestone_days, milestone_message, image_url FROM milestones where milestone_days <= ? ORDER BY milestone_days ASC";
//        PreparedStatement pstmt = connection.prepareStatement(query);
//        pstmt.setInt(1,soberdays);
//        ResultSet rs = pstmt.executeQuery();
//
//        List<Milestone> milestones = new ArrayList<>();
//        while (rs.next()) {
//            int milestoneDays = rs.getInt("milestone_days");
//            String milestoneMessage = rs.getString("milestone_message");
//            String imageUrl = rs.getString("image_url");
//            milestones.add(new Milestone(milestoneDays, milestoneMessage, imageUrl));
//        }
//        return milestones;
//    }
//

}
