<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<% 
    HttpSession sess = request.getSession();
    sess.removeAttribute("cabHeadItem");
//Získání parametrů z formuláře
    Integer id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note  = request.getParameter("note");
//Zpracování nových dat
    moje.appLayer.CableHeadBO.editCableHead(id, name, building, note);
    sess.setAttribute("cabHeadItem", moje.appLayer.CableHeadBO.getCableheadByID(id));
    
    String cableHeadId = id.toString();
    String link = ("readCableHeads.jsp?type=edit&name="+name+"&exportId="+cableHeadId);
    response.sendRedirect(link);
    
    
//Pokud přichází požadavek z formuláře "newCableHeadInform->tableCableHeadEditFormOne" bude upraven session a přesměrování bude zpět na "newCableHeadInform"
//    if(request.getParameter("cableHeadOne")!=null){
//        HttpSession sess = request.getSession();
//        sess.setAttribute("newCableHead", moje.appLayer.CableHeadBO.getCableheadByID(id));
//        RequestDispatcher rd = request.getRequestDispatcher("newCableHeadInform.jsp");
//        rd.forward(request, response);     //v prohlížeči zůstane načtena editační strana (bude si pamatovat předchozí stav zápisu)
//        response.sendRedirect("newCableHeadInform.jsp");  //prohlížeč si bude pamatovat minulé nastaven stránky
//    } else{
//        RequestDispatcher rd = request.getRequestDispatcher("formCableHead.jsp");
//        rd.forward(request, response);            //prohlížeč si bude pamatovat minulé nastaven stránky

        response.sendRedirect("readCableHeads.jsp"); //prohlížeč si bude pamatovat minulé nastaven stránky
//    }
%>
