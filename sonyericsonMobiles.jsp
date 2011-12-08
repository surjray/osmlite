<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>SonyEricson Mobiles: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.sonyMobiles.searchText.select();
  document.sonyMobiles.searchText.focus();
  document.sonyMobiles.search_button.disabled = true;
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
function myMethod(v)
{
  document.sonyMobiles.modelID1.value = v;
  document.sonyMobiles.action = "http://localhost:8080/OSM/product_mobile.jsp";
  document.sonyMobiles.submit();
}

function forward(temp1,temp2,p)
{
  document.sonyMobiles.modelID2.value = temp1;
  document.sonyMobiles.forwarding.value = temp2;
  document.sonyMobiles.price.value = p;
  document.sonyMobiles.action = "http://localhost:8080/OSM/Forward.jsp";
  document.sonyMobiles.submit();
}
function forwardTo(v)
{
  document.sonyMobiles.forwarding.value = "empty"; 
  document.sonyMobiles.count.value = v;
  document.sonyMobiles.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.sonyMobiles.submit();
}
function cart(temp1,p,c,v,m,temp2)
{
  document.sonyMobiles.modelID2.value = temp1;
  document.sonyMobiles.forwarding.value = temp2;
  document.sonyMobiles.price.value = p;
  document.sonyMobiles.catgry.value = c;
  document.sonyMobiles.vendor.value = v;
  document.sonyMobiles.model.value = m;
  document.sonyMobiles.quantity.value = 1; //default
  document.sonyMobiles.action="http://localhost:8080/OSM/Forward.jsp";
  document.sonyMobiles.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" onload="startInit()">
<form name="sonyMobiles" action="" method="get">
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
<br><hr>
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
<font color="#3333FF" face="Arial, Helvetica, sans-serif" size="4">
<input type="hidden" name="modelID1" value="">
<input type="hidden" name="modelID2" value="">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="pageID" value="Mob_SE">
<input type="hidden" name="catgry" value="">
<input type="hidden" name="vendor" value="">
<input type="hidden" name="model" value="">
<input type="hidden" name="quantity" value="">
<input type="hidden" name="count" value="">
<input type="hidden" name="price" value="">
<font color="#000000" size="2">
Go To: &nbsp;
</font>
<font size="2">
<a href="samsungMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Samsung Mobiles</a>
&nbsp;&nbsp;
<a href="motorolaMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Motorola Mobiles</a>
&nbsp;&nbsp;
<a href="nokiaMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Nokia Mobiles</a>
&nbsp;&nbsp;
<a href="flyMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Fly Mobiles</a>
</font>
<br><br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="935"></iframe>
</font>
<div id="main">
<a name="top"></a>
<!--
<table border="0" align="left">
<tr>
<td rowspan="3">
<img src="osm_logo.png" border="0" align="left" width="120" height="120" />
</td>
<td>
<font face="Times New Roman, Times, serif" color="#000000">
<h2>Welcome! to OSMlite.com</h2>
</font>
</td>
<td>&nbsp;</td>

<td>&nbsp;

</td>
</tr>
<tr>
<td>
<font face="Times New Roman, Times, serif" color="#000000">
<b> [ </b><a href="Login.html"><b>Sign in</b></a> <b>,</b> <a href="registration.html"><b> Register</b></a> <b>]</b>
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
<br><br><br><br><br><br><br><hr>
-->
<table border="0" align="center" cellspacing="3" cellpadding="3" bgcolor="#FFFFCC" width="90%">
<caption align="top"><font color="#FF6666" face="Tahoma">
<h2>~ <u>SonyEricson Mobiles</u> ~</h2>
</font>
</caption>
<!--<tr>
<td colspan="4"><hr></td>
</tr> -->
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobSEW350i")'><img  border="2" src="images/mobiles/sony/sonyericsson_w350i_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobSEW350i","8250","Mobile","SonyEricson","SonyEricson: W350i","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson: W350i</font>
</td>
<td><input type="button" value="Buy Now" name="b1" onclick='forward("mobSEW350i","Buy.jsp","8250")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.8,250</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="3">
<b>Click for specifications</b>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobSES500")'><img border="2" src="images/mobiles/sony/SonyEricsson_S500_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobSES500","9250","Mobile","SonyEricson","SonyEricson: S500","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson: S500</font>
</td>
<td><input type="button" value="Buy Now" name="b2" onclick='forward("mobSES500","Buy.jsp","9250")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.9,250</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="3">
<b>Click for specifications</b>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobSEW910i")'><img border="2" src="images/mobiles/sony/SonyEricsson_W910i_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobSEW910i","5400","Mobile","SonyEricson","SonyEricson: W910i","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson: W910i</font>
</td>
<td><input type="button" value="Buy Now" name="b3" onclick='forward("mobSEW910i","Buy.jsp","5400")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.5,400</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="3">
<b>Click for specifications</b>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobSEZ610i")'><img border="2" src="images/mobiles/sony/SonyEricsson_Z610i_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobSEZ610i","11500","Mobile","SonyEricson","SonyEricson: Z610i","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson: Z610i</font>
</td>
<td><input type="button" value="Buy Now" name="b4" onclick='forward("mobSEZ610i","Buy.jsp","11500")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.11,500</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="3">
<b>Click for specifications</b>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobSER300")'><img border="2" src="images/mobiles/sony/sonyericson_r300_s.jpg" height="100" width="87"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobSER300","7850","Mobile","SonyEricson","SonyEricson: R300","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
SonyEricson: R300</font>
</td>
<td><input type="button" value="Buy Now" name="b5" onclick='forward("mobSER300","Buy.jsp","7850")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.7,850</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="3">
<b>Click for specifications</b>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>
</table>
</div>
<br><br>
<center>
<a href="#top">Back to Top</a>
</center>
<br>
<hr />
<!--
---------------------------------------Advertisement Begin-----------------------------
-->
<font color="#000000" size="2">
<center>
<strong><u>Ads By Google</u></strong>
</center>
<br>
<a href="www.samsung.com" target="_blank" style="color:#000000" title="samsung.com">
<img src="images/advertisement/Samsung13,990_i8_L1.jpg" align="left" width="100" height="50" />
</a>
Experience photography,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Learn Web Programming, Go to </strong>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Visit </strong>
<a href="http://www.amazon.com" target="_blank" style="color:#FF3300">
www.amazon.com
</a>
<br> visit
<a href="http://www.samsung.com" target="_blank" style="color:#FF3300">
samsung.com
</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="http://www.coreservlets.com" target="_blank" style="color:#FF3300">
coreservlets.com
</a>
</font>
<!--
----------------------------------------Advertisement End-------------------------------
-->
<br><br>
<div id="footer">
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</div>  
</font>
</form>
</body>
</html>

