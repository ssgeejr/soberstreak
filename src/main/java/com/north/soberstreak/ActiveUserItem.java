package com.north.soberstreak;

import java.util.List;

public class ActiveUserItem {
    private String username;
    private String name;
    private long daysSober;
    private double amountSaved;
    private List<Milestone> milestones;

    // Constructor
    public ActiveUserItem(String username, String name, long daysSober, double amountSaved, List<Milestone> milestones) {
        this.username = username;
        this.name = name;
        this.daysSober = daysSober;
        this.amountSaved = amountSaved;
        this.milestones = milestones;
    }

    // Getters
    public String getUsername() {
        return username;
    }

    public String getName() {
        return name;
    }

    public long getDaysSober() {
        return daysSober;
    }

    public double getAmountSaved() {
        return amountSaved;
    }

    public List<Milestone> getMilestones() {
        return milestones;
    }
}
