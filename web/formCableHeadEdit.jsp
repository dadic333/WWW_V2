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
        <title>Kabelová hlava</title>
    </head>
    <body id="body-pozadi">
      <!-- Navbar start-->
      <%@include file="pices/navbar.jsp" %>
      <!-- Navbar end--> 
      <div class="d-block fixed-top my-5 pt-5 rounded">
        <h1>Editace KABELOVÉ HLAVY</h1>
      </div>
      <div class="container my-5 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
      <div class="container mt-5 py-5">
          <c:set var="device" value="<%= moje.appLayer.CableHeadBO.getCableheadByID(Integer.parseInt(request.getParameter("id"))) %>"/>
          <div class="container">
            <form action="editCableHeadForm.jsp" method="get">
                <div class="form-group">
                    <label for="id" class="item1">ID:</label>
                    <input class="form-control" name="id" id="id" value='${device.id}' type="text" readonly />
                </div>
                <div class="form-group">
                    <label for="name" class="item1">Název:</label>
                    <input class="form-control" name="name" id="name" type="text" value='${device.name}' required maxlength="59" />
                </div>
                <div class="form-group">
                    <label for="building" class="item1">Budova:</label>
                    <input class="form-control" name="building" id="building" type="text" value='${device.building}' required maxlength="49" />
                </div>
                <div class="form-group">
                    <label for="note" class="item1">Poznámka:</label>
                    <input class="form-control" name="note" id="note" type="text" value='${device.note}' required maxlength="149" />
                </div>
                <div class="d-flex justify-content-between mt-5" >
                  <button class="btn btn-dark col-4 col-sm-3 p-2" type="submit" >Odešli</button>
                  <button class="btn btn-danger col-4 col-sm-3 p-2 mx-1" type="reset" >Zruš změny</button>
                  <a href="readCableHeads.jsp" class="btn btn-info col-4 col-sm-3 p-2" type="button">Zpět</a>
                </div> 
            </form>
          </div>
      </div>
<%--         
      <div class="container-fluid">
        <form>
            <div class="form-group">
                <label for="pokus">form-control-sm:</label>
                <input type="text" name="pokus" id="pokus" class="form-control form-control-sm" >
            </div>
            <div class="form-group">
                <label for="pokus1">form-control:</label>
                <input type="text" name="pokus1" id="pokus1" class="form-control" >
            </div>
            <div class="form-group">
                <label for="pokus2">form-control-lg:</label>
                <input type="text" name="pokus2" id="pokus2" class="form-control form-control-lg" >
            </div>
            <div class="form-group">
                <label for="pokus3">form-control-plaintext:</label>
                <input type="text" name="pokus3" id="pokus3" class="form-control form-control-plaintext" >
            </div>
            <div class="form-group">
                <label for="pokus4">form-control-file:</label>
                <input type="text" name="pokus4" id="pokus4" class="form-control form-control-file" >
            </div>
            
          <div class="form-group">
            <label for="exampleInputEmail1">Email address</label>
            <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
          </div>
          <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
          </div>
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">Check me out</label>
          </div>
          <button type="submit" class="btn btn-primary">Submit</button>
        </form>
      </div>--%>
    </body>
</html>