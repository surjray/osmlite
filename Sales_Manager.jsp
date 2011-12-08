<%@ page language="java" import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>SALES MANGER'S TABLE</title>
<link rel="stylesheet" href="sb_Styles11.css" type="text/css"/>
<script language='javascript'>
function init()
{
  document.sales.userid.focus();
}
function verify()
{
var a=document.sales.userid.value;
var b=document.sales.amt.value;
var c=document.sales.ccn.value;
var d=document.sales.cvv.value;
var e=document.sales.country.value;

if(a =="")
{
alert("Please Enter Valid Userid")
return false
}
if(b =="")
{
alert("Please Enter a Valid Amount")
return false
}
if(isNaN(b))
{
alert("Amount must be numeric")
return false
}
if(c =="")
{
alert("Please Enter Valid Credit Card No.")
return false
}
if(isNaN(c))
{
alert("Credit Card No. must be numeric")
return false
}
if(d =="")
{
alert("Please Enter Valid CVV")
return false
}
if(isNaN(d))
{
alert("CVV no. must be numeric")
return false
}
if(e =="")
{
alert("Please Enter Valid Country")
return false
}
return true
}
</script>
</head>
<body onload="init();">
<div id="header"></div>
<DIV ALIGN="CENTER" style="font-weight:normal"><BR>
    <TABLE WIDTH="70%" BORDER="0" ALIGN="CENTER" CELLPADDING="4">
      <TR>
        <TD BGCOLOR="#F4FBFF" STYLE="border:1px solid #C9EBFF;"><div align="center"><STRONG>Sales
        Manager's Table</STRONG></div></TD>
      </TR>
		<TR><TD><div align="justify">This is the page of the Sales Manager
		  
		  <BR>
		  <BR />
		  The Sales Manager will view the sales table to get the sales related 
		  information as provided by the Administrator and get details of the 
		  sales of our customers.
		  <BR>
		  <BR />
		  The sales Manager has to fill the given form to give deatils to 
		  the Accounts Manager.
		  </div></TD></TR>
		</TABLE>
		
		
<table bgcolor="#F4FBFF" border="1">
<tr>

<tr><b>
<th>SalesID</th>
<th>TransactionID</th>
<th>Date of Payment</th>
<th>UserID</th>
<th>ProductID</th>
<th>Price</th>
<th>Category</th>
<th>Vendor</th>
<th>Model</th>
<th>Quantity</th>
<th>Credit_Type</th>
<th>CardHolder'sName</th></b>
<th>CCN</th>
<th>CVV</th>
</tr>		
<%
String tid=null;
String sid=null;
String dop=null;
String uid=null;
String pid=null;
Double price=0.0;
String cat=null;
String ven=null;
String model=null;
int qnty=0;
String cre_type=null;
String cname=null;
int ccn=0;
int cvv=0;
String sql="SELECT * FROM sales";

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");

Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
sid=rs.getString(1);
tid=rs.getString(2);
dop=rs.getString(3);
uid=rs.getString(4);
pid=rs.getString(5);
price=rs.getDouble(6);
cat=rs.getString(7);
ven=rs.getString(8);
model=rs.getString(9);
qnty=rs.getInt(10);
cre_type=rs.getString(11);
cname=rs.getString(12);
ccn=rs.getInt(13);
cvv=rs.getInt(14);
%>

<tr>
<td><%=sid %></td>
<td><%=tid %></td>
<td><%=dop %></td>
<td><%=uid %></td>
<td><%=pid %></td>
<td><%=price %></td>
<td><%=cat %></td>
<td><%=ven %></td>
<td><%=model %></td>
<td><%=qnty %></td>
<td><%=cre_type %></td>
<td><%=cname %></td>
<td><%=ccn %></td>
<td><%=cvv %></td>
</tr>

<%}
rs.close();
st.close();
con.close();
}
catch(SQLException e){}
catch(Exception e){}
%>

</table>
<br><br>
<form name='sales' action='Sales_Action.jsp' method='post' onSubmit='return verify()'>
<h3>~Please fill in the form for Payment Details for The Accounts Manager~</h3> 
<table bgcolor="" cellpadding="5" cellspacing="5">
<tr>
<td><b>User_ID:</td>
<td><input type='text' name='userid' ></td>
</tr>
<tr>
<td><b>Amount:</td>
<td><input type='text' name='amt' ></td>
</tr>
<tr>
<td><b>Credit Card NO.:</td>
<td><input type='text' name='ccn' ></td>
</tr>
<tr>
<td><b>CVV NO.:</td>
<td><input type='password' name='cvv' ></td>
</tr>
<tr>
<td><b>Cardholder's Name:</td>
<td><input type='text' name='country'></td>
</tr>
<br>
<td><input type='submit' value="Submit"></td>

<td><input type='reset' value="Reset" onclick="init();"></td>
</table>
<form>
</DIV>
<div id="footer">
<center>
<a href="http://localhost:8080/OSM/Admin.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Administrative Page</b></a>
</center>
</div>
</body>
</html>

