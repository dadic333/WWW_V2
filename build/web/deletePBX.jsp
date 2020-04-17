<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Pbx PBXToDelete = null;
  
    if (request.getParameter("id")!=null){
        PBXToDelete = moje.appLayer.PbxBO.getPbxByID(id);
        String name = PBXToDelete.getName();
        String PBXId = PBXToDelete.getId().toString();
        moje.appLayer.PbxBO.deletePbxAndOutputs(PBXToDelete);
        String link = ("readPBXs.jsp?type=delete&name="+name+"&exportId="+PBXId);
        response.sendRedirect(link);
    } else response.sendError(001, "Tato PBX nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech PBX. ");
%>