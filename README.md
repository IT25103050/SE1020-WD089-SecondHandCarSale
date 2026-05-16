<<<<<<< HEAD
# AutoMart - Second-Hand Car Sales and Purchase Platform

**AutoMart** is a production-grade, highly scalable web application engineered with **Spring Boot MVC**, **Pure Object-Oriented Domain Architecture**, and embedded **JSP/JSTL View Components**. The persistence tier uses pipe-delimited (`|`) localized stream files mapped seamlessly to persistent concrete class instances.

---

## 🏗️ Architecture & File Structure

The project implements a clean domain-driven module structure organized within the base namespace `com.carplatform`:

```text
untitled/
├── pom.xml                                   <-- Spring Boot 3.x, Tomcat Jasper, JSTL dependencies
├── .gitignore                                <-- Project build exclusions
├── README.md                                 <-- Architectural manual & Schema maps
└── src/
    └── main/
        ├── java/
        │   └── com/carplatform/
        │       ├── AutoMartApplication.java  <-- Entry point bootstrap runner
        │       ├── controller/               <-- Highly cohesive web controller tier
        │       │   ├── HomeController.java
        │       │   ├── AuthController.java
        │       │   ├── DashboardController.java
        │       │   ├── CarController.java
        │       │   ├── TransactionController.java
        │       │   ├── AdminController.java
        │       │   ├── SellerDealerController.java
        │       │   └── ReviewController.java
        │       ├── dao/                      <-- Data Access Objects resolving pipe-delimited persistence
        │       │   ├── UserDAO.java
        │       │   ├── CarDAO.java
        │       │   ├── TransactionDAO.java
        │       │   ├── PaymentDAO.java
        │       │   └── ReviewDAO.java
        │       ├── model/                    <-- Core OOP Model Tier (Abstraction, Inheritance, Polymorphism)
        │       │   ├── User.java             <-- Abstract base class (Buyer, Seller, Dealer, Admin subclasses)
        │       │   ├── Car.java              <-- Abstract base class (PetrolCar, DieselCar, ElectricCar subclasses)
        │       │   ├── Transaction.java      <-- Escrow transactional tracking record
        │       │   ├── Payment.java          <-- Abstract base class (CashPayment, OnlinePayment subclasses)
        │       │   └── Review.java           <-- Abstract base class (CarReview, SellerReview subclasses)
        │       └── util/                     <-- Secure and modular utility layers
        │           ├── FileHandler.java      <-- Thread-safe file append and read wrappers
        │           ├── IDGenerator.java      <-- Sequential auto-increment prefix assignment engine
        │           ├── PasswordUtil.java     <-- MessageDigest SHA-256 hash transformations
        │           ├── ValidationUtil.java   <-- Input formatting validation filters
        │           └── FileUploadUtil.java   <-- MultipartFile local disk persister
        │
        ├── resources/
        │   └── application.properties        <-- Internal routing configurations (/WEB-INF/jsp/ view resolver)
        │
        └── webapp/
            ├── css/
            │   └── style.css                 <-- Rich custom CSS (Glassmorphism, Gradients, Dynamic Animations)
            ├── js/
            │   └── script.js                 <-- Interactive client side interface hooks
            ├── uploads/                      <-- Persistent directory for file media allocation
            └── WEB-INF/
                ├── data/                     <-- Secure persistence layer containing pre-seeded catalog elements
                │   ├── users.txt
                │   ├── cars.txt
                │   ├── transactions.txt
                │   ├── payments.txt
                │   └── reviews.txt
                └── jsp/                      <-- Internal protected view components
                    ├── fragments/            <-- Modular design interface blocks
                    │   ├── layout-header.jsp
                    │   ├── layout-scripts.jsp
                    │   ├── navbar.jsp
                    │   ├── sidebar.jsp
                    │   └── footer.jsp
                    ├── index.jsp             <-- Showcase catalog landing portal
                    ├── car-list.jsp          <-- Multi-parameter filtered inventory roster
                    ├── car-details.jsp       <-- Telemetry views with dynamic depreciation residual indicators
                    ├── login.jsp             <-- Session scope authentication block
                    ├── register.jsp          <-- Subclass role binding provisioning hub
                    ├── buyer-dashboard.jsp   <-- Personalized purchaser transaction feeds
                    ├── seller-dashboard.jsp  <-- Private merchant fleet allocation center
                    ├── dealer-dashboard.jsp  <-- High-end enterprise certified showroom
                    ├── admin-dashboard.jsp   <-- Central system oversight dashboard
                    ├── add-car.jsp           <-- Asset creation hub supporting multipart image allocations
                    ├── edit-car.jsp          <-- Realtime pricing and availability modifiers
                    ├── my-listings.jsp       <-- Owner fleet administration array
                    ├── transactions.jsp      <-- History tracking transaction ledger
                    ├── transaction-details.jsp <-- Verification clearance audit interface
                    ├── reviews.jsp           <-- Public satisfaction logging feedback matrix
                    ├── add-review.jsp        <-- Target-context injected feedback appender
                    ├── manage-users.jsp      <-- Roster oversight and status modifiers
                    ├── manage-cars.jsp       <-- Total fleet inventory tracker
                    ├── pending-cars.jsp      <-- Verification pipeline resolving manual overrides
                    ├── pending-dealers.jsp   <-- Enterprise showroom permission hub
                    ├── manage-transactions.jsp <-- Escrow system tracking hub
                    └── manage-reviews.jsp    <-- Instant satisfaction log droppers
```

