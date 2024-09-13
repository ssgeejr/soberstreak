#Sober Streak

### Track your sobriety date and savings

<dependency>
    <groupId>org.mindrot</groupId>
    <artifactId>jbcrypt</artifactId>
    <version>0.4</version>
</dependency>

''#-------------------------------------------------------------------------------#
import org.mindrot.jbcrypt.BCrypt;

public class UserService {

    // Method to hash a password before storing it
    public String hashPassword(String plainPassword) {
        // Generate the bcrypt hash with a default work factor of 10
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt());
    }

    // Method to check if the provided password matches the stored hash
    public boolean checkPassword(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }
}

''#-------------------------------------------------------------------------------#
String hashedPassword = userService.hashPassword("password123");

String sql = "INSERT INTO users (username, email, password, sobriety_date, amount_per_day) VALUES (?, ?, ?, ?, ?)";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setString(1, "kale_kimo");
ps.setString(2, "kale@example.com");
ps.setString(3, hashedPassword);  // Store the bcrypt-hashed password
ps.setDate(4, java.sql.Date.valueOf("2016-06-22"));
ps.setBigDecimal(5, new BigDecimal("22.00"));

ps.executeUpdate();

''#-------------------------------------------------------------------------------#

String sql = "SELECT password FROM users WHERE username = ?";
PreparedStatement ps = connection.prepareStatement(sql);
ps.setString(1, "kale_kimo");

ResultSet rs = ps.executeQuery();
if (rs.next()) {
    String storedHashedPassword = rs.getString("password");

    // Check if the provided password matches the stored hashed password
    if (userService.checkPassword("password123", storedHashedPassword)) {
        System.out.println("Login successful");
    } else {
        System.out.println("Invalid password");
    }
} else {
    System.out.println("User not found");
}


