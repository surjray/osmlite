<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Fly Mobiles: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.flyMobiles.searchText.select();
  document.flyMobiles.searchText.focus();
  document.flyMobiles.search_button.disabled = true;
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
  document.flyMobiles.modelID1.value = v;
  document.flyMobiles.action = "http://localhost:8080/OSM/product_mobile.jsp";
  document.flyMobiles.submit();
}

function forward(temp1,temp2,p)
{
  document.flyMobiles.modelID2.value = temp1;
  document.flyMobiles.forwarding.value = temp2;
  document.flyMobiles.price.value = p;
  document.flyMobiles.action = "http://localhost:8080/OSM/Forward.jsp";
  document.flyMobiles.submit();
}
function forwardTo(v)
{
  document.flyMobiles.forwarding.value = "empty"; 
  document.flyMobiles.count.value = v;
  document.flyMobiles.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.flyMobiles.submit();
}
function cart(temp1,p,c,v,m,temp2)
{
  document.flyMobiles.modelID2.value = temp1;
  document.flyMobiles.forwarding.value = temp2;
  document.flyMobiles.price.value = p;
  document.flyMobiles.catgry.value = c;
  document.flyMobiles.vendor.value = v;
  document.flyMobiles.model.value = m;
  document.flyMobiles.quantity.value = 1; //default
  document.flyMobiles.action="http://localhost:8080/OSM/Forward.jsp";
  document.flyMobiles.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" onload="startInit()">
<form name="flyMobiles" action="" method="get">
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
<input type="hidden" name="pageID" value="Mob_Fly">
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
<a href="sonyericsonMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>SonyEricson Mobiles</a>
&nbsp;&nbsp;
<a href="nokiaMobiles.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Nokia Mobiles</a>
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
<table border="0" align="center" cellspacing="5" cellpadding="5" bgcolor="#FFFFCC" width="92%">
<caption align="top"><font color="#FF6666" face="Tahoma">
<h2>~ <u>FLY Mobiles</u> ~</h2>
</font>
</caption>
<!--<tr>
<td colspan="4"><hr></td>
</tr> -->
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobFlyE105")'><img  border="2" src="images/mobiles/fly/fly_E105_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobFlyE105","6750","Mobile","Fly","Fly: E105","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly: E105</font>
</td>
<td>&nbsp;
<input type="button" value="Buy Now" name="b1" onclick='forward("mobFlyE105","Buy.jsp","6750")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.6,750</font>
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobFlySX210")'><img border="2" src="images/mobiles/fly/fly_SX210_s.jpg" height="100" width="80"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobFlySX210","9300","Mobile","Fly","Fly: SX210","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly: SX210</font>
</td>
<td>&nbsp;
<input type="button" value="Buy Now" name="b2" onclick='forward("mobFlySX210","Buy.jsp","9300")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.9,300</font>
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobFlySL500i")'><img border="2" src="images/mobiles/fly/fly_SL500i_s.jpg" height="105" width="80"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobFlySL500i","12500","Mobile","Fly","Fly: SL500i","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly: SL500i</font>
</td>
<td>&nbsp;
<input type="button" value="Buy Now" name="b3" onclick='forward("mobFlySL500i","Buy.jsp","12500")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.12,500</font>
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobFlyMX230")'><img border="2" src="images/mobiles/fly/fly_MX230_s.jpg" height="100" width="100"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobFlyMX230","13250","Mobile","Fly","Fly: MX230","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly: MX230</font>
</td>
<td>&nbsp;
<input type="button" value="Buy Now" name="b4" onclick='forward("mobFlyMX230","Buy.jsp","13250")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.13,250</font>
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
<td rowspan="3" align="center"><a href="#" onclick='myMethod("mobFlyB600")'><img border="2" src="images/mobiles/fly/Fly_B600_s.jpg" height="100" width="90"></a></td>
<td><b>Vendor :</b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly</font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("mobFlyB600","15750","Mobile","Fly","Fly: B600","ShoppingCart.jsp")'>
&nbsp;
<font color="#000000" face="Tahoma" size="2">
Or,</font>
</td>
</tr>
<tr>
<td><b>Model: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Fly: B600</font>
</td>
<td>&nbsp;
<input type="button" value="Buy Now" name="b5" onclick='forward("mobFlyB600","Buy.jsp","15750")'></td>
</tr>
<tr>
<td><b>Price: </b></td>
<td><font color="#000000" face="Times New Roman, Times, serif">
Rs.15,750</font>
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


