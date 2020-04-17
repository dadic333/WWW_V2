<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Datadevice dataDevToDelete = null;
  
    if (request.getParameter("id")!=null){
        dataDevToDelete = moje.appLayer.DataDeviceBO.getDataDeviceByID(id);
        String name = dataDevToDelete.getName();
        String dataDeviceId = dataDevToDelete.getId().toString();
        moje.appLayer.DataDeviceBO.deleteDataDeviceAndOutpust(dataDevToDelete);
        String link = ("readDataDevices.jsp?type=delete&name="+name+"&exportId="+dataDeviceId);
        response.sendRedirect(link);   
    } else response.sendError(001, "Tento datový prvek nebyl v databázi nalezen. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech datových prvků. ");
%>