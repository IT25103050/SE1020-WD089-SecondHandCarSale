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

## 🗄 Database Design

### 👤 `users`
```text
userId
name
username
password
email
phone
role
status
registeredDate
🚘 cars
carId
sellerId
make
model
year
price
mileage
fuelType
transmission
condition
color
location
description
imageURL
status
datePosted
💳 transactions
txnId
carId
buyerId
sellerId
amount
paymentMethod
status
transactionDate
🛡 admins
adminId
username
password
email
permissions
createdDate
lastLogin
🏪 sellers
sellerId
userId
sellerType
businessName
address
city
avgRating
⭐ reviews
reviewId
targetType
targetId
reviewerId
rating
comment
reviewDate
status
📂 Recommended Project Structure
SE1020-WD089-SecondHandCarSale
│
├── src
│   └── com
│       └── carsales
│           ├── Main.java
│           ├── model
│           │   ├── User.java
│           │   ├── Admin.java
│           │   ├── Seller.java
│           │   ├── Car.java
│           │   ├── Transaction.java
│           │   └── Review.java
│           │
│           ├── service
│           │   ├── UserService.java
│           │   ├── CarService.java
│           │   ├── TransactionService.java
│           │   ├── AdminService.java
│           │   ├── SellerService.java
│           │   └── ReviewService.java
│           │
│           ├── management
│           │   ├── UserManagement.java
│           │   ├── CarListingManagement.java
│           │   ├── FilteringManagement.java
│           │   ├── TransactionManagement.java
│           │   ├── AdminManagement.java
│           │   ├── SellerDealerManagement.java
│           │   └── ReviewRatingManagement.java
│           │
│           ├── utils
│           │   ├── InputHelper.java
│           │   └── ValidationHelper.java
│           │
│           └── data
│               └── Database.java
│
├── database
│   └── schema.sql
│
├── screenshots
│
├── docs
│
├── README.md
├── .gitignore
└── LICENSE
⚙️ Setup Guide
1️⃣ Clone the repository
git clone https://github.com/IT25103050/SE1020-WD089-SecondHandCarSale.git
2️⃣ Open the project in IntelliJ IDEA

Open IntelliJ IDEA

Click File > Open

Select the project folder

3️⃣ Configure the database

Create a MySQL database:

CREATE DATABASE car_sales_system;

Then import your SQL schema and update database connection settings in the project.

4️⃣ Run the application

Run using:

Tomcat server, or

Spring Boot application

Then open:

http://localhost:8080
🔄 GitHub Workflow
🌿 Suggested Branch Names
main
user-management
car-listing-management
transaction-management
admin-management
seller-dealer-management
review-rating-filtering
✅ Basic Git Commands
git pull
git add .
git commit -m "Added user management module"
git push
📚 OOP Concepts Used

This project demonstrates:

🔒 Encapsulation

🧬 Inheritance

🎭 Polymorphism

🧩 Abstraction

🏗 Modular Design

🪟 Layered / MVC-style Architecture

🖼 Screenshots

Add your system screenshots here after development:

🏠 Home Page

🔐 Login Page

📝 Registration Page

🚘 Car Listing Page

🔎 Filter/Search Page

💳 Transaction Page

🛡 Admin Dashboard

⭐ Review Page

Example:

## 🖼 Screenshots

### Home Page
![Home Page](screenshots/homepage.png)

### Login Page
![Login Page](screenshots/login.png)
🚀 Future Improvements

📷 Car image upload

💬 Chat between buyer and seller

❤️ Wishlist / favorites

📊 Admin analytics dashboard

🔐 Secure authentication and authorization

📱 Fully responsive mobile UI

📍 Map-based location filtering

🎓 Academic Deliverables

✅ Source Code

✅ GitHub Repository

✅ README Documentation

✅ CRUD Operations

✅ UI Pages

✅ Database Design

✅ OOP Concept Implementation

👨‍💻 Team Details
<div align="center">
🚀 Developed by Group WD089
📚 SLIIT - SE1020 Object Oriented Programming
</div>
⭐ Support

If you like this project:

🌟 Star the repository

🍴 Fork the repository

🛠 Contribute improvements

<div align="center">
🚗✨ Happy Coding, Team WD089 ✨🚗
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0ea5e9,100:2563eb&height=120&section=footer"/> </div> ```
