<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    Integer id = Integer.parseInt(request.getParameter("id"));
    Integer outputCount = Integer.parseInt(request.getParameter("outputCount"));

    moje.entity.Telexchange telExchange = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
    moje.appLayer.HwPositionBO.addTelExchangeHwPositions(id, outputCount);
    
    HttpSession sess = request.getSession();
    sess.setAttribute("sessTelExchange", telExchange);
    
    response.sendRedirect("formTelExchangeOutputs.jsp");
%>