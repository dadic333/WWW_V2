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
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <script src="js/jquery_3.4.1/jquery.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script src="js/mujTableScript.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <title>Datový prvek</title>
  </head>
  <body id="body-pozadi">
<%    
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    Integer intId;
    String type,name;
    moje.entity.Datadevice dataDevice;
    
    intId = Integer.parseInt(request.getParameter("id"));
    dataDevice = moje.appLayer.DataDeviceBO.getDataDeviceByID(intId);
    type = request.getParameter("type");
    name = request.getParameter("name");
%>
    <script>
        $(document).ready(function() {
            var type = "<%=type%>";
            var name = "<%=name%>";
            
            if(type==="edit"){
                var entity = ("<div class=\"container py-2 my-2 message\" id=\"message\" style=\"charset=utf-8;\">Výstupu číslo:  \""+name+"\" byl úspěšně upraven.</div>");
                document.getElementById("message").innerHTML = entity;}
        });
    </script>
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="container fixed-top mt-5 pt-5">
        <h2>Výstupy DATOVÉHO PRVKU</h2>
    </div>
    <div class="container my-5 py-4"></div> <!-- výplň pro odstavení hlavního nadpisu -->
    <div class="container">
        <div class="d-flex pt-1 justify-content-end">
            <a href="readDataDevices.jsp" class="btn btn-info px-5">Zpět</a>
        </div>
    </div>
<%--    <%@include file="tables/tableCableHeadOutputs.jsp" %>  --%>
    <div id="message"></div>
    <div class="container my-4 py-1">
        <div class="table-responsive">
        <table id="tabulka" class="table table-striped table-bordered compact order-column ">
            <thead>
              <tr>
                <th>ID</th>
                <th>Datový prvek</th>
                <th>Výstup</th>
                <th>Tel. číslo</th>
                <th>MAC</th>
                <th>Poznámka</th>
                <th>editace</th>
              </tr>
            </thead>
          <tbody>
              <c:set var="outputs" value="<%=dataDevice.getDataoutputList() %>" />
              <c:forEach var="output" items="${outputs}">
                  <tr class="edit" data-bindID="${output.id}"> 
                    <td>
                        ${output.id}
                    </td>
                    <td>
                        ${output.deviceId.name}
                    </td>
                    <td>
                        ${output.datadevout}
                    </td>
                    <td>
                        ${output.phonenumber}
                    </td>
                    <td>
                        ${output.mac}
                    </td>
                    <td>
                        ${output.note}
                    </td>
                    <td>
                        <form action="formDataDeviceOutput.jsp" method="get">
                            <input name="id" value='${output.id}' type="hidden" />
                            <button class="btn btn-dark w-100" type="submit" >Uprav</button>
                        </form>
                    </td>
                  </tr> 
              </c:forEach>
          </tbody>
        <tfoot>
          <tr>
            <th>ID</th>
            <th>Datový prvek</th>
            <th>Výstup</th>
            <th>Tel. číslo</th>
            <th>MAC</th>
            <th>Poznámka</th>
            <th>editace</th>
          </tr>
        </tfoot>
      </table>
        </div>
    </div>
    <div class="container">
        <div class="d-flex my-3 justify-content-end">
            <a href="readDataDevices.jsp" class="btn btn-info px-5">Zpět</a>
        </div>
    </div>
  </body>
</html>
