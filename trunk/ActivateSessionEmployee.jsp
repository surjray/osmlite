<%@ page language="java" %>

<%
String eid = (String)request.getAttribute("empid1");
String URL = (String)request.getAttribute("url");
session.setAttribute("empid2",eid);
session.setMaxInactiveInterval(1200);
%>
<jsp:forward page="<%= URL %>"/>