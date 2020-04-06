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
        <link href="favs/ico.ico" rel="icon" type="image/x-icon">
        <title>Kabelová hlava</title>
    </head>
    <body id="body-pozadi">
      <!-- Navbar start-->
      <%@include file="pices/navbar.jsp" %>
      <!-- Navbar end--> 
      <h1>KABELOVÉ HLAVY</h1>
      <h2>Editace</h2>
      <div class="container">
<%--        <%@include file="tables/tableCableHeadEditForm.jsp" %>     --%>
        <%-- <table id="tabulka" class="table table-striped table-bordered" cellspacing="0" width="100%" style="background-color: #9fcdff"> --%>
        <table id="tabulka" class="table table-sm table-bordered">     
            <thead>
              <tr>
                <th>Index</th>
                <th>Název</th>
                <th>Budova</th>
                <th>Poznámka</th>
                <th>počet výstupů</th>
                <th>Edituj výstupy</th>
                <th>Výpis kabelových hlav</th>
              </tr>
            </thead>
            <tbody>
            <c:set var="device" value="<%= request.getSession().getAttribute("newCableHead") %>"/>
                <tr> 
                      <td>
                          <p>${device.id}</p>
                      </td>
                      <td>
                          <p>${device.name}</p>
                      </td>
                      <td>
                          <p>${device.building}</p>
                      </td>
                      <td>
                          <p>${device.note}</p>
                      </td>
                      <td>
                          <p>${device.outputcount}</p>
                      </td>
                    <form action="readCableHeadOutputs.jsp" method="post">
                        <td>
                            <input class="form-control-lg" name="id" value='${device.id}' type="hidden" />  
                            <div>
                            <button class="btn btn-dark" type="submit" >Uprav</button>  
                            </div>
                        </td>
                    </form>
                    <td>
                        <div>
                        <button class="btn btn-dark" type="submit" ><a href="readCableHeads.jsp">Přejdi</a></button>
                        </div>
                    </td>
                </tr> 
            </tbody>
        </table>
      </div>
      <!-- footer start -->
      <%@include file="pices/footer.jsp" %>
      <!-- footer end -->
    </body>
</html>