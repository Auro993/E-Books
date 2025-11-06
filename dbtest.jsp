<%@ page import="com.dao.UserDAO, com.db.DBConnect, com.user.UserDetails" %>
<%
try {
    out.println("Testing database connection...<br>");
    
    UserDAO dao = new UserDAO(DBConnect.getConn());
    out.println("Database connection: SUCCESS<br>");
    
    // Test if we can check email
    boolean exists = dao.checkEmailExists("test@test.com");
    out.println("Email check works: " + exists + "<br>");
    
    out.println("✅ Database operations working!");
} catch (Exception e) {
    out.println("❌ Database error: " + e.getMessage());
    e.printStackTrace(new java.io.PrintWriter(out));
}
%>