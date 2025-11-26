📚 <span style="color:#4CAF50">E-Books Web Application</span>

<p align="center">
  <img src="https://img.shields.io/badge/Project-E--Books-orange">
  <img src="https://img.shields.io/badge/Backend-Java%20Servlets-red">
  <img src="https://img.shields.io/badge/Frontend-JSP%20%7C%20CSS-blue">
  <img src="https://img.shields.io/badge/Database-MySQL-green">
  <img src="https://img.shields.io/badge/Server-Tomcat-yellow">
</p>
---

🔹 <span style="color:#03A9F4">Project Description</span>

An advanced E-Books Management Web Application developed using
Java Servlets, JSP, JDBC, MySQL and Tomcat.

This system allows users to browse, purchase, and download e-books
while the admin can manage books, users, and orders efficiently.


---

🎯 <span style="color:#9C27B0">Key Features</span>

👤 User Panel

✅ Register & Login
✅ Browse books by category
✅ Book details page
✅ Add to cart
✅ Checkout & payment page
✅ Download purchased books
✅ Logout system

🛠 Admin Panel

✅ Add new books
✅ Edit book information
✅ Delete books
✅ View orders
✅ User management


---

🖥 <span style="color:#FF5722">Technology Stack</span>

🌐 Frontend

JSP

HTML

CSS

Bootstrap


⚙ Backend

Java Servlets

JDBC

MVC Architecture


🗄 Database

MySQL


🚀 Server

Apache Tomcat



---

📁 <span style="color:#009688">Project Structure</span>

E-Books
 ├── src
 │   └── main
 │       ├── java
 │       │   ├── com.dao
 │       │   ├── com.db
 │       │   ├── com.servlet
 │       │   └── com.user
 │       └── webapp
 │           ├── css
 │           ├── img
 │           ├── login.jsp
 │           ├── register.jsp
 │           └── index.jsp
 └── README.md

---

🛢 <span style="color:#795548">Database Tables</span>

🧑 users

id

name

email

password

address


📖 books

id

title

author

category

price

pdf

status


🛒 cart

id

user_id

book_id


📦 orders

id

user_id

book_id

order_date



---

▶ <span style="color:#2196F3">How to Run Project</span>

✅ Import Project

Import as Dynamic Web Project in Eclipse / IntelliJ.

✅ Configure Server

Add Apache Tomcat Server.

✅ Setup Database

Create database:

CREATE DATABASE ebooks;

Import SQL file.

✅ Update DB Connection

Edit DBConnect.java:

String url = "jdbc:mysql://localhost:3306/ebooks";
String user = "root";
String pass = "your_password";

✅ Run Project

Right-click → Run on Server


---

🔐 <span style="color:#E91E63">Admin Login</span>

Email: aurosmitasahoo4@gmail.com



---

👩‍💻 <span style="color:#673AB7">Developer</span>

Aurosmita Sahoo
Full-Stack Java Developer
Servlet | JSP | SQL | JDBC | Tomcat


---

⭐ <span style="color:#FF9800">Support</span>

If you like this project, give it a ⭐ on GitHub!
