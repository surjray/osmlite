<%@ page import="java.sql.*" %>
<%
PreparedStatement ps=null;
ResultSet rs=null;
int m=0;
String sql="SELECT COUNT(*) FROM employee WHERE empid=? and password=?";
//String query = "SELECT pathUrl FROM employee Where empid='"+empid+"'";
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection cn=DriverManager.getConnection("jdbc:odbc:OSM","","");
String empid=request.getParameter("eid");
request.setAttribute("empid1",empid);
String password=request.getParameter("password");
ps=cn.prepareStatement(sql);
ps.setString(1,empid);
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
<br>
<br><br><br><br><br>
<div id="footer">
<center>
<a href="LoginEmployee.html" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Login page</b></a>
</center>
</div>
</form>
</BODY>
</HTML>
<% }
if(m>0)
{
  String query = "SELECT pageUrl FROM employee Where empid='"+empid+"'";
  String URL = null;
  //session.setAttribute("empid",empid);
  //session.setMaxInactiveInterval(1200);
  Statement stmt = cn.createStatement();
  ResultSet rs1 = stmt.executeQuery(query);
  if(rs1.next()){
    URL = rs1.getString(1);
  }
  request.setAttribute("url",URL);
%>
<jsp:forward page="ActivateSessionEmployee.jsp"/>
<%}
}
catch(SQLException e)
{}
%>


