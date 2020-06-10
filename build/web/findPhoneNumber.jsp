<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8");

    int pocetVyskytu;
    String link = null;
    Integer phoneNumber = Integer.parseInt(request.getParameter("phoneNumber").
                toString());
// vyhledání klapky na zařízeních
    List<moje.entity.Cabheadoutput> cableHeadOutputs
            = moje.appLayer.CabHeadOutputBO.findPhoneNumber(phoneNumber);
    List<moje.entity.Dataoutput> dataDeviceOutputs = moje.appLayer.DataOutputBO.
            findPhoneNumber(phoneNumber);
    List<moje.entity.Pbxoutput> pbxOutputs = moje.appLayer.PbxOutputBO.
            findPhoneNumber(phoneNumber);
    List<moje.entity.Hwposition> hwPositions = moje.appLayer.HwPositionBO.
            findPhoneNumber(phoneNumber);
// vytvoření session a vložení nálezů
    HttpSession sess = request.getSession();
    sess.setAttribute("findPhoneNumberCableHeadOutputs", cableHeadOutputs);
    sess.setAttribute("findPhoneNumberDataDeviceOutputs", dataDeviceOutputs);
    sess.setAttribute("findPhoneNumberPbxOutputs", pbxOutputs);
    sess.setAttribute("findPhoneNumberHwPositions", hwPositions);
// celkový počet nálezů dané klapky  
    pocetVyskytu = cableHeadOutputs.size() + dataDeviceOutputs.size()
            + pbxOutputs.size() + hwPositions.size();
// vytvoření a odeslání linku
    link = ("readFindPhoneNumber.jsp?pocetVyskytu=" + pocetVyskytu);
    response.sendRedirect(link);
%>
