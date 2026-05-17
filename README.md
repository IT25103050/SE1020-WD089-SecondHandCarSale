# 🏎️ AutoMart | Seller & Dealer Management Module

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![JSP](https://img.shields.io/badge/View-JSP%20%2F%20JSTL-blue.svg)](https://jakarta.ee/specifications/pages/3.0/)

**AutoMart Seller/Dealer Management** is a high-performance, specialized module designed for the AutoMart ecosystem. It provides a robust, enterprise-grade interface for merchants and certified dealerships to manage their vehicle fleets, track listings, and interact with the platform's core services.

---

## 🌟 Key Features

### 🏢 Merchant Dashboards
- **Seller Dashboard**: A streamlined interface for individual sellers to manage their private listings.
- **Dealer Dashboard**: An enterprise-certified showroom interface for professional dealerships.
- **Dynamic Stats**: Real-time tracking of active listings and pending requests.

### 🚗 Inventory Lifecycle
- **Asset Creation**: Support for multi-part image uploads and detailed vehicle specifications.
- **Live Modifiers**: Real-time updates for pricing, mileage, and availability status.
- **Polymorphic Categorization**: Specialized handling for Petrol, Diesel, and Electric vehicle types.

### 🛡️ Secure Access
- **Role-Based Routing**: Strict access control for Seller and Dealer roles.
- **Session Security**: State-managed authentication using secure session bindings.
- **Hashed Persistence**: SHA-256 password security for all merchant accounts.

---

## 🛠️ Technology Stack

| Component | Technology |
| :--- | :--- |
| **Backend Core** | Java 17, Spring Boot 3.x |
| **Web Tier** | Spring MVC, JSP, JSTL |
| **Aesthetics** | Vanilla CSS (Glassmorphism, Modern Gradients) |
| **Data Tier** | Streamed Pipe-Delimited Persistence (Flat File) |
| **Utilities** | Jakarta Servlet API, Apache Tomcat Jasper |

---

## 🏗️ Architecture & File Structure

The project implements a clean domain-driven module structure organized within the base namespace `com.carplatform`:

```text
Seller  Dealer Management/
├── src/main/java/com/carplatform/
│   ├── controller/               <-- Web tier (Auth, Dashboard, Car, SellerDealer)
│   ├── dao/                      <-- Data Access (User, Car, Transaction, Review)
│   ├── model/                    <-- Domain Objects (User, Car, Transaction, Review)
│   └── util/                     <-- Utilities (FileHandler, Security, Validation)
├── src/main/webapp/
│   ├── WEB-INF/jsp/              <-- Secure View Components
│   ├── css/                      <-- Premium Styling
│   └── js/                       <-- Interactive Hooks
└── pom.xml                       <-- Dependency Manifest
```

---

## 🧬 OOP Excellence

The architecture rigorously maintains full **Polymorphic mapping** to ensure clear decoupling between runtime memory states and file-backed storage records:

- **Encapsulation**: Private/protected modifiers with pure getters/setters.
- **Abstraction**: Base classes (`User`, `Car`, `Review`) defining core templates.
- **Inheritance**: Subclasses (`Seller`, `Dealer`, `ElectricCar`, etc.) extending specific behaviors.
- **Polymorphism**: Dynamic routing and specialized logic for different merchant types.

---

## 💾 Data Persistence Schemas

### 👤 User Schema (`users.txt`)
`[userId]|[fullName]|[email]|[passwordHash]|[phone]|[address]|[role]|[accountStatus]|[approvalStatus]|[createdAt]`
- Roles: `Seller`, `Dealer`
- Status: `ACTIVE` / `SUSPENDED`

### 🚘 Car Schema (`cars.txt`)
`[carId]|[sellerId]|[brand]|[model]|[year]|[price]|[mileage]|[fuelType]|[transmission]|[location]|[condition]|[description]|[imagePath]|[carStatus]|[approvalStatus]|[createdAt]`
- Types: `Petrol`, `Diesel`, `Electric`

---


---
*Engineered by Antigravity Core Telemetry Agent.*
