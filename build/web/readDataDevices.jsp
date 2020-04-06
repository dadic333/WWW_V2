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
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/mujTableScript.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Datový prvek</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="d-block fixed-top  mt-5 pt-4 rounded-right">
        <h1>DATOVÉ PRVKY</h1>
    </div>
    <div class="container mt-5 mb-3 pt-5 pb-1">
      <div class="d-flex justify-content-between">
        <a href="formDataDeviceNew.jsp" class="btn btn-info col-4">
          Založit nový datový prvek
        </a>
        <a href="formDataDeviceDelete.jsp" class="btn btn-danger col-4">
          Odstranit datový prvek
        </a>
      </div>
    </div>
    <!-- Výpis Datového prvku START -->
    <div class="container mt-2">
        <h2>Výpis datového prvku</h2>
        <form action="formDataDeviceOutputs.jsp" method="get">
            <select name="id" class="form-control" required>
                <option value="">--- Vyber datový prvek pro výpis ---</option>
                <c:forEach var="item" items="<%=moje.appLayer.DataDeviceBO.getAllDataDevices()%>">
                    <option value="${item.id}">
                        ID:&nbsp&nbsp&nbsp  ${item.id};&nbsp&nbsp&nbsp&nbsp&nbsp
                        NÁZEV:&nbsp&nbsp&nbsp  ${item.name};&nbsp&nbsp&nbsp&nbsp&nbsp
                        UMÍSTĚNÍ:&nbsp&nbsp&nbsp  ${item.building}
                    </option>
                </c:forEach>
            </select>
            <div class="d-flex justify-content-center my-3" >
              <button class="btn btn-dark px-5 py-2 " type="submit" >Vypiš</button>
            </div> 
        </form>
    </div>
    <!-- Výpis Kabelové Hlavy END -->  
    <main> 
      <h2>Výpis datových prvků</h2>
      <div class="container mb-3">
        <table id="tabulka" class="table table-striped table-bordered compact order-column " style="background-color: #80bdff;">
            <thead>
              <tr>
                <th>Index</th>
                <th>Název</th>
                <th>Budova</th>
                <th>Poznámka</th>
                <th>Datový prvek</th>
                <th>Výstupy / Edituj</th>
              </tr>
            </thead>
            <tbody>
                <c:set var="devices" value="<%= moje.appLayer.DataDeviceBO.getAllDataDevices()%>"/>
                <c:forEach var="device" items="${devices}">
                    <tr> 
                        <td>
                            ${device.id}
                        </td>
                        <td>
                            ${device.name}
                        </td>
                        <td>
                            ${device.building}
                        </td>
                        <td>
                            ${device.note}
                        </td>
                        <td>
                            <form action="formDataDeviceEdit.jsp" method="get">
                                <input  name="id" value='${device.id}' type="hidden" />
                                <button class="btn btn-dark w-100" type="submit">Uprav</button>
                            </form>
                        </td>
                        <td>
                            <form action="readDataDeviceOutputs.jsp" method="post">
                                <input name="id" value='${device.id}' type="hidden" />  
                                <button class="btn btn-dark w-100" type="submit" >
                                    ${device.outputcount} / Uprav
                                </button> 
                            </form>
                        </td>
                    </tr> 
                </c:forEach>
            </tbody>
            <tfoot>
              <tr>
                <th>Index</th>
                <th>Název</th>
                <th>Budova</th>
                <th>Poznámka</th>
                <th>Datový prvek</th>
                <th>Počet výstupů</th>
              </tr>
            </tfoot>
        </table>
      </div>
    </main>
  </body>
</html>