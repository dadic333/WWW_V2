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
    String note, hwName, technologytype;
    Integer output = null;
    String sphone = request.getParameter("phonenumber");
    Integer phonenumber = null;
    
    if(request.getParameter("id")!=null || request.getParameter("id")!=""){
        intId = Integer.parseInt(request.getParameter("id"));
        
        if(request.getParameter("phonenumber").isEmpty()){
            phonenumber = null;
        } else { phonenumber = Integer.parseInt(sphone);}

        note  = request.getParameter("note");
        technologytype = request.getParameter("technologytype");
        hwName = request.getParameter("hwName");
        moje.entity.Hwposition hwPosition = moje.appLayer.HwPositionBO.findHwPositionById(intId) ;
        hwPosition = moje.appLayer.HwPositionBO.editHwPosition(intId, hwName, output, phonenumber, technologytype, note);
        Integer telExchangeId = hwPosition.getTelechangeId().getId();

        String link = ("readTelExchangeOutputs.jsp?type=edit&name="+hwName+"&id="+telExchangeId);
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
%>

