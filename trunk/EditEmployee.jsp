<%@ page import="java.sql.*" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Edit Employee: OSMLite.com</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
</head>

<body>
<form name="edit" method="post">
<div id="header"></div>
<hr>

<%
String eid = (String)session.getAttribute("empid2");
if(eid != null){
String category = request.getParameter("category");
String fname = null;
String lname = null;
String email = null;
String empid = null;
String password = null;
String phone = null;
String address = null;
String city = null;
String pin = null;
String sql = "SELECT firstname,lastname,email,empid,phone,address,city,pincode,password FROM employee WHERE category='"+ category +"'";
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc:odbc:OSM","","");
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
%>

<table border="1" align="center">
<caption align="center"><h2>~ <u><%= category %> Details</u> ~</h2></caption>
<tr>
<th>First Name</th>
<th>Last Name</th>
<th>Email-ID</th>
<th>Employee ID</th>
<th>Password</th>
<th>Phone</th>
<th>Address</th>
<th>City</th>
<th>Pincode</th>
</tr>

<%
while(rs.next())
{
  fname = rs.getString(1);
  lname = rs.getString(2);
  email = rs.getString(3);
  empid = rs.getString(4);
  phone = rs.getString(5);
  address = rs.getString(6);
  city = rs.getString(7);
  pin = rs.getString(8);
  password = rs.getString(9);
%>

<tr>
<td><%= fname %></td>
<td><%= lname %></td>
<td><%= email %></td>
<td><%= empid %></td>
<td><%= password %></td>
<td><%= phone %></td>
<td><%= address %></td>
<td><%= city %></td>
<td><%= pin %></td>
</tr>

<%
}
}catch(SQLException e){}
 catch(Exception e){}
%>

</table>
<hr>
<font size="4">
<table border="0" bgcolor="#CCCC99" cellspacing="15" align="center" width="80%">
<caption align="center"><font color="#663399" size="4"><h2><u>Editable Fields</u></h2></caption>
<tr>
<td align="center">
<a href="ChangeEmpPassword.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Change Password</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="ChangeEmpEmail.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Change Email-ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="ChangeEmpAddress.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Change Address</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="ChangeEmpPhone.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Change Phone Number</b></a>
</td>
</tr>
</table>
<br>
<hr>

<center>
<a href="http://localhost:8080/OSM/LogoutEmployee.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Logout</b></a>
&nbsp;&nbsp;&nbsp;
<a href="http://localhost:8080/OSM/Admin.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Administrative Page</b></a>
</center>

<%
}
else{
%>
<h2>You have already Logged out...</h2>
<br><br><br><br><br><br><br><br><br><br><br><br>
<hr>
<center>
<a href="http://localhost:8080/OSM/LoginEmployee.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Employee Login Page</b></a>
</center>
<%
}
%>
</form>
</body>
</html>