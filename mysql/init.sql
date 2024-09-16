SET GLOBAL time_zone = 'America/Chicago';

USE soberstreak;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    validated TINYINT(1) NOT NULL DEFAULT 0,
    username VARCHAR(32) NOT NULL,
    password VARCHAR(255) NOT NULL,
    sobriety_date DATE NOT NULL,
    amount_per_day DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE milestones (
    milestone_id INT AUTO_INCREMENT PRIMARY KEY,
    milestone_days INT NOT NULL,
    milestone_message VARCHAR(255) NOT NULL,
    image_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


INSERT INTO milestones (milestone_days, milestone_message, image_url) VALUES
(1, "Congratulations on 24 hours sober! The first day is the hardest.", "https://example.com/images/24_hours.png"),
(3, "You've made it 3 days! Keep going!", "https://example.com/images/3_days.png"),
(7, "One week sober! You're making great progress!", "https://example.com/images/1_week.png"),
(10, "Double digits! 10 days sober and counting.", "https://example.com/images/10_days.png"),
(14, "Two weeks sober! Keep up the great work.", "https://example.com/images/2_weeks.png"),
(21, "Three weeks down! You're stronger than ever.", "https://example.com/images/3_weeks.png"),
(30, "One month sober! You're building momentum!", "https://example.com/images/1_month.png"),
(45, "45 days sober! You're making incredible strides.", "https://example.com/images/45_days.png"),
(60, "Two months sober! You're doing amazing.", "https://example.com/images/2_months.png"),
(90, "90 days sober! Three months of strength and determination.", "https://example.com/images/3_months.png"),
(100, "100 days sober! You've hit a major milestone!", "https://example.com/images/100_days.png"),
(120, "4 months sober! Stay the course, great things are happening.", "https://example.com/images/4_months.png"),
(150, "5 months sober! Your journey is inspiring.", "https://example.com/images/5_months.png"),
(180, "Half a year sober! 6 months of resilience.", "https://example.com/images/6_months.png"),
(270, "9 months sober! You're approaching one year.", "https://example.com/images/9_months.png"),
(365, "One year sober! You've reached an incredible achievement.", "https://example.com/images/1_year.png"),
(540, "18 months sober! Your journey continues to inspire.", "https://example.com/images/18_months.png"),
(730, "Two years sober! You're proof of what's possible.", "https://example.com/images/2_years.png"),
(1095, "Three years sober! A long-term commitment to a new life.", "https://example.com/images/3_years.png"),
(1460, "Four years sober! Your strength continues to grow.", "https://example.com/images/4_years.png"),
(1825, "Five years sober! Half a decade of strength.", "https://example.com/images/5_years.png"),
(2190, "Six years sober! Your journey is incredible.", "https://example.com/images/6_years.png"),
(2555, "Seven years sober! Resilience at its finest.", "https://example.com/images/7_years.png"),
(2920, "Eight years sober! Keep going strong.", "https://example.com/images/8_years.png"),
(3285, "Nine years sober! You're an inspiration to many.", "https://example.com/images/9_years.png"),
(3650, "Ten years sober! A decade of change and perseverance.", "https://example.com/images/10_years.png"),
(4015, "Eleven years sober! You've come so far.", "https://example.com/images/11_years.png"),
(4380, "Twelve years sober! Keep pushing forward.", "https://example.com/images/12_years.png"),
(4745, "Thirteen years sober! An amazing accomplishment.", "https://example.com/images/13_years.png"),
(5110, "Fourteen years sober! Your strength knows no bounds.", "https://example.com/images/14_years.png"),
(5475, "Fifteen years sober! An incredible journey of resilience.", "https://example.com/images/15_years.png"),
(5840, "Sixteen years sober! A milestone of perseverance.", "https://example.com/images/16_years.png"),
(6205, "Seventeen years sober! Keep inspiring others.", "https://example.com/images/17_years.png"),
(6570, "Eighteen years sober! A major life transformation.", "https://example.com/images/18_years.png"),
(6935, "Nineteen years sober! Nearly two decades of strength.", "https://example.com/images/19_years.png"),
(7300, "Twenty years sober! Two decades of positive transformation.", "https://example.com/images/20_years.png"),
(7665, "Twenty-one years sober! A long-lasting achievement.", "https://example.com/images/21_years.png"),
(8030, "Twenty-two years sober! You're a role model of perseverance.", "https://example.com/images/22_years.png"),
(8395, "Twenty-three years sober! Keep shining bright.", "https://example.com/images/23_years.png"),
(8760, "Twenty-four years sober! An incredible journey continues.", "https://example.com/images/24_years.png"),
(9125, "Twenty-five years sober! You've reached a quarter-century of sobriety.", "https://example.com/images/25_years.png"),
(9490, "Twenty-six years sober! Strength, endurance, and transformation.", "https://example.com/images/26_years.png"),
(9855, "Twenty-seven years sober! A lasting commitment to a better life.", "https://example.com/images/27_years.png"),
(10220, "Twenty-eight years sober! Your journey inspires many.", "https://example.com/images/28_years.png"),
(10585, "Twenty-nine years sober! You’ve come so far.", "https://example.com/images/29_years.png"),
(10950, "Thirty years sober! Three decades of dedication and strength.", "https://example.com/images/30_years.png");





