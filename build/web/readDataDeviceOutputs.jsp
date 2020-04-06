<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="error.jsp" %>
<%    
    HttpSession sess = request.getSession();
    moje.entity.Datadevice dataDevice;
    
    if(request.getParameter("id")!=null){
        Integer id = Integer.parseInt(request.getParameter("id"));
        dataDevice = moje.appLayer.DataDeviceBO.getDataDeviceByID(id);
        sess.setAttribute("sessDataDevice", dataDevice) ; 
    } else{
        dataDevice = (moje.entity.Datadevice)(request.getSession().getAttribute("sessDataDevice"));
    }

%>
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
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="d-block fixed-top mt-5 pt-4">
        <h1>Výstupy KABELOVÉ HLAVY - Editace</h1>
    </div>
    <div class="container my-4 py-1"></div> <!-- výplně pro odstavení hlavního nadpisu -->
<%--    <%@include file="tables/tableCableHeadOutputs.jsp" %>  --%>
      <div class="container my-5 py-5">
        <table id="tabulka" class="table table-striped table-bordered compact order-column " style="background-color: #80bdff;">
          <thead>
            <tr>
              <th>ID</th>
              <th>Kabelová hlava</th>
              <th>Výstup</th>
              <th>Tel. číslo</th>
              <th>Poznámka</th>
              <th></th>
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
                        ${output.cableheadId.name}
                    </td>
                    <td>
                        ${output.cabheadout}
                    </td>
                    <td>
                        ${output.phonenumber}
                    </td>
                    <td>
                        ${output.note}
                    </td>
                    <td>
                        <form action="formCableHeadOutput.jsp" method="get">
                            <input name="id" value='${output.id}' type="hidden" />
                            <button class="btn btn-dark px-5" type="submit" >Uprav</button>
                        </form>
                    </td>
                  </tr> 
              </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <th>ID</th>
              <th>Kabelová hlava</th>
              <th>Výstup</th>
              <th>Tel. číslo</th>
              <th>Poznámka</th>
              <th></th>
            </tr>
          </tfoot>
      </table>
    </div>
  </body>
</html>
