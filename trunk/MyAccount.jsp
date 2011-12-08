<%@ page import="java.sql.*" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
<title>My Account: OSMlite.com</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">

function forward(temp)
{
  document.myAccount.forwarding.value = temp;
  document.myAccount.action = "http://localhost:8080/OSM/Forward.jsp";
  document.myAccount.submit();
}

function forwardTo(v)
{
  document.myAccount.forwarding.value = "empty"; 
  document.myAccount.count.value = v;
  document.myAccount.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.myAccount.submit();
}

</script>
</head>
<body bgcolor="white">
<form name="myAccount" method="post">
<div id="header"></div>
<font color="#9933FF" face='Arial, Helvetica, sans-serif'>
<input type="hidden" name="forwarding" value="">
<!--<input type="hidden" name="forwarding2" value="">-->
<input type="hidden" name="count" value="">
<!--<input type="hidden" name="modelID2" value="null">-->
<!--<input type="hidden" name="pageID" value="MyAccount">-->
<!--
<table border="0" align="left">
<tr>
<td rowspan="3">
<img src="osm_logo.png" border="0" align="left" width="128" height="128" />
</td>
<td>&nbsp;

</td>
<td>&nbsp;</td>

<td>&nbsp;

</td>
</tr>
<tr>
<td>
<font color="#000000" style="font-family:'Monotype Corsiva','Times New Roman'; font-size: 36px;">
<h2>Welcome! to OSMlite.com</h2>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>

</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
</table>
<br><br><br><br><br><br><br><br><br><hr>
-->
<%
String uid = (String)session.getAttribute("userid2");
String sql = "SELECT firstname,lastname,email,userid,phone,address,city,pincode FROM user WHERE userid='"+ uid +"'";
String firstname = null;
String lastname = null;
String email = null;
String userid = null;
String phone = null;
String address = null;
String city = null;
String pincode = null;
if(uid != null){
%>
<br><br>
<table bgcolor="#99CC99" border="0" align="center" cellpadding="5" cellspacing="5">
<caption align="top">
<center>
<font color="#000000" face="Times New Roman, Times, serif">
<h1>~: <u>My Account details</u> :~</h1>
</font>
</center>
</caption>
<tr>
<td align="center">
<img src="images/user.JPG"/>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc:odbc:OSM","","");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

while(rs.next())
{
  firstname = rs.getString(1);
  lastname = rs.getString(2);
  email = rs.getString(3);
  userid = rs.getString(4);
  phone = rs.getString(5);
  address = rs.getString(6);
  city = rs.getString(7);
  pincode = rs.getString(8);
 }
 rs.close();
 stmt.close();
 con.close();
 }catch(SQLException e){}
 catch(Exception e){}
%>
 
 <tr>
 <td align="left">
 <font color="#9933FF" face='Arial, Helvetica, sans-serif'>
 <h2>Name: </h2></font>
 </td>
 <td>
 <font color="#000000" face="Times New Roman, Times, serif">
 <h3> <%= firstname %>&nbsp;<%= lastname %> </h3>
 </font>
 </td>
 <td>&nbsp;</td>
 <td>&nbsp;</td>
 </tr>
 <tr>
 <td align="left">
 <font color="#9933FF" face='Arial, Helvetica, sans-serif'>
 <h2>E-mail: </h2></font>
 </td>
 <td>
 <font color="#000000" face="Times New Roman, Times, serif">
 <h3><%= email %></h3> 
 </font>
 </td>
 <td>
 <b><a href="#" onClick='forward("changeEmail.html")' style="text-decoration:none; color:#CC6600" onMouseOver="style='text-decoration:underline; color:#9966FF; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'">Change E-mail ID</a></b>
 </td>
 <td rowspan="2" align="center">
 <a href="#" onClick='forwardTo("1")' style="color:#CC6600" onMouseOver="style='color:black'" onMouseOut="style='color:#CC6600'"><img src="images/shop2.png" border="1" height="75" width="75" /></a>
 </td>
 </tr>
 <tr>
 <td align="left">
 <font color="#9933FF" face='Arial, Helvetica, sans-serif'>
 <h2>User-id: </h2></font>
 </td>
 <td>
 <font color="#000000" face="Times New Roman, Times, serif">
 <h3><%= userid %> </h3>
 </font>
 </td>
 <td>
 <b><a href="#" onClick='forward("changePassword.html")' style="text-decoration:none; color:#CC6600" onMouseOver="style='text-decoration:underline; color:#9966FF; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'">Change Password</a></b>
 </td>
 </tr>
 <tr>
 <td align="left">
 <font color="#9933FF" face='Arial, Helvetica, sans-serif'>
 <h3>Phone Number: </h3></font>
 </td>
 <td>
 <font color="#000000" face="Times New Roman, Times, serif">
 <h3><%= phone %> </h3>
 </font>
 </td>
 <td>
 <b><a href="#" onClick='forward("changePhone.html")' style="text-decoration:none; color:#CC6600" onMouseOver="style='text-decoration:underline; color:#9966FF; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'">ChangePhoneNumber</a></b>
 </td>
 <td align="char"><b><u>QuickShoppingCart</u></b></td>
 </tr>
 <tr>
 <td align="left">
 <font color="#9933FF" face='Arial, Helvetica, sans-serif'>
 <h2>Address: </h2></font>
 </td>
 <td>
 <font color="#000000" face="Times New Roman, Times, serif">
 <h3><%= address %>, <%= city %>:- <%= pincode %></h3>
 </font>
 </td>
 <td>
 <b><a href="#" onClick='forward("changeAddress.html")' style="text-decoration:none; color:#CC6600" onMouseOver="style='text-decoration:underline; color:#9966FF; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'">Change Address</a></b>
 </td>
 <td>&nbsp;</td>
 </tr>
 </table>
 <br><br><hr>
 <center>
 <a href="Logout.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Logout</b></a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="index_dream.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Go to Home page</b></a>
 </center>
<hr>
 <%
 } 
  else
 {
 %>
 
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
 <font color="red">  
 <h1>You have already Logged Out!</h1>
 </font>
 <h2>Please Login again to see/change your account details. </h2>
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

 <!--
 <a href="Home.html" style="color:#CC6600" onMouseOver="style='text-decoration:none; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:underline; color:#CC6600'"><b>Go to Home page</b></a>
 &nbsp;&nbsp;&nbsp;
 <a href="Login.html" style="color:#CC6600" onMouseOver="style='text-decoration:none; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:underline; color:#CC6600'"><b>Go to Login page</b></a>
 -->
 <br><br>
 <div id="footer">
<center>
Footer
</center>
</div>
 <%
 }
 %>

 
 
 </font>
 </form>
 </body>
 </html>