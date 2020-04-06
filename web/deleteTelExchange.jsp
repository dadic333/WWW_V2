<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("telExchangeDelId"));
    moje.entity.Telexchange telExchangeToDelete = null;
    HttpSession sess = request.getSession();
  
    if (request.getParameter("telExchangeDelId")!=null){
        telExchangeToDelete = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
        sess.setAttribute("telExchangeToDelete", telExchangeToDelete) ;
        moje.appLayer.TelExchangeBO.deleteTelExchange(telExchangeToDelete);
        response.sendRedirect("deleteTelExchangeInform.jsp");
    } else response.sendError(001, "Tato telefonní ústředna nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech telefonních ústředen. ");
%>