<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Buy: OSMlite.com</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>
<script language="javascript">
function startInit()
{
  document.getElementById("section1").style.visibility="hidden";
  document.getElementById("section2").style.visibility="hidden";
  document.getElementById("section3").style.visibility="hidden";
  //document.getElementById("section4").style.visibility="hidden";
  document.getElementById("section5").style.visibility="hidden";
  document.getElementById("section6").style.visibility="hidden";
  document.getElementById("section7").style.visibility="hidden";
  document.getElementById("section8").style.visibility="hidden";
  document.buy.ccNum.focus();
}
function validate()
{
  var creditCardNum = document.buy.ccNum.value;
  //var bankName = document.buy.bName.value;
  var branch = document.buy.bLoc.value;
  var cardType = document.buy.type.value;
  var exDate = document.buy.date.value;
  var exYear = document.buy.year.value;
  var CVV = document.buy.cvv.value;
  if(isNaN(creditCardNum))
  {
    document.getElementById("section1").style.visibility="visible";
	document.buy.ccNum.select();
	document.buy.ccNum.focus();
	return false
  }
  if(isNaN(creditCardNum) == false)
  {
    document.getElementById("section1").style.visibility="hidden";
  }
  if(creditCardNum == "")
  {
    document.getElementById("section2").style.visibility="visible";
	document.buy.ccNum.select();
	document.buy.ccNum.focus();
	return false
  }
  if(creditCardNum != "")
  {
    document.getElementById("section2").style.visibility="hidden";
  }
  if(creditCardNum.length != 10)
  {
    document.getElementById("section3").style.visibility="visible";
	document.buy.ccNum.select();
	document.buy.ccNum.focus();
	return false    
  }
  if(creditCardNum.length == 10)
  {
    document.getElementById("section3").style.visibility="hidden";     
  }
  /**
  if(bankName == "")
  {
    document.getElementById("section4").style.visibility="visible";
	document.buy.bName.select();
	document.buy.bName.focus();
	return false
  }
  if(bankName != "")
  {
    document.getElementById("section4").style.visibility="hidden";
  }
  */
  if(branch == "")
  {
    document.getElementById("section5").style.visibility="visible";
	document.buy.bLoc.select();
	document.buy.bLoc.focus();
	return false
  }
  if(branch != "")
  {
    document.getElementById("section5").style.visibility="hidden";
  }
  if(cardType == "0")
  {
    document.getElementById("section6").style.visibility="visible";
	//document.buy.type.select();
	return false
  }
  if(cardType != "0")
  {
    document.getElementById("section6").style.visibility="hidden";
  }
  if(exDate == "0")
  {
    document.getElementById("section7").style.visibility="visible";
	//document.buy.date.select();
	return false
  }
  if(exDate != "0")
  {
    document.getElementById("section7").style.visibility="hidden";
  }
  if(exYear == "0")
  {
    document.getElementById("section7").style.visibility="visible";
	//document.buy.year.select();
	return false
  }
  if(exYear != "0")
  {
    document.getElementById("section7").style.visibility="hidden";
  }
  if(CVV == "")
  {
    document.getElementById("section8").style.visibility="visible";
	document.buy.cvv.select();
	document.buy.cvv.focus();
	return false
  }
  if(CVV != "")
  {
    document.getElementById("section8").style.visibility="hidden";
  }
  if(CVV.length != 3)
  {
    document.getElementById("section8").style.visibility="visible";
	document.buy.cvv.select();
	document.buy.cvv.focus();
	return false
  }
  if(CVV.length == 3)
  {
    document.getElementById("section8").style.visibility="hidden";
  }
  document.buy.cardNo.value = creditCardNum;
  document.buy.cvvNo.value = CVV;
  document.buy.bank.value = bankName;
  return true
  //document.buy.action = "http://localhost:8080/OSM/CheckBuy.jsp";
  //document.buy.submit();
}
function put(card)
{
  var c = document.buy.type.selectedIndex;
  var temp = card[c].text;
  document.buy.cardType.value = temp;
}
function forwardTo(v)
{
  document.buy.forwarding.value = "empty"; 
  document.buy.count.value = v;
  document.buy.action = "http://localhost:8080/OSM/ShoppingCart.jsp";
  document.buy.submit();
}
</script>
</head>

<body onload="startInit()">
<form name="buy" action="http://localhost:8080/OSM/Buy.jsp" method="post" onsubmit="return validate()">
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
<font face="Tahoma" color="#9966FF">
<input type="hidden" name="forwarding" value="">
<input type="hidden" name="count" value="">
<input type="hidden" name="cardNo" value="">
<input type="hidden" name="cvvNo" value="">
<input type="hidden" name="cardType" value="empty">

