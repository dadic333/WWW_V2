<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Telexchange"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note = request.getParameter("note");
    
    moje.entity.Telexchange newTelEx =moje.appLayer.TelExchangeBO.createNewTelExchange(name, building, note);
    System.out.println("Vytvoření nové telefonní ústředny ÚSPĚŠNÉ.");
    Integer id = newTelEx.getId();
    newTelEx = null;
    newTelEx = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
    HttpSession sess = request.getSession();
    sess.setAttribute("newTelExchange", newTelEx);

/*
    RequestDispatcher rd = request.getRequestDispatcher("newTelExchangeInform.jsp");
    rd.forward(request, response);
*/
    response.sendRedirect("newTelExchangeInform.jsp");
%>