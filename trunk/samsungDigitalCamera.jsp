<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Samsung Digital Camera: OSMlite</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.samsungDigiCam.searchText.select();
  document.samsungDigiCam.searchText.focus();
  document.samsungDigiCam.search_button.disabled = true;
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
  document.samsungDigiCam.modelID1.value = v;
  document.samsungDigiCam.action = "http://localhost:8080/OSM/Product_DigitalCamera.jsp";
  document.samsungDigiCam.submit();
}

function forward(temp1,temp2,p)
{
  document.samsungDigiCam.modelID2.value = temp1;
  document.samsungDigiCam.forwarding.value = temp2;
  document.samsungDigiCam.price.value = p;
  document.samsungDigiCam.action = "http://localhost:8080/OSM/Forward.jsp";
  document.samsungDigiCam.submit();
}
function forwardTo(v)
{
  document.samsungDigiCam.forwarding.value = "empty"; 
  document.samsungDigiCam.count.value = v;
  document.samsungDigiCam.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.samsungDigiCam.submit();
}
function cart(temp1,p,c,v,m,temp2)
{
  document.samsungDigiCam.modelID2.value = temp1;
  document.samsungDigiCam.forwarding.value = temp2;
  document.samsungDigiCam.price.value = p;
  document.samsungDigiCam.catgry.value = c;
  document.samsungDigiCam.vendor.value = v;
  document.samsungDigiCam.model.value = m;
  document.samsungDigiCam.quantity.value = 1; //default
  document.samsungDigiCam.action="http://localhost:8080/OSM/Forward.jsp";
  document.samsungDigiCam.submit();
}
</script>
</head>

<body bgcolor="#FFFFFF" onload="startInit()">
<form name="samsungDigiCam" method="get">
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
<font color="#999966" face="Tahoma">
<input type="hidden" name="modelID1" value="">
<input type="hidden" name="modelID2" value="">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="pageID" value="DigiCam_Sam">
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
<a href="canonDigitalCamera.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Canon DigitalCamera</a>
&nbsp;&nbsp;
<a href="sonyDigitalCamera.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Sony DigitalCamera</a>
</font>
<br><br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="520"></iframe>
</font>
<a name="top"></a>
<table border="0" align="center" bgcolor="#FFFFCC" cellpadding="3">
<caption align="top"><font color="#FF6666">
<h2>~ <u>SAMSUNG Digital Cameras</u> ~</h2>
</font>
</caption>
<tr>
<td align="center" rowspan="3">
<a href="#" onclick='myMethod("digicamSamS760")'><img  border="2" src="images/digital_camera/samsung/Samsung6,490_s1.jpg" height="150" width="140"></a>
</td>
<td align="left"><h3>Vendor: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung</h4></font>
</td>
<td rowspan="11">&nbsp;</td>
<td rowspan="11">&nbsp;</td>
<td align="center" rowspan="3">
<a href="#" onclick='myMethod("digicamSami8")'><img  border="2" src="images/digital_camera/samsung/Samsung13,990_s2.jpg" height="150" width="140"></a>
</td>
<td align="left"><h3>Vendor: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung</h4></font>
</td>
</tr>
<tr>
<td align="left"><h3> Model: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung: S760</h4></font>
</td>
<td align="left"><h3> Model: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung: i8</h4></font>
</td>
</tr>
<tr>
<td align="left"><h3> Price: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>6,490</h4></font>
</td>
<td align="left"><h3> Price: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>13,990</h4></font>
</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<b><u>Click for features</u></b></font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("digicamSamS760","6490","Digital Camera","Samsung","Samsung: S760","ShoppingCart.jsp")'>
</td>
<td align="center"><input type="button" value="Buy Now" name="b1" onclick='forward("digicamSamS760","Buy.jsp","6490")'></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<b><u>Click for features</u></b></font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("digicamSami8","13990","Digital Camera","Samsung","Samsung: i8","ShoppingCart.jsp")'>
</td>
<td align="center"><input type="button" value="Buy Now" name="b2" onclick='forward("digicamSami8","Buy.jsp","13990")'></td>
</tr>
<tr>
<td colspan="8">&nbsp;</td>
</tr>
<!--
<tr>
<td colspan="8">&nbsp;</td>
</tr>
-->
<tr>
<td align="center" rowspan="3">
<a href="#" onclick='myMethod("digicamSamL100")'><img  border="2" src="images/digital_camera/samsung/Samsung8,990_s3.jpg" height="150" width="140"></a>
</td>
<td align="left"><h3>Vendor :</h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung</h4></font>
</td>
<td align="center" rowspan="3">
<a href="#" onclick='myMethod("digicamSamS860")'><img  border="2" src="images/digital_camera/samsung/Samsung6,990_s4.jpg" height="150" width="140"></a>
</td>
<td align="left"><h3>Vendor :</h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung</h4></font>
</td>
</tr>
<tr>
<td align="left"><h3> Model: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung: L100</h4></font>
</td>
<td align="left"><h3> Model: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>Samsung: S860</h4></font>
</td>
</tr>
<tr>
<td align="left"><h3> Price: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>8,990</h4></font>
</td>
<td align="left"><h3> Price: </h3></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<h4>6,990</h4></font> 
</td>
</tr>
<tr>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<b><u>Click for features</u></b></font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("digicamSamL100","8990","Digital Camera","Samsung","Samsung: L100","ShoppingCart.jsp")'>
</td>
<td align="center"><input type="button" value="Buy Now" name="b3" onclick='forward("digicamSamL100","Buy.jsp","8990")'></td>
<td align="center"><font color="#000000" face="Times New Roman, Times, serif">
<b><u>Click for features</u></b></font>
</td>
<td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='cart("digicamSamS860","6990","Digital Camera","Samsung","Samsung: S860","ShoppingCart.jsp")'>
</td>
<td align="center"><input type="button" value="Buy Now" name="b4" onclick='forward("digicamSamS860","Buy.jsp","6990")'></td>
</tr>
<tr>
<td colspan="8">&nbsp;</td>
</tr>
</table>
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
