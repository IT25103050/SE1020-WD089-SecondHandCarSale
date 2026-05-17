package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import com.carplatform.util.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CarController {

    private final CarDAO carDAO;
    private final UserDAO userDAO;
    private final ReviewDAO reviewDAO;
    private final String carDataPath;
    private final String uploadPath;

    public CarController(CarDAO carDAO, UserDAO userDAO, ReviewDAO reviewDAO, ServletContext servletContext) {
        this.carDAO = carDAO;
        this.userDAO = userDAO;
        this.reviewDAO = reviewDAO;
        
        String dataPath = servletContext.getRealPath("/WEB-INF/data/cars.txt");
        if (dataPath == null) {
            System.err.println("[CarController] WARNING: getRealPath for cars.txt returned null. Using fallback.");
            dataPath = "src/main/webapp/WEB-INF/data/cars.txt";
        }
        this.carDataPath = dataPath;

        String upPath = servletContext.getRealPath("/uploads");
        if (upPath == null) {
            System.err.println("[CarController] WARNING: getRealPath for uploads returned null. Using fallback.");
            upPath = "src/main/webapp/uploads";
        }
        this.uploadPath = upPath;
    }


    @GetMapping("/add-car")
    public String showAddCarForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("currentUri", "/sell-car");
        return "add-car";
    }

    @PostMapping("/add-car")
    public String processAddCar(@RequestParam("brand") String brand,
                                @RequestParam("model") String carModel,
                                @RequestParam("year") int year,
                                @RequestParam("price") double price,
                                @RequestParam("mileage") double mileage,
                                @RequestParam("fuelType") String fuelType,
                                @RequestParam("transmission") String transmission,
                                @RequestParam("location") String location,
                                @RequestParam("condition") String condition,
                                @RequestParam("description") String description,
                                @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
                                HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        String imagePath = "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?q=80&w=600&auto=format&fit=crop";
        if (imageFile != null && !imageFile.isEmpty()) {
            try {
                String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
                imagePath = FileUploadUtil.saveFile(uploadPath, fileName, imageFile);
            } catch (IOException e) {
                model.addAttribute("errorMessage", "Failed to upload image. Using fallback placeholder.");
            }
        }

        String carId = IDGenerator.generateCarId(carDataPath);
        String approvalStatus = "PENDING";
        String createdAt = java.time.LocalDate.now().toString();

        Car newCar;
        if ("Diesel".equalsIgnoreCase(fuelType)) {
            newCar = new DieselCar(carId, user.getUserId(), brand, carModel, year, price, mileage, transmission, location, condition, description, imagePath, "AVAILABLE", approvalStatus, createdAt);
        } else if ("Electric".equalsIgnoreCase(fuelType)) {
            newCar = new ElectricCar(carId, user.getUserId(), brand, carModel, year, price, mileage, transmission, location, condition, description, imagePath, "AVAILABLE", approvalStatus, createdAt);
        } else {
            newCar = new PetrolCar(carId, user.getUserId(), brand, carModel, year, price, mileage, transmission, location, condition, description, imagePath, "AVAILABLE", approvalStatus, createdAt);
        }

        carDAO.saveCar(newCar);
        return "redirect:/my-listings?added=true";
    }

    @GetMapping("/edit-car")
    public String showEditCarForm(@RequestParam("carId") String carId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Car car = carDAO.getCarById(carId);
        if (car == null || !car.getSellerId().equalsIgnoreCase(user.getUserId())) {
            return "redirect:/my-listings";
        }

        model.addAttribute("car", car);
        model.addAttribute("currentUri", "/my-listings");
        return "edit-car";
    }

    @PostMapping("/edit-car")
    public String processEditCar(@RequestParam("carId") String carId,
                                 @RequestParam("price") double price,
                                 @RequestParam("mileage") double mileage,
                                 @RequestParam("carStatus") String carStatus,
                                 @RequestParam("description") String description,
                                 HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Car car = carDAO.getCarById(carId);
        if (car != null && car.getSellerId().equalsIgnoreCase(user.getUserId())) {
            car.setPrice(price);
            car.setMileage(mileage);
            car.setCarStatus(carStatus);
            car.setDescription(description);
            carDAO.updateCar(car);
        }
        return "redirect:/my-listings?updated=true";
    }

    @PostMapping("/delete-car")
    public String deleteCar(@RequestParam("carId") String carId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Car car = carDAO.getCarById(carId);
        if (car != null && car.getSellerId().equalsIgnoreCase(user.getUserId())) {
            carDAO.deleteCar(carId);
        }
        return "redirect:/my-listings?deleted=true";
    }

    @GetMapping("/my-listings")
    public String myListings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        model.addAttribute("myListings", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("currentUri", "/my-listings");
        return "my-listings";
    }

}
