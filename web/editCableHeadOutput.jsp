<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.persistence.metamodel.SetAttribute"%>
<%@page import="org.jboss.weld.context.http.HttpRequestContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="moje.entity.Cabheadoutput"%>
<%@page import="moje.entity.Cablehead"%>
<%@page errorPage="error.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");

    HttpSession sess = request.getSession();

    if(request.getParameter("id")!=null){
        Integer intId = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", intId);
        Integer phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
        String note  = request.getParameter("note");

        moje.entity.Cabheadoutput cabHeadOut = moje.appLayer.CabHeadOutputBO.editCabHeadOutput (intId, note, phonenumber); 


        sess.setAttribute("sessCabHead", cabHeadOut.getCableheadId()) ;
        
        response.sendRedirect("readCableHeadOutputs.jsp");
    }
    /*              
    moje.entity.Cabheadoutput out = moje.appLayer.CabHeadOutputBO.findCableHeadOutputById(intId);
    moje.entity.Cablehead cab  =  out.getCableheadId();            
    HttpSession sess = request.getSession();
    sess.setAttribute("id", cab) ;             

    Cablehead newcab = moje.appLayer.CableHeadBO.createNewCaleHeadAndCHOutputs(name, building, note, outputCount);
    int pomId = newcab.getId();
    newcab = null;
    newcab = moje.appLayer.CableHeadBO.getCableheadByID(pomId);
    HttpSession sess = request.getSession();
    sess.setAttribute("newCableHead", newcab);
    */ 
    
// novinka start
    if (request.getParameter("phoneNumber")!=null){
        Integer phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
        sess.setAttribute("phoneNumber", phoneNumber);
        response.sendRedirect("findPhoneNumber.jsp");
    }
//novinka konec
    
    response.sendRedirect("index.jsp");

    /*   
    RequestDispatcher rd = request.getRequestDispatcher("formCableHeadOutputsProcessing.jsp");
    rd.forward(request, response);
    */
%>

