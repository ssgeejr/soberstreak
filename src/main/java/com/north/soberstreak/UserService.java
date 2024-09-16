package com.north.soberstreak;

import org.mindrot.jbcrypt.BCrypt;
import java.util.*;

public class UserService {
    public UserService(){
        try{
//        	UserLogin ulogin = new UserLogin();
//        	ActiveUserItem aui = ulogin.validateUser();
//        	System.out.println(aui.getUsername());
//        	System.out.println(aui.getDaysSober());
//        	List<Milestone> mlist = aui.getMilestones();
//        	for (Milestone milestone : mlist) {
//        	    System.out.println(milestone.getMilestoneMessage());  // Example operation
//        	}
        }catch(Exception ex){
            System.out.println(ex);
        }

    }
    // Method to hash a password before storing it
    public String hashPassword(String plainPassword) {
        // Generate the bcrypt hash with a default work factor of 10
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // Method to check if the provided password matches the stored hash
    public boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

    public static void main(String[] args) {
//        System.out.println(new UserService().hashPassword("password123"));
        new UserService();
    }
}

