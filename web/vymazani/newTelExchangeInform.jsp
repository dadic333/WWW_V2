<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <title>Telefonní ústředna</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <h1>Vytvořená telefonní ústředna</h1>
    <div class="jumbotron">
        <div class="container">
            <%@include file="tables/tableTelExchangeEditFormOne.jsp" %>
        </div>
        <div class="row text-align-center">
            <div class="col-md-12">
                <p>
                    <a class="btn btn-vlastni btn-lg btn-block my-2" href="formTelExchange.jsp" role="button">Přejít na <b>Editaci</b> telefonních ústředen.</a>
                </p>
            </div>
            <div class="col-md-12 ">
                <p>
                    <a class="btn btn-vlastni btn-lg btn-block my-2" href="formTelExchangeNew.jsp" role="button"><b>Vytvořit</b> další telefonní ústřednu.</a>
                </p>
            </div>
            <div class="col-md-12">
                <p>
                    <a class="btn btn-vlastni btn-lg btn-block my-2" href="formTelExchangeDelete.jsp" role="button"><b>Odstranit</b> telefonní ústřednu.</a>
                </p>
            </div>
        </div>
    </div>
    <!-- footer start -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer end -->
  </body>
</html>
