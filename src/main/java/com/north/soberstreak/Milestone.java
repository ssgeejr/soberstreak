package com.north.soberstreak;

public class Milestone {
    private int milestoneDays;
    private String milestoneMessage;
    private String imageUrl;

    public Milestone(int milestoneDays, String milestoneMessage, String imageUrl) {
        this.milestoneDays = milestoneDays;
        this.milestoneMessage = milestoneMessage;
        this.imageUrl = imageUrl;
    }

    public int getMilestoneDays() {
        return milestoneDays;
    }

    public String getMilestoneMessage() {
        return milestoneMessage;
    }

    public String getImageUrl() {
        return imageUrl;
    }
}
