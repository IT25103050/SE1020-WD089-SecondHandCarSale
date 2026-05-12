# AutoMart - Second-Hand Car Sales and Purchase Platform

## Description
AutoMart is a complete Java-based web application for buying and selling second-hand cars. This project is built using object-oriented principles, Java Servlets, JSP, and uses simple `.txt` files for database simulation.

This system facilitates four major user roles:
1. **Buyers**: Can browse cars, search/filter, request to buy, pay for cars, and submit reviews for cars or sellers.
2. **Sellers**: Can add their own cars for sale, manage their listings, approve purchase requests, and mark transactions as completed.
3. **Dealers**: Similar to sellers but require an initial admin approval to be verified as an official dealer. They can maintain a large inventory.
4. **Admins**: Monitor and moderate the platform. Admins approve cars and dealer accounts, manage all users, transactions, and moderate reviews.

## Architecture & Technology Stack
*   **Language**: Java 11+
*   **Web Framework**: Java Servlets & JSP (JavaServer Pages)
*   **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
*   **Data Persistence**: `.txt` file handling
*   **Build Tool**: Maven

## Object-Oriented Principles (OOP)
This project is built using Object-Oriented Programming (OOP) concepts:
*   **Encapsulation**: Models (`User`, `Car`, `Transaction`) have private fields with public getter/setter methods.
*   **Inheritance**: `Buyer`, `Seller`, `Dealer`, and `Admin` classes inherit from the base abstract `User` class. `CarReview` and `SellerReview` inherit from `Review`. `CashPayment` and `OnlinePayment` inherit from `Payment`.
*   **Polymorphism**: Overridden `getRole()` and `processPayment()` methods demonstrate polymorphic behavior.
*   **Abstraction**: Abstract classes like `User` and `Payment` define templates without implementing instances directly.

## Structure
The application follows the Model-View-Controller (MVC) architectural pattern:
*   **Model (`com.carplatform.model`)**: Contains business entities.
*   **View (`src/main/webapp`)**: JSP files serve as the presentation layer. 
*   **Controller (`com.carplatform.servlet`)**: Servlets handle the HTTP request-response flow.
*   **DAO (`com.carplatform.dao`)**: Data Access Objects that interface with text files for data persistence.
*   **Util (`com.carplatform.util`)**: Helper classes for ID generation, file handling, and password hashing.

## Setup Instructions

### Prerequisites
*   Java Development Kit (JDK) 11 or higher
*   Apache Tomcat 9.x
*   IntelliJ IDEA (or Eclipse)
*   Maven

### Running Locally with IntelliJ IDEA
1. Open the project folder in IntelliJ IDEA.
2. Mark `src/main/java` as Sources Root if it isn't automatically.
3. Add a **Tomcat Server (Local)** Run Configuration:
   - Click `Add Configuration` -> `Tomcat Server` -> `Local`.
   - Point the Application Server to your Tomcat 9 installation folder.
   - Go to the `Deployment` tab, add an artifact for the project (`war exploded`).
   - Run the application.
4. The application will be accessible at `http://localhost:8080/`.

### Default Accounts
Since the project relies on text files, you may easily register your own accounts, or use the preconfigured ones in `/WEB-INF/data/users.txt` once they're created dynamically. Ensure there's at least one admin account manually given the 'Admin' role in the text file if needed. By default, newly registered Admins are automatically verified.

## Contribution & GitHub Commit Plan
1. **Module 1 (Backend & Models)**: Set up Java models, abstract classes, and utility functions (File handling).
2. **Module 2 (DAOs)**: Develop File-based Data Access Objects for persistence.
3. **Module 3 (Auth and Users)**: Build login, registration, and user-type specific dashboards.
4. **Module 4 (Car Management)**: Implement Add, Edit, Delete, Read capabilities for vehicles.
5. **Module 5 (Transactions & Payments)**: Establish the logic for buy-requests and payment simulation.
6. **Module 6 (Admin & Moderation)**: Include comprehensive admin functionalities for approvals and user suspensions.
7. **Module 7 (UI/UX Setup)**: Craft the JSPs alongside Bootstrap configuration for an elegant visual design.
