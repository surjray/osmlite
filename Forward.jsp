<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" %>

<%
  String forwardTo = request.getParameter("forwarding");
  String modelID = request.getParameter("modelID2");
  String uid = (String)session.getAttribute("userid2");
  //request.setAttribute("modelid",modelID);
  String pageID = request.getParameter("pageID");
  //request.setAttribute("pageid",pageID);
  
  if(modelID != null){
  String price = request.getParameter("price");
  String category = request.getParameter("catgry");
  String vendor = request.getParameter("vendor");
  String model = request.getParameter("model");
  String quantity = request.getParameter("quantity");
    request.setAttribute("modelid",modelID);
    request.setAttribute("pageid",pageID);
    request.setAttribute("cart_price",price);
	request.setAttribute("cart_category",category);
	request.setAttribute("cart_vendor",vendor);
	request.setAttribute("cart_model",model);
	request.setAttribute("cart_quantity",quantity);
  }
  if(uid != null)
  {
%>

<jsp:forward page="<%= forwardTo %>"/>

<%
  }
  if(uid == null){
%>
<jsp:forward page="Error.jsp"/>
<%
  }
%>