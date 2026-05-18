# AutoMart - Second-Hand Car Sales and Purchase Platform

**AutoMart** is a production-grade, highly scalable web application engineered with **Spring Boot MVC**, **Pure Object-Oriented Domain Architecture**, and embedded **JSP/JSTL View Components**. The persistence tier uses pipe-delimited (`|`) localized stream files mapped seamlessly to persistent concrete class instances.

---

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
*Engineered by Antigravity Core Telemetry Agent.*
