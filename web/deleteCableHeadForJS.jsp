<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(id);
  
%>
Položka byla úspěšně vymazána.

<%-- TESTOVACÍ PRVEK --%>
<%--
<%@page import="moje.entity.Cablehead"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  int id = Integer.parseInt(request.getParameter("id"));
  moje.entity.Cablehead toDelete = moje.appLayer.CableHeadBO.getCableheadByID(id);
  String name = toDelete.getName();
  moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(id);
  Cablehead x = moje.appLayer.CableHeadBO.getCableheadByID(id);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>Hello World!</h1>
    
    <%
      if(x==null){
        out.println("Kabelová hlava jménem <b>'");%><%=name%><% out.println("'</b> byla vymazána.");%>
        
    <%} else{
        out.println("Něco se pokazilo. Zadaná kabelová hlava nebyla vymazána. \n"
                + "<b>Zkuste to později.<b>");
        }
    %>
    <br />
    <a href="formCableHead.jsp">Přejdi na stránku editace Kabelových hlav.</a>
  </body>
</html>
--%>