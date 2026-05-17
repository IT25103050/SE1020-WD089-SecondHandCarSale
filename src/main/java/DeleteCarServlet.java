package main.java;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String carId = request.getParameter("id");
        String dataPath = getServletContext().getRealPath("/WEB-INF/data/cars.txt");
        File file = new File(dataPath);
        List<String> lines = new ArrayList<>();

        if (file.exists()) {
            try (BufferedReader br = new BufferedReader(new FileReader(file))) {
                String line;
                while ((line = br.readLine()) != null) {
                    String[] data = line.split("\\|");
                    // Keep the line ONLY if it doesn't match the ID we want to delete
                    if (data.length >= 8 && data[0].equals(carId)) {
                        continue;
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
}