<%@page import="moje.entity.Cablehead"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%  
  int intId = Integer.parseInt(request.getParameter("id"));
%>

<% 
  Cablehead ret = %><%= moje.appLayer.CableHeadBO.getCableheadForJson(intId) %>;
  
%>
<%--
<%
    JSONObject json = new JSONObject();
    json.put("id", ret.getId());
    json.put("name", ret.getName());
    json.put("note", ret.getNote());
    json.put("buiding", ret.getBuilding());
%>
--%>
