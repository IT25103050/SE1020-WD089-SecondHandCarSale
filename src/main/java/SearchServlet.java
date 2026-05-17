package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchBrand = request.getParameter("brand");
        String fuelType = request.getParameter("fuel_type");
        String minPriceParam = request.getParameter("min_price");
        String maxPriceParam = request.getParameter("max_price");

        if (searchBrand == null) searchBrand = "";
        if (fuelType == null) fuelType = "";

        double minPrice = 0;
        double maxPrice = Double.MAX_VALUE;

        try {
            if (minPriceParam != null && !minPriceParam.isEmpty()) {
                minPrice = Double.parseDouble(minPriceParam);
            }
            if (maxPriceParam != null && !maxPriceParam.isEmpty()) {
                maxPrice = Double.parseDouble(maxPriceParam);
            }
        } catch (NumberFormatException e) {
            // Keep defaults if parsing fails
        }

        List<String[]> filteredCars = new ArrayList<>();

        String dataDir = getServletContext().getRealPath("/WEB-INF/data");
        File dir = new File(dataDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        File file = new File(dir, "cars.txt");

        // Seed with three unique, distinct high-quality car image URLs
        if (!file.exists() || file.length() == 0) {
            try (PrintWriter writer = new PrintWriter(new FileWriter(file))) {
                writer.println("CAR2001|USR1003|Toyota|Corolla|2018|12500000|42000|Petrol|Auto|Colombo|Used|Single owner.|https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?q=80&w=600&auto=format&fit=crop|AVAILABLE|APPROVED|2026-05-17");
                writer.println("CAR2002|USR1003|Nissan|X-Trail|2017|14800000|58000|Petrol|Auto|Kandy|Used|Spacious SUV.|https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?q=80&w=600&auto=format&fit=crop|AVAILABLE|APPROVED|2026-05-17");
                writer.println("CAR2007|USR1002|Toyota|Vitz|2017|7800000|45000|Petrol|Manual|Galle|Used|Fuel efficient.|https://images.unsplash.com/photo-1541899481282-d53bffe3c35d?q=80&w=600&auto=format&fit=crop|AVAILABLE|APPROVED|2026-05-17");
            }
        }

        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] carData = line.split("\\|");

                if (carData.length >= 8) {
                    String brand = carData[2].toLowerCase();
                    String model = carData[3].toLowerCase();
                    String fuel = carData[7].toLowerCase();

                    double price = 0;
                    try {
                        price = Double.parseDouble(carData[5]);
                    } catch (Exception e) {}

                    boolean matchesBrand = searchBrand.isEmpty() || brand.contains(searchBrand.toLowerCase()) || model.contains(searchBrand.toLowerCase());
                    boolean matchesFuel = fuelType.isEmpty() || fuel.equalsIgnoreCase(fuelType.toLowerCase());
                    boolean matchesPrice = price >= minPrice && price <= maxPrice;

                    if (matchesBrand && matchesFuel && matchesPrice) {
                        filteredCars.add(carData);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("carList", filteredCars);
        request.getRequestDispatcher("search-cars.jsp").forward(request, response);
    }
}