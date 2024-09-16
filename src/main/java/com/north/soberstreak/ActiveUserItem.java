package com.north.soberstreak;

import java.util.List;

public class ActiveUserItem {
    private String username;
    private String name;
    private String soberDate;
    private int daysSober;
    private double amountSaved;
    private List<Milestone> milestones;

    // Constructor
    public ActiveUserItem(String username, String name, String sDate, int daysSober, double amountSaved, List<Milestone> milestones) {
        this.username = username;
        this.name = name;
        this.soberDate = sDate;
        this.daysSober = daysSober;
        this.amountSaved = amountSaved;
        this.milestones = milestones;
    }

    // Getters
    public String getUsername() {
        return username;
    }
    
    public String getSobrietyDate() {
        return soberDate;
    }
    public String getName() {
        return name;
    }

    public int getDaysSober() {
        return daysSober;
    }

    public double getAmountSaved() {
        return amountSaved;
    }

    public List<Milestone> getMilestones() {
        return milestones;
    }
}
