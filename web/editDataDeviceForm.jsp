<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
    HttpSession sess = request.getSession();
    sess.removeAttribute("dataDeviceItem");
//Získání parametrů z formuláře    
    Integer id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String building = request.getParameter("building");
    String note  = request.getParameter("note");
//Zpracování nových dat
    moje.appLayer.DataDeviceBO.editdataDevice(id, name, building, note);
    sess.setAttribute("dataDeviceItem", moje.appLayer.DataDeviceBO.getDataDeviceByID(id));

    String dataDeviceId = id.toString();
    String link = ("readDataDevices.jsp?type=edit&name="+name+"&exportId="+dataDeviceId);
    response.sendRedirect(link); 
%>
