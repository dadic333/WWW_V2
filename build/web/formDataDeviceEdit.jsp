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
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="css/styl.css" rel="stylesheet">
        <link href="css/formStyl.css" rel="stylesheet">
        <link href="css/editor-tabulek.css" rel="stylesheet">
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.bootstrap4.min.js"></script>
        <script src="js/mujTableScript.js"></script>
        <link href="favs/ico.ico" rel="icon" type="image/x-icon">
        <title>Datový prvek</title>
    </head>
    <body id="body-pozadi">
      <!-- Navbar start-->
      <%@include file="pices/navbar.jsp" %>
      <!-- Navbar end--> 
      <div class="d-block fixed-top my-5 pt-4 rounded-right">
        <h1>Editace DATOVÉHO PRVKU</h1>
      </div>
      <div class="container my-5 pt-5">
          <h2>Editace datového prvku</h2>
          <c:set var="device" value="<%= moje.appLayer.DataDeviceBO.getDataDeviceByID(Integer.parseInt(request.getParameter("id"))) %>"/>
          <div class="container">
            <form action="editDataDeviceForm.jsp" method="get">
                <div class="form-group">
                    <label for="id">ID:</label>
                    <input class="form-control" name="id" id="id" value='${device.id}' type="text" readonly />
                </div>
                <div class="form-group">
                    <label for="name" >Název:</label>
                    <input class="form-control" name="name" id="name" type="text" value='${device.name}' required maxlength="59" />
                </div>
                <div class="form-group">
                    <label for="building" >Budova:</label>
                    <input class="form-control" name="building" id="building" type="text" value='${device.building}' required maxlength="49" />
                </div>
                <div class="form-group">
                    <label for="note" >Poznámka:</label>
                    <input class="form-control" name="note" id="note" type="text" value='${device.note}' required maxlength="149" />
                </div>
                <div class="d-flex justify-content-between mt-3" >
                  <button class="btn btn-dark col-4 col-sm-3 p-2" type="submit" >Odešli</button>
                  <button class="btn btn-danger col-4 col-sm-3 p-2 mx-1" type="reset" >Zruš změny</button>
                  <a href="readDataDevices.jsp" type="button" class="btn btn-info col-4 col-sm-3 p-2">Datové prvky</a>
                </div> 
            </form>
          </div>
      </div>
    </body>
</html>