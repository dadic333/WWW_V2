<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note  = request.getParameter("note");

    moje.appLayer.PbxBO.editPbx(id, name, building, note);

    if(request.getParameter("PBXOne")!=null){
        HttpSession sess = request.getSession();
        sess.setAttribute("newPBX", moje.appLayer.PbxBO.getPbxByID(id));
//        RequestDispatcher rd = request.getRequestDispatcher("newCableHeadInform.jsp");
//        rd.forward(request, response);     //v prohlížeči zůstane načtena editační strana (bude si pamatovat předchozí stav zápisu)
        response.sendRedirect("newPBXInform.jsp");  //prohlížeč si nebude pamatovat minulé nastaven stránky
    } else{
//        RequestDispatcher rd = request.getRequestDispatcher("formCableHead.jsp");
//        rd.forward(request, response);            //prohlížeč si bude pamatovat minulé nastaven stránky
        response.sendRedirect("formPBX.jsp"); //prohlížeč si nebude pamatovat minulé nastaven stránky
    }
%>
