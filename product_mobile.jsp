<%@ page import="java.sql.*" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Mobile Specifications: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.specificationMobile.searchText.select();
  document.specificationMobile.searchText.focus();
  document.specificationMobile.search_button.disabled = true;
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
function cart_buy(temp1,p,c,v,m,page_id,temp2)
{
  document.specificationMobile.modelID2.value = temp1;
  document.specificationMobile.forwarding.value = temp2;
  document.specificationMobile.price.value = p;
  document.specificationMobile.catgry.value = c;
  document.specificationMobile.vendor.value = v;
  document.specificationMobile.model.value = m;
  document.specificationMobile.quantity.value = 1; //default
  document.specificationMobile.pageID.value = page_id;
  document.specificationMobile.action="http://localhost:8080/OSM/Forward.jsp";
  document.specificationMobile.submit();
}
function forwardTo(v)
{
  document.specificationMobile.forwarding.value = "empty"; 
  document.specificationMobile.count.value = v;
  document.specificationMobile.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.specificationMobile.submit();
}
</script>
</head>
<body bgcolor="white" onload="startInit()">
<form name="specificationMobile" method="get">
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
   String source1=null;
   String source2=null;
   String model=null;
   double price=0.0;
   String vendor=null;
   String FMradio=null;
   String camera=null;
   String mp3=null;
   String video=null;
   String memoryCard=null;
   String gprs=null;
   String mms=null;
   String email=null;
   String cdma=null;
   String category=null;
   String pid = request.getParameter("modelID1");
   String pageID = request.getParameter("pageID");
   String sql = "SELECT    model,price,vendorID,FMradio,camera,mp3player,videorecording,memorycard,GPRS,MMS,email,GSM,source1,source2,category FROM product WHERE productID='"+ pid +"'";
   
  try{
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery(sql);

while(rs.next())
{
     model=rs.getString(1);
	 price=rs.getDouble(2);
	 vendor=rs.getString(3);
	 FMradio=rs.getString(4);
	 camera=rs.getString(5);
	 mp3=rs.getString(6);
	 video=rs.getString(7);
	 memoryCard=rs.getString(8);
	 gprs=rs.getString(9);
	 mms=rs.getString(10);
	 email=rs.getString(11);
	 cdma=rs.getString(12);
	 source1=rs.getString(13);
	 source2=rs.getString(14);
	 category=rs.getString(15);
  }
  rs.close();
  stmt.close();
  con.close();
 }catch(SQLException e){}
  catch(Exception e){}
%>


<!--
<table border="0" align="left">
<tr>
<td rowspan="3">
<img src="osm_logo.png" border="0" align="left" width="130" height="130" />
</td>

<%
  if(uid != null){
%>

<td>
<font face="Times New Roman, Times, serif" color="#000000">
<h2>Welcome! <%= uid %> to OSMlite.com</h2>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>

<%
  }
  else{
%>

<td>
<font face="Times New Roman, Times, serif" color="#000000">
<h2>Welcome! to OSMlite.com</h2>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>
<font face="Times New Roman, Times, serif" color="#000000">
<b> [ </b><a href="Login.html"><b>Sign in</b></a> <b>,</b> <a href="registration.html"><b> Register</b></a> <b>]</b>
</font>
</td>

<%
  }
%>

<td>&nbsp;</td>
<td>&nbsp;</td>

</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>

</tr>
</table>
<br><br><br><br><br><br><br><hr>
-->
<table bgcolor="#FFFFCC" border="0" cellpadding="5" cellspacing="5">
<caption align="top"><font face="Times New Roman, Times, serif" color="#9900CC">
<h2><u>Specification of <%= model %> </u></h2>
</font>
</caption>
<!--<tr>
<td colspan="6"><hr></td>
</tr>-->
<tr>
<td rowspan="6" align="center">
<a href="#" onmouseover="document.mob.src='<%= source2 %>'" onmouseout="document.mob.src='<%= source1 %>'">
<img border="2" src="<%= source1 %>" width="250" height="250" name="mob">
</a>
</td>
<td><b>Model: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= model %></b>
</font>
</td>
<td rowspan="6">&nbsp;</td>
<td><b>Video Recording: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= video %></b>
</font>
</td>
</tr>
<tr>
<td><b>Price: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= price %></b>
</font>
</td>
<td><b>Memory card: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= memoryCard %></b>
</font>
</td>
</tr>
<tr>
<td><b>Vendor: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= vendor %></b>
</font>
</td>
<td><b>GPRS: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= gprs %></b>
</font>
</td>
</tr>
<tr>
<td><b>FM Radio: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= FMradio %></b>
</font>
</td>
<td><b>MMS/SMS: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= mms %></b>
</font>
</td>
</tr>
<tr>
<td><b>Camera: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= camera %></b>
</font>
</td>
<td><b>E-mail: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= email %></b>
</font>
</td>
</tr>
<tr>
<td><b>MP3 Player: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= mp3 %></b>
</font>
</td>
<td><b>CDMA/GSM: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= cdma %></b>
</font>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="button" name="b1" value="Add to Cart" onclick='cart_buy("<%= pid %>","<%= price %>","<%= category %>","<%= vendor %>","<%= model %>","<%= pageID %>","ShoppingCart.jsp")'></td>
<td align="center"><font face="Arial, Helvetica, sans-serif" color="#9933CC">
<b>Or</b>
</td>
<td><input type="button" name="b2" value="Buy Now" onclick='cart_buy("<%= pid %>","<%= price %>","<%= category %>","<%= vendor %>","<%= model %>","<%= pageID %>","Buy.jsp")'></td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="6"><hr></td>
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