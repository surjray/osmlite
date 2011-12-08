<%@ page language="java" import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ACCOUNTS MANGER'S TABLE</title>
<link rel="stylesheet" href="sb_Styles11.css" type="text/css"/>
<script language='javascript'>
</script>
</head>
<body>
<div id="header"></div>
<DIV ALIGN="CENTER" style="font-weight:normal"><BR>
    <TABLE WIDTH="70%" BORDER="0" ALIGN="CENTER" CELLPADDING="4">
      <TR>
        <TD BGCOLOR="#F4FBFF" STYLE="border:1px solid #C9EBFF;"><div align="center"><STRONG>Accounts
        Manager's Table</STRONG></div></TD>
      </TR>
		<TR><TD><div align="justify">This is the page of the Accounts Manager
		  
		  <BR>
		  <BR />
		  The Sales Manager will provide the payment related 
		  information to the Accounts Manager. 
		 
		  <BR>
		  <BR />
		  The Accounts Manager will view the table to get the payment related  
		  information and send it to the Payment Gateway;
		  </div></TD></TR>
		</TABLE>
<br><br>		
<table bgcolor="#F4FBFF" border="2" cellpadding="" cellspacing="" width='80%'>

<tr>
<B>
<th>UserID</th>
<th>Price</th>
<th>CCN</th>
<th>CVV</th>
<th>CardHolder'sName</th>
</tr>		
		
<%

String uid=null;
Double price=null;
int ccn=0;
int cvv=0;
String cname=null;

String sql="SELECT * FROM accounts";

try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");

Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
uid=rs.getString(1);
price=rs.getDouble(2);
ccn=rs.getInt(3);
cvv=rs.getInt(4);
cname=rs.getString(5);
%>
<tr>
<td><%=uid %></td>
<td><%=price %></td>
<td><%=ccn %></td>
<td><%=cvv %></td>
<td><%=cname %></td>
</B>
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
<br>
<br>
<h3><b>~The details are to be Submitted to the Payment Gateway by The Accounts Manager~</h3>
</DIV>
<div id="footer">
<center>
<a href="http://localhost:8080/OSM/Admin.jsp" style="color:#CC6600" onMouseOver="style='text-decoration:underline; color:#FF6600; font-style:italic'" onMouseOut="style='text-decoration:none; color:#CC6600'"><b>Back to Administrative Page</b></a>
</center>
</div>
</body>
</html>
