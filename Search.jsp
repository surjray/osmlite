<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
 <meta http-equiv="content-type" content="text/html;charset=utf-8" />
<title>Search.OSM.com</title>
<link rel="stylesheet" href="sb_Styles11.css" type="text/css"/>
<script type="text/javascript">
function init()
{
  document.getElementById("searchText").focus();
}
function forwardToSearch(f)
{
      var txt=f.searchText.value;
      var cat=f.category.value;
      if((txt != "") && (cat != "0"))
     {
    	f.action="http://localhost:8080/OSM/Search.jsp";
    	f.submit();
  	}
    else alert("Please enter the search parameters.");
}

</script>
</head>
<body onload="init()">

<%
  String searchText = request.getParameter("searchText");
  String category = request.getParameter("category");
  String path=null;
  String sql = "SELECT pathURL FROM search where vendorID='"+ searchText +"' and category='"+ category +"'";
 //Code for books & apparels-------------------------------------- 
	if(category.equals("Book")) 
	 sql="select id from books where name like"+" '%"+searchText+"%'";
	else if(category.equals("Apparel")) 
	 sql="select id from apparels where item like"+" '%"+searchText+"%'";
//----------------------------------------------------------------
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
     Statement stmt = con.createStatement();
     ResultSet rs = stmt.executeQuery(sql);

  if(rs.next())
  {
    path = rs.getString(1);
//Code for books & apparels-------------------------------------- 
	if(category.equals("Book")) 
    path = "sb_Book.jsp?id="+path;
	else if(category.equals("Apparel")) 
    path = "sb_Apparel.jsp?id="+path;
//---------------------------------------------------------------
%>

<jsp:forward page="<%= path %>"/>

<%  }else{ %>

<form name="searchForm">

<div id="header"></div>

<div id="tabs">
  <ul>
	<li><a href="Home.html"><span>Home</span></a></li>
<%
  String uid = (String)session.getAttribute("userid2");
  if(uid == null){
%>
	<li><a href="Login.html"><span>Log in</span></a></li>
	<li><a href="registration.html"><span>Register</span></a></li>
<% }else{ %>
    <li><a href="Logout.jsp"><span>Logout</span></a></li>
	<li><a href="#" onclick='window.location.assign("ShoppingCart.jsp?forwarding=empty&count=1");'><span>Shopping Cart</span></a></li>	
<% } %>
	<li><a href="MyAccount.jsp"><span>My Account</span></a></li>
	<li><a href="aboutus.html"><span>About Us</span></a></li>
	<li><a href="Feedback.jsp" target="_blank"><span>Feedback</span></a></li>
  </ul>
</div>
<br><hr>
<div id="infobar">
<input name="searchText" id="searchText" type="text" size="50"/>
&nbsp;Category:
<select name="category">
<option value="0">Select</option>
<option value="Mobile">Mobile</option>
<option value="Digital Camera">Digital Camera</option>
<option value="LCD Television">LCD Television</option>
<option value="Computer">Computer</option>
<option value="Book">Books</option>
<option value="Apparel">Apparels</option>
<option value="Watch">Watches</option>
</select>&nbsp;
<input name="searchButton" type="button" value="Search" onclick="forwardToSearch(this.form)" />
</div>

<div id="main">
<br /><br /><br /><br />
<span style="font-size:xx-large; font-family: Georgia, 'Times New Roman', Times, serif; color:#FF0000; padding: 50px">
Sorry! No Match Found.
</span>
<br /><br /><br />
<br /><br /><br />
</div>

<div id="footer">
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</div>     
</form>
<%
  }
  
%>

</body>
</html>
