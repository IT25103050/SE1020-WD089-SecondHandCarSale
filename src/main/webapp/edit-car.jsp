<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>AutoMart - Edit Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<%
    String carId = request.getParameter("id");
    String brand = "", model = "", year = "", price = "", mileage = "", fuel = "", currentImg = "";

    String dataPath = getServletContext().getRealPath("/WEB-INF/data/cars.txt");
    File file = new File(dataPath);
    if (file.exists()) {
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] data = line.split("\\|");
                if (data.length >= 8 && data[0].equals(carId)) {
                    brand = data[2];
                    model = data[3];
                    year = data[4];
                    price = data[5];
                    mileage = data[6];
                    fuel = data[7];
                    currentImg = (data.length > 12) ? data[12] : "";
                    break;
                }
            }
        } catch(Exception e) {}
    }
%>
<div class="container my-5">
    <div class="card shadow p-5 mx-auto" style="max-width: 600px; border-radius: 12px;">
        <h3 class="fw-bold text-dark mb-4">Modify Vehicle Records (<%= carId %>)</h3>

        <form action="UpdateCarServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= carId %>">
            <input type="hidden" name="existing_image" value="<%= currentImg %>">

            <div class="mb-3">
                <label class="form-label fw-bold small text-muted text-uppercase">Brand</label>
                <input type="text" name="brand" class="form-control" value="<%= brand %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold small text-muted text-uppercase">Model</label>
                <input type="text" name="model" class="form-control" value="<%= model %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold small text-muted text-uppercase">Year</label>
                <input type="number" name="year" class="form-control" value="<%= year %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold small text-muted text-uppercase">Price (LKR)</label>
                <input type="number" name="price" class="form-control" value="<%= price %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold small text-muted text-uppercase">Mileage (km)</label>
                <input type="number" name="mileage" class="form-control" value="<%= mileage %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold small text-muted text-uppercase">Fuel Type</label>
                <select name="fuel" class="form-select">
                    <option value="Petrol" <%= "Petrol".equalsIgnoreCase(fuel) ? "selected" : "" %>>Petrol</option>
                    <option value="Diesel" <%= "Diesel".equalsIgnoreCase(fuel) ? "selected" : "" %>>Diesel</option>
                </select>
            </div>

            <div class="mb-4">
                <label class="form-label fw-bold small text-muted text-uppercase">Update Car Image (Leave blank to keep old photo)</label>
                <input type="file" name="new_car_image" class="form-control" accept="image/*">
                <% if(currentImg != null && !currentImg.isEmpty()) { %>
                    <div class="form-text text-success">Current path: <%= currentImg %></div>
                <% } %>
            </div>

            <div class="d-grid gap-2 mt-4">
                <button type="submit" class="btn btn-primary fw-bold">Save Changes</button>
                <a href="SearchServlet" class="btn btn-outline-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>