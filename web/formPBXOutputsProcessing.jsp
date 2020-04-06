<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<%
    Integer id;
    HttpSession sess = request.getSession();
   
    moje.entity.Pbx pbxPom= (moje.entity.Pbx) sess.getAttribute("sessPBX");
    id = pbxPom.getId();
    
    moje.entity.Pbx pbx = moje.appLayer.PbxBO.getPbxByID(id);
    
    sess.setAttribute("sessPBX", pbx) ; 
%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script>
      $(document).ready(function() {
       $('#tabulka').dataTable();
      } );
    </script>
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <title>Pobočková ústředna</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <h1>Výstupy PBX - Editace</h1>
    <div class="jumbotron">
      <h2>Výpis PBX</h2>
      <div class="container">
          <%@include file="tables/tablePBXOutputs.jsp" %>
      </div>
    </div>
    <!-- footer start -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer end -->
  </body>
</html>