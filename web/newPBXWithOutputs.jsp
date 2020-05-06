<%@page contentType="text/html, utf-8" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Pbx"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    HttpSession sess = request.getSession();
    sess.removeAttribute("pbxItem");
    
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note = request.getParameter("note");
    String outputCountS = request.getParameter("outputCount");
    Integer outputCount = Integer.parseInt(outputCountS);

    Pbx newPBX = moje.appLayer.PbxBO.createNewPbxAndOutputs(name, building, note, outputCount);
    System.out.println("Vytvoření nové PBX ÚSPĚŠNÉ.");
    int pomId = newPBX.getId();
    newPBX = null;
    newPBX = moje.appLayer.PbxBO.getPbxByID(pomId);
    name = newPBX.getName().toString();
    String pbxId = newPBX.getId().toString();
    
    sess.setAttribute("pbxItem", newPBX);
    
    String link = ("readPBXs.jsp?type=new&name="+name+"&exportId="+pbxId);
    response.sendRedirect(link);
%>