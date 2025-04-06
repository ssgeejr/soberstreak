package com.north.soberstreak;

import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

public class ActiveUserItem {
    private String username;
    private String name;
    private String soberDate;
    private int daysSober;
    private String amountSaved;
    private List<Milestone> milestones;

    // Constructor
    public ActiveUserItem(String username, String name, String sDate, int daysSober, double rawAmountSaved, List<Milestone> milestones) {
        this.username = username;
        this.name = name;
        this.soberDate = sDate;
        this.daysSober = daysSober;
        this.amountSaved = formatAmountToDollars(rawAmountSaved);
        this.milestones = milestones;
    }

    private String formatAmountToDollars(double amount) {
        NumberFormat formatter = NumberFormat.getCurrencyInstance(Locale.US);  // Format for US currency
        return formatter.format(amount);  // Returns amount in the format "$XX.XX"
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

    public String getAmountSaved() {
        return amountSaved;
    }

    public List<Milestone> getMilestones() {
        return milestones;
    }
}
