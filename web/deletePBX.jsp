<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Pbx PBXToDelete = null;
    HttpSession sess = request.getSession();
    sess.removeAttribute("pbxItem");
  
    if (request.getParameter("id")!=null){
        PBXToDelete = moje.appLayer.PbxBO.getPbxByID(id);
        moje.appLayer.PbxBO.deletePbxAndOutputs(PBXToDelete);
        sess.setAttribute("pbxItem", PBXToDelete);
        String link = ("readPBXs.jsp?type=delete");
        response.sendRedirect(link);
    } else response.sendError(001, "Tato PBX nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech PBX. ");
%>