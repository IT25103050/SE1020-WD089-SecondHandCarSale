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

@WebServlet("/manage-cars")
public class ManageCarsServlet extends HttpServlet {
    private AdminCarDAO adminCarDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminCarDAO = new AdminCarDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminCarRecord> cars = adminCarDAO.getAllCars();
        request.setAttribute("cars", cars);
        request.getRequestDispatcher("/manage-cars.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String carId = request.getParameter("carId");

        if (action != null && carId != null) {
            switch (action) {
                case "approve":
                    adminCarDAO.approveCar(carId);
                    break;
                case "reject":
                    adminCarDAO.rejectCar(carId);
                    break;
                case "delete":
                    adminCarDAO.deleteCar(carId);
                    break;
                case "markSold":
                    adminCarDAO.markCarAsSold(carId);
                    break;
            }
        }
        response.sendRedirect(request.getContextPath() + "/manage-cars");
    }
}
