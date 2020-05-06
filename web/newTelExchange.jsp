<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Telexchange"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    HttpSession sess = request.getSession();
    sess.removeAttribute("telExchangeItem");
    
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note = request.getParameter("note");
    
    moje.entity.Telexchange newTelEx = moje.appLayer.TelExchangeBO.createNewTelExchange(name, building, note);

    Integer id = newTelEx.getId();
    newTelEx = null;
    newTelEx = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
    name = newTelEx.getName().toString();
    String telExchangeId = newTelEx.getId().toString();

    sess.setAttribute("telExchangeItem", newTelEx);

    String link = ("readTelExchanges.jsp?type=new&name="+name+"&exportId="+telExchangeId);
    response.sendRedirect(link);
/*
    RequestDispatcher rd = request.getRequestDispatcher("newTelExchangeInform.jsp");
    rd.forward(request, response);
*/
%>