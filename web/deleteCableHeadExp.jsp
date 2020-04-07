<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
  int intId = Integer.parseInt(request.getParameter("id"));
%>
<%= moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(intId) %>