<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Pbx"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note = request.getParameter("note");
    String outputCountS = request.getParameter("outputCount");
    Integer outputCount = Integer.parseInt(outputCountS);

    Pbx newPBX = new moje.appLayer.PbxBO().createNewPbxAndOutputs(name, building, note, outputCount);
    System.out.println("Vytvoření nové PBX ÚSPĚŠNÉ.");
    int pomId = newPBX.getId();
    newPBX = null;
    newPBX = moje.appLayer.PbxBO.getPbxByID(pomId);
    name = newPBX.getName();
    String PBXId = newPBX.getId().toString();
    String link = ("readDataDevices.jsp?type=new&name="+name+"&exportId="+PBXId);
    response.sendRedirect(link);
%>