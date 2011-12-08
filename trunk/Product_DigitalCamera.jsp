<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Digital Camera Features: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.specificationDigiCam.searchText.select();
  document.specificationDigiCam.searchText.focus();
  document.specificationDigiCam.search_button.disabled = true;
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
  document.specificationDigiCam.modelID2.value = temp1;
  document.specificationDigiCam.forwarding.value = temp2;
  document.specificationDigiCam.price.value = p;
  document.specificationDigiCam.catgry.value = c;
  document.specificationDigiCam.vendor.value = v;
  document.specificationDigiCam.model.value = m;
  document.specificationDigiCam.quantity.value = 1; //default
  document.specificationDigiCam.pageID.value = page_id;
  document.specificationDigiCam.action="http://localhost:8080/OSM/Forward.jsp";
  document.specificationDigiCam.submit();
}
function forwardTo(v)
{
  document.specificationDigiCam.forwarding.value = "empty"; 
  document.specificationDigiCam.count.value = v;
  document.specificationDigiCam.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.specificationDigiCam.submit();
}
</script>
</head>

<body bgcolor="#FFFFFF" onload="startInit()">
<form name="specificationDigiCam" method="get">
<%
  String uid = (String)session.getAttribute("userid2");
%>
<div id="header"></div>

<div id="tabs">
  <ul>
    <li><a href="http://localhost:8080/OSM/Home.html"><span>Home</span></a></li>
<%
  if(uid == null){
%>
    <li><a href="http://localhost:8080/OSM/Login.html"><span>Sign in</span></a></li>
<%
  }
  else{
%>
    <li><a href="http://localhost:8080/OSM/Logout.jsp"><span>Logout</span></a></li>
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
<font face="Arial, Helvetica, sans-serif" color="#9933CC" size="4">
<input type="hidden" name="modelID2" value="">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="price" value="">
<input type="hidden" name="catgry" value="">
<input type="hidden" name="vendor" value="">
<input type="hidden" name="model" value="">
<input type="hidden" name="quantity" value="">
<input type="hidden" name="pageID" value="">
<input type="hidden" name="count" value="">

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

<%
   String source1=null;
   String source2=null;
   String model=null;
   double price=0.0;
   String vendor=null;
   String zoom=null;
   String camera=null;
   String ipe=null;
   String fdt=null;
   String smileShutter=null;
   String sceneRecognition=null;
   String underWaterMode=null;
   String music=null;
   String cameraRetouching=null;
   String warranty=null;
   String screenSize=null;
   String category=null;
   String pid = request.getParameter("modelID1");
   String pageID = request.getParameter("pageID");
   String sql = "SELECT    model,price,vendorID,zoom,camera,IPE,FDT,smile_shutter,scene_recognition,under_water_mode,music_playback,in_camera_retouching,source1,source2,warranty,screensize,category FROM product WHERE productID='"+ pid +"'";

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
	 zoom=rs.getString(4);
	 camera=rs.getString(5);
	 ipe=rs.getString(6);
	 fdt=rs.getString(7);
	 smileShutter=rs.getString(8);
	 sceneRecognition=rs.getString(9);
	 underWaterMode=rs.getString(10);
	 music=rs.getString(11);
	 cameraRetouching=rs.getString(12);
	 source1=rs.getString(13);
	 source2=rs.getString(14);
	 warranty=rs.getString(15);
	 screenSize=rs.getString(16);
	 category=rs.getString(17);
  }
  rs.close();
  stmt.close();
  con.close();
 }catch(SQLException e){}
  catch(Exception e){}
%>

<table border="0" bgcolor="#FFFFCC" align="center" cellspacing="5" cellpadding="5">
<caption align="top"><font color="#FF6666" face="Tahoma">
<h2><u>Specification of <%= model %> </u></h2>
</font>
</caption>
<tr>
<td colspan="5" align="center">
<a href="#" onmouseover="document.DigiCam.src='<%= source2 %>'" onmouseout="document.DigiCam.src='<%= source1 %>'">
<img border="2" src="<%= source1 %>" width="550" height="300" name="DigiCam">
</a>
</td>
</tr>
<tr>
<td align="center"><b>Model: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= model %></b>
</font>
</td>
<td rowspan="8">&nbsp;</td>
<td align="center"><b>FDT: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= fdt %></b>
</font>
</td>
</tr>
<tr>
<td align="center"><b>Price: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= price %></b>
</font>
</td>
<td align="center"><b>Smile Shutter: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= smileShutter %></b>
</font>
</td>
</tr>
<tr>
<td align="center"><b>Vendor: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= vendor %></b>
</font>
</td>
<td align="center"><b>Scene Recognition: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= sceneRecognition %></b>
</font>
</td>
</tr>
<tr>
<td align="center"><b>Zoom: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= zoom %></b>
</font>
</td>
<td align="center"><b>Under Water Mode: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= underWaterMode %></b>
</font>
</td>
</tr>
<tr>
<td align="center"><b>Camera: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= camera %></b>
</font>
</td>
<td align="center"><b>Music Playback: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= music %></b>
</font>
</td>
</tr>
<tr>
<td align="center"><b>IPE: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= ipe %></b>
</font>
</td>
<td align="center"><b>In Camera Retouching: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= cameraRetouching %></b>
</font>
</td>
</tr>
<tr>
<td align="center"><b>Screen Size: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= screenSize %></b>
</font>
</td>
<td align="center"><b>Warranty: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000" size="3">
<b><%= warranty %></b>
</font>
</td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td align="center"><input type="button" name="b1" value="Add to Cart" onclick='cart_buy("<%= pid %>","<%= price %>","<%= category %>","<%= vendor %>","<%= model %>","<%= pageID %>","ShoppingCart.jsp")'>
</td>
<td align="center"><input type="button" name="b2" value="Buy Now" onclick='cart_buy("<%= pid %>","<%= price %>","<%= category %>","<%= vendor %>","<%= model %>","<%= pageID %>","Buy.jsp")'></td>
</tr>
<tr>
<td colspan="5"><hr></td>
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
