<%@page import="moje.appLayer.CableHeadBO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="moje.entity.Cablehead"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Kabelová hlava - Vytvoření</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar START-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar END--> 
    <div class="d-block fixed-top mt-5 pt-4 rounded-right">
        <h1>KABELOVÉ HLAVY - Vytvoření</h1>
    </div>
    <div class="container my-4 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
    <!-- vytvoření kabelové hlavy START -->  
    <div class="container mt-5 pt-5">
      <form action="newCableHeadWithOutputs.jsp" method="get">
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
          <div class="form-group">
            <label for="outputCount" class="item1">Počet výstupů:</label>
            <input class="item1 form-control" name="outputCount" id="outputCount" type="number" placeholder="zadej počet výstupů" required maxlength="9" min="0" max="999999999" />
          </div>
        <div class="d-flex justify-content-center mt-3">  
          <button class="btn btn-dark px-5" type="submit" >Vytvořit</button>
        </div> 
      </form>
    </div>
    <!-- vytvoření kabelové hlavy END -->
  </body>
</html>
