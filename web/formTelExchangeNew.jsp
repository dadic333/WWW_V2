<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <title>Telefonní ústředna</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar START-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar END--> 
    <h1>TELEFONNÍ ÚSTŘEDNY</h1>
    <!-- vytvoření telefonní ústředny START -->  
    <div class="container">
      <h2>Založení nové telefonní ústředny</h2>
      <form action="newTelExchange.jsp" method="get">
          <div class="form-group">
            <label for="name" class="item1">Název:</label>
            <input class="item1 form-control" name="name" id="name" type="text" placeholder="zadej název" required maxlength="59" />
          </div>
          <div class="form-group">
            <label for="building" class="item1">Budova:</label>
            <input class="item1 form-control" name="building" id="building" type="text" placeholder="zadej např. 'Ulice 20'" required maxlength="49" />
          </div>
          <div class="form-group">
            <label for="note" class="item1">Poznámka:</label>
            <input class="item1 form-control" name="note" id="note" type="text" placeholder="zadej např. '1NP, dv. 1, funkčních páry 1-30'" required maxlength="149" />
          </div>
          <!--
          <div class="form-group">
            <label for="outputCount" class="item1">Počet výstupů:</label>
            <input class="item1 form-control" name="outputCount" id="outputCount" type="number" placeholder="zadej počet výstupů" min="0" required/>
          </div>
          -->
        <div class="mx-auto" style="width: 70px">  
          <button class="btn btn-odeslat" type="submit" >Vytvořit</button>
        </div> 
      </form>
    </div>
    <!-- vytvoření telefonní ústředny END -->
    <!-- výpis telefonních ústředen START -->
    <div class="jumbotron">
      <h2>Výpis pobočkových ústředen</h2>
      <div class="container">
          <%@include file="tables/tableTelExchange.jsp" %>
      </div>
    </div>
    <!-- výpis telefonních ústředen END -->  
    <!-- footer START -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer END -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
