package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:oracle:thin:@localhost:1521/xepdb1";

    private static final String USER = "system";

    private static final String PASSWORD = "root";

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
 
    }

public static void main(String[] args) {
    Connection con = getConnection();

    if (con != null) {
        System.out.println("SUCCESS: Oracle Database is connected!");
    } else {
        System.out.println("FAILED: Database connection failed.");
    }
  }
}