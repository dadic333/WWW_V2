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
    String technologytype = request.getParameter("technologytype");
    
    moje.entity.Pbxoutput pbxOut = moje.appLayer.PbxOutputBO.editPbxOutput(id, technologytype, note, phonenumber);
    
    HttpSession sess = request.getSession();
    sess.setAttribute("sessPBX", pbxOut.getPbxId()) ;
    
// novinka start
    if (request.getParameter("phoneNumber")!=null){
        Integer phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        sess.setAttribute("phoneNumber", phoneNumber);
        response.sendRedirect("findPhoneNumber.jsp");
    }
//novinka konec

    response.sendRedirect("formPBXOutputsProcessing.jsp");

    /*   
    RequestDispatcher rd = request.getRequestDispatcher("formPBXOutputsProcessing.jsp");
    rd.forward(request, response);
    */
%>
