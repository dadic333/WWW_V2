<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page import="org.jboss.weld.context.http.HttpRequestContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    Integer intId = null;
    String sphone = request.getParameter("phonenumber");
    Integer phonenumber = null;

    if (request.getParameter("id") != null) {
        intId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", intId);

        if (sphone.isEmpty()) {   // ošetření, aby phonenumber mohl nabývat      
            phonenumber = null;   // hodnoty null, pokud nebyl input vyplněn
        } else {
            phonenumber = Integer.parseInt(sphone);
        }
        String note = request.getParameter("note");
        String mac = request.getParameter("mac");

        moje.entity.Dataoutput dataDevOut = moje.appLayer.DataOutputBO.
                editDataOutput(intId, note, phonenumber, mac);
        String name = dataDevOut.getDatadevout().toString();
        Integer dataDeviceId = dataDevOut.getDeviceId().getId();

        String link = ("readDataDeviceOutputs.jsp?type=edit&name=" + name
                + "&id=" + dataDeviceId);
        response.sendRedirect(link);
    }
    HttpSession sess = request.getSession();
    if (request.getParameter("phoneNumber") != null) {
        Integer phoneNumber = Integer.parseInt(request.getParameter(
                "phoneNumber"));
        sess.setAttribute("phoneNumber", phoneNumber);
        response.sendRedirect("findPhoneNumber.jsp");
    }
    response.sendRedirect("index.jsp");
%>
