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
    
    if(request.getParameter("id")!=null){
        intId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", intId);
        
        if(sphone.isEmpty()){
            phonenumber = null;
        } else { phonenumber = Integer.parseInt(sphone);}

        String note  = request.getParameter("note");
        String technologytype = request.getParameter("technologytype");
    
        moje.entity.Pbxoutput pbxOut = moje.appLayer.PbxOutputBO.findPBXOutputById(intId);
        pbxOut = moje.appLayer.PbxOutputBO.editPbxOutput(intId, technologytype, note, phonenumber);
        String name = pbxOut.getPbxout().toString();
        Integer pbxId = pbxOut.getPbxId().getId();
    
    
        String link = ("readPBXOutputs.jsp?type=edit&name="+name+"&id="+pbxId);
        response.sendRedirect(link);
    }
// novinka start
    HttpSession sess = request.getSession();
    if (request.getParameter("phoneNumber")!=null){
        Integer phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        sess.setAttribute("phoneNumber", phoneNumber);
        response.sendRedirect("findPhoneNumber.jsp");
    }
//novinka konec

    response.sendRedirect("index.jsp");

    /*   
    RequestDispatcher rd = request.getRequestDispatcher("formPBXOutputsProcessing.jsp");
    rd.forward(request, response);
    */
%>