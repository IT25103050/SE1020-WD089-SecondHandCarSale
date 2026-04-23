public class Car {
    // Attributes from your database structure
    private String brand;
    private String model;
    private double price;
    private int mileage;

    // Constructor
    public Car(String brand, String model, double price, int mileage) {
        this.brand = brand;
        this.model = model;
        this.price = price;
        this.mileage = mileage;
    }

    // Getters (Required for OOP)
    public String getBrand() { return brand; }
    public String getModel() { return model; }
    public double getPrice() { return price; }
}