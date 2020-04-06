<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error.jsp" %>
<script>
    var v="123456789";
</script>
<% 
    String string1="<script>document.writeln(v)</script>";
    out.println("value= "+string1); 
%>

<script>    
    document.write(sessionStorage.getItem('key'));
    var id = sessionStorage.getItem('key');
</script>

<% String id = "<script>document.writeln(id)</script>";
String stringMoje = "<script>(v)</script>";
out.println("    id = " + id+"  ... \n"); 
Integer Iid = Integer.parseInt("51");
out.println("    Iid = " + Iid+"  ... \n"); 

out.println("integerID, nebo-li moje = "+stringMoje);
%>

<%


    /*Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Cablehead cabHeadToDelete = null;
    HttpSession sess = request.getSession();
  
    if (request.getParameter("id")!=null){
        cabHeadToDelete = moje.appLayer.CableHeadBO.getCableheadByID(id);
        sess.setAttribute("cabHeadToDelete", cabHeadToDelete) ;
        moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(cabHeadToDelete);
        response.sendRedirect("deleteCableHeadInform.jsp");*/
%>
<%/*
    Integer id = Integer.parseInt(request.getParameter("id"));
    moje.entity.Cablehead cabHeadToDelete = null;
    HttpSession sess = request.getSession();
  
    if (request.getParameter("id")!=null){
        cabHeadToDelete = moje.appLayer.CableHeadBO.getCableheadByID(id);
        sess.setAttribute("cabHeadToDelete", cabHeadToDelete) ;
        moje.appLayer.CableHeadBO.deleteCableHeadAndOutpustByCableHead(cabHeadToDelete);
        response.sendRedirect("deleteCableHeadInform.jsp");
    } else response.sendError(001, "Tato kabelová nebyla v databázi nalezena. "
            + "Mohlo dojít k narušení připojení, nebo k problému u databáze. "
            + "Zkuste to pozdějii. Případně zkuste překontrolovat výpis všech kabelových hlav. ");*/
%>

