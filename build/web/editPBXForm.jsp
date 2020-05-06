<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
    HttpSession sess = request.getSession();
    sess.removeAttribute("pbxItem");
//Získání parametrů z formuláře
    Integer id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note  = request.getParameter("note");
//Zpracování nových dat
    moje.appLayer.PbxBO.editPbx(id, name, building, note);
    sess.setAttribute("pbxItem", moje.appLayer.PbxBO.getPbxByID(id));

    String pbxId = id.toString();
    String link = ("readPBXs.jsp?type=edit&name="+name+"&exportId="+pbxId);
    response.sendRedirect(link);

%>
