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
    <div class="d-block fixed-top mt-5 pt-4 rounded-right">
        <h1>Vytvořená kabelová hlava</h1>
    </div>
    <div class="container mt-5 py-5">
        <%--<%@include file="tables/tableCableHeadEditFormOne.jsp" %>--%>
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
                <c:set var="device" target="Cablehead" value="<%= request.getSession().getAttribute("newCableHead")%>" />
                    <tr class="edit" data-bindID="${device.id}"> 
                      <td>
                          <div>
                              ${device.id}
                          </div>
                      </td>
                      <td>
                          <div>
                              ${device.name}
                          </div>
                      </td>
                      <td>
                          <div>
                              ${device.building}
                          </div>
                      </td>
                      <td>
                          <div>
                              ${device.note}
                          </div>
                      </td>
                      <td>
                          <div>
                              ${device.outputcount}
                          </div>
                      </td>
                </tr> 
            </tbody>
        </table>
    </div>
    <div class="container mb-4">
      <div class="d-flex justify-content-between">
        <form action="formCableHeadEdit.jsp" method="post">
            <input name="id" value='${device.id}' type="hidden" />
            <button class="btn btn-primary " type="submit" >Uprav kabelovou hlavu</button>
        </form>
        <form action="readCableHeadOutputs.jsp" method="post">
            <input name="id" value='${device.id}' type="hidden" />
            <button class="btn btn-dark  " type="submit" >Uprav výstupy</button>
        </form>
        <a href="readCableHeads.jsp" type="button" class="btn btn-info ">Kabelové hlavy</a>
      </div>
                            <div class="d-flex justify-content-between mt-3" >
                  <button class="btn btn-dark col-4 col-sm-3 p-2" type="submit" >Odešli</button>
                  <button class="btn btn-danger col-4 col-sm-3 p-2 mx-1" type="reset" >Zruš změny</button>
                  <a href="readCableHeads.jsp" type="button" class="btn btn-info col-4 col-sm-3 p-2">Kabelové hlavy</a>
                </div> 
    </div>
  </body>
</html>