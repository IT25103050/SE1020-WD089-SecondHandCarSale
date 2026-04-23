package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateCarServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class UpdateCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("car_id"));
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        double price = Double.parseDouble(request.getParameter("price"));
        int mileage = Integer.parseInt(request.getParameter("mileage"));
        String status = request.getParameter("status");

        // Handle Image Upload
        Part filePart = request.getPart("car_image");
        String fileName = (filePart != null) ? filePart.getSubmittedFileName() : "";
        String imagePath = null;

        if (fileName != null && !fileName.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            filePart.write(uploadPath + File.separator + fileName);
            imagePath = "images/" + fileName;
        }

        try (Connection conn = DBConnection.getConnection()) {
            String sql;
            PreparedStatement ps;

            if (imagePath != null) {
                // Update everything INCLUDING the image
                sql = "UPDATE cars SET brand=?, model=?, price=?, mileage=?, listing_status=?, image_url=? WHERE car_id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, brand);
                ps.setString(2, model);
                ps.setDouble(3, price);
                ps.setInt(4, mileage);
                ps.setString(5, status);
                ps.setString(6, imagePath);
                ps.setInt(7, id);
            } else {
                // Update everything EXCEPT the image (keep the old one)
                sql = "UPDATE cars SET brand=?, model=?, price=?, mileage=?, listing_status=? WHERE car_id=?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, brand);
                ps.setString(2, model);
                ps.setDouble(3, price);
                ps.setInt(4, mileage);
                ps.setString(5, status);
                ps.setInt(6, id);
            }

            ps.executeUpdate();
            response.sendRedirect("SearchServlet?brand=&msg=updated");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}