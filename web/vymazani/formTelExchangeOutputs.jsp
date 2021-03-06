<%@page import="moje.entity.Telexchange"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page errorPage="error.jsp" %>
<%    
    Integer id;
    HttpSession sess = request.getSession();
    if ((request.getParameter("id")) == null){
        moje.entity.Telexchange telEx = (Telexchange)sess.getAttribute("sessTelExchange");
        id = telEx.getId();
    } else {
        id = Integer.parseInt(request.getParameter("id"));
    }
    moje.entity.Telexchange telExchange = moje.appLayer.TelExchangeBO.getTelExchangeByID(id);
    sess.setAttribute("sessTelExchange", telExchange) ; 
%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> 
    <link href="bootstrap/css/bootstrap-grid.min.css" rel="stylesheet">
    <link href="bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="css/editor-tabulek.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
    <link href="css/formStyl.css" rel="stylesheet">
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script>
    <script>
      $(document).ready(function() {
       $('#tabulka').dataTable();
      } );
    </script>
    <link href="favs/ico.ico" rel="icon" type="image/x-icon">
    <title>Telefonní ústředna</title>
  </head>
  <body id="body-pozadi">
    <!-- Navbar start-->
    <%@include file="pices/navbar.jsp" %>
    <!-- Navbar end--> 
    <h2>Výstupy Telefonní ústředny - Editace</h2>
    <!-- vytvoření telefonní karty START -->  
    <div class="container">
      <h3>Přidání telefonní karty k ústředně</h3>
      <form action="newTelExchangeCard.jsp" method="get">
          <div class="form-group">
              <c:set var="telEx" value="<%=telExchange%>" /> <%--název ústředny--%>
              <input name="id" type="hidden" value="<%=id%>" />
          </div>
          <div class="form-group">
              <label for="outputCount" class="">Název ústředny:   <b>${telEx.name}</b></label>
            <input class="form-control" name="outputCount" id="outputCount" type="number" placeholder="zadej počet výstupů" required maxlength="4" min="1" max="1000" />
          </div>
        <div class="mx-auto" style="width: 70px">  
          <button class="btn btn-odeslat" type="submit" >Vytvořit</button>
        </div> 
      </form>
    </div>
    <!-- vytvoření telefonní karty END -->    
    <div class="jumbotron">
      <h2>Výpis telefonní ústředny</h2>
      <div class="container">
          <%@include file="tables/tableTelExchangeOutputs.jsp" %>
      </div>
    </div>
    <!-- footer start -->
    <%@include file="pices/footer.jsp" %>
    <!-- footer end -->
  </body>
</html>