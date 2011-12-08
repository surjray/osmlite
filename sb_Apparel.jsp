 <%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Details page</title>
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
      var path="Search.jsp?searchText="+txt+"&category="+cat;
      window.open(path);
     }
    else alert("Please enter the search parameters.");
   }
   function forwardToCart(id,page,prc,cat,ven,mod,quan,pgID)
   {
      var path="Forward.jsp?modelID2="+id+"&forwarding="+page+"&price="+prc+"&catgry="+cat+"&vendor="+ven+"&model="+mod+"&quantity="+quan+"&pageID="+pgID;
      window.location.assign(path);
   }
  </script>
 </head>
 <body onload="init()">
  <form>
<div id="header"></div>

<div id="tabs">
  <ul>
	<li><a href="index_dream.jsp"><span>Home</span></a></li>
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
	<li><a href="Feedback.html" target="_blank"><span>Feedback</span></a></li>
  </ul>
</div>

<div id="infobar" style="background-color:#9999CC;">
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

     <%
    Connection cn=null;
    PreparedStatement pst=null;
    ResultSet rs=null;
    String qr="select * from apparels where id=?";

    String id=request.getParameter("id");
    if(id!=null){
     try {
      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      cn=DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
      pst=cn.prepareStatement(qr);
      pst.setString(1,id);
      rs=pst.executeQuery();
      %>
	  
<div id="main">
     <table bgcolor="#FFFFCC">
     <% if (rs.next()){  
String img=rs.getString("image");
String item=rs.getString("item");
String brn=rs.getString("brand");
String type=rs.getString("type");
String sz=rs.getString("size");
double prc=rs.getDouble("price");
double disc=rs.getDouble("discount");
double save=(prc*100)/(100-disc)-prc;
	 
	 %>
      <tr>
	  <td><img src="<%= img %>" alt="Product sample"/></td>
	  <td>
		<ul>
		 <li style="white-space: nowrap"><strong><%= item %></strong></li>
		 <li>Brand: <%= brn %></li>
		 <li>Type: <%= type %></li>
		 <li>Size: <%= sz %></li>
    	 <li><strong>Our Price Rs.&nbsp;<%=prc  %></strong><br />You save Rs.&nbsp;<%= save %></li></ul></td>
        <td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='forwardToCart("<%= id %>","ShoppingCart.jsp","<%= prc %>","Apparel","<%= brn %>","<%= item %>","1","sb_Apparels")'/><br />Or<br />
<input type="button" name="buy" value="Buy Now" onclick='forwardToCart("<%= id %>","Buy.jsp","<%= prc %>","Apparel","<%= brn %>","<%= item %>","1","sb_Apparels")'/>
        </td>
  	</tr>
	<tr><td colspan="3"><em>Product Description:</em><br /><%= rs.getString("features") %><hr /></td></tr>
	<tr><td colspan="3"><strong>Shipping Details:</strong>
The Seller will ship the Product in 7 working days.<br />Shipping Charges - Rs. <%= rs.getInt("shipping") %><br />Applicable Octroi charges will be paid by the consignee.<br /><strong>Payment methods accepted:</strong><br />EMI: 3 Easy Monthly Installments (Available on CITI Bank and ICICI Bank Credit Card Only)<br />Credit Card: VISA | Master Card | American Express | Citibank Diner<br />Cheque.<br />Net Banking: ICICIBank.com | HDFC Bank Direct Pay | Federal Bank - FedNet | ITZ Cash<br />Cash on Delivery - COD
           </td>
      </tr>
    <% } %>
     </table>
</div>

<div id="footer">
<input type="button" value="Back" onclick='window.location.assign("sb_Apparels.jsp");'/>
</div>
     
   </form>
 </body>
</html>
  <% }catch(SQLException sqle){}
    catch(Exception e){}
    finally {
	try {
	if(pst!=null)pst.close();
        if(cn!=null)cn.close();
     }catch(SQLException sqle){}
    }
   }
   %>
