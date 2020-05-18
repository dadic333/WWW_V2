<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="error.jsp" %>
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
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Datový prvek - Vytvoření</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar START-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar END--> 
   <div class="container fixed-top mt-5 pt-5 rounded">
        <h2>Vytvoření DATOVÉHO PRVKU</h2>
    </div>
    <div class="container my-5 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
    <!-- vytvoření datového prvku START -->  
    <div class="container mt-5 py-5">
      <form action="newDataDeviceWithOutputs.jsp" method="get">
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
            <input class="item1 form-control" name="note" id="note" type="text" placeholder="zadej např. '1NP, dv. 1,'" required maxlength="149" />
          </div>
          <div class="form-group">
            <label for="outputCount" class="item1">Počet výstupů:</label>
            <input class="item1 form-control" name="outputCount" id="outputCount" type="number" placeholder="zadej MAXIMÁLNÍ počet výstupů" required maxlength="9" min="0" max="999999999" />
          </div>
                <div class="d-flex justify-content-between mt-5" >
                  <button class="btn btn-dark col-4 col-sm-3 p-2" type="submit" >Odešli</button>
                  <button class="btn btn-danger col-4 col-sm-3 p-2 mx-1" type="reset" >Zruš změny</button>
                  <button class="btn btn-info col-4 col-sm-3 p-2" type="button" onclick="goToPage(this)" data-page="readDataDevices.jsp">Zpět</button>
                </div> 
      </form>
    </div>
    <!-- vytvoření datového prvku END -->
      <script>
          function goToPage(data){
              var page = data.getAttribute("data-page");
              var odkaz = (page);
              window.location=odkaz;    
          } 
      </script>
  </body>
</html>