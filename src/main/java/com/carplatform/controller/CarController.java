package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import com.carplatform.util.*;
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
    private static final String FILE_PATH = "c:/Users/aruno/Desktop/untitled/src/main/webapp/WEB-INF/data/cars.txt";

    public CarController(CarDAO carDAO, UserDAO userDAO) {
        this.carDAO = carDAO;
        this.userDAO = userDAO;
    }

    @GetMapping("/car-details")
    public String showCarDetails(@RequestParam("carId") String carId, Model model) {
        Car car = carDAO.getCarById(carId);
        if (car == null) return "redirect:/cars";

        User seller = userDAO.getUserById(car.getSellerId());

        model.addAttribute("car", car);
        model.addAttribute("seller", seller);
        model.addAttribute("estimatedValue", String.format("%.2f", car.calculateEstimatedValue()));
        model.addAttribute("currentUri", "/cars");
        return "car-details";
    }

    @GetMapping("/add-car")
    public String showAddCarForm(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || "Buyer".equalsIgnoreCase(user.getRole())) {
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
                imagePath = FileUploadUtil.saveFile("src/main/webapp/uploads", fileName, imageFile);
            } catch (IOException e) {
                model.addAttribute("errorMessage", "Failed to upload image. Using fallback placeholder.");
            }
        }

        String carId = IDGenerator.generateCarId(FILE_PATH);
        String approvalStatus = "Admin".equalsIgnoreCase(user.getRole()) ? "APPROVED" : "PENDING";
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
        if (car == null || (!car.getSellerId().equalsIgnoreCase(user.getUserId()) && !"Admin".equalsIgnoreCase(user.getRole()))) {
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
        if (car != null && (car.getSellerId().equalsIgnoreCase(user.getUserId()) || "Admin".equalsIgnoreCase(user.getRole()))) {
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
        if (car != null && (car.getSellerId().equalsIgnoreCase(user.getUserId()) || "Admin".equalsIgnoreCase(user.getRole()))) {
            carDAO.deleteCar(carId);
        }
        return "redirect:/my-listings?deleted=true";
    }

    @GetMapping("/my-listings")
    public String myListings(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || "Buyer".equalsIgnoreCase(user.getRole())) return "redirect:/login";

        model.addAttribute("myListings", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("currentUri", "/my-listings");
        return "my-listings";
    }

    @GetMapping("/cars")
    public String showCars(@RequestParam(value = "brand", required = false) String brand,
                           @RequestParam(value = "fuelType", required = false) String fuelType,
                           @RequestParam(value = "maxPrice", required = false) String maxPrice,
                           Model model) {

        List<Car> cars = carDAO.getApprovedAvailableCars();

        if (brand != null && !brand.trim().isEmpty()) {
            String query = brand.trim().toLowerCase();
            cars = cars.stream()
                    .filter(car -> car.getBrand().toLowerCase().contains(query)
                            || car.getModel().toLowerCase().contains(query))
                    .toList();
        }

        if (fuelType != null && !fuelType.trim().isEmpty()) {
            cars = cars.stream()
                    .filter(car -> car.getFuelType().equalsIgnoreCase(fuelType.trim()))
                    .toList();
        }

        if (maxPrice != null && !maxPrice.trim().isEmpty()) {
            try {
                double max = Double.parseDouble(maxPrice.trim());
                cars = cars.stream()
                        .filter(car -> car.getPrice() <= max)
                        .toList();
            } catch (NumberFormatException ignored) {
            }
        }

        model.addAttribute("cars", cars);
        model.addAttribute("currentUri", "/cars");
        return "car-list";
    }

    @GetMapping("/manage-cars")
    public String manageCars(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/";
        }
        model.addAttribute("cars", carDAO.getAllCars());
        model.addAttribute("currentUri", "/manage-cars");
        return "manage-cars";
    }

    @GetMapping("/pending-cars")
    public String pendingCars(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/";
        }
        List<Car> pending = carDAO.getAllCars().stream()
                .filter(car -> "PENDING".equalsIgnoreCase(car.getApprovalStatus()))
                .toList();
        model.addAttribute("pendingCars", pending);
        model.addAttribute("currentUri", "/pending-cars");
        return "pending-cars";
    }

    @PostMapping("/approve-car")
    public String approveCar(@RequestParam("carId") String carId,
                             @RequestParam("approvalStatus") String approvalStatus,
                             HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/";
        }
        Car car = carDAO.getCarById(carId);
        if (car != null) {
            car.setApprovalStatus(approvalStatus);
            if ("APPROVED".equalsIgnoreCase(approvalStatus)) {
                car.setCarStatus("AVAILABLE");
            }
            carDAO.updateCar(car);
        }
        return "redirect:/pending-cars?resolved=true";
    }
}
