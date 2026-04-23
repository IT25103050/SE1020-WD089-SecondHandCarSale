package main.java;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() {
        try {
            // Add this line to manually load the driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Change 'your_db_name' to your actual database name
            String url = "jdbc:mysql://localhost:3306/car_marketplace";
            String user = "root";
            String password = "Root123"; // Usually empty for XAMPP/Local
            return DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}