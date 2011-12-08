<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
String firstname=request.getParameter("fname");
String middlename=request.getParameter("mname");
String lastname=request.getParameter("lname");
String email=request.getParameter("email");
String empid=request.getParameter("uid");
String password=request.getParameter("password1");
String phone=request.getParameter("pnumber");
String pageUrl=request.getParameter("url");
String category=request.getParameter("category");
//String dob_year=request.getParameter("year1");
String address=request.getParameter("address1");
String country=request.getParameter("country");
String state=request.getParameter("state");
String city=request.getParameter("city");
String pincode=request.getParameter("pin");
//String sex=request.getParameter("sex");
int m=0;
String sql="SELECT empid FROM employee WHERE empid= '" + empid +"'";

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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Success Registration: OSMlite.com</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
</head>

<body>
<div id="header"></div>
<hr>
<font color="#FF9966" face="Tahoma, Modern">
<h1>Welcome!&nbsp;<%= firstname %></h1>
<h3>You have successfully registered with us as a/an <%= category %>!!!</h3><br>
<h2>Please Login with the userid & password to perform <%= category %> functions.</h2>
<br><br><br><br>

<br><br><br><br>
<div id="footer">
<center>
<center>
<a href="Admin.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Administrative page</b></a>
</center>
</center>
</div>
</body>
</html>
<%
st.executeUpdate("insert into employee values('"+firstname+"','"+middlename+"','"+lastname+"','"+empid+"','"+password+"','"+address+"','"+phone+"','"+email+"','"+pageUrl+"','"+country+"','"+state+"','"+city+"','"+pincode+"','"+category+"')");
}
else
{
%>
<jsp:forward page="errorEmployeeRegistration.html"/>
<%}
}
catch(SQLException e){}
catch(Exception e){}
%>
