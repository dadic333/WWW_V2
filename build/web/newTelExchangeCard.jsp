<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    Integer id = Integer.parseInt(request.getParameter("id"));
    Integer outputCount = Integer.parseInt(request.getParameter("outputCount"));

    moje.appLayer.HwPositionBO.addTelExchangeHwPositions(id, outputCount);

    String link = ("readTelExchangeOutputs.jsp?type=addCard&outputCount="+outputCount+"&id="+id);
    response.sendRedirect(link);
%>