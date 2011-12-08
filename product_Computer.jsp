<%@ page language="java" import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Computer Details</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
<script language="Javascript">
function startInit()
{
  document.Comsp.searchText.select();
  document.Comsp.searchText.focus();
  document.Comsp.search_button.disabled = true;
}

function myFunction(f,v) //checks whether search text is typed or not
{
  f.h1.value = v;
  var x = f.searchText.value;
  
  if(x == "")
  {
    f.search_button.disabled = true;
    alert("Please type what you want to search")
  }
  else{
  f.search_button.disabled = false;
  }
}

function forwardSearch(f)
{
  var temp = f.h1.value;
  
  if(temp == 0)
  {
    alert("Please select a category from the select box")
  }
  else
  {
    f.action="http://localhost:8080/OSM/Search.jsp";
    f.submit();
  }
}
function cart(temp1,p,c,v,m,page_id,temp2)
{
  document.Comsp.modelID2.value = temp1;
  document.Comsp.forwarding.value = temp2;
  document.Comsp.price.value = p;
  document.Comsp.catgry.value = c;
  document.Comsp.vendor.value = v;
  document.Comsp.model.value = m;
  document.Comsp.quantity.value = 1; //default
  document.Comsp.pageID.value = page_id;
  document.Comsp.action="http://localhost:8080/OSM/Forward.jsp";
  document.Comsp.submit();
}
function forwardTo(v)
{
  document.Comsp.forwarding.value = "empty"; 
  document.Comsp.count.value = v;
  document.Comsp.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.Comsp.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" onload="startInit()">
<form name="Comsp" method="get">
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
<hr>
<div id="infobar">
<input type="text" name="searchText" size="70" value="Type vendor name eg. Nokia, Samsung or Book name etc.">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<b>Category: </b>
<select name="category" onChange="myFunction(this.form,this.value)">
<option value="0">[All Categories]</option>
<option value="Mobile">Mobile</option>
<option value="Digital Camera">Digital Camera</option>
<option value="LCD Television">LCD Television</option>
<option value="Computer">Computer</option>
<option value="Book">Books</option>
<option value="Apparel">Apparels</option>
<option value="Watch">Watches</option>
</select>
<input type="button" name="search_button" value="Search" onClick="forwardSearch(this.form)">
<input type="hidden" value="0" name="h1">
</div>
<br>
<font face="Arial, Helvetica, sans-serif" color="#9966FF" size="4">
<input type="hidden" name="modelID2" value="">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="price" value="">
<input type="hidden" name="catgry" value="">
<input type="hidden" name="vendor" value="">
<input type="hidden" name="model" value="">
<input type="hidden" name="quantity" value="">
<input type="hidden" name="pageID" value="">
<input type="hidden" name="count" value="">

<%
String pid= request.getParameter("modelID1");
String pageID = request.getParameter("pageID");
String model=null;
String vendorID=null;
double price=0.0;
String hardDisk=null;
String RAM=null;
String frequency=null;
String motherboard=null;
String OS=null;
String CdWriter=null;
String monitor=null;
String source1=null;
String source2=null;
String category=null;
String sql= "SELECT   model,price,vendorID,hardDisk,RAM,frequency,motherboard,OS,CdWriter,monitor,source1,source2,category FROM product1 WHERE productID='"+ pid +"'";


try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");

Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
model=rs.getString(1);
vendorID=rs.getString(3);
price=rs.getDouble(2);
hardDisk=rs.getString(4);
RAM=rs.getString(5);
frequency=rs.getString(6);
motherboard=rs.getString(7);
OS=rs.getString(8);
CdWriter=rs.getString(9);
monitor=rs.getString(10);
source1=rs.getString(11);
source2=rs.getString(12);
category=rs.getString(13);
}
rs.close();
st.close();
con.close();
}
catch(SQLException e){}
catch(Exception e){}
%>

<table bgcolor="#FFFFCC" border="0" cellpadding="5" cellspacing="5">
<caption align="top"><font face="Times New Roman, Times, serif" color="#9900CC">
<h2><u>SPECIFICATION OF:- <%= model %> </u></h2>
</font>
</caption>
<tr>
<td colspan="6"></td>
</tr>
<tr>
<td rowspan="6" align="center">
<a href="#" onmouseover="document.com.src='<%= source2 %>'" onmouseout="document.com.src='<%= source1 %>'">
<img border="2" src="<%= source1 %>" width="250" height="300" name="com">
</a>
</td>
<td><b>Vendor:</b></td>
<td><font color="#000000"><b><%=vendorID %></b></font></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><b>Price:</b></td>
<td><font color="#000000"><b><%=price %></b></font></td>
</tr>
<tr>
<td><b>Hard-Disk:</b></td>
<td><font color="#000000"><b><%=hardDisk %></b></font></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><b>RAM:</b></td>
<td><font color="#000000"><b><%=RAM %></b></font></td>
</tr>
<tr>
<td><b>Frequency:</b></td>
<td><font color="#000000"><b><%=frequency %></b></font></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><b>Motherboard:</b></td>
<td><b><font color="#000000"><%=motherboard %></b></font></td>
</tr>
<tr>
<td><b>CD/DVD Writer:</b></td>
<td><font color="#000000"><b><%=CdWriter %></b></font></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><b>Monitor:</b></td>
<td><font color="#000000"><b><%=monitor %></b></font></td>
</tr>
<tr>
<td><b>O/S:</b></td>
<td><font color="#000000"><b><%= OS %></b></font></td>
<td>&nbsp;</td>
<br>
<tr>
<td><input type="button" name="b1" value="Add to Cart" onclick='cart("<%= pid %>","<%= price %>","<%= category %>","<%= vendorID %>","<%= model %>","<%= pageID %>","ShoppingCart.jsp")'></td>
<td align="center"><font face="Arial, Helvetica, sans-serif" color="#9933CC">
<b>Or</b>
</td>
<td><input type="button" name="b2" value="Buy" onclick='cart("<%= pid %>","<%= price %>","<%= category %>","<%= vendorID %>","<%= model %>","<%= pageID %>","Buy.jsp")'></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="7"><hr></td>
</tr>
</table>
<br>
<font color="#000000" face="Times New Roman, Times, serif">
<strong><u>Payment Methods Accepted</u> :-</strong><br><br>EMI: 3 Easy Monthly Installments (Available on CITI Bank and ICICI Bank Credit Card Only)<br>Credit Card: VISA | Master Card | American Express | Citibank Diner<br>Cheque.<br>Net Banking: ICICIBank.com | HDFC Bank Direct Pay | Federal Bank - FedNet | ITZ Cash<br>Cash on Delivery - COD
</font>
<br><br>
<div id="footer">
<center>
<a href="#top"><b>Back to top</b></a>
</center>
</div>
</font>
</form>
</body>
</html>