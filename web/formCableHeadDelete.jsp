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
    <title>Kabelová hlava</title>
    </head>
    <body id="body-pozadi">
        <!-- Navbar START-->
        <%@include file="pices/navbar.jsp" %>
        <!-- Navbar END--> 
        <div class="d-block fixed-top mt-5 pt-4 rounded-right">
            <h1>KABELOVÉ HLAVY - Vymazání</h1>
        </div>
        <!-- Vymazní Kabelové Hlavy START -->
        <div class="container py-5"></div>
        <div class="jumbotron mt-3">
            <h2>Kabelová hlava - odstranění</h2>
            <form action="deleteCableHead.jsp" method="get">
                <select name="id" id="id" class="form-control" required>
                    <option value="">--- Vyber kabelovou hlavu pro vymazání ---</option>
                    <c:forEach var="item" items="<%=CableHeadBO.getAllCableHeads()%>">
                        <option value="${item.id}">
                            ID:&nbsp&nbsp&nbsp  ${item.id};&nbsp&nbsp&nbsp&nbsp&nbsp  
                            NÁZEV:&nbsp&nbsp&nbsp  ${item.name};&nbsp&nbsp&nbsp&nbsp&nbsp
                            UMÍSTĚNÍ:&nbsp&nbsp&nbsp  ${item.building}
                        </option>
                    </c:forEach>
                </select>
                <div class="d-flex justify-content-center mt-3">
                  <button class="btn btn-dark px-5" type="submit" >Vymazat</button>
                </div> 
            </form>
        </div>
        <!-- Vymazní Kabelové Hlavy END -->         
        <!-- výpis kabelových hlav START -->
        <h2>Výpis kabelů</h2>
        <div class="container">
              <%-- <%@include file="tables/tableCableHead.jsp" %> --%>
            <table id="tabulka" class="table table-striped table-bordered compact order-column " style="background-color: #80bdff;">
                <thead>
                  <tr>
                    <th>Index</th>
                    <th>Název</th>
                    <th>Budova</th>
                    <th>Poznámka</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                    <c:set var="devices" value="<%= moje.appLayer.CableHeadBO.getAllCableHeads() %>"/>
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
                                <form action="deleteCableHead.jsp" method="get">
                                    <input  name="id" value='${device.id}' type="hidden" />
                                    <button class="btn btn-dark px-3" type="submit">Odstraň</button>
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
                    <th></th>
                  </tr>
                </tfoot>
            </table>
        </div>     
    <!-- výpis kabelových hlav END -->  
    </body>
</html>

