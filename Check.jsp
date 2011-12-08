<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%
String firstname=request.getParameter("fname");
String middlename=request.getParameter("mname");
String lastname=request.getParameter("lname");
String email=request.getParameter("email");
String userid=request.getParameter("uid");
String password=request.getParameter("password1");
String phone=request.getParameter("pnumber");
String dob_month=request.getParameter("month1");
String dob_date=request.getParameter("date1");
String dob_year=request.getParameter("year1");
String address=request.getParameter("address1");
String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String pincode=request.getParameter("pin");
String sex=request.getParameter("sex");
int m=0;
String sql="SELECT userid FROM user WHERE userid= '" + userid +"'";

try{
Statement st=null;
ResultSet rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:OSM","","");

st=cn.createStatement();

rs=st.executeQuery(sql);
if(rs.next())
 m++;

if(m==0)
{ %>
<html>
<head>
<title>Welcome to OSMlite!</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
</head>
<body bgcolor="white">
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
<font color="#9933CC" face="Bookman Old Style, Microsoft Sans Serif, Tahoma, Modern">
<h1>Welcome!&nbsp;<%= firstname %></h1>
<h3>You have successfully registered with us!!!</h3><br>
<h2>Please login with your userid & password to use the services provided by us.</h2>
<br><br><br><br>
<center>
<font color="#000000">
<strong><u>Ads by Google</u></strong>
</font>
</center>
<br>
<!--
--------------------------------------Advertisement Start---------------------------------
-->
<a href="http://www.samsung.com" target="_blank" title="Go to samsung.com">
<img src="images/advertisement/mainrev_visual_00.jpg" height="200" width="765" />
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
</body>
</html>
<%
st.executeUpdate("insert into user values('"+firstname+"','"+middlename+"','"+lastname+"','"+email+"','"+userid+"','"+password+"','"+phone+"','"+dob_month+"','"+dob_date+"','"+dob_year+"','"+address+"','"+country+"','"+state+"','"+city+"','"+pincode+"','"+sex+"')");
}

else
{
%>
<jsp:forward page="errorRegistration.html"/>
<%}
}
catch(SQLException e){}
catch(Exception e){}
%>
