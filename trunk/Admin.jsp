<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Administrator: OSMLite.com</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function forward(temp)
{
  document.admin.category.value=temp;
  document.admin.action="http://localhost:8080/OSM/EditEmployee.jsp";
  document.admin.submit();
}
</script>
</head>

<body>
<form name="admin" method="post" action="">
<div id="header"></div>
<hr>
<input type="hidden" name="category" value="" />
<font size="4">
<%
String eid = (String)session.getAttribute("empid2");
if(eid != null){
%>
<table bgcolor="#CCCC99" border="0" align="center" width="90%" cellspacing="15">
<caption align="center"><font color="#663399" size="4"><h2><u>Administrative Function</u></h2></font></caption>
<tr>
<td align="center">
<a href="EmployeeRegistration.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Create Administrator ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="#" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'" onclick='forward("Admin")'><b>Edit Administrator ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="EmployeeRegistration.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Create Sales Manager ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="#" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'" onclick='forward("Sales Manager")'><b>Edit Sales Manager ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="EmployeeRegistration.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Create Accounts Manager ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="#" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'" onclick='forward("Accounts Manager")'><b>Edit Accounts Manager ID</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="Sales_Manager.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Check Sales Manager Function</b></a>
</td>
</tr>
<tr>
<td align="center">
<a href="Accounts_Manager.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Check Accounts Manager Function</b></a>
</td>
</tr>
</table>
<br>
<hr>

<center>
<a href="http://localhost:8080/OSM/LogoutEmployee.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Logout</b></a>
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
</font>
</form>
</body>
</html>
