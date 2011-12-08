<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Successfull Purchase: OSMlite</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.buysuccess.searchText.select();
  document.buysuccess.searchText.focus();
  document.buysuccess.search_button.disabled = true;
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
</script>
</head>

<body onload="startInit()">
<form name="buysuccess" method="post" action="">
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

<%
  if(uid != null){
  String cartID = uid + "shopcart";
  String status = "unpaid";
  String productID = null;
  double price = 0.0;
  String category = null;
  String vendor = null;
  String model = null;
  int quantity = 0;
  int count = 0;
  String sdate = new java.util.Date().toString();
  String pid = request.getParameter("modelID2");
  String cname = request.getParameter("bLoc");
  String creditCardType = request.getParameter("type");
  int creditCardNum = Integer.parseInt(request.getParameter("cardNo"));
  int cvvNum = Integer.parseInt(request.getParameter("cvvNo"));
  double amount = Float.parseFloat(request.getParameter("price"));
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
  
  if(pid.equals("empty")){
  try{
  PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM shoppingCart WHERE userID=? AND cartID=? AND status=?");
  ps2.setString(1,uid);
  ps2.setString(2,cartID);
  ps2.setString(3,status);
  ResultSet rs2 = ps2.executeQuery();
  while(rs2.next()){
    count = rs2.getInt(1);
  }
  //ps.executeUpdate("UPDATE shoppingCart SET status='paid' WHERE userID='"+uid+"' AND cartID='"+uid+"shopcart'");
  ps2.close();
  rs2.close();
  }catch(SQLException e){}
  catch(Exception e){}
  //---------------------Transfer data from shoppingcart to sales table--------------------
  while(count != 0){
  try{
   PreparedStatement ps3 = con.prepareStatement("SELECT productID,price,category,vendor,model,quantity FROM shoppingCart WHERE userID=? AND cartID=? AND status=?");
  ps3.setString(1,uid);
  ps3.setString(2,cartID);
  ps3.setString(3,status);
  ResultSet rs3 = ps3.executeQuery();
  while(rs3.next())
  {
    productID = rs3.getString("productID");
	price = rs3.getDouble("price");
	category = rs3.getString("category");
	vendor = rs3.getString("vendor");
	model = rs3.getString("model");
	quantity = rs3.getInt("quantity");
	
	Statement stmt1 = con.createStatement();
    stmt1.executeUpdate("INSERT INTO sales(saleID,transactionID,dateOfPayment,userID,productID,price,category,vendor,model,quantity,creditCardType,cname,creditCardNum,cvvNum) VALUES('sales"+uid+"','transaction"+uid+"','"+sdate+"','"+uid+"','"+productID+"',"+price+",'"+category+"','"+vendor+"','"+model+"',"+quantity+",'"+creditCardType+"','"+cname+"',"+creditCardNum+","+cvvNum+")");
  stmt1.close();
   // stmt.executeUpdate("DELETE FROM shoppingCart WHERE userID='"+uid+"' AND cartID='"+uid+"shopcart' AND status='paid'");
    // rs.next();
  }
  	//--------------------Update shoppingCart set status to "paid"---------------------------
	Statement stmt2 = con.createStatement();
    stmt2.executeUpdate("UPDATE shoppingCart SET status='paid' WHERE userID='"+uid+"' AND cartID='"+    uid+"shopcart'");
	stmt2.close();

 }catch(SQLException e){}
  catch(Exception e){}
  count--;
 }
  try{
    Statement stmt3 = con.createStatement();
	stmt3.executeUpdate("DELETE FROM shoppingCart WHERE userID='"+uid+"' AND cartID='"+uid+"shopcart' AND status='paid'");
	stmt3.close();
	}catch(SQLException e){}
  catch(Exception e){}
  }
  else if(pid != null)
  {
     quantity = Integer.parseInt(request.getParameter("quantity"));
 
     try{
	 PreparedStatement ps1 = con.prepareStatement("SELECT price,category,vendorID,model FROM product WHERE productID=?");
	 ps1.setString(1,pid);
	 ResultSet rs1 = ps1.executeQuery();
     while(rs1.next()){
       price = rs1.getDouble("price");
	   category = rs1.getString("category");
	   vendor = rs1.getString("vendorID");
	   model = rs1.getString("model");
	   
	   Statement stmt4 = con.createStatement();
       stmt4.executeUpdate("INSERT INTO   sales(saleID,transactionID,dateOfPayment,userID,productID,price,category,vendor,model,quantity,creditCardType,cname,creditCardNum,cvvNum) VALUES('sales"+uid+"','transaction"+uid+"','"+sdate+"','"+uid+"','"+pid+"',"+price+",'"+category+"','"+vendor+"','"+model+"',"+quantity+",'"+creditCardType+"','"+cname+"',"+creditCardNum+","+cvvNum+")");
       stmt4.close();
     }
	 ps1.close();
	 rs1.close();
	 }catch(SQLException e){}
  catch(Exception e){}
  }
  
%>

<font face="Tahoma" color="#FF6633">
<h2>Welcome! <%= uid %>, Purchasing of Amount Rs.<%= amount %>/- Successfully Done.
<br><br>Items Will Be Delivered To Your Address Within One Week.</h2>
<br>
<a href="index_dream.html" style="text-decoration:none" onmouseover="style='color:red; text-decoration:underline; font-style:italic'" onmouseout="style='color:#CC6600; text-decoration:none'">Purchase More Items</a>
<br><br><br><br>
<!--
-----------------------------------------Advertisement----------------------------------------
-->
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="765" height="160" title="acer_advertisement">
  <param name="movie" value="images/advertisement/one.swf" />
  <param name="quality" value="high" />
  <embed src="images/advertisement/one.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="765" height="160"></embed>
</object>
<br><br>
<!--
-----------------------------------------Advertisement----------------------------------------
-->
<%
  }         //-----------------------End of condition if(uid!=null)---------------------------
  else{
%>

 <font color="red">  
 <h1>You have already Logged Out!</h1>
 </font>
 <h2>Please Login again to purchase more Items. </h2>
 <br><br><br><br>
 
<center>
<font color="#000000">
<strong><u>
Ads by Google</u></strong></font>
</center>
<br>
<!--
--------------------------------------Advertisement Start---------------------------------
-->
<a href="http://www.naukri.com" target="_blank" title="Go to naukri.com">
<img src="images/advertisement/imgad.gif" height="90" width="765" /></a>
<!--
--------------------------------------Advertisement End-----------------------------------
-->
<br><br>
<%
  }
%>
<div id="footer">
<center>
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</center>
</div>
</font>
</form>
</body>
</html>
