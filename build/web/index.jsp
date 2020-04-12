<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Kabelová kniha</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="d-block fixed-top pt-5 my-5 rounded">
        <h1>KABELOVÁ KNIHA</h1>
    </div>
    <div class="container my-5 pt-5 justify-content-center">
        <div class="col-8 col-md-10">
            <h3>Úvod</h3>
            <p class="text-justify">
                Vítej uživateli.
            </p>
            <p>
                Pro práci používej horní navigační lištu.
                Pokus se co nejméně používat "KROK ZPĚT" v internetovém prohlížeči.<br />
                Pokud jej použiješ!!!
                Akce kterou internetový prohlížeč následně vykoná je závislá na daném prohlížeči a jeho nastavení.
            </p>
            <p>
                Přeji bezproblémové užívání.
            </p>
        </div>
    </div>
  </body>
</html>
