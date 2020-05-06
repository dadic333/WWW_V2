<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
  int intId = Integer.parseInt(request.getParameter("id"));
  String name = request.getParameter("name");
  String building = request.getParameter("building");
  String note  = request.getParameter("note");
%>
<%= moje.appLayer.CableHeadBO.editCableHead(intId, name, building, note) %>