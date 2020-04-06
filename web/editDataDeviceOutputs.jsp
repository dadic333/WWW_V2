<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page import="org.jboss.weld.context.http.HttpRequestContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
  
    Integer id = Integer.parseInt(request.getParameter("id"));
    request.setAttribute("id", id);
    Integer phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
    String note  = request.getParameter("note");
    String mac = request.getParameter("mac");
    
    moje.entity.Dataoutput dataDevOut = moje.appLayer.DataOutputBO.editDataOutput(id, note, phonenumber, mac);
    
    HttpSession sess = request.getSession();
    sess.setAttribute("sessDataDevice", dataDevOut.getDeviceId()) ;
    
// novinka start
    if (request.getParameter("phoneNumber")!=null){
        Integer phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        sess.setAttribute("phoneNumber", phoneNumber);
        response.sendRedirect("findPhoneNumber.jsp");
    }
//novinka konec

    response.sendRedirect("formDataDeviceOutputsProcessing.jsp");

    /*   
    RequestDispatcher rd = request.getRequestDispatcher("formCableHeadOutputsProcessing.jsp");
    rd.forward(request, response);
    */
%>
