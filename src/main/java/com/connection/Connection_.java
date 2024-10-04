package com.connection;

import java.sql.*;

public class Connection_ {

    public static Connection getc() {

        Connection connection = null;

        // PostgreSQL connection details
        String url = "jdbc:postgresql://dpg-crrub7lds78s73dtre4g-a.singapore-postgres.render.com/asmdb"; // Render PostgreSQL URL
        String username = "asmdb_user"; // Your PostgreSQL username
        String password = "1aaLi8ZrGIcunYIcVuF6zhAH4bMGEkGJ"; // Your PostgreSQL password

        try {
            
        	try {
        	    Class.forName("org.postgresql.Driver");
        	} catch (ClassNotFoundException e) {
        	    System.err.println("PostgreSQL JDBC Driver not found. Include in your library path.");
        	    e.printStackTrace();
        	}

        	
            // 2. Get the connection to PostgreSQL
            connection = DriverManager.getConnection(url, username, password);

            // 3. Pass success message
            System.out.println("DB connected to PostgreSQL");
        } catch (Exception e) {
            System.out.println(e);
        }

        return connection;
    }

    public static void check() {

        Connection c = getc();
        try {
            c.close();
            System.out.println("Connection closed");
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public static void main(String[] args) {
        // Uncomment to check the connection
         //check();
    }
}
