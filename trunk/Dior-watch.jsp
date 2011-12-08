<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Dior Watches</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language='javascript'>
function startInit()
{
  document.Dior.searchText.select();
  document.Dior.search_button.disabled = true;
}

function myFunction3(f,v) //checks whether search text is typed or not
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
function myFunction(a)
{
document.Dior.modelID1.value=a;
document.Dior.action="http://localhost:8080/OSM/product_Watch.jsp";
document.Dior.submit();
}

function myFunction2(b,c,p)
{
document.Dior.modelID2.value=b;
document.Dior.forwarding.value=c;
document.Dior.price.value=p;
document.Dior.action="http://localhost:8080/OSM/Forward.jsp";
document.Dior.submit();

}
function cart(temp1,p,c,v,m,page_id,temp2)
{
  document.Dior.modelID2.value = temp1;
  document.Dior.forwarding.value = temp2;
  document.Dior.price.value = p;
  document.Dior.catgry.value = c;
  document.Dior.vendor.value = v;
  document.Dior.model.value = m;
  document.Dior.quantity.value = 1; //default
  document.Dior.pageID.value = page_id;
  document.Dior.action="http://localhost:8080/OSM/Forward.jsp";
  document.Dior.submit();
}
function forwardTo(v)
{
  document.Dior.forwarding.value = "empty"; 
  document.Dior.count.value = v;
  document.Dior.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.Dior.submit();
}

</script>
</head>

<body>
<body bgcolor="#FFFFFF" onload="startInit()">
<form name="Dior" method="get" action="">
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
<select name="category" onChange="myFunction3(this.form,this.value)">
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
<font color="#3333FF" face="Verdana, Arial, Helvetica, sans-serif">
<input type="hidden" name="modelID1" value="">
<input type="hidden" name="modelID2" value="">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="pageID" value="wat_Dior">
<input type="hidden" name="count" value="">
<input type="hidden" name="price" value="">
<input type="hidden" name="catgry" value="">
<input type="hidden" name="vendor" value="">
<input type="hidden" name="model" value="">
<input type="hidden" name="quantity" value="">
<font color="#000000" size="2">
Go To: &nbsp;
</font>
<font size="2">
<a href="Timex-watch.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Timex Watches</a>
&nbsp;&nbsp;
<a href="Espirit-watch.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Espirit Watches</a>
&nbsp;&nbsp;
<a href="Titan-watch.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Titan Watches</a>
&nbsp;&nbsp;

</font>
<br><br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="1100"></iframe>
</font>
<div id="main">
<a name="top"></a>
<center>
<table border="0" bgcolor="#FFFFCC" cellpadding="5" cellspacing="5" width="600">
<caption align="top"><font color="#FF6666" face="Tahoma" size="3">
<h1>~ <u>DIOR Watches</u> ~</h1>
</font>
</caption>
<tr>
<td colspan="4"></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myFunction("watDior1")'><img border="2" src="images/Watches/Dior/PinkSatin.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000"><h3><b>DIOR</b></h3></td>
<td><input type="button" name="b11" value="Add To Cart" onclick='cart("watDior1","20000","Watch","Dior","Diamond accented Pink Satin","wat_Dior","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000"><h3><b>Pink Satin</b></h3></td>
<td><input type="button" name="b12" value="Buy Now" onclick='myFunction2("watDior1","Buy.jsp","20000")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000"><h3><b>20000</b></h3></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<td rowspan="3" align="center"><a href="#" onclick='myFunction("watDior2")'><img border="2" src="images/Watches/Dior/RivaXXL.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000"><h3><b>DIOR</b></h3></td>
<td><input type="button" name="b21" value="Add To Cart" onclick='cart("watDior2","32000","Watch","Dior","Riva XXL Automatic","wat_Dior","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000"><h3><b>Riva Men's XXL Automatic</b></h3></td>
<td><input type="button" name="b22" value="Buy Now" onclick='myFunction2("watDior2","Buy.jsp","32000")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000"><h3><b>32000</b></h3></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<td rowspan="3" align="center"><a href="#" onclick='myFunction("watDior3")'><img border="2" src="images/Watches/Dior/Steel.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000"><h3><b>DIOR</b></h3></td>
<td><input type="button" name="b31" value="Add To Cart" onclick='cart("watDior3","64000","Watch","Dior","Steel Diamond Chronograph","wat_Dior","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000"><h3><b>Steel Chrono</b></h3></td>
<td><input type="button" name="b32" value="Buy Now" onclick='myFunction2("watDior3","Buy.jsp","64000")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000"><h3><b>64000</b></h3></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="2">
<b>Click for specifications</b>
</font>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr><td colspan="4"><hr></td></tr>
<tr>
<td colspan="4"></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myFunction("watDior4")'><img border="2" src=
"images/Watches/Dior/RivaChrono.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000"><h3><b>DIOR</b></h3></td>
<td><input type="button" name="b41" value="Add To Cart" onclick='cart("watDior4","120000","Watch","Dior","Riva Chronograph Sparkling","wat_Dior","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000"><h3><b>Riva Chrono</b></h3></td>
<td><input type="button" name="b42" value="Buy Now" onclick='myFunction2("watDior4","Buy.jsp","120000")'</td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000"><h3><b>120000</b></h3></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font color="#000000" face="Times New Roman, Times, serif" size="2">
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
<a href="#top"><h2><b>Back to Top</b></h2></a>
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
