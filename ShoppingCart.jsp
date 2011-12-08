<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ShoppingCart: OSMlite.com</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<%! int count=0, sequenceNum = 0, sn = 0; %>
<%! double totalSum = 0.0; %>
<%! String cartModel = null;
    String status = null; 
%>

<script language="javascript">
function startInit()
{
  <% sequenceNum = sequenceNum +1; %>
  document.shopCart.searchText.select();
  document.shopCart.searchText.focus();
  document.shopCart.search_button.disabled = true;
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
function payment(totalPayment)
{
  document.shopCart.price.value = totalPayment;
  document.shopCart.action = "http://localhost:8080/OSM/Buy.jsp";
  document.shopCart.submit();
}
function forward(m,num)
{
  document.shopCart.hmodel.value = m;
  document.shopCart.hsn.value = num;
  document.shopCart.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.shopCart.submit();
}

</script>
</head> 

<body onload="startInit()">
<form name="shopCart" action="">
<div id="header"></div>
<input type="hidden" name="price" value="">
<input type="hidden" name="hmodel" value=""> <!-- Default value "empty" -->
<input type="hidden" name="hsn" value="">
<input type="hidden" name="forwarding" value="0">    <!-- Default value "0" -->

<%!
/**
  void insertCart(String uid,String modelID,String cartID,double price,String category,String vendor,String model,int quantity)
  {
    try{
	Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
	Statement stmt = con.createStatement();
	stmt.executeUpdate("insert into shoppingCart values('"+uid+"','"+modelID+"','"+cartID+"',"+price+",'"+category+"','"+vendor+"','"+model+"',"+quantity+")");
	}
	catch(SQLException e){}
    catch(Exception e){}
  }
 
 int countQuantity()
  {
    int q = 0;
	String sql = "SELECT SUM(quantity) from shoppingCart S,shoppingCart C WHERE S.userID=C.userID AND S.productID=C.productID";
	try{
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	  q = rs.getInt(1);
	
	}
	catch(SQLException e){}
    catch(Exception e){}
	return q;
  }
*/
%>

<%
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
  String uid = (String)session.getAttribute("userid2");
  String cartID = uid + "shopcart";
  //-----------------------------------Default view logic-------------------------------------
  String forwarding = request.getParameter("forwarding");
  if(forwarding.equals("empty")){
  count = Integer.parseInt(request.getParameter("count"));
  try{
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery("SELECT SUM(price) FROM shoppingCart WHERE userID='"+uid+"' AND cartID='"+cartID+"'");
  while(rs.next())
  {
    totalSum = rs.getDouble(1);  //-------------------Get Sum Amount------------------------
  }
  rs.close();
  stmt.close();
  }catch(SQLException e){}
   catch(Exception e){}
  }
  //-----------------------------------Default view logic End---------------------------------
  //-----------------------------------Remove Logic start-------------------------------------
  String smodel = request.getParameter("hmodel");
  String snum = request.getParameter("hsn");
  
  if(smodel != null && snum != null){
  //count = 0; //--------------------------------Reset count----------------------------------
    try{
    Statement stmt = con.createStatement();
	stmt.executeUpdate("DELETE FROM shoppingCart WHERE model='"+smodel+"' AND sequenceNo="+Integer.parseInt(snum)+"AND userID='"+uid+"'");
	stmt.close();
	}catch(SQLException e){}
   catch(Exception e){}
   count++;
  }
  //------------------------------------Remove Logic end--------------------------------------
  //------------------------------------Main part begins--------------------------------------
  String pathURL = "index_dream.html";  //default
  String modelID = (String)request.getAttribute("modelid");
  String pageID = (String)request.getAttribute("pageid");
  //String cartID = uid + "shopcart";
  String q = "SELECT status FROM shoppingCart WHERE userID='"+uid+"' AND cartID='"+cartID+"'";
  String query = "SELECT sequenceNo,category,model,price,quantity FROM shoppingCart WHERE userID='"+uid+"' AND cartID='"+cartID+"'";
  String sql = "SELECT SUM(price) FROM shoppingCart WHERE userID=? AND cartID=?";
  
 // Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
 // Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
  if(pageID != null){
  try{
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery(q);
  while(rs.next())
  {
    status = rs.getString("status");  //-------------------Get Status
  }
  rs.close();
  stmt.close();
  
  PreparedStatement ps = con.prepareStatement("SELECT pathURL FROM search WHERE pageID=?");
	ps.setString(1,pageID);
	rs = ps.executeQuery();
	while(rs.next())
	{
	  pathURL = rs.getString("pathURL");  //---------------Get Where to back
	}
	ps.close();
  }catch(SQLException e){}
   catch(Exception e){}
  }
  //--------------If something already present in the cart display those items------??*Not working*
   if(count!=0 && totalSum !=0)   
   {
     try{ 
	 Statement stmt = con.createStatement();
	 ResultSet rs = stmt.executeQuery(query);
%>
<!--
<%= count %>
-->
<font face="Arial, Helvetica, sans-serif" color="#9966FF" size="4">
<table bgcolor="white" border="0" cellpadding="5" cellspacing="1" align="center">
<caption align="top"><font face="Tahoma" color="#FF6666" size="3">
<h3>Welcome! <%= uid %>, Your cart status</h3>
</font>
</caption>
<tr>
<!--
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">#Serial No.</font></th>
-->
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Category</font></th>
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Model</font></th>
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Quantity</font></th>
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Price</font></th>
</tr>

<%

	while(rs.next())
	{
	  sn = rs.getInt("sequenceNo");
%>

<tr>
<!--
<td align="center">
<%= sn %>
</td>
-->
<td align="center"><font face="Times New Roman, Times, serif"><b><%= rs.getString("category") %>
</b></font></td>
<%
  cartModel = rs.getString("model");
%>
<td align="center"><font face="Times New Roman, Times, serif"><b><%= cartModel %>
</b></font></td>
<td align="center"><font face="Times New Roman, Times, serif"><b><%= rs.getInt("quantity") %>
</b></font></td>
<td align="right"><font face="Times New Roman, Times, serif"><b><%= rs.getDouble("price") %>
</b></font></td>
<td>
<font size="3">
<a href="#" style="text-decoration:none" onmouseover="style='color:red; text-decoration:underline; font-style:italic'" onmouseout="style='color:#CC6600; text-decoration:none'" onclick='forward("<%= cartModel %>","<%= sn %>")'><b>Remove</b></a>
</font>
</td>
</tr>


<%	  
	}
	rs.close();
    stmt.close();
	
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,uid);
	ps.setString(2,cartID);
    rs = ps.executeQuery();
	while(rs.next())
	{
	  totalSum = rs.getDouble(1);
	}
%>

<tr>
<td colspan="4"><hr></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td align="center"><font color="#000000"><b>Sum Total: </b></font></td>
<td align="center"><font color="#000000"><b><%= totalSum %></b></font></td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>

<%
	
   }catch(SQLException e){}
    catch(Exception e){}
%>

<tr>
<td>&nbsp;</td>
<td align="center">
<font size="3">
<a href="<%= pathURL %>" style="text-decoration:none" onmouseover="style='color:red; text-decoration:underline; font-style:italic'" onmouseout="style='color:#CC6600; text-decoration:none'"><b>Add More Items</b></a>
</font>
</td>
<td colspan="2" align="center">
<input type="button" name="paymentb" value="Proceed To Payment" onclick='payment("<%= totalSum %>")'>
</td>
</tr>
</table>
<% 
   count = 0; //-----------------------Reset count to zero---------------------------------------- 
  }
  //----------------------------Add items to cart and display them-------------------------------- 
  else if(modelID != null)  
  {
    status = "unpaid";
	float price = Float.parseFloat((String)request.getAttribute("cart_price"));
    String category = (String)request.getAttribute("cart_category");
    String vendor = (String)request.getAttribute("cart_vendor");
    String model = (String)request.getAttribute("cart_model");
    int quantity = Integer.parseInt((String)request.getAttribute("cart_quantity"));
//  quan = countQuantity();
  try{
//   insertCart(uid,modelID,cartID,price,category,vendor,model,quantity);
   Statement stmt = con.createStatement();
   stmt.executeUpdate("insert into shoppingCart values('"+uid+"','"+modelID+"','"+cartID+"',"+price+",'"+category+"','"+vendor+"','"+model+"',"+quantity+",'"+status+"',"+sequenceNum+")");
   ResultSet rs = stmt.executeQuery(query);
%>

<font face="Arial, Helvetica, sans-serif" color="#9966FF" size="4">
<table bgcolor="white" border="0" cellpadding="5" cellspacing="1" align="center">
<caption align="top"><font face="Tahoma" color="#FF6666" size="3">
<h3>Welcome! <%= uid %>, Your cart status</h3>
</font>
</caption>
<tr>
<!--
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">#Serial No.</font></th>
-->
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Category</font></th>
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Model</font></th>
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Quantity</font></th>
<th bgcolor="#FFCC99"><font face="Tahoma" color="#990000" size="4">Price</font></th>
</tr>

<%

	while(rs.next())
	{
	  sn = rs.getInt("sequenceNo");
%>

<tr>
<!--
<td align="center">
<%= sn %>
</td>
-->
<td align="center"><font face="Times New Roman, Times, serif"><b><%= rs.getString("category") %>
</b></font></td>
<%
  cartModel = rs.getString("model");
%>
<td align="center"><font face="Times New Roman, Times, serif"><b><%= cartModel %>
</b></font></td>
<td align="center"><font face="Times New Roman, Times, serif"><b><%= rs.getInt("quantity") %>
</b></font></td>
<td align="right"><font face="Times New Roman, Times, serif"><b><%= rs.getDouble("price") %>
</b></font></td>
<td>
<font size="3">
<a href="#" style="text-decoration:none" onmouseover="style='color:red; text-decoration:underline; font-style:italic'" onmouseout="style='color:#CC6600; text-decoration:none'" onclick='forward("<%= cartModel %>","<%= sn %>")'><b>Remove</b></a>
</font>
</td>
</tr>


<%	  
	}
	rs.close();
    stmt.close();
    	
//	Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1,uid);
	ps.setString(2,cartID);
    rs = ps.executeQuery();
	while(rs.next())
	{
	  totalSum = rs.getDouble(1);  //-----------------Calculate Sum-------------------------
	}
%>

<tr>
<td colspan="4"><hr></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td align="center"><font color="#000000"><b>Sum Total: </b></font></td>
<td align="center"><font color="#000000"><b><%= totalSum %></b></font></td>
</tr>
<tr>
<td colspan="4"><hr></td>
</tr>

<%
	
   }catch(SQLException e){}
    catch(Exception e){}
%>

<tr>
<td>&nbsp;</td>
<td align="center">
<font size="3">
<a href="<%= pathURL %>" style="text-decoration:none" onmouseover="style='color:red; text-decoration:underline; font-style:italic'" onmouseout="style='color:#CC6600; text-decoration:none'"><b>Add More Items</b></a>
</font>
</td>
<td colspan="2" align="center">
<input type="button" name="paymentb" value="Proceed To Payment" onclick='payment("<%= totalSum %>")'>
</td>
</tr>
</table>
<%
  }
  //--------------------------Nothing present in the cart--------------------Default view
  else if(totalSum == 0.0 && uid != null){
%>
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

    <li><a href="http://localhost:8080/OSM/MyAccount.jsp" title="My OSMlite"><span>My Account</span></a></li>
    <li><a href="http://localhost:8080/OSM/Feedback.html" title="Give Feedback"><span>Feedback</span></a></li>
  </ul>
</div>
<br><hr>
<center>
<h1><%= uid %>, Your Cart Status.</h1>
<font color="#FF6633" face="Bookman Old Style" size="4">
<h3><u>Please Search a Product & Add It To Your ShoppingCart</u></h3>
</font>
</center>
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
<br><br><br><br><br>
<center>
<strong><u>Ads by Google</u></strong>
</center>
<br>
<!--
--------------------------------------Advertisement Start---------------------------------
-->
<a href="http://www.hp.com" target="_blank" title="Go to hp.com">
<img src="images/advertisement/EC_20081218_Hp_vHome.jpg" height="200" width="780" />
</a>
<!--
--------------------------------------Advertisement End-----------------------------------
-->

<%
  count = 0; //-------------------------reset count to zero-------------------------
  }
  else{
%>
<jsp:forward page="Error.jsp"/>
<%
}
%>
</font>
<div id="footer">
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</div>  
</form>
</body>
</html>
