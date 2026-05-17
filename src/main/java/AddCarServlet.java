package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet("/AddCarServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AddCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String brand = request.getParameter("brand");
            String model = request.getParameter("model");
            String year = request.getParameter("year");
            String price = request.getParameter("price");
            String mileage = request.getParameter("mileage");
            String fuel = request.getParameter("fuel_type");

            // 1. Target local server storage path
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploaded-images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // 2. Extract uploaded image from your device form stream
            Part part = request.getPart("car_image");
            String fileName = System.currentTimeMillis() + "_" + getFileName(part);
            String fullSavePath = uploadPath + File.separator + fileName;
            part.write(fullSavePath);

            // 3. Form dynamic URL reference route
            String imageUrl = "uploaded-images/" + fileName;

            // Generate row array matching system criteria layout string indexes
            String carId = "CAR" + String.valueOf(System.currentTimeMillis()).substring(8);
            String carRecord = String.format("%s|USR1009|%s|%s|%s|%s|%s|%s|Auto|Colombo|Used|Good|%s|AVAILABLE|APPROVED|2026-05-17",
                    carId, brand, model, year, price, mileage, fuel, imageUrl);

            String dataPath = getServletContext().getRealPath("/WEB-INF/data/cars.txt");
            File file = new File(dataPath);

            try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(file, true)))) {
                out.println(carRecord);
            }
            response.sendRedirect("SearchServlet");
        } catch (Exception e) {
            response.getWriter().println("File upload error exception occurred: " + e.getMessage());
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "car.jpg";
    }
}