package com.webapp.parking.action;

import com.webapp.parking.db.DB;
import com.webapp.parking.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            // Establish the connection
            Connection con = DB.getCon();

            // Handle different actions
            if ("view".equals(action)) {
                viewUsers(request, response, con);
            } else if ("delete".equals(action)) {
                deleteUser(request, response, con);
            } else {
                viewUsers(request, response, con);  // Default view users
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error");
        }
    }

    private void viewUsers(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, ServletException, IOException {
        String query = "SELECT * FROM Users";
        PreparedStatement stmt = con.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        List<User> userList = new ArrayList<>();

        // Log the SQL query being executed for better debugging
        System.out.println("Executing query: " + query);

        // Iterate over the result set and populate the list of users
        while (rs.next()) {
            int userId = rs.getInt("user_id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String role = rs.getString("role");
            String status = rs.getString("status");

            // Log each user's details for debugging
            System.out.println("User fetched - ID: " + userId + ", Name: " + name + ", Email: " + email + ", Role: " + role + ", Status: " + status);

            // Create a new User object using the constructor with parameters
            User user = new User(userId, name, email, role, status);
            userList.add(user);
        }

        // Log the size of the user list
        System.out.println("Total users fetched: " + userList.size());

        // Log the content of the list
        System.out.println("The users list: " + userList);

        // Set users as a request attribute to be accessed in the JSP
        request.setAttribute("userList", userList);

        // Forward the request to users.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/users.jsp");
        dispatcher.forward(request, response);
    }


    private void deleteUser(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException {
        String userId = request.getParameter("user_id");

        if (userId != null) {
            String query = "DELETE FROM Users WHERE user_id = ?";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, Integer.parseInt(userId));

            int result = stmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("user?action=view");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete user");
            }
        }
    }

    // Handle POST requests (create and update user)
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            // Establish the connection
            Connection con = DB.getCon();

            if ("create".equals(action)) {
                createUser(request, response, con);
            } else if ("update".equals(action)) {
                updateUser(request, response, con);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database connection error");
        }
    }

    private void createUser(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        String query = "INSERT INTO Users (name, email, phone_number, password, role, status) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = con.prepareStatement(query);

        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, phoneNumber);
        stmt.setString(4, password);
        stmt.setString(5, role);
        stmt.setString(6, status);

        int result = stmt.executeUpdate();
        if (result > 0) {
            response.sendRedirect("user?action=view");  // Redirect to view users
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create user");
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response, Connection con) throws SQLException, IOException {
        String userId = request.getParameter("user_id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String status = request.getParameter("status");

        String query = "UPDATE Users SET name = ?, email = ?, phone_number = ?, password = ?, role = ?, status = ? WHERE user_id = ?";
        PreparedStatement stmt = con.prepareStatement(query);

        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, phoneNumber);
        stmt.setString(4, password);
        stmt.setString(5, role);
        stmt.setString(6, status);
        stmt.setInt(7, Integer.parseInt(userId));

        int result = stmt.executeUpdate();
        if (result > 0) {
            response.sendRedirect("user?action=view");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update user");
        }
    }
}
