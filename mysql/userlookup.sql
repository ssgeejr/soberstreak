
SELECT 
    u.username,
    u.sobriety_date,
    DATEDIFF(CURDATE(), u.sobriety_date) AS days_sober,
    m.milestone_message,
    m.milestone_days,
    m.image_url as mimg,
    (DATEDIFF(CURDATE(), u.sobriety_date) * u.amount_per_day) AS money_saved
FROM 
    users u
JOIN 
    milestones m
ON 
    DATEDIFF(CURDATE(), u.sobriety_date) >= m.milestone_days
	where u.username = 'kalekimo'
	and u.password = MD5('mypassword')
ORDER BY 
    u.name, m.milestone_days;
    
