<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Values Accpeted</title>
  <link rel="stylesheet" href="sb_Styles11.css" type="text/css"/>
</head>

<body>
<div id="header"></div>
<div id="main" style="text-align:center">
<%
String user=request.getParameter("userid");
String amount=request.getParameter("amt");
String credit_no=request.getParameter("ccn");
String cvv_no=request.getParameter("cvv");
String cname=request.getParameter("country");


    Connection cn=null;
    Statement st=null;
    String qr="insert into accounts values('"+user+"','"+amount+"','"+credit_no+"','"+cvv_no+"','"+cname+"')";
	try {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    cn=DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
    st=cn.createStatement();
    st.executeUpdate(qr);
    st.close();
    cn.close();
  }
    catch(SQLException e){}
    catch(Exception e){}
%>
<br /><br /><br /><br />
<!--
<span style="font-size:24px; font-family:Verdana, Arial, Helvetica, sans-serif; color:#FF0000; padding: 50px">
-->
<font size="4">
The Sales Manager has sent the sales information to the Accounts Manager<br /><br /><br>The accounts Manager will now view the information and send it to the Payment Gateway!!!
</font>
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
</div>
<div id="footer">
<center>
<a href="http://localhost:8080/OSM/Admin.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Administrative Page</b></a>
</center>
</div>     
</body>
</html>
	