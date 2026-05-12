# AutoMart - Second-Hand Car Sales and Purchase Platform

## Team Members and Modules

*   **Member 1: User Management**
    *   **Responsibility**: Registration, login, logout, profile CRUD
    *   **Main File**: `users.txt`
    *   **Folder Location**: `/member1_user_management/`
*   **Member 2: Car Listing Management**
    *   **Responsibility**: Add, view, edit, delete car listings
    *   **Main File**: `cars.txt`
    *   **Folder Location**: `/member2_car_management/`
*   **Member 3: Transaction Management**
    *   **Responsibility**: Purchase requests, transactions, payment status
    *   **Main Files**: `transactions.txt`, `payments.txt`
    *   **Folder Location**: `/member3_transaction_management/`
*   **Member 4: Admin Management**
    *   **Responsibility**: Admin dashboard, approvals, moderation
    *   **Main Files**: `users.txt`, `cars.txt`, `transactions.txt`, `reviews.txt`
    *   **Folder Location**: `/member4_admin_management/`
*   **Member 5: Seller / Dealer Management**
    *   **Responsibility**: Seller/dealer profile and inventory
    *   **Main Files**: `users.txt`, `cars.txt`
    *   **Folder Location**: `/member5_seller_management/`
*   **Member 6: Review, Rating & Filtering**
    *   **Responsibility**: Reviews, ratings, search and filters
    *   **Main Files**: `reviews.txt`, `cars.txt`
    *   **Folder Location**: `/member6_review_management/`

## GitHub Branch Names

Please use the following branch names when pushing code to the repository:

*   Member 1: `feature/user-management`
*   Member 2: `feature/car-management`
*   Member 3: `feature/transaction-management`
*   Member 4: `feature/admin-management`
*   Member 5: `feature/seller-management`
*   Member 6: `feature/review-management`
*   Shared Utilities: `chore/shared-utilities`

## How to Run in Tomcat

1.  Each member can merge their code together into the main `src` directory.
2.  Open the final merged project in IntelliJ IDEA.
3.  Configure a Local Tomcat Server (e.g., Apache Tomcat 9/10).
4.  Deploy the exploded WAR artifact in the Run Configuration.
5.  All data files should automatically be read from `WEB-INF/data/`.
