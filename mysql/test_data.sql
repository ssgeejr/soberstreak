INSERT INTO users (name, sobriety_date, amount_per_day, password)
VALUES ('Kale Kimo', '2016-06-22', 22.00, MD5('password123'));


SELECT 
    u.name,
    u.sobriety_date,
    DATEDIFF(CURDATE(), u.sobriety_date) AS days_sober,
    m.milestone_message,
    m.milestone_days,
    (DATEDIFF(CURDATE(), u.sobriety_date) * u.amount_per_day) AS money_saved
FROM 
    users u
JOIN 
    milestones m
ON 
    DATEDIFF(CURDATE(), u.sobriety_date) >= m.milestone_days
ORDER BY 
    u.name, m.milestone_days;
	
	
	
SELECT *
FROM users
WHERE username = 'provided_username'
  AND password = MD5('provided_password')
  AND validated = 1;
