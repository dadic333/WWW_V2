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
    <title>Telefonní středna</title>
  </head>
  <body id="body-pozadi">
<%    
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
   
    Integer intId;
    String type, name, outputCount;
    moje.entity.Telexchange telExchange;
    
    intId = Integer.parseInt(request.getParameter("id"));
    telExchange = moje.appLayer.TelExchangeBO.getTelExchangeByID(intId);  
    type = request.getParameter("type");
    name = request.getParameter("name");
    outputCount = request.getParameter("outputCount");
%>
    <script>
        $(document).ready(function() {
            var type = "<%=type%>";
            var name = "<%=name%>";
            var outputCount = "<%=outputCount%>";
            
            if(type==="edit"){
                var entity = ("<div class=\"container py-2 my-2 message\" id=\"message\" style=\"charset=utf-8;\">HW pozice jménem:  \""+name+"\" byla úspěšně upravena.</div>");
                document.getElementById("message").innerHTML = entity;}
            if(type==="addCard"){
                var entity = ("<div class=\"container py-2 my-2 message\" id=\"message\" style=\"charset=utf-8;\">Bylo přidáno \""+outputCount+"\" výstupů.</div>");
                document.getElementById("message").innerHTML = entity;}
        });
    </script>
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <div class="container fixed-top mt-5 pt-5">
        <h2>Výstupy TELEFONNÍ ÚSTŘEDNY</h2>
    </div>
    <div class="container my-5 py-4"></div> <!-- výplň pro odstavení hlavního nadpisu -->
    <div class="container my-5 py-3 bg-light addCard">
        <h3>Přidání telefonní karty k ústředně</h3>
        <form action="newTelExchangeCard.jsp" method="get">
          <div class="form-group">
              <c:set var="telEx" value="<%=telExchange%>" /> <%--název ústředny--%>
              <input name="id" type="hidden" value="<%=intId%>" />
          </div>
          <div class="form-group">
              <label for="outputCount" class="">Název ústředny:   <b>${telEx.name}</b></label>
            <input class="form-control" name="outputCount" id="outputCount" type="number" placeholder="zadej počet výstupů na kartě" required maxlength="4" min="1" max="1000" />
          </div>
            <div class="d-flex justify-content-center mt-3" >
              <button class="btn btn-dark px-5 py-2 " type="submit" >Odešli</button>
            </div> 
        </form>
    </div>
    <div class="container">
        <div class="d-flex pt-1 justify-content-end">
            <a href="readTelExchanges.jsp" class="btn btn-info px-5">Zpět</a>
        </div>
    </div>
    <div id="message"></div>
    <div class="container my-4 py-1">
        <table id="tabulka" class="table table-striped table-bordered compact order-column ">
          <thead>
            <tr>
              <th>ID</th>
              <th>Tel. ústředna</th>
              <th>HW pozice</th>
              <th>Tel. číslo</th>
              <th>Analog/Digital</th>
              <th>Poznámka</th>
              <th>Uprav</th>
            </tr>
          </thead>
          <tbody>
              <c:set var="outputs" value="<%=telExchange.getHwpositionList() %>" />
              <c:forEach var="output" items="${outputs}">
                  <tr class="edit" data-bindID="${output.id}"> 
                    <td>
                        ${output.id}
                    </td>
                    <td>
                        ${output.telechangeId.name}
                    </td>
                    <td>
                        ${output.name}
                    </td>
                    <td>
                        ${output.phonenumber}
                    </td>
                    <td>
                        ${output.technologytype}
                    </td>
                    <td>
                        ${output.note}
                    </td>
                    <td>
                        <form action="formTelExchangeOutput.jsp" method="get">
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
              <th>Tel. ústředna</th>
              <th>HW pozice</th>
              <th>Tel. číslo</th>
              <th>Analog/Digital</th>
              <th>Poznámka</th>
              <th>Uprav</th>
            </tr>
          </tfoot>
      </table>
    </div>
    <div class="container">
        <div class="d-flex my-3 justify-content-end">
            <a href="readCableHeads.jsp" class="btn btn-info px-5">Zpět</a>
        </div>
    </div>
  </body>
</html>