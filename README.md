
<div align="center">

# 🚗💨 Second-Hand Car Sales & Purchase Platform

### 📚 SE1020 – Object Oriented Programming Project
### 👨‍💻 Group WD089

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=24&pause=1000&color=0EA5E9&center=true&vCenter=true&width=700&lines=Buy+and+Sell+Second-Hand+Cars+Online;Built+with+Java+%7C+JSP+%7C+Servlets+%7C+Spring+Boot;Role-Based+System+for+Buyers%2C+Sellers%2C+and+Admins;OOP+Project+by+Group+WD089" alt="Typing SVG" />

<br>

![Java](https://img.shields.io/badge/Java-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![IntelliJ IDEA](https://img.shields.io/badge/IDE-IntelliJ_IDEA-black?style=for-the-badge&logo=intellijidea)
![GitHub](https://img.shields.io/badge/GitHub-Version_Control-181717?style=for-the-badge&logo=github)

</div>

---

## 🌟 Project Overview

The **Second-Hand Car Sales & Purchase Platform** is a **web-based system** designed to help users **buy and sell used cars easily and securely**.

It supports multiple user roles such as:

- 👤 **Buyers**
- 🏪 **Sellers / Dealers**
- 🛡 **Admins**

This project is developed using **Object-Oriented Programming concepts** and modern **Java web technologies**.

---

## ✨ Core Features

### 👤 User Management
- User registration and login
- Profile management
- Role-based access control

### 🚘 Car Listing Management
- Add new car listings
- View all listed vehicles
- Update listing details
- Remove car advertisements

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
- Manage buying/selling process
- Record transactions
- Update payment and transaction status

### 🛡 Admin Management
- Manage users
- Moderate listings
- Monitor system activities

### 🏪 Seller / Dealer Management
- Handle seller/dealer profiles
- Manage inventory
- View posted listings

### ⭐ Review & Rating Management
- Add reviews for cars/sellers
- Rate sellers
- Moderate and manage review content

---

## 🎯 Objectives

- Build a complete **car sales management platform**
- Apply **OOP principles** in a real-world project
- Practice **GitHub team collaboration**
- Implement **CRUD operations** for all modules
- Develop a clean **user interface**

---

## 👨‍👩‍👧‍👦 Workload Distribution

| Member | Module | Description | Main Table(s) |
|--------|--------|-------------|---------------|
| 1 | 👤 User Management | Registration, login, profile CRUD | `users` |
| 2 | 🚘 Car Listing Management | Manage car advertisements | `cars` |
| 3 | 💳 Transaction Management | Handle purchases and payments | `transactions` |
| 4 | 🛡 Admin Management | System moderation and admin control | `admins` |
| 5 | 🏪 Seller / Dealer Management | Manage sellers and inventory | `sellers`, `cars` |
| 6 | ⭐ Review & Rating + Filtering | Reviews, ratings, and filter/search | `reviews`, `cars` |

> 📌 Each member is expected to complete at least **3 CRUD operations** and **3 UI pages** for their module.

---

## 🛠 Tech Stack

<div align="center">

| Category | Technology |
|----------|------------|
| 💻 IDE | IntelliJ IDEA |
| ⚙ Backend | Java |
| 🌐 Web | JSP / Servlets / Spring Boot |
| 🎨 Frontend | HTML, CSS, JavaScript |
| 🧩 UI | Bootstrap / Tailwind CSS |
| 🗄 Database | MySQL |
| 🔧 Version Control | Git + GitHub |

</div>

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
