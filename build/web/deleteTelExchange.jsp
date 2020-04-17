<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Telexchange telExchangeToDelete = null;
  
    if (request.getParameter("id")!=null){
        telExchangeToDelete = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
        String name = telExchangeToDelete.getName();
        String telExchangeId = telExchangeToDelete.getId().toString();
        moje.appLayer.TelExchangeBO.deleteTelExchange(telExchangeToDelete); 
        String link = ("readTelExchanges.jsp?type=delete&name="+name+"&exportId="+telExchangeId);
        response.sendRedirect(link);
    } else response.sendError(001, "Tato telefonní ústředna nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech telefonních ústředen. ");
%>