<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Datadevice"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");  
    
    System.out.println("ZÍSKÁNÍ PARAMETRŮ - START");
    
    String name = request.getParameter("name");
    System.out.println("name = "+name);
    String building = request.getParameter("building");
    System.out.println("building = "+building);
    String note = request.getParameter("note");
    System.out.println("note = "+note);
    String outputCountS = request.getParameter("outputCount");
    int outputCount = Integer.parseInt(outputCountS);
    System.out.println("output Count = "+outputCount);
  
    System.out.println("ZÍSKÁNÍ PARAMETRŮ - END");
    
    Datadevice newDat = new moje.appLayer.DataDeviceBO().createDadtaDeviceAndOutputs(name, building, note, outputCount);
    System.out.println("Vytvoření nové kabelové hlavy ÚSPĚŠNÉ.");
    int pomId = newDat.getId();
    newDat = null;
    newDat = moje.appLayer.DataDeviceBO.getDataDeviceByID(pomId);
    HttpSession sess = request.getSession();
    sess.setAttribute("newDataDevice", newDat);
    request.setAttribute("newDataDevice", newDat);

    System.out.println("______________newDat_____________");
    System.out.println("name= "+newDat.getName()+"; building= "+newDat.getBuilding()+"; note= "+newDat.getNote());
/*
    RequestDispatcher rd = request.getRequestDispatcher("newDataDeviceInform.jsp");
    rd.forward(request, response);
*/
    response.sendRedirect("newDataDeviceInform.jsp");
%>