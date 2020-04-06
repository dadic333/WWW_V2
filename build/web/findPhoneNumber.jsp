<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<%

  Integer phoneNumber;
  if((request.getParameter("phoneNumber"))!=null){
      phoneNumber = Integer.parseInt(request.getParameter("phoneNumber").toString());
  } else phoneNumber = (Integer)(request.getSession().getAttribute("phoneNumber"));
//novinka start  
//  if((request.getParameter("phoneNumber"))==null){
//      phoneNumber = (Integer) (request.getSession().getAttribute("phoneNumber"));
//  }
//konec novinky
  List<moje.entity.Cabheadoutput> cableHeadOutputs = moje.appLayer.CabHeadOutputBO.findPhoneNumber(phoneNumber);
  List<moje.entity.Dataoutput> dataDeviceOutputs = moje.appLayer.DataOutputBO.findPhoneNumber(phoneNumber);
  List<moje.entity.Pbxoutput> pbxOutputs = moje.appLayer.PbxOutputBO.findPhoneNumber(phoneNumber);
  List<moje.entity.Hwposition> hwPositions = moje.appLayer.HwPositionBO.findPhoneNumber(phoneNumber);
  HttpSession sess = request.getSession();
  sess.setAttribute("findPhoneNumberCableHeadOutputs", cableHeadOutputs);
  sess.setAttribute("findPhoneNumberDataDeviceOutputs", dataDeviceOutputs);
  sess.setAttribute("findPhoneNumberPbxOutputs", pbxOutputs);
  sess.setAttribute("findPhoneNumberHwPositions", hwPositions);
  response.sendRedirect("formFindPhoneNumber.jsp");
%>
