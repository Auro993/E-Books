<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    session.removeAttribute("user");
    session.setAttribute("logout-msg", "Logout Successfully!");
    response.sendRedirect("login.jsp");
%>