---

## 🧬 Object-Oriented Design Principles (OOP)

The architecture rigorously maintains full **Polymorphic mapping** to ensure clear decoupling between runtime memory states and file-backed storage records:

### 1. Encapsulation
Every model encapsulates its properties with private/protected modifiers access-restricted via pure getters and setters. Data parsing layers remain sealed inside specific DAOs to isolate raw string token handling.

### 2. Abstraction & Inheritance
Core domain abstractions form deep class hierarchies:
*   **`User` Tier**: Superclass providing concrete shared attributes (ID, email, password, status flags) while abstracting behavior. Subclasses (`Buyer`, `Seller`, `Dealer`, `Admin`) extend capabilities and override dynamic strings via `displayUserInfo()` and specific portal labeling rules.
*   **`Car` Tier**: Superclass holding persistent core properties (brand, model, baseline cost, status tags) while defining hooks like `calculateEstimatedValue()` and `displayCarDetails()`. Subclasses (`PetrolCar`, `DieselCar`, `ElectricCar`) override formulas dynamically (e.g., higher mileage residual decay applied to standard combustion models versus fixed battery module lifespan depreciation on electric platforms).
*   **`Payment` Tier**: Base payment interface extending subclass polymorphism (`CashPayment`, `OnlinePayment`) to drive transactional payment workflows.
*   **`Review` Tier**: Abstract assessment mapping handling targets differently based on subtype (`CarReview`, `SellerReview`).

### 3. Polymorphism
Controller mappings invoke base types directly (e.g., `List<Car>`), allowing dynamic polymorphic routing for both display operations and localized data persistence via the overloaded `toFileString()` signature.

---

## 💾 Localized Persistence Schemas

Data files utilize pipe-separated formats (`|`). **Never** alter the sequence order to prevent misaligned parameter parsing:

### 1. `users.txt`
```text
[userId]|[fullName]|[email]|[passwordHash]|[phone]|[address]|[role]|[accountStatus]|[approvalStatus]|[createdAt]
```
*   `role`: Valid options include `Buyer`, `Seller`, `Dealer`, `Admin`.
*   `accountStatus`: `ACTIVE` or `SUSPENDED`.
*   `approvalStatus`: `APPROVED` or `PENDING` (Dealers initialize as `PENDING` awaiting Admin validation).

### 2. `cars.txt`
```text
[carId]|[sellerId]|[brand]|[model]|[year]|[price]|[mileage]|[fuelType]|[transmission]|[location]|[condition]|[description]|[imagePath]|[carStatus]|[approvalStatus]|[createdAt]
```
*   `fuelType`: Must match `Petrol`, `Diesel`, or `Electric` to trigger appropriate subclass instantiations.
*   `carStatus`: `AVAILABLE`, `RESERVED`, or `SOLD`.
*   `approvalStatus`: `APPROVED` or `PENDING`.

### 3. `transactions.txt`
```text
[transactionId]|[buyerId]|[carId]|[sellerId]|[requestDate]|[transactionStatus]|[paymentMethod]|[paymentStatus]
```
*   `transactionStatus`: `PENDING`, `COMPLETED`, or `CANCELLED`.
*   `paymentMethod`: `Cash` or `Online`.

### 4. `payments.txt`
```text
[paymentId]|[transactionId]|[paymentType]|[amount]|[paymentStatus]|[paymentDate]
```
*   `paymentType`: `Cash` or `Online`.

