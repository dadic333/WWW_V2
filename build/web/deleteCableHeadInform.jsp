<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="moje.entity.Cablehead"%>
<%@page import="java.util.List"%>
<%@page import="moje.entity.Cabheadoutput"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/mujTableNoFunctions.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Kabelová hlava</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <h1 style="position:fixed; background-color: #B0BED9; z-index: 3; border-radius: 0.9rem;">Odstaněná kabelová hlava</h1>
    <div class="container mt-5 py-5">
        <table id="tableNoFunctions" class="table table-bordered compact mt-5" style="background-color: #80bdff;">
            <thead>
                <tr>
                  <th>Index</th>
                  <th>Název</th>
                  <th>Budova</th>
                  <th>Poznámka</th>
                  <th>Počet výstupů</th>
                </tr>
            </thead>
            <tbody>
                <c:set var="cableHead" value="<%= request.getSession().getAttribute("cabHeadToDelete") %>" />
                <tr>  
                  <td>${cableHead.id}</td>
                  <td>${cableHead.name}</td>
                  <td>${cableHead.building}</td>
                  <td>${cableHead.note}</td>
                  <td>${cableHead.outputcount}</td>
                </tr>
            </tbody>
        </table>
    </div>
   <div class="container">
      <div class="d-flex justify-content-between">
        <a class="btn btn-info px-5" href="readCableHeads.jsp" role="button"><b>Výpis</b> kabelových hlav.</a>
        <a class="btn btn-danger px-5" href="formCableHeadDelete.jsp" role="button"><b>Odstranit</b> další kabelovou hlavu.</a>
      </div>
    </div>
  </body>
</html>
