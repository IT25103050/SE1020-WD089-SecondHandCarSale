package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UpdateCarServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50
)
public class UpdateCarServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carId = request.getParameter("id");
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        String mileage = request.getParameter("mileage");
        String fuel = request.getParameter("fuel");
        String finalImg = request.getParameter("existing_image");

        try {
            // Check if user selected a new replacement picture file from device
            Part part = request.getPart("new_car_image");
            if (part != null && part.getSize() > 0) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploaded-images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String fileName = System.currentTimeMillis() + "_" + getFileName(part);
                part.write(uploadPath + File.separator + fileName);
                finalImg = "uploaded-images/" + fileName; // Set new path
            }
        } catch (Exception e) {
            // Fallback to old image if file reading encounters issues
        }

        String dataPath = getServletContext().getRealPath("/WEB-INF/data/cars.txt");
        File file = new File(dataPath);
        List<String> lines = new ArrayList<>();

        if (file.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = br.readLine()) != null) {
                    String[] data = line.split("\\|");
                    if (data.length >= 8 && data[0].equals(carId)) {
                        line = String.format("%s|USR1009|%s|%s|%s|%s|%s|%s|Auto|Colombo|Used|Good|%s|AVAILABLE|APPROVED|2026-05-17",
                                carId, brand, model, year, price, mileage, fuel, finalImg);
                    }
                    lines.add(line);
                }
            } catch (Exception e) {}

            try (PrintWriter out = new PrintWriter(new FileWriter(file))) {
                for (String l : lines) {
                    out.println(l);
                }
            } catch (Exception e) {}
        }
        response.sendRedirect("SearchServlet");
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