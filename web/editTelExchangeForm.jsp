<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note  = request.getParameter("note");
%>
<%
    moje.appLayer.TelExchangeBO.editTelExchange(id, name, building, note);
%>
<%
    moje.entity.Telexchange telEx = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
%>
<%
    if(request.getParameter("telExchangeOne")!=null){
        HttpSession sess = request.getSession();
        sess.setAttribute("newTelExchange", telEx);
//        sess.setAttribute("newTelEx", moje.appLayer.TelExchangeBO.getTelExchangeByID(id));
//        RequestDispatcher rd = request.getRequestDispatcher("newCableHeadInform.jsp");
//        rd.forward(request, response);     //v prohlížeči zůstane načtena editační strana (bude si pamatovat předchozí stav zápisu)
        response.sendRedirect("newTelExchangeInform.jsp");  //prohlížeč si bude pamatovat minulé nastaven stránky
    } else{
//        RequestDispatcher rd = request.getRequestDispatcher("formCableHead.jsp");
//        rd.forward(request, response);            //prohlížeč si bude pamatovat minulé nastaven stránky
        response.sendRedirect("formTelExchange.jsp"); //prohlížeč si bude pamatovat minulé nastaven stránky
    }
%>
