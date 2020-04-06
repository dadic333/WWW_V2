<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Pbx"%>
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

    Pbx newPBX = new moje.appLayer.PbxBO().createNewPbxAndOutputs(name, building, note, outputCount);
    System.out.println("Vytvoření nové PBX ÚSPĚŠNÉ.");
    int pomId = newPBX.getId();
    newPBX = null;
    newPBX = moje.appLayer.PbxBO.getPbxByID(pomId);
    HttpSession sess = request.getSession();
    sess.setAttribute("newPBX", newPBX);


    System.out.println("______________newPBX_____________");
    System.out.println("name= "+newPBX.getName()+"; building= "+newPBX.getBuilding()+"; note= "+newPBX.getNote());
/*
    RequestDispatcher rd = request.getRequestDispatcher("newPBXInform.jsp");
    rd.forward(request, response);
*/
    response.sendRedirect("newPBXInform.jsp");
%>