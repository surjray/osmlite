<%@ page language="java" %>

<%
String uid = (String)session.getAttribute("userid2");
session.removeAttribute("userid2");
session.invalidate();
response.sendRedirect("http://localhost:8080/OSM/Login.html");
%>
