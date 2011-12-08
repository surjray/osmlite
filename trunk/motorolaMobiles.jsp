<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Motorola Mobiles: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.motoMobiles.searchText.select();
  document.motoMobiles.searchText.focus();
  document.motoMobiles.search_button.disabled = true;
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
  document.motoMobiles.modelID1.value = v;
  document.motoMobiles.action = "http://localhost:8080/OSM/product_mobile.jsp";
  document.motoMobiles.submit();
}

function forward(temp1,temp2,p)
{
  document.motoMobiles.modelID2.value = temp1;
  document.motoMobiles.forwarding.value = temp2;
  document.motoMobiles.price.value = p;
  document.motoMobiles.action = "http://localhost:8080/OSM/Forward.jsp";
  document.motoMobiles.submit();
}
function forwardTo(v)
{
  document.motoMobiles.forwarding.value = "empty"; 
  document.motoMobiles.count.value = v;
  document.motoMobiles.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.motoMobiles.submit();
}
function cart(temp1,p,c,v,m,temp2)
{
  document.motoMobiles.modelID2.value = temp1;
  document.motoMobiles.forwarding.value = temp2;
  document.motoMobiles.price.value = p;
  document.motoMobiles.catgry.value = c;
  document.motoMobiles.vendor.value = v;
  document.motoMobiles.model.value = m;
  document.motoMobiles.quantity.value = 1; //default
  document.motoMobiles.action="http://localhost:8080/OSM/Forward.jsp";
  document.motoMobiles.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" onload="startInit()">
<form name="motoMobiles" action="" method="get">
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
<input type="hidden" name="catgry" value="">
<input type="hidden" name="vendor" value="">
<input type="hidden" name="model" value="">
<input type="hidden" name="quantity" value="">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="pageID" value="Mob_Moto">
<input type="hidden" name="count" value="">
<input type="hidden" name="price" value="">
<font color="#000000" size="2">
Go To: &nbsp;
</font>
<font size="2">
<a href="samsungMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Samsung Mobiles</a>
&nbsp;&nbsp;
<a href="nokiaMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Nokia Mobiles</a>
&nbsp;&nbsp;
<a href="sonyericsonMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>SonyEricson Mobiles</a>
&nbsp;&nbsp;
<a href="flyMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Fly Mobiles</a>
</font>
<br><br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="1010"></iframe>
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
<table border="0" align="center" cellspacing="5" cellpadding="5" bgcolor="#FFFFCC" width="94%">
<caption align="top"><font color="#FF6666" face="Tahoma">
<h2>~ <u>MOTOROLA Mobiles</u> ~</h2>
</font>
</caption>
<!--<tr>
<td colspan="4"><hr></td>
</tr> -->
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobMRE8a")'><img  border="2" src="images/mobiles/motorola/Motorola_E8a_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobMRE8a","18250","Mobile","Motorola","Motorola: E8a","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola: E8a</font>
</td>
<td><input type="button" value="Buy Now" name="b1" onclick='forward("mobMRE8a","Buy.jsp","18250")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.18,250</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobMRZN5")'><img border="2" src="images/mobiles/motorola/moto_zn5_s.JPG" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobMRZN5","15300","Mobile","Motorola","Motorola: ZN5","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola: ZN5</font>
</td>
<td><input type="button" value="Buy Now" name="b2" onclick='forward("mobMRZN5","Buy.jsp","15300")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.15,300</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobMREM325")'><img border="2" src="images/mobiles/motorola/motorola_RokrEM325_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobMREM325","5500","Mobile","Motorola","Motorola: ROKR EM325","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola: ROKR EM325</font>
</td>
<td><input type="button" value="Buy Now" name="b3" onclick='forward("mobMREM325","Buy.jsp","5500")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.5,500</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobMRROKRE6")'><img border="2" src="images/mobiles/motorola/Motorola_ROKRE6_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobMRROKRE6","15250","Mobile","Motorola","Motorola: ROKR E6","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola: ROKR E6</font>
</td>
<td><input type="button" value="Buy Now" name="b4" onclick='forward("mobMRROKRE6","Buy.jsp","15250")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.15,250</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobMRA810")'><img border="2" src="images/mobiles/motorola/motorola_a810_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobMRA810","18750","Mobile","Motorola","Motorola: A810","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Motorola: A810</font>
</td>
<td><input type="button" value="Buy Now" name="b5" onclick='forward("mobMRA810","Buy.jsp","18750")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.18,750</font>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<br>
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

