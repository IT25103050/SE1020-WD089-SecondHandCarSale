package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/AddCarServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddCarServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 1. Get Text Data
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        int year = Integer.parseInt(request.getParameter("year"));
        double price = Double.parseDouble(request.getParameter("price"));
        int mileage = Integer.parseInt(request.getParameter("mileage"));
        String fuel = request.getParameter("fuel_type");

        // 2. Handle the Image File
        Part filePart = request.getPart("car_image");
        String fileName = filePart.getSubmittedFileName();

        // Define where to save the image on your computer
        String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir(); // Create 'images' folder if missing

        // Save the actual file to the folder
        filePart.write(uploadPath + File.separator + fileName);
        String dbImagePath = "images/" + fileName; // This is the path for the DB

        try (Connection conn = DBConnection.getConnection()) {
            // 3. Save to DB (Including the image_url)
            String sql = "INSERT INTO cars (brand, model, manufacture_year, price, mileage, fuel_type, image_url) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, brand);
            ps.setString(2, model);
            ps.setInt(3, year);
            ps.setDouble(4, price);
            ps.setInt(5, mileage);
            ps.setString(6, fuel);
            ps.setString(7, dbImagePath);

            ps.executeUpdate();
            response.sendRedirect("SearchServlet?brand=&msg=added");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}