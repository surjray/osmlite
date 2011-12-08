<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html
xmlns="http://www.w3.org/1999/xhtml"> <head> <meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1" /> <title>Alienware Computers</title>

<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language='javascript'>
function startInit()
{
  document.Alien.searchText.select();
  document.Alien.search_button.disabled = true;
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
document.Alien.modelID1.value=a;
document.Alien.action="http://localhost:8080/OSM/product_Computer.jsp";
document.Alien.submit();
}

function myFunction2(b,c,p)
{
document.Alien.modelID2.value=b;
document.Alien.forwarding.value=c;
document.Alien.price.value=p;
document.Alien.action="http://localhost:8080/OSM/Forward.jsp";
document.Alien.submit();
}
function cart(temp1,p,c,v,m,page_id,temp2)
{
  document.Alien.modelID2.value = temp1;
  document.Alien.forwarding.value = temp2;
  document.Alien.price.value = p;
  document.Alien.catgry.value = c;
  document.Alien.vendor.value = v;
  document.Alien.model.value = m;
  document.Alien.quantity.value = 1; //default
  document.Alien.pageID.value = page_id;
  document.Alien.action="http://localhost:8080/OSM/Forward.jsp";
  document.Alien.submit();
}
function forwardTo(v)
{
  document.Alien.forwarding.value = "empty"; 
  document.Alien.count.value = v;
  document.Alien.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.Alien.submit();
}
</script>
</head>

<body>
<body bgcolor="#FFFFFF" onload="startInit()">
<form name="Alien" method="get" action="">
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
<input type="hidden" name="pageID" value="com_Alien">
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
<a href="Dell-com.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Dell Computers</a>
&nbsp;&nbsp;
<a href="Apple-com.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>Apple Computers</a>
&nbsp;&nbsp;
<a href="HCL-com.jsp" style="text-decoration:none; color:#000000" onmouseover='style="text-decoration:underline; color:#9966FF; font-style:italic"' onmouseout='style="text-decoration:none; color:#000000"' target="_parent">>HCL Computers</a>
&nbsp;&nbsp;

</font>
<br><br>
<font color="#000000">
<iframe src="categories.html" align="left" width="15%" height="1130"></iframe>
</font>
<div id="main">
<a name="top"></a>
<center>
<table border="0" bgcolor="#FFFFCC" cellpadding="5" cellspacing="5" width="600">
<caption align="top"><font color="#FF6666" face="Tahoma" size="3">
<h1>~ <u>ALIENWARE Computers</u> ~</h1>
</font>
</caption>
<tr>
<td colspan="4"></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myFunction("comAlienware1")'><img border="2" src="images/Computers/Alienware/Aurora.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000" ><h3><b>ALIENWARE</b></h3></td>
<td><input type="button" name="b11" value="Add To Cart" onclick='cart("comAlienware1","48000","Computer","Alienware","Aurora","com_Alien","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></td>
<td><font color="#000000" ><h3><b>Aurora</b></h3></font></td>
<td><input type="button" name="b12" value="Buy Now" onclick='myFunction2("comAlienware1","Buy.jsp","48000")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000" ><h3><b>48000</b></h3></td>
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
<td colspan="4"></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myFunction("comAlienware2")'><img border="2" src="images/Computers/Alienware/Area51750i.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000" ><h3><b>ALIENWARE</b></h3></td>
<td><input type="button" name="b21" value="Add To Cart" onclick='cart("comAlienware2","60100","Computer","Alienware","Area-51 750i","com_Alien","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000" ><h3><b>Area-51 750i</b></h3></td>
<td><input type="button" name="b22" value="Buy Now" onclick='myFunction2("comAlienware2","Buy.jsp","60100")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000" ><h3><b>60100</b></h3></td>
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
<td colspan="4"></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myFunction("comAlienware3")'><img border="2" src="images/Computers/Alienware/Area51X58Destroyer.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000" ><h3><b>ALIENWARE</b></h3></td>
<td><input type="button" name="b31" value="Add To Cart" onclick='cart("comAlienware3","79500","Computer","Alienware","Area-51 X58","com_Alien","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000" ><h3><b>Area-51 X58</b></h3></td>
<td><input type="button" name="b32" value="Buy Now" onclick='myFunction2("comAlienware3","Buy.jsp","79500")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000" ><h3><b>79500</b></h3></td>
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
<td colspan="4"></td>
</tr>
<tr>
<td rowspan="3" align="center"><a href="#" onclick='myFunction("comAlienware4")'><img border="2" src=
"images/Computers/Alienware/ALXX58.jpg" height="135" width="135"></a></td>
<td><font color="#0066FF" ><h3><b>Vendor:</b></h3></font></td>
<td><font color="#000000" ><h3><b>ALIENWARE</b></h3></td>
<td><input type="button" name="b41" value="Add To Cart" onclick='cart("comAlienware4","177552","Computer","Alienware","ALX X58","com_Alien","ShoppingCart.jsp")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Model:</b></h3></font></td>
<td><font color="#000000" ><h3><b>ALX X58</b></h3></td>
<td><input type="button" name="b42" value="Buy Now" onclick='myFunction2("comAlienware4","Buy.jsp","177552")'></td>
</tr>
<tr>
<td><font color="#0066FF" ><h3><b>Price:</b></h3></font></td>
<td><font color="#000000" ><h3><b>177552</b></h3></td>
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