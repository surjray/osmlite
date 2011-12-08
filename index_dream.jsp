 <%@ page contentType="text/html; charset=iso-8859-1" language="java" errorPage="" %>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=windows-1251">

<title>Welcome to OSMlite</title>
  <link rel="stylesheet" href="sb_Styles11.css" type="text/css"/>
<style>
TD {font-family: tahoma; font-size: 11px;}
A{font-family:tahoma;font-size: 11px;color:000000;font:900;text-decoration:underline}
A:visited {color:ffffff}
.bold{font:900}
.right{font-size:12px;font-family:verdana}
a.menu{color:1C5679;font-size:11;text-decoration:none;font:100}
a.menu:visited{color:1C5679}
.bold {
	font-family: Verdana, Geneva, sans-serif;
}
</style>
<script language="JavaScript">
<!--
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
//-->
</script>
<body leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0" >
<form>
<div id="header" style="background-color:#999999"></div>
<div id="tabs">
  <ul>
	<li><a href="index_dream.jsp"><span>Home</span></a></li>
<%
  String uid = (String)session.getAttribute("userid2");
  if(uid != null){
%>  
    <li><a href="Logout.jsp"><span>Log out</span></a></li>
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
<input name="searchButton" type="button" value="Search" onClick="forwardToSearch(this.form)" />
</div>
</form>
<table border="0" cellpadding="0" cellspacing="0">
  <tr> </tr>
  <tr> </tr>
  <tr>
    <td valign="top" width="170"><table border="0" cellpadding="0" cellspacing="0" width="170">
      <tr>
        <td width="170" align="center"><p><img src="images/osm_logo.png" alt="Logo" width="160" height="160"></p></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><img src="images/categories.jpg" width="168" border="0"></td>
      </tr>
      <tr>
        <td><table border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td style="padding-left:40"><a href="sb_Books.jsp" class="menu" style="font-size:12px"> Books</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="padding-left:40"><a href="sb_Apparels.jsp" class="menu" style="font-size:12px"> Apparels </a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="padding-left:40"><a href="Computers.jsp" class="menu" style="font-size:12px"> Computers and IT stuff</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="padding-left:40"><a href="LCDTelevision.jsp" class="menu" style="font-size:12px"> LCD Television</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="padding-left:40"><a href="DigitalCamera.jsp" class="menu" style="font-size:12px"> Digital Camera</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="padding-left:40"><a href="Mobiles.jsp" class="menu" style="font-size:12px"> Mobile phones</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td style="padding-left:40"><a href="Watches.jsp" class="menu" style="font-size:12px"> Watches</a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
      </tr>
    </table>
        <img src="images/t6.jpg" border="0" width="170" height="125"> <img src="images/cart6.JPG" border="0" width="170" height="170"></td>
    <td valign="top" width="656"><table border="0" cellpadding="0" cellspacing="0" width="603">
      <tr>
        <td width="332"><img src="images/your_account.jpg" border="0" width="332" height="61" alt=""></td>
        <td width="271"><img src="images/config.jpg" border="0" width="271" height="61" alt=""></td>
      </tr>
      <tr>
        <td background="images/win1_back.jpg"  width="332"><table border="0"  width="332" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top" width="180"><table border="0" cellpadding="0" cellspacing="0" width="205">
              <form action="">
                <tr><%  if(uid == null){ %>
                  <td width="112" height="30" style="padding-left:30"><p><a href="registration.html" class="menu" style="font-size:12px; font-weight:bold">Register yourself.<img src="images/register-icon.GIF" height="41" border="0" style="vertical-align:middle"></a>
                    
                 <br />Registration is fast and free. </p></td>
                </tr>
                <tr>
                  <td colspan="2"  height="30" style="padding-left:30"><p>Already a registered member?
                  </p></td>
                </tr>
                <tr>
                  <td colspan="2" style="padding-left:30"></td>
                </tr>
                <tr>
                  <td colspan="2"  align="center"><p>
                    <input name="button" type="button" value="Log in" onClick='window.location.assign("Login.html")'>
                  </p></td></tr>
<% }else{ %><td class="menu" style="padding-left:30;font-size:12px; vertical-align:middle;color:1C5679">Welcome <b><%= uid %></b><br /><br /></td>
</tr>
<tr><td style="padding-left:60"><a href="MyAccount.jsp"><img src="images/user.JPG" border="1"/></a></td></tr>
<% } %>
   
              </form>
            </table></td>
            <td valign="top"><table width="118" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="75"  style="padding-left:7">
                  <a href="#" onclick='window.location.assign("ShoppingCart.jsp?forwarding=empty&count=1");'><img src="images/shopping_cart_icon.jpg" width="75" height="75" border="0"></a></td>
             </tr>
			 <tr><td class="menu" style="padding-left:25">View Cart</td></tr>
            </table>
			
          </tr>
        </table></td>
        <td background="images/win2_back.jpg" width="271" valign="top"><table border="0" cellpadding="0" cellspacing="0"  width="271">
          <tr>
            <td rowspan="2" valign="top" style="padding-left:15"><img src="images/pic.jpg" border="0" width="68" height="90" alt=""></td>
            <td valign="top"><img src="images/personalize.jpg" border="0" width="188" height="31" alt=""></td>
          </tr>
          <tr>
            <td style=" font-size:12px;padding-left:20;padding-right:40">We offer exclusive licensing or reseller volume rates, depending on your marketing</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td colspan="2"><img src="images/bottom1.jpg" border="0" width="603" height="14" alt=""></td>
      </tr>
    </table>
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="3">&nbsp;</td>
          </tr>
          <tr align="center">
            <td width="250"><a href="sb_Books.jsp"><img src="images/pic1.jpg" border="0" width="174" height="162" alt=""></a></td>
            <td width="250"><a href="Computers.jsp"><img src="images/pic3.jpg" border="0" width="168" height="162" alt=""></a></td>
            <td width="250"><a href="DigitalCamera.jsp"><img src="images/pic2.jpg" border="0" width="184" height="162" alt=""></a></td>
          </tr>
          <tr align="right">
            <td><a href=""></a></td>
            <td><a href=""></a></td>
            <td><a href=""></a></td>
          </tr>
        </table>
      <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
          <tr>
            <td><a href="sb_Apparels.jsp"><img src="images/pic4.jpg" border="0" width="200" height="162" alt=""></a></td>
            <td>&nbsp;</td>
            <td><a href="Mobiles.jsp"><img src="images/pic6.jpg" alt="" width="200" height="162" border="0"></a></td>
            <td><a href="Watches.jsp"><img src="images/pic7.jpg" alt="" width="200" height="162" border="0"></a></td>
            <td>&nbsp;</td>
          </tr>
          <tr align="right">
            <td><a href=""></a></td>
            <td>&nbsp;</td>
            <td><a href=""></a></td>
            <td><a href=""></a></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td colspan="5">&nbsp;</td>
          </tr>
        </table>
      <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="images/tracking.jpg" border="0" width="332" height="51" alt=""></td>
            <td><img src="images/contact.jpg" border="0" width="271" height="51" alt=""></td>
          </tr>
          <tr>
            <td background="images/win3_back.jpg"><table border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="top" width="200"><table border="0" cellspacing="0" cellpadding="0" width="200">
                      <tr>
                        <td style="padding-left:38;padding-right:20"><a href="sb_Apparels.jsp"><img src="images/new-summer-sale_210409.gif" border="0" width="263" height="94"></a></td>
                      </tr>
                      <tr> </tr>
                  </table></td>
                  <td valign="top">&nbsp;</td>
                </tr>
            </table></td>
            <td background="images/win2_back.jpg"><table width="236" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="83" rowspan="2">&nbsp;</td>
                </tr>
                <tr>
                  <td width="146" style="padding-left:40;padding-right:30"><a href="index_dream.jsp"><img src="images/Shopping-newGift-Store_210808.gif" border="0"></a></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2"><img src="images/bottom3.jpg" border="0" width="603" height="14" alt=""></td>
          </tr>
          <tr>
            <td colspan="2" height="20"><img src="images/spacer.gif" border="0" width="50" height="1" alt=""><img src="images/fin_part.GIF" border="0"></td>
          </tr>
          <tr>
            <td colspan="2" height="22" background="images/footer.jpg"><table border="0" cellpadding="0" cellspacing="0" width="603">
                <tr>
                  <td style="padding-left:40">OSM Inc., 2009. All rights reserved.</td>
                  <td><a href="Terms.html" class="menu" target="_blank"> &gt; Terms and Conditions</a></td>
                </tr>
            </table></td>
          </tr>
      </table></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>
</body>
</html>