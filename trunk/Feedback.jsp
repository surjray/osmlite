<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Feedback Accepted</title>
  <link rel="stylesheet" href="sb_Styles11.css" type="text/css"/>
</head>

<body>
<div id="header"></div>
<div id="main" style="text-align:center">
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String city=request.getParameter("city");
String country=request.getParameter("country");
String phone=request.getParameter("phone");
String fb_type=request.getParameter("fb_type");
String feedback=request.getParameter("feedback");

    Connection cn=null;
    Statement st=null;
    String qr="insert into feedbacks(name,email,city,country,phone,fb_type,feedback) values('"+name+"','"+email+"','"+city+"','"+country+"','"+phone+"','"+fb_type+"','"+feedback+"')";
	try {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    cn=DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
    st=cn.createStatement();
    st.executeUpdate(qr);
%>	

<br /><br /><br /><br />
<span style="font-size:24px; font-family: Georgia, 'Times New Roman', Times, serif; color:#FF0000; padding: 50px">
Thank you for your valuable feedback.<br /><br />Please visit again.
</span>
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
<% }catch(SQLException sqle){ %>  

<br /><br /><br /><br />
<span style="font-size:24px; font-family: Georgia, 'Times New Roman', Times, serif; color:#FF0000; padding: 50px">
Error:&nbsp;<%= sqle.getMessage() %>
</span>
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
<br /><br /><br /> 
<%  } catch(Exception e){ %>  

<br /><br /><br /><br />
<span style="font-size:24px; font-family: Georgia, 'Times New Roman', Times, serif; color:#FF0000; padding: 50px">
Error:&nbsp;<%= e.getMessage() %>
</span>
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
<br /><br /><br />
<%  } finally {
	try {
	if(st!=null)st.close();
        if(cn!=null)cn.close();
    }catch(SQLException sqle){}
 }
%>
</div>
<div id="footer">
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</div>     
</body>
</html>
