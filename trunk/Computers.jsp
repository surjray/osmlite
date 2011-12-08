<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Computers: OSMlite</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">

function startInit()
{
  document.computer.searchText.select();
  document.computer.searchText.focus();
  document.computer.search_button.disabled = true;
}

function myFunction(f,v)
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
  document.computer.forwarding.value = temp;
  document.computer.action = "http://localhost:8080/OSM/Forward.jsp";
  document.computer.submit();
}
function forwardTo(v)
{
  document.computer.forwarding.value = "empty"; 
  document.computer.count.value = v;
  document.computer.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.computer.submit();
}
</script>

</head>

<body bgcolor="#FFFFFF" onload="startInit();">
<form name="computer" method="get">
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
    <li><a href="http://localhost:8080/OSM/Feedback.jsp" title="Give Feedback"><span>Feedback</span></a></li>
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
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="count" value="">

<marquee  behavior="scroll" direction="left">
<font color="#99CCFF" face="Courier New, Courier, monospace" size="2">
<h2><u><b>Please Click On A Computer To See Different Models Of That Particular Vendor</b></u></h2></font>
</marquee>
<br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="700"></iframe>
</font>
<center>
<table border="0" align="center">
<caption align="top"><font face="Geneva, Arial, Helvetica, sans-serif" color="#FF6666" size="2"><h1><b>~<u>Computers</u>~</b></h1></font></caption>
<br><br>
<tr>
<td colspan="7"><a href="Apple-com.jsp" onmouseover="document.image1.src='images/Computers/Apple/iMac~3.jpg'"  onmouseout="document.image1.src='images/Computers/Apple/iMac.jpg'"><img border="0" src="images/Computers/Apple/iMac.jpg" height="200" width="200" name="image1">
</a>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><a href="HCL-com.jsp" onmouseover="document.image2.src='images/Computers/HCL/EzeebeeMaxXP.jpg'"  onmouseout="document.image2.src='images/Computers/HCL/BeanstalkClassic.jpg'"><img border="0" src="images/Computers/HCL/BeanstalkClassic.jpg" height="200" width="200" name="image2">
</a>
</td>

</tr>
</table>
<table border="0">
<tr>
<td align="left"><font color="#0000FF" face="Georgia, Times New Roman,Times, serif"><h3><u><b>Apple</b></u></h3></td></font>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td align="right"><font color="#0000FF" face="Georgia, Times New Roman,Times, serif"><h3><u><b>HCL</b></u></h3></td></font>
<td>&nbsp;</td>
</tr>
</table>
<br><br><br>
<table border="0">
<tr>
<td colspan="7"></td>

<td><a href="Alienware-com.jsp" onmouseover="document.image3.src='images/Computers/Alienware/Aurora.jpg'"  onmouseout="document.image3.src='images/Computers/Alienware/Area51750i.jpg'"><img border="0" src="images/Computers/Alienware/Area51750i.jpg" height="200" width="200" name="image3">
</a>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><a href="Dell-com.jsp" onmouseover="document.image4.src='images/Computers/Dell/XPSStudio.jpg'"  onmouseout="document.image4.src='images/Computers/Dell/XPS430~2.jpg'"><img border="0" src="images/Computers/Dell/XPS430~2.jpg" height="200" width="200" name="image4">
</a>
</td>

</tr>
</table>
<table border="0">
<tr>
<td align="left"><font color="#0000FF" face="Georgia, Times New Roman,Times, serif"><h3><u><b>Alienware</b></u></h3></td></font>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

<td align="right"><font color="#0000FF" face="Georgia, Times New Roman,Times, serif"><h3><u><b>Dell</b></u></h3></td></font>
<td>&nbsp;</td>
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
&nbsp;&nbsp;&nbsp;&nbsp;
<strong>Visit </strong>
<a href="http://www.amazon.com" target="_blank" style="color:#FF3300">
www.amazon.com
</a>
<br>visit
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

