<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
    HttpSession sess = request.getSession();
    sess.removeAttribute("telExchangeItem");
//Získání parametrů z formuláře      
    Integer id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note  = request.getParameter("note");
//Zpracování nových dat
    moje.appLayer.TelExchangeBO.editTelExchange(id, name, building, note);
    
    sess.setAttribute("telExchangeItem", moje.appLayer.TelExchangeBO.getTelExchangeByID(id));

    String telExchangeId = id.toString();
    String link = ("readTelExchanges.jsp?type=edit&name="+name+"&exportId="+telExchangeId);
    response.sendRedirect(link);
%>
