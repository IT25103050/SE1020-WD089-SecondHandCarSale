package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat; // Added this for clear prices

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String brand = request.getParameter("brand");
        String maxPrice = request.getParameter("max_price");
        String minYear = request.getParameter("min_year");

        // Tool to format numbers like 6,500,000 instead of 6.5E6
        DecimalFormat df = new DecimalFormat("#,###");

        try {
            Connection conn = DBConnection.getConnection();
            if (conn != null) {
                // SQL query that handles filters for brand, price, and year
                String sql = "SELECT * FROM cars WHERE brand LIKE ? AND price <= ? AND manufacture_year >= ?";
                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setString(1, (brand == null || brand.isEmpty()) ? "%%" : "%" + brand + "%");
                ps.setDouble(2, (maxPrice == null || maxPrice.isEmpty()) ? 999999999 : Double.parseDouble(maxPrice));
                ps.setInt(3, (minYear == null || minYear.isEmpty()) ? 0 : Integer.parseInt(minYear));

                ResultSet rs = ps.executeQuery();

                out.println("<!DOCTYPE html><html lang='en'><head>");
                out.println("<meta charset='UTF-8'><meta name='viewport' content='width=device-width, initial-scale=1.0'>");
                out.println("<title>Car Search Results</title>");
                out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css' rel='stylesheet'>");
                out.println("<style>.car-img-container { height: 200px; overflow: hidden; } .car-img { object-fit: cover; height: 100%; width: 100%; }</style>");
                out.println("</head><body class='bg-light'>");

                // Navbar
                out.println("<nav class='navbar navbar-expand-lg navbar-dark bg-dark'><div class='container-fluid'>");
                out.println("<a class='navbar-brand fw-bold text-primary' href='#'>AutoFleet Manager</a>");
                out.println("</div></nav>");

                // Main Container
                out.println("<div class='container my-5'>");
                out.println("<div class='d-flex justify-content-between align-items-center mb-4'>");
                out.println("  <div><h1 class='fw-bold'>Car Search Results</h1><p class='text-muted'>Filtered results for your inventory.</p></div>");
                out.println("  <a href='add-car.jsp' class='btn btn-primary'>+ Add New Car</a>");
                out.println("</div>");

                out.println("<div class='row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4'>");

                boolean found = false;
                while (rs.next()) {
                    found = true;
                    int id = rs.getInt("car_id");
                    String imagePath = rs.getString("image_path");

                    if (imagePath == null || imagePath.isEmpty()) {
                        imagePath = "images/default-car.jpg";
                    }

                    // Format the price here to remove the scientific notation
                    String formattedPrice = df.format(rs.getDouble("price"));

                    out.println("<div class='col'><div class='card h-100 shadow-sm'>");
                    out.println("<div class='car-img-container'><img src='" + imagePath + "' class='card-img-top car-img' alt='Car Image'></div>");
                    out.println("<div class='card-body'>");
                    out.println("<h5 class='card-title fw-bold'>" + rs.getString("brand") + " " + rs.getString("model") + "</h5>");
                    out.println("<p class='card-text text-muted mb-1'>" + rs.getInt("manufacture_year") + " • " + rs.getString("fuel_type") + "</p>");
                    out.println("<p class='text-primary fs-4 fw-bold mb-1'>LKR " + formattedPrice + "</p>");
                    out.println("<p class='card-text text-muted'>" + rs.getInt("mileage") + " km</p></div>");
                    out.println("<div class='card-footer d-flex gap-2'>");
                    out.println("<a href='edit-car.jsp?id=" + id + "' class='btn btn-outline-primary flex-fill'>Edit</a>");
                    out.println("<a href='DeleteCarServlet?id=" + id + "' class='btn btn-outline-danger flex-fill' onclick='return confirm(\"Delete this listing?\")'>Delete</a>");
                    out.println("</div></div></div>");
                }

                if (!found) {
                    out.println("<div class='col-12'><div class='alert alert-warning'>No cars found matching those criteria.</div></div>");
                }

                out.println("</div><div class='text-center mt-5'><a href='search-cars.jsp' class='btn btn-link'>← Back to Search</a></div>");
                out.println("</div><script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js'></script></body></html>");
                conn.close();
            }
        } catch (Exception e) {
            out.println("<div class='container mt-5 text-danger'>Error: " + e.getMessage() + "</div>");
        }
    }
}