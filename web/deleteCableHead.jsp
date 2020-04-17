<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<%--
<script>
    var v="Vleoženo v SCRIPTU.     ";
</script>

<% 
    String string1="<script>document.writeln(v)</script>";
    out.println("1. "+string1); 
%>

<script>     
    var id = sessionStorage.getItem('key');
    document.write(sessionStorage.getItem('key'));
</script>

<% String sid = "<script>document.writeln(id)</script>";
out.println("    2. stringId = " + sid);

Integer Iid = Integer.parseInt("888888");
out.println("    3. integerId = " + Iid.toString());

Integer integ = Integer.parseInt("<script>document.writeln(id)</script>");


String snumb = "51";
out.println("     4. snumb = "+snumb);

String stringMoje = "<script>(v)</script>";
out.println("    5. integerID, nebo-li moje = "+stringMoje);

/*
String sid2 = sid;
Integer i = Integer.parseInt(sid2.toString());
out.println(i);
*/
--%>

<%
/* 
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Cablehead cabHeadToDelete = null;
    HttpSession sess = request.getSession();
  
    if (request.getParameter("id")!=null){
        cabHeadToDelete = moje.appLayer.CableHeadBO.getCableheadByID(id);
        sess.setAttribute("cabHeadToDelete", cabHeadToDelete) ;
        moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(cabHeadToDelete);
        response.sendRedirect("deleteCableHeadInform.jsp");
*/
%>

<%

    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Cablehead cabHeadToDelete = null;
  
    if (request.getParameter("id")!=null){
        cabHeadToDelete = moje.appLayer.CableHeadBO.getCableheadByID(id);
        String name = cabHeadToDelete.getName();
        String cableHeadId = cabHeadToDelete.getId().toString();
        moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(cabHeadToDelete);
        String link = ("readCableHeads.jsp?type=delete&name="+name+"&exportId="+cableHeadId);
        response.sendRedirect(link);
    } else response.sendError(001, "Tato kabelová nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech kabelových hlav. ");

%>