### 5. `reviews.txt`
```text
[reviewId]|[buyerId]|[carId]|[sellerId]|[reviewType]|[rating]|[comment]|[createdAt]
```
*   `reviewType`: `CAR` or `SELLER`.
*   If `reviewType` is `SELLER`, `carId` remains blank. If `CAR`, `sellerId` captures listing representative tags.

---

## 🚀 Execution & Verification Guides

### Running Locally
Right-click AutoMartApplication.java and run it.
Then open:
http://localhost:8080/


---
*Engineered by Antigravity Core Telemetry Agent.*
=======
<div align="center">

# 🚗💨 Second-Hand Car Sales & Purchase Platform

### 📚 SE1020 – Object Oriented Programming Project  
### 👨‍💻 Group WD089

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=24&pause=1000&color=0EA5E9&center=true&vCenter=true&width=800&lines=Buy+and+Sell+Second-Hand+Cars+Online;Built+with+Java+%7C+JSP+%7C+Servlets+%7C+Spring+Boot;Role-Based+Access+for+Buyers%2C+Sellers%2FDealers+and+Admins;OOP+Project+by+Group+WD089" alt="Typing SVG" />

<br>

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-Java_Web-blue?style=for-the-badge)
![Servlets](https://img.shields.io/badge/Servlets-Jakarta-orange?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/IDE-IntelliJ_IDEA-black?style=for-the-badge&logo=intellijidea)
![GitHub](https://img.shields.io/badge/GitHub-Version_Control-181717?style=for-the-badge&logo=github)

</div>

---

## 🌟 Project Overview

The **Second-Hand Car Sales & Purchase Platform** is a web-based system developed for the **SE1020 Object Oriented Programming module**.

This platform allows users to **buy and sell second-hand cars** efficiently through a role-based system with separate access for:

- 👤 **Buyers**
- 🏪 **Sellers / Dealers**
- 🛡 **Admins**

The project is built using **Java web technologies** and applies core **Object-Oriented Programming concepts** such as encapsulation, inheritance, polymorphism, and abstraction.

---

## 🎯 Project Objectives

- Build a complete **car sales management system**
- Apply **OOP principles** in a real-world software solution
- Implement **CRUD operations** across all project modules
- Develop a clean and organized **web interface**
- Practice **team collaboration** using GitHub
- Maintain proper **documentation and version control**

---

## ✨ Main Features

### 👤 User Management
- User registration
- User login/logout
- Profile management
- Role-based access handling

### 🚘 Car Listing Management
- Add new car listings
- View available cars
- Update car details
- Delete car advertisements

### 🔎 Filtering Management
Users can search and filter cars by:
- 💰 Price
- 📅 Year
- 🛣 Mileage
- ⛽ Fuel Type
- ⚙️ Transmission
- 📍 Location
- 🔧 Condition

### 💳 Transaction Management
- Record purchases
- Manage buyer and seller transactions
- Track payment and transaction status

### 🛡 Admin Management
- Manage users
- Moderate car listings
- Monitor platform activities
- Approve or remove content

### 🏪 Seller / Dealer Management
- Manage seller/dealer profiles
- Handle seller inventory
- View and update posted cars

### ⭐ Review and Rating Management
- Add seller/car reviews
- Give ratings
- Manage and moderate review content

---

## 👨‍👩‍👧‍👦 Workload Distribution

| Member | Module | Description | Main Table(s) |
|--------|--------|-------------|---------------|
| 1 | 👤 User Management | Registration, login, profile CRUD | `users` |
| 2 | 🚘 Car Listing Management | Add, view, edit, delete car listings | `cars` |
| 3 | 💳 Transaction Management | Handle transactions and payment status | `transactions` |
| 4 | 🛡 Admin Management | Admin controls, moderation, approvals | `admins` |
| 5 | 🏪 Seller / Dealer Management | Seller/dealer profile and inventory | `sellers`, `cars` |
| 6 | ⭐ Review, Rating & Filtering | Reviews, ratings, search and filters | `reviews`, `cars` |

> 📌 Each member is expected to complete at least **3 CRUD operations** and **3 UI pages** for their assigned module.

---

## 🛠 Tech Stack

| Category | Technology |
|----------|------------|
| 💻 IDE | IntelliJ IDEA |
| ⚙️ Backend | Java |
| 🌐 Web Technologies | JSP / Servlets / Spring Boot |
| 🎨 Frontend | HTML, CSS, JavaScript |
| 🧩 UI Framework | Bootstrap / Tailwind CSS |
| 🗄 Database | MySQL |
| 🔧 Version Control | Git + GitHub |

---
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
