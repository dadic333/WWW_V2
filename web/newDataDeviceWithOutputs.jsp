<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Datadevice"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    HttpSession sess = request.getSession();
    sess.removeAttribute("dataDeviceItem");
    
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note = request.getParameter("note");
    String outputCountS = request.getParameter("outputCount");
    Integer outputCount = Integer.parseInt(outputCountS);

    Datadevice newDat = moje.appLayer.DataDeviceBO.createDadtaDeviceAndOutputs(name, building, note, outputCount);

    int pomId = newDat.getId();
    newDat = null;
    newDat = moje.appLayer.DataDeviceBO.getDataDeviceByID(pomId);
    name = newDat.getName().toString();
    String dataDeviceId = newDat.getId().toString();
    
    sess.setAttribute("dataDeviceItem", newDat);
    
    String link = ("readDataDevices.jsp?type=new&name="+name+"&exportId="+dataDeviceId);
    response.sendRedirect(link);
%>