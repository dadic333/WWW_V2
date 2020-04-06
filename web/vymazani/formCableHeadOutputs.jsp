<%@page import="moje.entity.Cabheadoutput"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<%    
    Integer intId = Integer.parseInt(request.getParameter("id"));
    
    moje.entity.Cablehead cabHead = moje.appLayer.CableHeadBO.getCableheadByID(intId);
    HttpSession sess = request.getSession();
    sess.setAttribute("sessCabHead", cabHead) ; 
%>
<c:set var="idSess" scope="session" value="<%=intId%>"/>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/mujTableScript.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Kabelová hlava</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="d-block fixed-top mt-5 pt-4">
        <h1>Výstupy KABELOVÉ HLAVY - Editace</h1>
    </div>
    <div class="container my-4 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
    <h1>Výstupy KABELOVÉ HLAVY - Editace</h1>
    <div class="jumbotron">
      <h2>Výpis kabelové hlavy</h2>
      <div class="container">
          <%@include file="tables/tableCableHeadOutputs.jsp" %>
      </div>
    </div>
    <!-- footer start -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer end -->
  </body>
</html>