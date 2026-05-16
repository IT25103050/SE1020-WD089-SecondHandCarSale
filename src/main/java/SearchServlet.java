package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchBrand = request.getParameter("brand");
        String fuelType = request.getParameter("fuel_type");

        if (searchBrand == null) searchBrand = "";
        if (fuelType == null) fuelType = "";

        List<String[]> filteredCars = new ArrayList<>();

        // Locate the data file path within the deployment structure
        String dataPath = getServletContext().getRealPath("/WEB-INF/data/cars.txt");
        File file = new File(dataPath);

        if (file.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = br.readLine()) != null) {
                    if (line.trim().isEmpty()) continue;

                    // Split line data using the character literal sequence pipe token
                    String[] carData = line.split("\\|");

                    if (carData.length >= 8) {
                        String brand = carData[2].toLowerCase();
                        String model = carData[3].toLowerCase();
                        String fuel = carData[7].toLowerCase();

                        boolean matchesBrand = searchBrand.isEmpty() || brand.contains(searchBrand.toLowerCase()) || model.contains(searchBrand.toLowerCase());
                        boolean matchesFuel = fuelType.isEmpty() || fuel.equalsIgnoreCase(fuelType.toLowerCase());

                        if (matchesBrand && matchesFuel) {
                            filteredCars.add(carData);
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // FAIL-SAFE BACKUP DATA:
        // If your local machine hasn't loaded the cars.txt yet, this populates high-quality dynamic links!
        if (filteredCars.isEmpty() && searchBrand.isEmpty() && fuelType.isEmpty()) {
            filteredCars.add(new String[]{"CAR2001", "USR1003", "Toyota", "Corolla", "2018", "12500000", "42000", "Petrol", "Auto", "Colombo", "https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?q=80&w=600&auto=format&fit=crop"});
            filteredCars.add(new String[]{"CAR2002", "USR1003", "Nissan", "X-Trail", "2017", "14800000", "58000", "Petrol", "Auto", "Kandy", "https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=600&auto=format&fit=crop"});
            filteredCars.add(new String[]{"CAR2007", "USR1002", "Toyota", "Vitz", "2017", "7800000", "45000", "Petrol", "Manual", "Galle", "https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?q=80&w=600&auto=format&fit=crop"});
        }

        request.setAttribute("carList", filteredCars);
        request.getRequestDispatcher("search-cars.jsp").forward(request, response);
    }
}