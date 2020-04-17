<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Datadevice"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note = request.getParameter("note");
    String outputCountS = request.getParameter("outputCount");
    Integer outputCount = Integer.parseInt(outputCountS);

    Datadevice newDat = new moje.appLayer.DataDeviceBO().createDadtaDeviceAndOutputs(name, building, note, outputCount);
    System.out.println("Vytvoření nové kabelové hlavy ÚSPĚŠNÉ.");
    int pomId = newDat.getId();
    newDat = null;
    newDat = moje.appLayer.DataDeviceBO.getDataDeviceByID(pomId);
    name = newDat.getName();
    String dataDeviceId = newDat.getId().toString();
    String link = ("readDataDevices.jsp?type=new&name="+name+"&exportId="+dataDeviceId);
    response.sendRedirect(link);
%>