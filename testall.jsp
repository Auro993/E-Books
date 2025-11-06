<%@ page import="com.dao.UserDAO, com.db.DBConnect, com.user.UserDetails" %>
<%
try {
    UserDAO dao = new UserDAO(DBConnect.getConn());
    
    // Test email check
    boolean exists = dao.checkEmailExists("test@test.com");
    out.println("Email check works: " + exists + "<br>");
    
    // Test user addition
    UserDetails testUser = new UserDetails("Test User", "test@test.com", "password", "1234567890");
    boolean added = dao.addUser(testUser);
    out.println("User addition works: " + added + "<br>");
    
    out.println("✅ Database operations working!");
} catch (Exception e) {
    out.println("❌ Database error: " + e.getMessage());
    e.printStackTrace(new java.io.PrintWriter(out));
}
%>