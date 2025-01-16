package com.webapp.parking.db;

import java.sql.*;

public class DB {
    static public Connection con = null;

    public static Connection getCon() throws SQLException, ClassNotFoundException
    {
        if (con == null) {
            Class.forName("com.mysql.cj.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/CarParkingSystem";
            String username = "root";
            String password = "";

            con = DriverManager.getConnection(url, username, password);
        }
        return con;
    }
}
