// backend/src/main/java/com/schoollms/util/DBConnection.java
package com.schoollms.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    // Use environment variables for cloud deployment
    private static final String URL = System.getenv("DB_URL") != null ? 
        System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/schoollms";
    private static final String USER = System.getenv("DB_USER") != null ? 
        System.getenv("DB_USER") : "root";
    private static final String PASSWORD = System.getenv("DB_PASSWORD") != null ? 
        System.getenv("DB_PASSWORD") : "";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}