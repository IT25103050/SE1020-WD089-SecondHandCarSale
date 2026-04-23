package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Get the ID of the car we want to delete from the URL
        String idStr = request.getParameter("id");

        if (idStr != null) {
            try {
                Connection conn = DBConnection.getConnection();
                if (conn != null) {
                    // 2. SQL to remove the car
                    String sql = "DELETE FROM cars WHERE car_id = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);
                    ps.setInt(1, Integer.parseInt(idStr));

                    ps.executeUpdate();
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 3. After deleting, send the user back to the search page automatically
        response.sendRedirect("SearchServlet?brand=");
    }
}