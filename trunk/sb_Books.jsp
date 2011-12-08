 <%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Books catalog</title>
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
  <form action="sb_Books.jsp" name="sb_Books" method="post">
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
    Statement st=null;
    ResultSet rs=null;
    int fr1=1,to1=10,MAX=20,fr2=fr1,to2=to1;//default
    String srt=" bestselling asc";//default

    String sub=request.getParameter("submit");
    if(sub!=null){

    try{
     fr1=Integer.parseInt(request.getParameter("from"));//any number between 1 and MAX
     to1=Integer.parseInt(request.getParameter("to"));//any number between 1 and MAX
    }catch(NumberFormatException nfe){}

     int diff=to1-fr1;
     if(sub.equals("Previous")){ fr2=(fr1-1);to2=(fr1-diff-1);}
     if(sub.equals("Next")){ fr2=(to1+1);to2=(to1+diff+1);}

     if (fr2>to2){fr2=fr2-to2;to2=fr2+to2;fr2=to2-fr2;}//swap
     }
  
    String qr="select * from books order by"+srt;

    try {
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    cn=DriverManager.getConnection("jdbc:odbc:PRODUCT_OSM","","");
    st=cn.createStatement();
    rs=st.executeQuery(qr);
   %>	
   <iframe src="categories.html" align="left" width="15%" height="1010"></iframe>
<div id="main" style="margin-left:20%; margin-right:0%">
<span style="font-weight:normal">Showing <%= fr2<1?1:fr2 %> - <%= to2>MAX?MAX:to2 %> of <%= MAX %> Results</span>

     <table bgcolor="#FFFFCC">
    <% while (rs.next()){
    	int row=rs.getRow();
	if(row>=fr2 && row<=to2){
String id=rs.getString("id");	
String img=rs.getString("image_min");
String name=rs.getString("name");
String auth=rs.getString("author");
String frm=rs.getString("format");
String pub=rs.getString("publisher");
String isbn=rs.getString("isbn");
String slr=rs.getString("seller");
double prc=rs.getDouble("price");
    %>
      <tr>
	  <td><%= row %></td>
	  <td><a href="sb_Book.jsp?id=<%= id %>"><img src="<%= img %>" alt="Cover Page"/></a></td>
	  <td>
		<ul>
		 <li><strong><%= name %></strong></li>
		 <li>Author: <%= auth %></li>
	  	 <li>Price: Rs. <%= prc %></li>
          </ul>
        </td>
        <td align="center">
<input type="button" name="atc" value="Add to Cart" onclick='forwardToCart("<%= id %>","ShoppingCart.jsp","<%= prc %>","Book","<%= pub %>","<%= name %>","1","sb_Books")'/><br />Or<br />
<input type="button" name="buy" value="Buy Now" onclick='forwardToCart("<%= id %>","Buy.jsp","<%= prc %>","Book","<%= pub %>","<%= name %>","1","sb_Books")'/>
        </td>
      </tr>
      <% }  } %>
     </table>
</div>

    <input type="hidden" name="from" value="<%= fr2 %>"/>
    <input type="hidden" name="to" value="<%= to2 %>"/>
	
<div id="footer">
    <% if(fr2>1){ %><input type="submit" name="submit" value="Previous"/>&nbsp;
    <% }if(to2<MAX){ %><input type="submit" name="submit" value="Next"/><% } %><br /><br />
	<a href="index_dream.jsp" style="text-decoration:none; font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF"><b>Home</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="aboutus.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF"><b>About Us</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Feedback.html" style="text-decoration:none;font-size:12px;font-family:Georgia, 'Times New Roman', Times, serif; color:#0099FF"><b>Feedback</b></a>
</div>

  </form>
 </body>
</html>
  <% }catch(SQLException sqle){}
    catch(Exception e){}
    finally {
	try {
	if(st!=null)st.close();
        if(cn!=null)cn.close();
    }catch(SQLException sqle){}
   }
   %>
