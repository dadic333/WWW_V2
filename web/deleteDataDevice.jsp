<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("dataDevDelId"));
    moje.entity.Datadevice dataDevToDelete = null;
    HttpSession sess = request.getSession();
  
    if (request.getParameter("dataDevDelId")!=null){
        dataDevToDelete = moje.appLayer.DataDeviceBO.getDataDeviceByID(id);
        sess.setAttribute("dataDevToDelete", dataDevToDelete) ;
        moje.appLayer.DataDeviceBO.deleteDataDeviceAndOutpust(dataDevToDelete);
        response.sendRedirect("deleteDataDeviceInform.jsp");
    } else response.sendError(001, "Tento datový prvek nebyl v databázi nalezen. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech datových prvků. ");
%>