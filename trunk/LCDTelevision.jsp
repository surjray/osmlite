<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>LCD TeleVision: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.lcdTV.searchText.select();
  document.lcdTV.searchText.focus();
  document.lcdTV.search_button.disabled = true;
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
function forward(temp)
{
  document.lcdTV.forwarding.value = temp;
  document.lcdTV.action = "http://localhost:8080/OSM/Forward.jsp";
  document.lcdTV.submit();
}
function forwardTo(v)
{
  document.lcdTV.forwarding.value = "empty"; 
  document.lcdTV.count.value = v;
  document.lcdTV.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.lcdTV.submit();
}
</script>

</head>

<body onload="startInit()">
<form name="lcdTV" method="get">
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
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="count" value="">
<font face="Tahoma" color="#9966FF" size="4">
<marquee behavior="alternate" direction="left" bgcolor="#FFFFFF">
<font color="#9933CC" size="4">
<b><u>Please Click a Product to see the different models of that particular vendor</u></b>
<br>
</font>
</marquee>
<br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="690"></iframe>
</font>
<table bgcolor="#FFFFFF"  border="0" align="center" width="80%">
<tr>
<td colspan="2" align="center" bgcolor="#FF9966"><font color="#990000" size="5">
<br>
<b>~ LCD Television ~</b></font>
<br><br>
</td>
</tr>
<tr>
<td align="center" colspan="2">
<a href="sonyLCDTV.jsp" onmouseover="document.img2.src='images/LCD_TV/SONY/sony71,900_KLV4XZ350A_L2.jpg'" onmouseout="document.img2.src='images/LCD_TV/SONY/sony71,900_KLV4XZ350A_L2.jpg'" target="_blank"><img src="images/LCD_TV/SONY/sony71,900_KLV4XZ350A_L2.jpg" width="250" height="190" border="0" name="img2"></a>
</td>
</tr>
<tr>
<td colspan="2" align="center"><font size="3"><b><u>SONY</u></b></font></td>
</tr>
<tr>
<td align="center">
<a href="samsungLCDTV.jsp" onmouseover="document.img1.src='images/LCD_TV/SAMSUNG/samsung_s4.jpg'" onmouseout="document.img1.src='images/LCD_TV/SAMSUNG/samsung_s4.jpg'" target="_blank"><img src="images/LCD_TV/SAMSUNG/samsung_s4.jpg" width="250" height="300" border="0" name="img1"></a>
</td>
<td align="center">
<a href="lgLCDTV.jsp" onmouseover="document.img3.src='images/LCD_TV/LG/LG83,000_42LG80FR _L2.gif'" onmouseout="document.img3.src='images/LCD_TV/LG/LG83,000_42LG80FR _L2.gif'" target="_blank"><img src="images/LCD_TV/LG/LG83,000_42LG80FR _L2.gif" width="250" height="190" border="0" name="img3"></a>
</td>
</tr>
<tr>
<td align="center"><font size="3"><b><u>SAMSUNG</u></b></font></td>
<td align="center"><font size="3"><b><u>LG</u></b></font></td>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
</tr>
</table>
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
