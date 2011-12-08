<%@ page import="java.sql.*" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
<title>Change Phone: OSMlite</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
<script language="javascript">
function forwardTo(v)
{
  document.changePhone.forwarding.value = "empty"; 
  document.changePhone.count.value = v;
  document.changePhone.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.changePhone.submit();
}
</script>
</head>
<body bgcolor="white">
<form name="changePhone">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="count" value="">
<%
  String uid = (String)session.getAttribute("userid2");
%>
<div id="header"></div>

<div id="tabs">
  <ul>
    <li><a href="http://localhost:8080/OSM/index_dream.html" title="Go to Home page"><span>Home</span></a></li>
<%
  if(uid == null){
%>
    <li><a href="http://localhost:8080/OSM/Login.html" title="Go to Login page"><span>Sign in</span></a></li>
<%
  }
  else{
%>
    <li><a href="http://localhost:8080/OSM/Logout.jsp" title="Logout"><span>Logout</span></a></li>
<%
  }
  if(uid == null){
%>
    <li><a href="http://localhost:8080/OSM/registration.html" title="Register"><span>Register</span></a></li>
<%
  }
%>
    <li><a href="http://localhost:8080/OSM/aboutus.html" title="About Us"><span>About us</span></a></li>
<%
  if(uid != null){
%>
    <li><a href="#" onclick='forwardTo("1")' title="Quick Shopping Cart"><span>Shopping Cart</span></a></li>
<%
  }
%>
    <li><a href="http://localhost:8080/OSM/MyAccount.jsp" title="My OSMlite"><span>My Account</span></a></li>
    <li><a href="http://localhost:8080/OSM/Feedback.html" title="Give Feedback" target="_blank"><span>Feedback</span></a></li>
  </ul>
</div>
<br><hr>
<font color="#000000" face="Times New Roman, Times, serif">

<%
String newPhone = request.getParameter("phone2");
String uid1 = request.getParameter("uid");
String sql = "UPDATE user SET phone= '"+ newPhone +"' WHERE userid= '"+ uid1 +"'";
//String uid2 = (String)session.getAttribute("userid2");

if(uid != null){
try
{
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con = DriverManager.getConnection("jdbc:odbc:OSM","","");
  Statement stmt = con.createStatement();
  stmt.executeUpdate(sql);
}catch(SQLException e){}
catch(Exception e){}

%>

<h1>Welcome!&nbsp;<%= uid %></h1>
<h2>Your Phone Number Has Been Successfully Changed. Please Login Again.</h2>


<%
session.removeAttribute("userid2");
session.invalidate();
}
else
{
%>

<font color="red">
<h1>Error! You Have Already Logged Out!</h1>
</font>
<h2> Please Login Again to Change Your Phone Number.</h2>


<%
}
%>

<br><br><br><br><br>
 
<center>
<font color="#000000">
<strong><u>
Ads by Google</u></strong>
</font>
</center>
<br>
<!--
--------------------------------------Advertisement Start---------------------------------
-->
<a href="http://www.naukri.com" target="_blank" title="Go to naukri.com">
<img src="images/advertisement/imgad.gif" height="90" width="765" />
</a>
<!--
--------------------------------------Advertisement End-----------------------------------
-->
<br><br>
<div id="footer">
<center>
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</center>
</div>
</font>
</form>
</body>
</html>
