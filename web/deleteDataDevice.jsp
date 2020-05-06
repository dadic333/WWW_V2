<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Datadevice dataDevToDelete = null;
    
    HttpSession sess = request.getSession();
    sess.removeAttribute("dataDeviceItem");
  
    if (request.getParameter("id")!=null){
        dataDevToDelete = moje.appLayer.DataDeviceBO.getDataDeviceByID(id);
        moje.appLayer.DataDeviceBO.deleteDataDeviceAndOutpust(dataDevToDelete);
        sess.setAttribute("dataDeviceItem", dataDevToDelete);
        String link = ("readDataDevices.jsp?type=delete");
        response.sendRedirect(link);   
    } else response.sendError(001, "Tento datový prvek nebyl v databázi nalezen. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech datových prvků. ");
%>