<%
  if(uid != null){
  int m=0;
  //double amount = 0.0;
  double totalSum = 0.0;
  String model = (String)request.getAttribute("modelid");
  //int quantity = Integer.parseInt((String)request.getAttribute("cart_quantity"));
  if(model != null){
    totalSum = Float.parseFloat((String)request.getAttribute("cart_price"));
%>
<input type="hidden" name="modelID2" value="<%= model %>">
<%
  }
  else{
    totalSum = Float.parseFloat(request.getParameter("price"));
%>
<input type="hidden" name="modelID2" value="empty">
<%
  }
  //int cardNumber = Integer.parseInt(request.getParameter("cardNo"));
  //int cvvNumber = Integer.parseInt(request.getParameter("cvvNo"));
  String cardType = request.getParameter("cardType");
  String sql = "SELECT COUNT(*) FROM creditCard WHERE creditCardNum=? AND cvvNum=? AND cardType=?";
  //String query = "SELECT totalBalance FROM creditCard WHERE creditCardNum="+cardNumber+" AND cvvNum="+cvvNumber+" AND bankName='"+bank+"'";
  
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
  
  if(cardType != null){
  int cardNumber = Integer.parseInt(request.getParameter("cardNo"));
  int cvvNumber = Integer.parseInt(request.getParameter("cvvNo"));
  //String query = "SELECT totalBalance FROM creditCard WHERE creditCardNum="+cardNumber+" AND cvvNum="+cvvNumber+" AND cardType='"+cardType+"'";
  
  try{
    PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1,cardNumber);
	ps.setInt(2,cvvNumber);
	ps.setString(3,cardType);
	ResultSet rs = ps.executeQuery();
	if(rs.next())
	{
	  m=Integer.parseInt(rs.getString(1));
	}
	rs.close();
	ps.close();
	}catch(SQLException e){}
     catch(Exception e){}
	if(m != 0)
	{
/**	  try{
	  Statement stmt = con.createStatement();
	  ResultSet rs = stmt.executeQuery(query);
	  if(rs.next()){
	    amount = rs.getDouble(1);
	  }
	  rs.close();
	  stmt.close();
	  }catch(SQLException e){}
       catch(Exception e){}
	   
	   if(amount < totalSum){
*/	     
%>
<!--
<h1><font face="Tahoma" color="#FF0000">Error! Your Purchasing Amount Exceeded Your Total Balance .</font></h1>
<h2><font face="Tahoma" color="#00CC66">Please Remove Some Items From The Cart & Try Again...</font></h2>
-->
<%
/**	   }
	   else{
*/
%>

<jsp:forward page="BuySuccess.jsp"/>

<%	     
	   
	}
	else{
%>

<h1>
<img src="images/msg_error.gif" height="30" width="30" />
<font face="Tahoma" color="#FF0000">Error! Invalid Credit Card Number, Please Check.</font>
</h1>

<%
	}
  }
%>

<input type="hidden" name="quantity" value="1">

<input type="hidden" name="price" value="<%= totalSum %>">
<fieldset>
<legend align="center"><font color="#CC6600" size="4"><b>Credit Card Details</b></font></legend>
<br><br>
<table border="0" align="center">
<tr>
<td><font face="Times New Roman, Times, serif" size="4">
Card Type : 
</font>
</td>
<td>
<select name="type" onchange="put(this)">
<option value="0">[Select]</option>
<option value="Discover">Discover</option>
<option value="MasterCard">MasterCard</option>
<option value="Visa">Visa</option>
<option value="AmericanExpress">AmericanExpress</option>
<option value="Citibank Diner">Citibank Diner</option>
</select>
</td>
</tr>
<tr>
<td><div id="section6"><font color="#FF0000">Please Select a Card Type!</font></div></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font face="Times New Roman, Times, serif" size="4">
Expiration Date :  
</font>
</td>
<td>
<select name="date">
<option value="0">[Month (mm)]</option>
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>
&nbsp;&nbsp;
<select name="year">
<option value="0">[Year]</option>
<option>2009</option>
<option>2010</option>
<option>2011</option>
<option>2012</option>
<option>2013</option>
<option>2014</option>
</select>
</td>
</tr>
<tr>
<td><div id="section7"><font color="#FF0000">Please Select The Expiration Date!</font></div></td>
<td>&nbsp;</td>
</tr>
<tr>
<td><font face="Times New Roman, Times, serif" size="4">Please Enter Your Credit Card Number : 
</font></td>
<td><input type="text" name="ccNum" value="" size="25">
</td>
</tr>
<tr>
<td>
<div id="section1"><font color="#FF0000">Please Enter a valid Credit Card Number!</font></div>
<div id="section2"><font color="#FF0000">Please Enter Your Credit Card Number!</font></div>
</td>
<td>
<div id="section3"><font color="#FF0000">The Number must exactly contain 10 digits!</font></div>
</td>
</tr>
<tr>
<td><font face="Times New Roman, Times, serif" size="4">Credit Card CVV Number : 
</font></td>
<td><input type="password" name="cvv" value="" size="25"></td>
</tr>
<tr>
<td>
<div id="section8"><font color="#FF0000">Please Enter Correct Credit Card CVV Number!</font></div>
</td>
<td>&nbsp;</td>
</tr>
<!--
<tr>
<td><font face="Times New Roman, Times, serif" size="4">Please Enter The Bank Name : 
</font></td>
<td><input type="text" name="bName" value="" size="25"></td>
</tr>
<tr>
<td>
<div id="section4"><font color="#FF0000">Please Enter The Bank Name!</font></div>
</td>
<td>&nbsp;</td>
</tr>
-->
<tr>
<td><font face="Times New Roman, Times, serif" size="4">Please Enter Card Holder's Name : 
</font></td>
<td><input type="text" name="bLoc" value="" size="25"></td>
</tr>
<tr>
<td>
<div id="section5"><font color="#FF0000">Please Enter Card Holder's name!</font></div>
</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>&nbsp;</td>
<td align="left"><input type="submit" name="confirm" value="Confirm Payment">
&nbsp;&nbsp;&nbsp; <input type="reset" name="clear" value="Clear Form" onclick="startInit()">
</td>
</tr>
</table>
<br>
</fieldset>
<br>

<%
  }
  else{
%>

<font color="red">
<h1>Error! You Have already Logged Out!</h1>
</font>
<h2> Please Login Again to Purcahse Products.</h2>
<br><br><br><br><br>
<center>
<font color="#000000">
<strong><u>
Ads by Google</u></strong>
</font>
</center>
<br>
<!--
--------------------------------------Advertisement Start---------------------------------
-->
<a href="http://www.hp.com" target="_blank" title="Go to hp.com">
<img src="images/advertisement/HHO_20090301_R1-1L_save44percent.jpg" height="200" width="765" />
</a>
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
