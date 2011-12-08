<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>LCD TeleVision specifications: OSMlite.com</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.specificationLCD.searchText.select();
  document.specificationLCD.searchText.focus();
  document.specificationLCD.search_button.disabled = true;
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
  document.specificationLCD.modelID2.value = temp1;
  document.specificationLCD.forwarding.value = temp2;
  document.specificationLCD.price.value = p;
  document.specificationLCD.catgry.value = c;
  document.specificationLCD.vendor.value = v;
  document.specificationLCD.model.value = m;
  document.specificationLCD.quantity.value = 1; //default
  document.specificationLCD.pageID.value = page_id;
  document.specificationLCD.action="http://localhost:8080/OSM/Forward.jsp";
  document.specificationLCD.submit();
}
function forwardTo(v)
{
  document.specificationLCD.forwarding.value = "empty"; 
  document.specificationLCD.count.value = v;
  document.specificationLCD.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.specificationLCD.submit();
}
</script>
</head>

<body bgcolor="#FFFFFF" onload="startInit()">
<form name="specificationLCD" method="get">
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
<font face="Tahoma" color="#990000" size="4">
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
   String powerSupply=null;
   String powerConsumption=null;
   String dimension=null;
   String screenSize=null;
   String screenAspectRatio=null;
   String resolution=null;
   String colourSystem=null;
   String dataSignals=null;
   String tvScanLines=null;
   String speaker=null;
   String audioAmplifier=null;
   String fccClass=null;
   String viewableAngle=null;
   String brightness=null;
   String contrastRatio=null;
   String pictureInPicture=null;
   String design=null;
   String warranty=null;
   String category=null;
   String pid = request.getParameter("modelID1");
   String pageID = request.getParameter("pageID");
   String sql = "SELECT    model,price,vendorID,source1,source2,warranty,powersupply,powerconsumption,dimension,screensize,screenaspectratio,resolution,coloursystem,datasignals,tvscanlines,speaker,audioamplifier,FCCclass,viewableangle,brightness,contrastratio,pictureinpicture,designLCDtv,category FROM product WHERE productID='"+ pid +"'";

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
	 source1=rs.getString(4);
	 source2=rs.getString(5);
	 warranty=rs.getString(6);
	 powerSupply=rs.getString(7);
     powerConsumption=rs.getString(8);
     dimension=rs.getString(9);
     screenSize=rs.getString(10);
     screenAspectRatio=rs.getString(11);
     resolution=rs.getString(12);
     colourSystem=rs.getString(13);
     dataSignals=rs.getString(14);
     tvScanLines=rs.getString(15);
     speaker=rs.getString(16);
     audioAmplifier=rs.getString(17);
     fccClass=rs.getString(18);
     viewableAngle=rs.getString(19);
     brightness=rs.getString(20);
     contrastRatio=rs.getString(21);
     pictureInPicture=rs.getString(22);
     design=rs.getString(23);
	 category=rs.getString(24);
  }
  rs.close();
  stmt.close();
  con.close();
 }catch(SQLException e){}
  catch(Exception e){}
%>

<table border="0" align="center"  bgcolor="#FFFFFF" bordercolor="#FFFFFF" cellpadding="1" cellspacing="5">
<caption align="top"><font face="Times New Roman, Times, serif" color="#9900CC">
<h2><u>Specification of <%= model %> </u></h2>
</font>
</caption>
<tr>
<td colspan="2" align="center">
<a href="#" onmouseover="document.LCD.src='<%= source2 %>'" onmouseout="document.LCD.src='<%= source1 %>'">
<img border="0" src="<%= source1 %>" width="550" height="350" name="LCD">
</a>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF" align="left" colspan="2">
<font color="#663399" face="Tahoma" size="5">
<b> Vendor Specifications :- </b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Model: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= model %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Price: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= price %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Vendor: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= vendor %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Warranty: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= warranty %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF" align="left" colspan="2">
<font color="#663399" face="Tahoma" size="5">
<b> Dimension & General Specifications :- </b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Power Supply: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= powerSupply %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Power Consumption: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= powerConsumption %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Dimension: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= dimension %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Screen Size: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= screenSize %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Screen Aspect Ratio: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= screenAspectRatio %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Resolution: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= resolution %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Colour System: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= colourSystem %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Data Signals: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= dataSignals %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>TV Scan Lines: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= tvScanLines %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Speaker: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= speaker %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Audio Amplifier: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= audioAmplifier %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>FCC Class: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= fccClass %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Brightness: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= brightness %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Contrast Ratio: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= contrastRatio %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Picture In Picture: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= pictureInPicture %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFFFFF" align="left" colspan="2">
<font color="#663399" face="Tahoma" size="5">
<b> Design Specifications :- </b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Viewable Angle: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= viewableAngle %></b>
</font>
</td>
</tr>
<tr>
<td bgcolor="#FFCC99" align="left"><b>Design: </b></td>
<td align="center"><font face="Times New Roman, Times, serif" color="#000000">
<b><%= design %></b>
</font>
</td>
</tr>
<tr bordercolor="#000033">
<td align="center" bgcolor="#FFFFFF"><input type="button" name="b1" value="Add to Cart" onclick='cart_buy("<%= pid %>","<%= price %>","<%= category %>","<%= vendor %>","<%= model %>","<%= pageID %>","ShoppingCart.jsp")'>
</td>
<td align="center" bgcolor="#FFFFFF"><input type="button" name="b2" value="Buy Now" onclick='cart_buy("<%= pid %>","<%= price %>","<%= category %>","<%= vendor %>","<%= model %>","<%= pageID %>","Buy.jsp")'></td>
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
