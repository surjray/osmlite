<%@ page import="java.sql.*" %>
<%
PreparedStatement ps=null;
ResultSet rs=null;
int m=0;
String sql="SELECT COUNT(*) FROM user WHERE userid=? and password=?";
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:OSM","","");
String uid=request.getParameter("uid");
request.setAttribute("userid1",uid);
String password=request.getParameter("password");
ps=cn.prepareStatement(sql);
ps.setString(1,uid);
ps.setString(2,password);
rs=ps.executeQuery();
if(rs.next())
m=Integer.parseInt(rs.getString(1));
if(m==0)
{ %>
<HTML>
<head>
<title>Login Page: OSMlite.com</title>
<link rel="stylesheet" href="sb_Styles-V1.1.css" type="text/css"/>

<script language="javascript">
function startInit()
{
  document.errorLogin.searchText.select();
  document.errorLogin.searchText.focus();
  document.errorLogin.search_button.disabled = true;
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
<BODY bgcolor="white" onLoad="startInit()">
<form name="errorLogin" method="get">

<div id="header"></div>

<div id="tabs">
  <ul>
    <li><a href="http://localhost:8080/OSM/index_dream.html" title="Go to Home page"><span>Home</span></a></li>

    <li><a href="http://localhost:8080/OSM/Login.html" title="Go to Login page"><span>Sign in</span></a></li>

    <li><a href="http://localhost:8080/OSM/registration.html" title="Register"><span>Register</span></a></li>
    <li><a href="http://localhost:8080/OSM/aboutus.html" title="About Us"><span>About us</span></a></li>

    <li><a href="http://localhost:8080/OSM/MyAccount.jsp" title="My OSMlite"><span>My Account</span></a></li>
    <li><a href="http://localhost:8080/OSM/Feedback.html" title="Give Feedback" target="_blank"><span>Feedback</span></a></li>
  </ul>
</div>
<hr>
<div id="infobar">
<input type="text" name="searchText" size="70" value="Type vendor name eg. Nokia, Samsung or Book name etc.">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- <span> --> 
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
<!-- </span> -->
</div>
<br>
<!--
<table border="0" align="left">
<tr>
<td rowspan="3">
<img src="osm_logo.png" border="0" align="left" width="130" height="130" />
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
<b> [ </b><a href="Login.html"><b>Back to Login page</b></a><b> ] </b>
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
<br><br><br><br><br><br><br>
-->
<font color="red" face="Times New Roman, Times, serif">
<H1>Error!!! No Match Found !</H1>
</font>
<font color="#9966FF" face="Arial, Helvetica, sans-serif">
<H2>Either username or password is incorrect...</H2>
</font>
<br><br><br><br><br><br>
<center>
<font color="#000000">
<strong><u>Ads by Google</u></strong>
</font>
</center>
<br>
<!--
--------------------------------------Advertisement Start---------------------------------
-->
<a href="http://www.samsung.com" target="_blank" title="Go to samsung.com">
<img src="images/advertisement/mainrev_visual_00.jpg" height="150" width="765" />
</a>
<!--
--------------------------------------Advertisement End-----------------------------------
-->
<br><br>
<div id="footer">
<center>
<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">About Us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF">Feedback</a>
</center>
</div>
</form>
</BODY>
</HTML>
<% }
if(m>0)
{
%>
<jsp:forward page="ActivateSession.jsp"/>
<%}
}
catch(SQLException e)
{}
%>


