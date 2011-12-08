<%@ page language="java" %>

<%
String uid = (String)request.getAttribute("userid1");
session.setAttribute("userid2",uid);
session.setMaxInactiveInterval(1200);
response.sendRedirect("http://localhost:8080/OSM/index_dream.jsp");
%>