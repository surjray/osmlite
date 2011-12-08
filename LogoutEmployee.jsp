<%@ page language="java" %>

<%
String eid = (String)session.getAttribute("empid2");
session.removeAttribute("empid2");
session.invalidate();
response.sendRedirect("http://localhost:8080/OSM/LoginEmployee.html");
%>
