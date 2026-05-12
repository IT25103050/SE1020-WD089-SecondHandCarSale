package com.carplatform.servlet;

import com.carplatform.dao.AdminCarDAO;
import com.carplatform.model.AdminCarRecord;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/pending-cars")
public class PendingCarsServlet extends HttpServlet {
    private AdminCarDAO adminCarDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminCarDAO = new AdminCarDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminCarRecord> pendingCars = adminCarDAO.getPendingCars();
        request.setAttribute("pendingCars", pendingCars);
        request.getRequestDispatcher("/pending-cars.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String carId = request.getParameter("carId");

        if (action != null && carId != null) {
            if ("approve".equals(action)) {
                adminCarDAO.approveCar(carId);
            } else if ("reject".equals(action)) {
                adminCarDAO.rejectCar(carId);
            }
        }
        response.sendRedirect(request.getContextPath() + "/pending-cars");
    }
}
