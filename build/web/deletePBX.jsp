<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("PBXDelId"));
    moje.entity.Pbx PBXToDelete = null;
    HttpSession sess = request.getSession();
  
    if (request.getParameter("PBXDelId")!=null){
        PBXToDelete = moje.appLayer.PbxBO.getPbxByID(id);
        sess.setAttribute("PBXToDelete", PBXToDelete) ;
        moje.appLayer.PbxBO.deletePbxAndOutputs(PBXToDelete);
        response.sendRedirect("deletePBXInform.jsp");
    } else response.sendError(001, "Tato PBX nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech PBX. ");
%>