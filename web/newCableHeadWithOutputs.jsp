<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page import="org.jboss.weld.context.http.HttpRequestContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="moje.entity.Cabheadoutput"%>
<%@page import="moje.entity.Cablehead"%>
<%@page import="java.text.DateFormat"%>
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

    Cablehead newcab = moje.appLayer.CableHeadBO.createNewCaleHeadAndCHOutputs(name, building, note, outputCount);
    System.out.println("Vytvoření nové kabelové hlavy ÚSPĚŠNÉ.");
    int pomId = newcab.getId();
    newcab = null;
    newcab = moje.appLayer.CableHeadBO.getCableheadByID(pomId);
    HttpSession sess = request.getSession();
    sess.setAttribute("newCableHead", newcab);
/*  request.setAttribute("newCableHead", newcab);
    --nepotřené--
    request.setAttribute("keyA", "TEXT - (A)");
    request.setAttribute("keyB", "TEXT - (B)");
*/
    System.out.println("______________newcab_____________");
    System.out.println("name= "+newcab.getName()+"; building= "+newcab.getBuilding()+"; note= "+newcab.getNote());
/*
    RequestDispatcher rd = request.getRequestDispatcher("newCableHeadInform.jsp");
    rd.forward(request, response);
*/
    response.sendRedirect("newCableHeadInform.jsp");
%>
